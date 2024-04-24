; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21022 () Bool)

(assert start!21022)

(declare-fun b_free!5569 () Bool)

(declare-fun b_next!5569 () Bool)

(assert (=> start!21022 (= b_free!5569 (not b_next!5569))))

(declare-fun tp!19762 () Bool)

(declare-fun b_and!12389 () Bool)

(assert (=> start!21022 (= tp!19762 b_and!12389)))

(declare-fun b!211326 () Bool)

(declare-fun e!137563 () Bool)

(declare-fun tp_is_empty!5431 () Bool)

(assert (=> b!211326 (= e!137563 tp_is_empty!5431)))

(declare-fun b!211327 () Bool)

(declare-fun e!137564 () Bool)

(declare-fun e!137561 () Bool)

(declare-fun mapRes!9230 () Bool)

(assert (=> b!211327 (= e!137564 (and e!137561 mapRes!9230))))

(declare-fun condMapEmpty!9230 () Bool)

(declare-datatypes ((V!6889 0))(
  ( (V!6890 (val!2760 Int)) )
))
(declare-datatypes ((ValueCell!2372 0))(
  ( (ValueCellFull!2372 (v!4751 V!6889)) (EmptyCell!2372) )
))
(declare-datatypes ((array!10059 0))(
  ( (array!10060 (arr!4775 (Array (_ BitVec 32) ValueCell!2372)) (size!5100 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10059)

(declare-fun mapDefault!9230 () ValueCell!2372)

(assert (=> b!211327 (= condMapEmpty!9230 (= (arr!4775 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2372)) mapDefault!9230)))))

(declare-fun b!211328 () Bool)

(declare-fun res!103192 () Bool)

(declare-fun e!137560 () Bool)

(assert (=> b!211328 (=> (not res!103192) (not e!137560))))

(declare-datatypes ((array!10061 0))(
  ( (array!10062 (arr!4776 (Array (_ BitVec 32) (_ BitVec 64))) (size!5101 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10061)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10061 (_ BitVec 32)) Bool)

(assert (=> b!211328 (= res!103192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211329 () Bool)

(declare-fun res!103188 () Bool)

(assert (=> b!211329 (=> (not res!103188) (not e!137560))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211329 (= res!103188 (= (select (arr!4776 _keys!825) i!601) k0!843))))

(declare-fun res!103194 () Bool)

(assert (=> start!21022 (=> (not res!103194) (not e!137560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21022 (= res!103194 (validMask!0 mask!1149))))

(assert (=> start!21022 e!137560))

(declare-fun array_inv!3135 (array!10059) Bool)

(assert (=> start!21022 (and (array_inv!3135 _values!649) e!137564)))

(assert (=> start!21022 true))

(assert (=> start!21022 tp_is_empty!5431))

(declare-fun array_inv!3136 (array!10061) Bool)

(assert (=> start!21022 (array_inv!3136 _keys!825)))

(assert (=> start!21022 tp!19762))

(declare-fun b!211330 () Bool)

(declare-fun res!103191 () Bool)

(assert (=> b!211330 (=> (not res!103191) (not e!137560))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211330 (= res!103191 (and (= (size!5100 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5101 _keys!825) (size!5100 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211331 () Bool)

(declare-fun res!103189 () Bool)

(assert (=> b!211331 (=> (not res!103189) (not e!137560))))

(declare-datatypes ((List!3005 0))(
  ( (Nil!3002) (Cons!3001 (h!3643 (_ BitVec 64)) (t!7938 List!3005)) )
))
(declare-fun arrayNoDuplicates!0 (array!10061 (_ BitVec 32) List!3005) Bool)

(assert (=> b!211331 (= res!103189 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3002))))

(declare-fun mapIsEmpty!9230 () Bool)

(assert (=> mapIsEmpty!9230 mapRes!9230))

(declare-fun b!211332 () Bool)

(declare-fun res!103193 () Bool)

(assert (=> b!211332 (=> (not res!103193) (not e!137560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211332 (= res!103193 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!9230 () Bool)

(declare-fun tp!19763 () Bool)

(assert (=> mapNonEmpty!9230 (= mapRes!9230 (and tp!19763 e!137563))))

(declare-fun mapValue!9230 () ValueCell!2372)

(declare-fun mapRest!9230 () (Array (_ BitVec 32) ValueCell!2372))

(declare-fun mapKey!9230 () (_ BitVec 32))

(assert (=> mapNonEmpty!9230 (= (arr!4775 _values!649) (store mapRest!9230 mapKey!9230 mapValue!9230))))

(declare-fun b!211333 () Bool)

(declare-fun e!137562 () Bool)

(assert (=> b!211333 (= e!137560 (not e!137562))))

(declare-fun res!103190 () Bool)

(assert (=> b!211333 (=> res!103190 e!137562)))

(assert (=> b!211333 (= res!103190 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4120 0))(
  ( (tuple2!4121 (_1!2071 (_ BitVec 64)) (_2!2071 V!6889)) )
))
(declare-datatypes ((List!3006 0))(
  ( (Nil!3003) (Cons!3002 (h!3644 tuple2!4120) (t!7939 List!3006)) )
))
(declare-datatypes ((ListLongMap!3035 0))(
  ( (ListLongMap!3036 (toList!1533 List!3006)) )
))
(declare-fun lt!108658 () ListLongMap!3035)

(declare-fun zeroValue!615 () V!6889)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6889)

(declare-fun getCurrentListMap!1070 (array!10061 array!10059 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) Int) ListLongMap!3035)

(assert (=> b!211333 (= lt!108658 (getCurrentListMap!1070 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108660 () ListLongMap!3035)

(declare-fun lt!108662 () array!10059)

(assert (=> b!211333 (= lt!108660 (getCurrentListMap!1070 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108663 () ListLongMap!3035)

(declare-fun lt!108665 () ListLongMap!3035)

(assert (=> b!211333 (and (= lt!108663 lt!108665) (= lt!108665 lt!108663))))

(declare-fun v!520 () V!6889)

(declare-fun lt!108661 () ListLongMap!3035)

(declare-fun +!562 (ListLongMap!3035 tuple2!4120) ListLongMap!3035)

(assert (=> b!211333 (= lt!108665 (+!562 lt!108661 (tuple2!4121 k0!843 v!520)))))

(declare-datatypes ((Unit!6408 0))(
  ( (Unit!6409) )
))
(declare-fun lt!108659 () Unit!6408)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!211 (array!10061 array!10059 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) (_ BitVec 64) V!6889 (_ BitVec 32) Int) Unit!6408)

(assert (=> b!211333 (= lt!108659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!211 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!493 (array!10061 array!10059 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) Int) ListLongMap!3035)

(assert (=> b!211333 (= lt!108663 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211333 (= lt!108662 (array!10060 (store (arr!4775 _values!649) i!601 (ValueCellFull!2372 v!520)) (size!5100 _values!649)))))

(assert (=> b!211333 (= lt!108661 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211334 () Bool)

(assert (=> b!211334 (= e!137561 tp_is_empty!5431)))

(declare-fun b!211335 () Bool)

(declare-fun lt!108664 () tuple2!4120)

(assert (=> b!211335 (= e!137562 (= lt!108658 (+!562 lt!108661 lt!108664)))))

(assert (=> b!211335 (= lt!108660 (+!562 lt!108663 lt!108664))))

(assert (=> b!211335 (= lt!108664 (tuple2!4121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211336 () Bool)

(declare-fun res!103195 () Bool)

(assert (=> b!211336 (=> (not res!103195) (not e!137560))))

(assert (=> b!211336 (= res!103195 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5101 _keys!825))))))

(assert (= (and start!21022 res!103194) b!211330))

(assert (= (and b!211330 res!103191) b!211328))

(assert (= (and b!211328 res!103192) b!211331))

(assert (= (and b!211331 res!103189) b!211336))

(assert (= (and b!211336 res!103195) b!211332))

(assert (= (and b!211332 res!103193) b!211329))

(assert (= (and b!211329 res!103188) b!211333))

(assert (= (and b!211333 (not res!103190)) b!211335))

(assert (= (and b!211327 condMapEmpty!9230) mapIsEmpty!9230))

(assert (= (and b!211327 (not condMapEmpty!9230)) mapNonEmpty!9230))

(get-info :version)

(assert (= (and mapNonEmpty!9230 ((_ is ValueCellFull!2372) mapValue!9230)) b!211326))

(assert (= (and b!211327 ((_ is ValueCellFull!2372) mapDefault!9230)) b!211334))

(assert (= start!21022 b!211327))

(declare-fun m!239199 () Bool)

(assert (=> b!211329 m!239199))

(declare-fun m!239201 () Bool)

(assert (=> b!211332 m!239201))

(declare-fun m!239203 () Bool)

(assert (=> b!211333 m!239203))

(declare-fun m!239205 () Bool)

(assert (=> b!211333 m!239205))

(declare-fun m!239207 () Bool)

(assert (=> b!211333 m!239207))

(declare-fun m!239209 () Bool)

(assert (=> b!211333 m!239209))

(declare-fun m!239211 () Bool)

(assert (=> b!211333 m!239211))

(declare-fun m!239213 () Bool)

(assert (=> b!211333 m!239213))

(declare-fun m!239215 () Bool)

(assert (=> b!211333 m!239215))

(declare-fun m!239217 () Bool)

(assert (=> mapNonEmpty!9230 m!239217))

(declare-fun m!239219 () Bool)

(assert (=> start!21022 m!239219))

(declare-fun m!239221 () Bool)

(assert (=> start!21022 m!239221))

(declare-fun m!239223 () Bool)

(assert (=> start!21022 m!239223))

(declare-fun m!239225 () Bool)

(assert (=> b!211331 m!239225))

(declare-fun m!239227 () Bool)

(assert (=> b!211335 m!239227))

(declare-fun m!239229 () Bool)

(assert (=> b!211335 m!239229))

(declare-fun m!239231 () Bool)

(assert (=> b!211328 m!239231))

(check-sat tp_is_empty!5431 (not b!211331) (not mapNonEmpty!9230) (not b!211335) (not b_next!5569) (not b!211332) (not start!21022) (not b!211333) (not b!211328) b_and!12389)
(check-sat b_and!12389 (not b_next!5569))
(get-model)

(declare-fun d!58113 () Bool)

(assert (=> d!58113 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211332 d!58113))

(declare-fun b!211413 () Bool)

(declare-fun e!137610 () Bool)

(declare-fun e!137612 () Bool)

(assert (=> b!211413 (= e!137610 e!137612)))

(declare-fun c!35696 () Bool)

(assert (=> b!211413 (= c!35696 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211414 () Bool)

(declare-fun e!137609 () Bool)

(declare-fun contains!1387 (List!3005 (_ BitVec 64)) Bool)

(assert (=> b!211414 (= e!137609 (contains!1387 Nil!3002 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19984 () Bool)

(declare-fun call!19987 () Bool)

(assert (=> bm!19984 (= call!19987 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35696 (Cons!3001 (select (arr!4776 _keys!825) #b00000000000000000000000000000000) Nil!3002) Nil!3002)))))

(declare-fun b!211415 () Bool)

(assert (=> b!211415 (= e!137612 call!19987)))

(declare-fun b!211416 () Bool)

(declare-fun e!137611 () Bool)

(assert (=> b!211416 (= e!137611 e!137610)))

(declare-fun res!103250 () Bool)

(assert (=> b!211416 (=> (not res!103250) (not e!137610))))

(assert (=> b!211416 (= res!103250 (not e!137609))))

(declare-fun res!103252 () Bool)

(assert (=> b!211416 (=> (not res!103252) (not e!137609))))

(assert (=> b!211416 (= res!103252 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211417 () Bool)

(assert (=> b!211417 (= e!137612 call!19987)))

(declare-fun d!58115 () Bool)

(declare-fun res!103251 () Bool)

(assert (=> d!58115 (=> res!103251 e!137611)))

(assert (=> d!58115 (= res!103251 (bvsge #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58115 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3002) e!137611)))

(assert (= (and d!58115 (not res!103251)) b!211416))

(assert (= (and b!211416 res!103252) b!211414))

(assert (= (and b!211416 res!103250) b!211413))

(assert (= (and b!211413 c!35696) b!211417))

(assert (= (and b!211413 (not c!35696)) b!211415))

(assert (= (or b!211417 b!211415) bm!19984))

(declare-fun m!239301 () Bool)

(assert (=> b!211413 m!239301))

(assert (=> b!211413 m!239301))

(declare-fun m!239303 () Bool)

(assert (=> b!211413 m!239303))

(assert (=> b!211414 m!239301))

(assert (=> b!211414 m!239301))

(declare-fun m!239305 () Bool)

(assert (=> b!211414 m!239305))

(assert (=> bm!19984 m!239301))

(declare-fun m!239307 () Bool)

(assert (=> bm!19984 m!239307))

(assert (=> b!211416 m!239301))

(assert (=> b!211416 m!239301))

(assert (=> b!211416 m!239303))

(assert (=> b!211331 d!58115))

(declare-fun d!58117 () Bool)

(declare-fun e!137615 () Bool)

(assert (=> d!58117 e!137615))

(declare-fun res!103257 () Bool)

(assert (=> d!58117 (=> (not res!103257) (not e!137615))))

(declare-fun lt!108724 () ListLongMap!3035)

(declare-fun contains!1388 (ListLongMap!3035 (_ BitVec 64)) Bool)

(assert (=> d!58117 (= res!103257 (contains!1388 lt!108724 (_1!2071 lt!108664)))))

(declare-fun lt!108722 () List!3006)

(assert (=> d!58117 (= lt!108724 (ListLongMap!3036 lt!108722))))

(declare-fun lt!108723 () Unit!6408)

(declare-fun lt!108725 () Unit!6408)

(assert (=> d!58117 (= lt!108723 lt!108725)))

(declare-datatypes ((Option!259 0))(
  ( (Some!258 (v!4757 V!6889)) (None!257) )
))
(declare-fun getValueByKey!253 (List!3006 (_ BitVec 64)) Option!259)

(assert (=> d!58117 (= (getValueByKey!253 lt!108722 (_1!2071 lt!108664)) (Some!258 (_2!2071 lt!108664)))))

(declare-fun lemmaContainsTupThenGetReturnValue!140 (List!3006 (_ BitVec 64) V!6889) Unit!6408)

(assert (=> d!58117 (= lt!108725 (lemmaContainsTupThenGetReturnValue!140 lt!108722 (_1!2071 lt!108664) (_2!2071 lt!108664)))))

(declare-fun insertStrictlySorted!143 (List!3006 (_ BitVec 64) V!6889) List!3006)

(assert (=> d!58117 (= lt!108722 (insertStrictlySorted!143 (toList!1533 lt!108661) (_1!2071 lt!108664) (_2!2071 lt!108664)))))

(assert (=> d!58117 (= (+!562 lt!108661 lt!108664) lt!108724)))

(declare-fun b!211422 () Bool)

(declare-fun res!103258 () Bool)

(assert (=> b!211422 (=> (not res!103258) (not e!137615))))

(assert (=> b!211422 (= res!103258 (= (getValueByKey!253 (toList!1533 lt!108724) (_1!2071 lt!108664)) (Some!258 (_2!2071 lt!108664))))))

(declare-fun b!211423 () Bool)

(declare-fun contains!1389 (List!3006 tuple2!4120) Bool)

(assert (=> b!211423 (= e!137615 (contains!1389 (toList!1533 lt!108724) lt!108664))))

(assert (= (and d!58117 res!103257) b!211422))

(assert (= (and b!211422 res!103258) b!211423))

(declare-fun m!239309 () Bool)

(assert (=> d!58117 m!239309))

(declare-fun m!239311 () Bool)

(assert (=> d!58117 m!239311))

(declare-fun m!239313 () Bool)

(assert (=> d!58117 m!239313))

(declare-fun m!239315 () Bool)

(assert (=> d!58117 m!239315))

(declare-fun m!239317 () Bool)

(assert (=> b!211422 m!239317))

(declare-fun m!239319 () Bool)

(assert (=> b!211423 m!239319))

(assert (=> b!211335 d!58117))

(declare-fun d!58119 () Bool)

(declare-fun e!137616 () Bool)

(assert (=> d!58119 e!137616))

(declare-fun res!103259 () Bool)

(assert (=> d!58119 (=> (not res!103259) (not e!137616))))

(declare-fun lt!108728 () ListLongMap!3035)

(assert (=> d!58119 (= res!103259 (contains!1388 lt!108728 (_1!2071 lt!108664)))))

(declare-fun lt!108726 () List!3006)

(assert (=> d!58119 (= lt!108728 (ListLongMap!3036 lt!108726))))

(declare-fun lt!108727 () Unit!6408)

(declare-fun lt!108729 () Unit!6408)

(assert (=> d!58119 (= lt!108727 lt!108729)))

(assert (=> d!58119 (= (getValueByKey!253 lt!108726 (_1!2071 lt!108664)) (Some!258 (_2!2071 lt!108664)))))

(assert (=> d!58119 (= lt!108729 (lemmaContainsTupThenGetReturnValue!140 lt!108726 (_1!2071 lt!108664) (_2!2071 lt!108664)))))

(assert (=> d!58119 (= lt!108726 (insertStrictlySorted!143 (toList!1533 lt!108663) (_1!2071 lt!108664) (_2!2071 lt!108664)))))

(assert (=> d!58119 (= (+!562 lt!108663 lt!108664) lt!108728)))

(declare-fun b!211424 () Bool)

(declare-fun res!103260 () Bool)

(assert (=> b!211424 (=> (not res!103260) (not e!137616))))

(assert (=> b!211424 (= res!103260 (= (getValueByKey!253 (toList!1533 lt!108728) (_1!2071 lt!108664)) (Some!258 (_2!2071 lt!108664))))))

(declare-fun b!211425 () Bool)

(assert (=> b!211425 (= e!137616 (contains!1389 (toList!1533 lt!108728) lt!108664))))

(assert (= (and d!58119 res!103259) b!211424))

(assert (= (and b!211424 res!103260) b!211425))

(declare-fun m!239321 () Bool)

(assert (=> d!58119 m!239321))

(declare-fun m!239323 () Bool)

(assert (=> d!58119 m!239323))

(declare-fun m!239325 () Bool)

(assert (=> d!58119 m!239325))

(declare-fun m!239327 () Bool)

(assert (=> d!58119 m!239327))

(declare-fun m!239329 () Bool)

(assert (=> b!211424 m!239329))

(declare-fun m!239331 () Bool)

(assert (=> b!211425 m!239331))

(assert (=> b!211335 d!58119))

(declare-fun d!58121 () Bool)

(declare-fun e!137632 () Bool)

(assert (=> d!58121 e!137632))

(declare-fun res!103271 () Bool)

(assert (=> d!58121 (=> (not res!103271) (not e!137632))))

(declare-fun lt!108747 () ListLongMap!3035)

(assert (=> d!58121 (= res!103271 (not (contains!1388 lt!108747 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!137634 () ListLongMap!3035)

(assert (=> d!58121 (= lt!108747 e!137634)))

(declare-fun c!35707 () Bool)

(assert (=> d!58121 (= c!35707 (bvsge #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58121 (validMask!0 mask!1149)))

(assert (=> d!58121 (= (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108747)))

(declare-fun b!211450 () Bool)

(assert (=> b!211450 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> b!211450 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5100 _values!649)))))

(declare-fun e!137635 () Bool)

(declare-fun apply!194 (ListLongMap!3035 (_ BitVec 64)) V!6889)

(declare-fun get!2566 (ValueCell!2372 V!6889) V!6889)

(declare-fun dynLambda!537 (Int (_ BitVec 64)) V!6889)

(assert (=> b!211450 (= e!137635 (= (apply!194 lt!108747 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4775 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211451 () Bool)

(declare-fun e!137631 () Bool)

(assert (=> b!211451 (= e!137632 e!137631)))

(declare-fun c!35706 () Bool)

(declare-fun e!137637 () Bool)

(assert (=> b!211451 (= c!35706 e!137637)))

(declare-fun res!103269 () Bool)

(assert (=> b!211451 (=> (not res!103269) (not e!137637))))

(assert (=> b!211451 (= res!103269 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun b!211452 () Bool)

(declare-fun e!137636 () ListLongMap!3035)

(declare-fun call!19990 () ListLongMap!3035)

(assert (=> b!211452 (= e!137636 call!19990)))

(declare-fun e!137633 () Bool)

(declare-fun b!211453 () Bool)

(assert (=> b!211453 (= e!137633 (= lt!108747 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211454 () Bool)

(assert (=> b!211454 (= e!137637 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211454 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19987 () Bool)

(assert (=> bm!19987 (= call!19990 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211455 () Bool)

(declare-fun isEmpty!501 (ListLongMap!3035) Bool)

(assert (=> b!211455 (= e!137633 (isEmpty!501 lt!108747))))

(declare-fun b!211456 () Bool)

(declare-fun res!103270 () Bool)

(assert (=> b!211456 (=> (not res!103270) (not e!137632))))

(assert (=> b!211456 (= res!103270 (not (contains!1388 lt!108747 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211457 () Bool)

(assert (=> b!211457 (= e!137634 e!137636)))

(declare-fun c!35708 () Bool)

(assert (=> b!211457 (= c!35708 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211458 () Bool)

(assert (=> b!211458 (= e!137634 (ListLongMap!3036 Nil!3003))))

(declare-fun b!211459 () Bool)

(assert (=> b!211459 (= e!137631 e!137633)))

(declare-fun c!35705 () Bool)

(assert (=> b!211459 (= c!35705 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun b!211460 () Bool)

(assert (=> b!211460 (= e!137631 e!137635)))

(assert (=> b!211460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun res!103272 () Bool)

(assert (=> b!211460 (= res!103272 (contains!1388 lt!108747 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211460 (=> (not res!103272) (not e!137635))))

(declare-fun b!211461 () Bool)

(declare-fun lt!108750 () Unit!6408)

(declare-fun lt!108749 () Unit!6408)

(assert (=> b!211461 (= lt!108750 lt!108749)))

(declare-fun lt!108744 () ListLongMap!3035)

(declare-fun lt!108745 () V!6889)

(declare-fun lt!108748 () (_ BitVec 64))

(declare-fun lt!108746 () (_ BitVec 64))

(assert (=> b!211461 (not (contains!1388 (+!562 lt!108744 (tuple2!4121 lt!108746 lt!108745)) lt!108748))))

(declare-fun addStillNotContains!105 (ListLongMap!3035 (_ BitVec 64) V!6889 (_ BitVec 64)) Unit!6408)

(assert (=> b!211461 (= lt!108749 (addStillNotContains!105 lt!108744 lt!108746 lt!108745 lt!108748))))

(assert (=> b!211461 (= lt!108748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211461 (= lt!108745 (get!2566 (select (arr!4775 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211461 (= lt!108746 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211461 (= lt!108744 call!19990)))

(assert (=> b!211461 (= e!137636 (+!562 call!19990 (tuple2!4121 (select (arr!4776 _keys!825) #b00000000000000000000000000000000) (get!2566 (select (arr!4775 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!58121 c!35707) b!211458))

(assert (= (and d!58121 (not c!35707)) b!211457))

(assert (= (and b!211457 c!35708) b!211461))

(assert (= (and b!211457 (not c!35708)) b!211452))

(assert (= (or b!211461 b!211452) bm!19987))

(assert (= (and d!58121 res!103271) b!211456))

(assert (= (and b!211456 res!103270) b!211451))

(assert (= (and b!211451 res!103269) b!211454))

(assert (= (and b!211451 c!35706) b!211460))

(assert (= (and b!211451 (not c!35706)) b!211459))

(assert (= (and b!211460 res!103272) b!211450))

(assert (= (and b!211459 c!35705) b!211453))

(assert (= (and b!211459 (not c!35705)) b!211455))

(declare-fun b_lambda!7681 () Bool)

(assert (=> (not b_lambda!7681) (not b!211450)))

(declare-fun t!7944 () Bool)

(declare-fun tb!2893 () Bool)

(assert (=> (and start!21022 (= defaultEntry!657 defaultEntry!657) t!7944) tb!2893))

(declare-fun result!4983 () Bool)

(assert (=> tb!2893 (= result!4983 tp_is_empty!5431)))

(assert (=> b!211450 t!7944))

(declare-fun b_and!12395 () Bool)

(assert (= b_and!12389 (and (=> t!7944 result!4983) b_and!12395)))

(declare-fun b_lambda!7683 () Bool)

(assert (=> (not b_lambda!7683) (not b!211461)))

(assert (=> b!211461 t!7944))

(declare-fun b_and!12397 () Bool)

(assert (= b_and!12395 (and (=> t!7944 result!4983) b_and!12397)))

(assert (=> b!211457 m!239301))

(assert (=> b!211457 m!239301))

(assert (=> b!211457 m!239303))

(declare-fun m!239333 () Bool)

(assert (=> b!211450 m!239333))

(assert (=> b!211450 m!239333))

(declare-fun m!239335 () Bool)

(assert (=> b!211450 m!239335))

(declare-fun m!239337 () Bool)

(assert (=> b!211450 m!239337))

(assert (=> b!211450 m!239335))

(assert (=> b!211450 m!239301))

(declare-fun m!239339 () Bool)

(assert (=> b!211450 m!239339))

(assert (=> b!211450 m!239301))

(declare-fun m!239341 () Bool)

(assert (=> d!58121 m!239341))

(assert (=> d!58121 m!239219))

(assert (=> b!211454 m!239301))

(assert (=> b!211454 m!239301))

(assert (=> b!211454 m!239303))

(declare-fun m!239343 () Bool)

(assert (=> b!211455 m!239343))

(declare-fun m!239345 () Bool)

(assert (=> b!211453 m!239345))

(assert (=> b!211461 m!239333))

(assert (=> b!211461 m!239335))

(assert (=> b!211461 m!239337))

(assert (=> b!211461 m!239335))

(declare-fun m!239347 () Bool)

(assert (=> b!211461 m!239347))

(declare-fun m!239349 () Bool)

(assert (=> b!211461 m!239349))

(declare-fun m!239351 () Bool)

(assert (=> b!211461 m!239351))

(assert (=> b!211461 m!239333))

(declare-fun m!239353 () Bool)

(assert (=> b!211461 m!239353))

(assert (=> b!211461 m!239347))

(assert (=> b!211461 m!239301))

(declare-fun m!239355 () Bool)

(assert (=> b!211456 m!239355))

(assert (=> b!211460 m!239301))

(assert (=> b!211460 m!239301))

(declare-fun m!239357 () Bool)

(assert (=> b!211460 m!239357))

(assert (=> bm!19987 m!239345))

(assert (=> b!211333 d!58121))

(declare-fun b!211470 () Bool)

(declare-fun e!137643 () Bool)

(declare-fun call!19995 () ListLongMap!3035)

(declare-fun call!19996 () ListLongMap!3035)

(assert (=> b!211470 (= e!137643 (= call!19995 (+!562 call!19996 (tuple2!4121 k0!843 v!520))))))

(declare-fun d!58123 () Bool)

(declare-fun e!137642 () Bool)

(assert (=> d!58123 e!137642))

(declare-fun res!103275 () Bool)

(assert (=> d!58123 (=> (not res!103275) (not e!137642))))

(assert (=> d!58123 (= res!103275 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5100 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5100 _values!649))))))))

(declare-fun lt!108753 () Unit!6408)

(declare-fun choose!1085 (array!10061 array!10059 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) (_ BitVec 64) V!6889 (_ BitVec 32) Int) Unit!6408)

(assert (=> d!58123 (= lt!108753 (choose!1085 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58123 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!211 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108753)))

(declare-fun bm!19992 () Bool)

(assert (=> bm!19992 (= call!19995 (getCurrentListMapNoExtraKeys!493 _keys!825 (array!10060 (store (arr!4775 _values!649) i!601 (ValueCellFull!2372 v!520)) (size!5100 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211471 () Bool)

(assert (=> b!211471 (= e!137642 e!137643)))

(declare-fun c!35711 () Bool)

(assert (=> b!211471 (= c!35711 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!211472 () Bool)

(assert (=> b!211472 (= e!137643 (= call!19995 call!19996))))

(declare-fun bm!19993 () Bool)

(assert (=> bm!19993 (= call!19996 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58123 res!103275) b!211471))

(assert (= (and b!211471 c!35711) b!211470))

(assert (= (and b!211471 (not c!35711)) b!211472))

(assert (= (or b!211470 b!211472) bm!19992))

(assert (= (or b!211470 b!211472) bm!19993))

(declare-fun m!239359 () Bool)

(assert (=> b!211470 m!239359))

(declare-fun m!239361 () Bool)

(assert (=> d!58123 m!239361))

(assert (=> bm!19992 m!239213))

(declare-fun m!239363 () Bool)

(assert (=> bm!19992 m!239363))

(assert (=> bm!19993 m!239211))

(assert (=> b!211333 d!58123))

(declare-fun b!211515 () Bool)

(declare-fun e!137679 () Bool)

(declare-fun lt!108812 () ListLongMap!3035)

(assert (=> b!211515 (= e!137679 (= (apply!194 lt!108812 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211516 () Bool)

(declare-fun res!103302 () Bool)

(declare-fun e!137677 () Bool)

(assert (=> b!211516 (=> (not res!103302) (not e!137677))))

(declare-fun e!137671 () Bool)

(assert (=> b!211516 (= res!103302 e!137671)))

(declare-fun c!35729 () Bool)

(assert (=> b!211516 (= c!35729 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211517 () Bool)

(declare-fun e!137678 () Bool)

(assert (=> b!211517 (= e!137678 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211518 () Bool)

(declare-fun e!137681 () ListLongMap!3035)

(declare-fun call!20011 () ListLongMap!3035)

(assert (=> b!211518 (= e!137681 (+!562 call!20011 (tuple2!4121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211519 () Bool)

(declare-fun e!137674 () Bool)

(declare-fun call!20016 () Bool)

(assert (=> b!211519 (= e!137674 (not call!20016))))

(declare-fun b!211520 () Bool)

(declare-fun e!137673 () ListLongMap!3035)

(declare-fun call!20015 () ListLongMap!3035)

(assert (=> b!211520 (= e!137673 call!20015)))

(declare-fun bm!20008 () Bool)

(declare-fun call!20013 () ListLongMap!3035)

(assert (=> bm!20008 (= call!20013 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211521 () Bool)

(declare-fun c!35725 () Bool)

(assert (=> b!211521 (= c!35725 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137676 () ListLongMap!3035)

(assert (=> b!211521 (= e!137676 e!137673)))

(declare-fun b!211522 () Bool)

(assert (=> b!211522 (= e!137681 e!137676)))

(declare-fun c!35728 () Bool)

(assert (=> b!211522 (= c!35728 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211523 () Bool)

(assert (=> b!211523 (= e!137677 e!137674)))

(declare-fun c!35727 () Bool)

(assert (=> b!211523 (= c!35727 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20009 () Bool)

(assert (=> bm!20009 (= call!20016 (contains!1388 lt!108812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211525 () Bool)

(declare-fun call!20014 () ListLongMap!3035)

(assert (=> b!211525 (= e!137673 call!20014)))

(declare-fun bm!20010 () Bool)

(assert (=> bm!20010 (= call!20015 call!20011)))

(declare-fun bm!20011 () Bool)

(declare-fun call!20017 () Bool)

(assert (=> bm!20011 (= call!20017 (contains!1388 lt!108812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211526 () Bool)

(declare-fun e!137670 () Bool)

(assert (=> b!211526 (= e!137670 (= (apply!194 lt!108812 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211527 () Bool)

(assert (=> b!211527 (= e!137671 (not call!20017))))

(declare-fun bm!20012 () Bool)

(declare-fun c!35724 () Bool)

(declare-fun call!20012 () ListLongMap!3035)

(assert (=> bm!20012 (= call!20011 (+!562 (ite c!35724 call!20013 (ite c!35728 call!20012 call!20014)) (ite (or c!35724 c!35728) (tuple2!4121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun e!137672 () Bool)

(declare-fun b!211528 () Bool)

(assert (=> b!211528 (= e!137672 (= (apply!194 lt!108812 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4775 lt!108662) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5100 lt!108662)))))

(assert (=> b!211528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun b!211529 () Bool)

(declare-fun e!137675 () Bool)

(assert (=> b!211529 (= e!137675 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211530 () Bool)

(assert (=> b!211530 (= e!137671 e!137670)))

(declare-fun res!103295 () Bool)

(assert (=> b!211530 (= res!103295 call!20017)))

(assert (=> b!211530 (=> (not res!103295) (not e!137670))))

(declare-fun b!211531 () Bool)

(assert (=> b!211531 (= e!137676 call!20015)))

(declare-fun b!211532 () Bool)

(declare-fun e!137682 () Unit!6408)

(declare-fun lt!108803 () Unit!6408)

(assert (=> b!211532 (= e!137682 lt!108803)))

(declare-fun lt!108802 () ListLongMap!3035)

(assert (=> b!211532 (= lt!108802 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108814 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108811 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108811 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108798 () Unit!6408)

(declare-fun addStillContains!170 (ListLongMap!3035 (_ BitVec 64) V!6889 (_ BitVec 64)) Unit!6408)

(assert (=> b!211532 (= lt!108798 (addStillContains!170 lt!108802 lt!108814 zeroValue!615 lt!108811))))

(assert (=> b!211532 (contains!1388 (+!562 lt!108802 (tuple2!4121 lt!108814 zeroValue!615)) lt!108811)))

(declare-fun lt!108813 () Unit!6408)

(assert (=> b!211532 (= lt!108813 lt!108798)))

(declare-fun lt!108806 () ListLongMap!3035)

(assert (=> b!211532 (= lt!108806 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108810 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108810 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108817 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108817 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108800 () Unit!6408)

(declare-fun addApplyDifferent!170 (ListLongMap!3035 (_ BitVec 64) V!6889 (_ BitVec 64)) Unit!6408)

(assert (=> b!211532 (= lt!108800 (addApplyDifferent!170 lt!108806 lt!108810 minValue!615 lt!108817))))

(assert (=> b!211532 (= (apply!194 (+!562 lt!108806 (tuple2!4121 lt!108810 minValue!615)) lt!108817) (apply!194 lt!108806 lt!108817))))

(declare-fun lt!108809 () Unit!6408)

(assert (=> b!211532 (= lt!108809 lt!108800)))

(declare-fun lt!108815 () ListLongMap!3035)

(assert (=> b!211532 (= lt!108815 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108808 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108819 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108819 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108807 () Unit!6408)

(assert (=> b!211532 (= lt!108807 (addApplyDifferent!170 lt!108815 lt!108808 zeroValue!615 lt!108819))))

(assert (=> b!211532 (= (apply!194 (+!562 lt!108815 (tuple2!4121 lt!108808 zeroValue!615)) lt!108819) (apply!194 lt!108815 lt!108819))))

(declare-fun lt!108818 () Unit!6408)

(assert (=> b!211532 (= lt!108818 lt!108807)))

(declare-fun lt!108804 () ListLongMap!3035)

(assert (=> b!211532 (= lt!108804 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108816 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108805 () (_ BitVec 64))

(assert (=> b!211532 (= lt!108805 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211532 (= lt!108803 (addApplyDifferent!170 lt!108804 lt!108816 minValue!615 lt!108805))))

(assert (=> b!211532 (= (apply!194 (+!562 lt!108804 (tuple2!4121 lt!108816 minValue!615)) lt!108805) (apply!194 lt!108804 lt!108805))))

(declare-fun b!211533 () Bool)

(declare-fun res!103297 () Bool)

(assert (=> b!211533 (=> (not res!103297) (not e!137677))))

(declare-fun e!137680 () Bool)

(assert (=> b!211533 (= res!103297 e!137680)))

(declare-fun res!103294 () Bool)

(assert (=> b!211533 (=> res!103294 e!137680)))

(assert (=> b!211533 (= res!103294 (not e!137678))))

(declare-fun res!103300 () Bool)

(assert (=> b!211533 (=> (not res!103300) (not e!137678))))

(assert (=> b!211533 (= res!103300 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun bm!20013 () Bool)

(assert (=> bm!20013 (= call!20014 call!20012)))

(declare-fun b!211534 () Bool)

(assert (=> b!211534 (= e!137674 e!137679)))

(declare-fun res!103296 () Bool)

(assert (=> b!211534 (= res!103296 call!20016)))

(assert (=> b!211534 (=> (not res!103296) (not e!137679))))

(declare-fun b!211535 () Bool)

(declare-fun Unit!6412 () Unit!6408)

(assert (=> b!211535 (= e!137682 Unit!6412)))

(declare-fun bm!20014 () Bool)

(assert (=> bm!20014 (= call!20012 call!20013)))

(declare-fun d!58125 () Bool)

(assert (=> d!58125 e!137677))

(declare-fun res!103301 () Bool)

(assert (=> d!58125 (=> (not res!103301) (not e!137677))))

(assert (=> d!58125 (= res!103301 (or (bvsge #b00000000000000000000000000000000 (size!5101 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))))

(declare-fun lt!108801 () ListLongMap!3035)

(assert (=> d!58125 (= lt!108812 lt!108801)))

(declare-fun lt!108799 () Unit!6408)

(assert (=> d!58125 (= lt!108799 e!137682)))

(declare-fun c!35726 () Bool)

(assert (=> d!58125 (= c!35726 e!137675)))

(declare-fun res!103299 () Bool)

(assert (=> d!58125 (=> (not res!103299) (not e!137675))))

(assert (=> d!58125 (= res!103299 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58125 (= lt!108801 e!137681)))

(assert (=> d!58125 (= c!35724 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58125 (validMask!0 mask!1149)))

(assert (=> d!58125 (= (getCurrentListMap!1070 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108812)))

(declare-fun b!211524 () Bool)

(assert (=> b!211524 (= e!137680 e!137672)))

(declare-fun res!103298 () Bool)

(assert (=> b!211524 (=> (not res!103298) (not e!137672))))

(assert (=> b!211524 (= res!103298 (contains!1388 lt!108812 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (= (and d!58125 c!35724) b!211518))

(assert (= (and d!58125 (not c!35724)) b!211522))

(assert (= (and b!211522 c!35728) b!211531))

(assert (= (and b!211522 (not c!35728)) b!211521))

(assert (= (and b!211521 c!35725) b!211520))

(assert (= (and b!211521 (not c!35725)) b!211525))

(assert (= (or b!211520 b!211525) bm!20013))

(assert (= (or b!211531 bm!20013) bm!20014))

(assert (= (or b!211531 b!211520) bm!20010))

(assert (= (or b!211518 bm!20014) bm!20008))

(assert (= (or b!211518 bm!20010) bm!20012))

(assert (= (and d!58125 res!103299) b!211529))

(assert (= (and d!58125 c!35726) b!211532))

(assert (= (and d!58125 (not c!35726)) b!211535))

(assert (= (and d!58125 res!103301) b!211533))

(assert (= (and b!211533 res!103300) b!211517))

(assert (= (and b!211533 (not res!103294)) b!211524))

(assert (= (and b!211524 res!103298) b!211528))

(assert (= (and b!211533 res!103297) b!211516))

(assert (= (and b!211516 c!35729) b!211530))

(assert (= (and b!211516 (not c!35729)) b!211527))

(assert (= (and b!211530 res!103295) b!211526))

(assert (= (or b!211530 b!211527) bm!20011))

(assert (= (and b!211516 res!103302) b!211523))

(assert (= (and b!211523 c!35727) b!211534))

(assert (= (and b!211523 (not c!35727)) b!211519))

(assert (= (and b!211534 res!103296) b!211515))

(assert (= (or b!211534 b!211519) bm!20009))

(declare-fun b_lambda!7685 () Bool)

(assert (=> (not b_lambda!7685) (not b!211528)))

(assert (=> b!211528 t!7944))

(declare-fun b_and!12399 () Bool)

(assert (= b_and!12397 (and (=> t!7944 result!4983) b_and!12399)))

(assert (=> b!211517 m!239301))

(assert (=> b!211517 m!239301))

(assert (=> b!211517 m!239303))

(declare-fun m!239365 () Bool)

(assert (=> bm!20009 m!239365))

(declare-fun m!239367 () Bool)

(assert (=> b!211526 m!239367))

(assert (=> bm!20008 m!239203))

(assert (=> b!211529 m!239301))

(assert (=> b!211529 m!239301))

(assert (=> b!211529 m!239303))

(assert (=> d!58125 m!239219))

(declare-fun m!239369 () Bool)

(assert (=> b!211515 m!239369))

(declare-fun m!239371 () Bool)

(assert (=> bm!20011 m!239371))

(declare-fun m!239373 () Bool)

(assert (=> b!211518 m!239373))

(assert (=> b!211524 m!239301))

(assert (=> b!211524 m!239301))

(declare-fun m!239375 () Bool)

(assert (=> b!211524 m!239375))

(declare-fun m!239377 () Bool)

(assert (=> b!211532 m!239377))

(declare-fun m!239379 () Bool)

(assert (=> b!211532 m!239379))

(declare-fun m!239381 () Bool)

(assert (=> b!211532 m!239381))

(declare-fun m!239383 () Bool)

(assert (=> b!211532 m!239383))

(declare-fun m!239385 () Bool)

(assert (=> b!211532 m!239385))

(declare-fun m!239387 () Bool)

(assert (=> b!211532 m!239387))

(declare-fun m!239389 () Bool)

(assert (=> b!211532 m!239389))

(declare-fun m!239391 () Bool)

(assert (=> b!211532 m!239391))

(declare-fun m!239393 () Bool)

(assert (=> b!211532 m!239393))

(assert (=> b!211532 m!239383))

(assert (=> b!211532 m!239203))

(declare-fun m!239395 () Bool)

(assert (=> b!211532 m!239395))

(declare-fun m!239397 () Bool)

(assert (=> b!211532 m!239397))

(assert (=> b!211532 m!239377))

(assert (=> b!211532 m!239387))

(assert (=> b!211532 m!239301))

(declare-fun m!239399 () Bool)

(assert (=> b!211532 m!239399))

(assert (=> b!211532 m!239395))

(declare-fun m!239401 () Bool)

(assert (=> b!211532 m!239401))

(declare-fun m!239403 () Bool)

(assert (=> b!211532 m!239403))

(declare-fun m!239405 () Bool)

(assert (=> b!211532 m!239405))

(assert (=> b!211528 m!239301))

(assert (=> b!211528 m!239301))

(declare-fun m!239407 () Bool)

(assert (=> b!211528 m!239407))

(declare-fun m!239409 () Bool)

(assert (=> b!211528 m!239409))

(assert (=> b!211528 m!239335))

(declare-fun m!239411 () Bool)

(assert (=> b!211528 m!239411))

(assert (=> b!211528 m!239409))

(assert (=> b!211528 m!239335))

(declare-fun m!239413 () Bool)

(assert (=> bm!20012 m!239413))

(assert (=> b!211333 d!58125))

(declare-fun b!211536 () Bool)

(declare-fun e!137692 () Bool)

(declare-fun lt!108834 () ListLongMap!3035)

(assert (=> b!211536 (= e!137692 (= (apply!194 lt!108834 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211537 () Bool)

(declare-fun res!103311 () Bool)

(declare-fun e!137690 () Bool)

(assert (=> b!211537 (=> (not res!103311) (not e!137690))))

(declare-fun e!137684 () Bool)

(assert (=> b!211537 (= res!103311 e!137684)))

(declare-fun c!35735 () Bool)

(assert (=> b!211537 (= c!35735 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211538 () Bool)

(declare-fun e!137691 () Bool)

(assert (=> b!211538 (= e!137691 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211539 () Bool)

(declare-fun e!137694 () ListLongMap!3035)

(declare-fun call!20018 () ListLongMap!3035)

(assert (=> b!211539 (= e!137694 (+!562 call!20018 (tuple2!4121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211540 () Bool)

(declare-fun e!137687 () Bool)

(declare-fun call!20023 () Bool)

(assert (=> b!211540 (= e!137687 (not call!20023))))

(declare-fun b!211541 () Bool)

(declare-fun e!137686 () ListLongMap!3035)

(declare-fun call!20022 () ListLongMap!3035)

(assert (=> b!211541 (= e!137686 call!20022)))

(declare-fun call!20020 () ListLongMap!3035)

(declare-fun bm!20015 () Bool)

(assert (=> bm!20015 (= call!20020 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211542 () Bool)

(declare-fun c!35731 () Bool)

(assert (=> b!211542 (= c!35731 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137689 () ListLongMap!3035)

(assert (=> b!211542 (= e!137689 e!137686)))

(declare-fun b!211543 () Bool)

(assert (=> b!211543 (= e!137694 e!137689)))

(declare-fun c!35734 () Bool)

(assert (=> b!211543 (= c!35734 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211544 () Bool)

(assert (=> b!211544 (= e!137690 e!137687)))

(declare-fun c!35733 () Bool)

(assert (=> b!211544 (= c!35733 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20016 () Bool)

(assert (=> bm!20016 (= call!20023 (contains!1388 lt!108834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211546 () Bool)

(declare-fun call!20021 () ListLongMap!3035)

(assert (=> b!211546 (= e!137686 call!20021)))

(declare-fun bm!20017 () Bool)

(assert (=> bm!20017 (= call!20022 call!20018)))

(declare-fun bm!20018 () Bool)

(declare-fun call!20024 () Bool)

(assert (=> bm!20018 (= call!20024 (contains!1388 lt!108834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211547 () Bool)

(declare-fun e!137683 () Bool)

(assert (=> b!211547 (= e!137683 (= (apply!194 lt!108834 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211548 () Bool)

(assert (=> b!211548 (= e!137684 (not call!20024))))

(declare-fun c!35730 () Bool)

(declare-fun bm!20019 () Bool)

(declare-fun call!20019 () ListLongMap!3035)

(assert (=> bm!20019 (= call!20018 (+!562 (ite c!35730 call!20020 (ite c!35734 call!20019 call!20021)) (ite (or c!35730 c!35734) (tuple2!4121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun e!137685 () Bool)

(declare-fun b!211549 () Bool)

(assert (=> b!211549 (= e!137685 (= (apply!194 lt!108834 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4775 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5100 _values!649)))))

(assert (=> b!211549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun b!211550 () Bool)

(declare-fun e!137688 () Bool)

(assert (=> b!211550 (= e!137688 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211551 () Bool)

(assert (=> b!211551 (= e!137684 e!137683)))

(declare-fun res!103304 () Bool)

(assert (=> b!211551 (= res!103304 call!20024)))

(assert (=> b!211551 (=> (not res!103304) (not e!137683))))

(declare-fun b!211552 () Bool)

(assert (=> b!211552 (= e!137689 call!20022)))

(declare-fun b!211553 () Bool)

(declare-fun e!137695 () Unit!6408)

(declare-fun lt!108825 () Unit!6408)

(assert (=> b!211553 (= e!137695 lt!108825)))

(declare-fun lt!108824 () ListLongMap!3035)

(assert (=> b!211553 (= lt!108824 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108836 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108833 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108833 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108820 () Unit!6408)

(assert (=> b!211553 (= lt!108820 (addStillContains!170 lt!108824 lt!108836 zeroValue!615 lt!108833))))

(assert (=> b!211553 (contains!1388 (+!562 lt!108824 (tuple2!4121 lt!108836 zeroValue!615)) lt!108833)))

(declare-fun lt!108835 () Unit!6408)

(assert (=> b!211553 (= lt!108835 lt!108820)))

(declare-fun lt!108828 () ListLongMap!3035)

(assert (=> b!211553 (= lt!108828 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108832 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108839 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108839 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108822 () Unit!6408)

(assert (=> b!211553 (= lt!108822 (addApplyDifferent!170 lt!108828 lt!108832 minValue!615 lt!108839))))

(assert (=> b!211553 (= (apply!194 (+!562 lt!108828 (tuple2!4121 lt!108832 minValue!615)) lt!108839) (apply!194 lt!108828 lt!108839))))

(declare-fun lt!108831 () Unit!6408)

(assert (=> b!211553 (= lt!108831 lt!108822)))

(declare-fun lt!108837 () ListLongMap!3035)

(assert (=> b!211553 (= lt!108837 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108830 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108841 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108841 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108829 () Unit!6408)

(assert (=> b!211553 (= lt!108829 (addApplyDifferent!170 lt!108837 lt!108830 zeroValue!615 lt!108841))))

(assert (=> b!211553 (= (apply!194 (+!562 lt!108837 (tuple2!4121 lt!108830 zeroValue!615)) lt!108841) (apply!194 lt!108837 lt!108841))))

(declare-fun lt!108840 () Unit!6408)

(assert (=> b!211553 (= lt!108840 lt!108829)))

(declare-fun lt!108826 () ListLongMap!3035)

(assert (=> b!211553 (= lt!108826 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108838 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108838 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108827 () (_ BitVec 64))

(assert (=> b!211553 (= lt!108827 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211553 (= lt!108825 (addApplyDifferent!170 lt!108826 lt!108838 minValue!615 lt!108827))))

(assert (=> b!211553 (= (apply!194 (+!562 lt!108826 (tuple2!4121 lt!108838 minValue!615)) lt!108827) (apply!194 lt!108826 lt!108827))))

(declare-fun b!211554 () Bool)

(declare-fun res!103306 () Bool)

(assert (=> b!211554 (=> (not res!103306) (not e!137690))))

(declare-fun e!137693 () Bool)

(assert (=> b!211554 (= res!103306 e!137693)))

(declare-fun res!103303 () Bool)

(assert (=> b!211554 (=> res!103303 e!137693)))

(assert (=> b!211554 (= res!103303 (not e!137691))))

(declare-fun res!103309 () Bool)

(assert (=> b!211554 (=> (not res!103309) (not e!137691))))

(assert (=> b!211554 (= res!103309 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun bm!20020 () Bool)

(assert (=> bm!20020 (= call!20021 call!20019)))

(declare-fun b!211555 () Bool)

(assert (=> b!211555 (= e!137687 e!137692)))

(declare-fun res!103305 () Bool)

(assert (=> b!211555 (= res!103305 call!20023)))

(assert (=> b!211555 (=> (not res!103305) (not e!137692))))

(declare-fun b!211556 () Bool)

(declare-fun Unit!6413 () Unit!6408)

(assert (=> b!211556 (= e!137695 Unit!6413)))

(declare-fun bm!20021 () Bool)

(assert (=> bm!20021 (= call!20019 call!20020)))

(declare-fun d!58127 () Bool)

(assert (=> d!58127 e!137690))

(declare-fun res!103310 () Bool)

(assert (=> d!58127 (=> (not res!103310) (not e!137690))))

(assert (=> d!58127 (= res!103310 (or (bvsge #b00000000000000000000000000000000 (size!5101 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))))

(declare-fun lt!108823 () ListLongMap!3035)

(assert (=> d!58127 (= lt!108834 lt!108823)))

(declare-fun lt!108821 () Unit!6408)

(assert (=> d!58127 (= lt!108821 e!137695)))

(declare-fun c!35732 () Bool)

(assert (=> d!58127 (= c!35732 e!137688)))

(declare-fun res!103308 () Bool)

(assert (=> d!58127 (=> (not res!103308) (not e!137688))))

(assert (=> d!58127 (= res!103308 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58127 (= lt!108823 e!137694)))

(assert (=> d!58127 (= c!35730 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58127 (validMask!0 mask!1149)))

(assert (=> d!58127 (= (getCurrentListMap!1070 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108834)))

(declare-fun b!211545 () Bool)

(assert (=> b!211545 (= e!137693 e!137685)))

(declare-fun res!103307 () Bool)

(assert (=> b!211545 (=> (not res!103307) (not e!137685))))

(assert (=> b!211545 (= res!103307 (contains!1388 lt!108834 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (= (and d!58127 c!35730) b!211539))

(assert (= (and d!58127 (not c!35730)) b!211543))

(assert (= (and b!211543 c!35734) b!211552))

(assert (= (and b!211543 (not c!35734)) b!211542))

(assert (= (and b!211542 c!35731) b!211541))

(assert (= (and b!211542 (not c!35731)) b!211546))

(assert (= (or b!211541 b!211546) bm!20020))

(assert (= (or b!211552 bm!20020) bm!20021))

(assert (= (or b!211552 b!211541) bm!20017))

(assert (= (or b!211539 bm!20021) bm!20015))

(assert (= (or b!211539 bm!20017) bm!20019))

(assert (= (and d!58127 res!103308) b!211550))

(assert (= (and d!58127 c!35732) b!211553))

(assert (= (and d!58127 (not c!35732)) b!211556))

(assert (= (and d!58127 res!103310) b!211554))

(assert (= (and b!211554 res!103309) b!211538))

(assert (= (and b!211554 (not res!103303)) b!211545))

(assert (= (and b!211545 res!103307) b!211549))

(assert (= (and b!211554 res!103306) b!211537))

(assert (= (and b!211537 c!35735) b!211551))

(assert (= (and b!211537 (not c!35735)) b!211548))

(assert (= (and b!211551 res!103304) b!211547))

(assert (= (or b!211551 b!211548) bm!20018))

(assert (= (and b!211537 res!103311) b!211544))

(assert (= (and b!211544 c!35733) b!211555))

(assert (= (and b!211544 (not c!35733)) b!211540))

(assert (= (and b!211555 res!103305) b!211536))

(assert (= (or b!211555 b!211540) bm!20016))

(declare-fun b_lambda!7687 () Bool)

(assert (=> (not b_lambda!7687) (not b!211549)))

(assert (=> b!211549 t!7944))

(declare-fun b_and!12401 () Bool)

(assert (= b_and!12399 (and (=> t!7944 result!4983) b_and!12401)))

(assert (=> b!211538 m!239301))

(assert (=> b!211538 m!239301))

(assert (=> b!211538 m!239303))

(declare-fun m!239415 () Bool)

(assert (=> bm!20016 m!239415))

(declare-fun m!239417 () Bool)

(assert (=> b!211547 m!239417))

(assert (=> bm!20015 m!239211))

(assert (=> b!211550 m!239301))

(assert (=> b!211550 m!239301))

(assert (=> b!211550 m!239303))

(assert (=> d!58127 m!239219))

(declare-fun m!239419 () Bool)

(assert (=> b!211536 m!239419))

(declare-fun m!239421 () Bool)

(assert (=> bm!20018 m!239421))

(declare-fun m!239423 () Bool)

(assert (=> b!211539 m!239423))

(assert (=> b!211545 m!239301))

(assert (=> b!211545 m!239301))

(declare-fun m!239425 () Bool)

(assert (=> b!211545 m!239425))

(declare-fun m!239427 () Bool)

(assert (=> b!211553 m!239427))

(declare-fun m!239429 () Bool)

(assert (=> b!211553 m!239429))

(declare-fun m!239431 () Bool)

(assert (=> b!211553 m!239431))

(declare-fun m!239433 () Bool)

(assert (=> b!211553 m!239433))

(declare-fun m!239435 () Bool)

(assert (=> b!211553 m!239435))

(declare-fun m!239437 () Bool)

(assert (=> b!211553 m!239437))

(declare-fun m!239439 () Bool)

(assert (=> b!211553 m!239439))

(declare-fun m!239441 () Bool)

(assert (=> b!211553 m!239441))

(declare-fun m!239443 () Bool)

(assert (=> b!211553 m!239443))

(assert (=> b!211553 m!239433))

(assert (=> b!211553 m!239211))

(declare-fun m!239445 () Bool)

(assert (=> b!211553 m!239445))

(declare-fun m!239447 () Bool)

(assert (=> b!211553 m!239447))

(assert (=> b!211553 m!239427))

(assert (=> b!211553 m!239437))

(assert (=> b!211553 m!239301))

(declare-fun m!239449 () Bool)

(assert (=> b!211553 m!239449))

(assert (=> b!211553 m!239445))

(declare-fun m!239451 () Bool)

(assert (=> b!211553 m!239451))

(declare-fun m!239453 () Bool)

(assert (=> b!211553 m!239453))

(declare-fun m!239455 () Bool)

(assert (=> b!211553 m!239455))

(assert (=> b!211549 m!239301))

(assert (=> b!211549 m!239301))

(declare-fun m!239457 () Bool)

(assert (=> b!211549 m!239457))

(assert (=> b!211549 m!239333))

(assert (=> b!211549 m!239335))

(assert (=> b!211549 m!239337))

(assert (=> b!211549 m!239333))

(assert (=> b!211549 m!239335))

(declare-fun m!239459 () Bool)

(assert (=> bm!20019 m!239459))

(assert (=> b!211333 d!58127))

(declare-fun d!58129 () Bool)

(declare-fun e!137696 () Bool)

(assert (=> d!58129 e!137696))

(declare-fun res!103312 () Bool)

(assert (=> d!58129 (=> (not res!103312) (not e!137696))))

(declare-fun lt!108844 () ListLongMap!3035)

(assert (=> d!58129 (= res!103312 (contains!1388 lt!108844 (_1!2071 (tuple2!4121 k0!843 v!520))))))

(declare-fun lt!108842 () List!3006)

(assert (=> d!58129 (= lt!108844 (ListLongMap!3036 lt!108842))))

(declare-fun lt!108843 () Unit!6408)

(declare-fun lt!108845 () Unit!6408)

(assert (=> d!58129 (= lt!108843 lt!108845)))

(assert (=> d!58129 (= (getValueByKey!253 lt!108842 (_1!2071 (tuple2!4121 k0!843 v!520))) (Some!258 (_2!2071 (tuple2!4121 k0!843 v!520))))))

(assert (=> d!58129 (= lt!108845 (lemmaContainsTupThenGetReturnValue!140 lt!108842 (_1!2071 (tuple2!4121 k0!843 v!520)) (_2!2071 (tuple2!4121 k0!843 v!520))))))

(assert (=> d!58129 (= lt!108842 (insertStrictlySorted!143 (toList!1533 lt!108661) (_1!2071 (tuple2!4121 k0!843 v!520)) (_2!2071 (tuple2!4121 k0!843 v!520))))))

(assert (=> d!58129 (= (+!562 lt!108661 (tuple2!4121 k0!843 v!520)) lt!108844)))

(declare-fun b!211557 () Bool)

(declare-fun res!103313 () Bool)

(assert (=> b!211557 (=> (not res!103313) (not e!137696))))

(assert (=> b!211557 (= res!103313 (= (getValueByKey!253 (toList!1533 lt!108844) (_1!2071 (tuple2!4121 k0!843 v!520))) (Some!258 (_2!2071 (tuple2!4121 k0!843 v!520)))))))

(declare-fun b!211558 () Bool)

(assert (=> b!211558 (= e!137696 (contains!1389 (toList!1533 lt!108844) (tuple2!4121 k0!843 v!520)))))

(assert (= (and d!58129 res!103312) b!211557))

(assert (= (and b!211557 res!103313) b!211558))

(declare-fun m!239461 () Bool)

(assert (=> d!58129 m!239461))

(declare-fun m!239463 () Bool)

(assert (=> d!58129 m!239463))

(declare-fun m!239465 () Bool)

(assert (=> d!58129 m!239465))

(declare-fun m!239467 () Bool)

(assert (=> d!58129 m!239467))

(declare-fun m!239469 () Bool)

(assert (=> b!211557 m!239469))

(declare-fun m!239471 () Bool)

(assert (=> b!211558 m!239471))

(assert (=> b!211333 d!58129))

(declare-fun d!58131 () Bool)

(declare-fun e!137698 () Bool)

(assert (=> d!58131 e!137698))

(declare-fun res!103316 () Bool)

(assert (=> d!58131 (=> (not res!103316) (not e!137698))))

(declare-fun lt!108849 () ListLongMap!3035)

(assert (=> d!58131 (= res!103316 (not (contains!1388 lt!108849 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!137700 () ListLongMap!3035)

(assert (=> d!58131 (= lt!108849 e!137700)))

(declare-fun c!35738 () Bool)

(assert (=> d!58131 (= c!35738 (bvsge #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58131 (validMask!0 mask!1149)))

(assert (=> d!58131 (= (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108849)))

(declare-fun b!211559 () Bool)

(assert (=> b!211559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> b!211559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5100 lt!108662)))))

(declare-fun e!137701 () Bool)

(assert (=> b!211559 (= e!137701 (= (apply!194 lt!108849 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4775 lt!108662) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211560 () Bool)

(declare-fun e!137697 () Bool)

(assert (=> b!211560 (= e!137698 e!137697)))

(declare-fun c!35737 () Bool)

(declare-fun e!137703 () Bool)

(assert (=> b!211560 (= c!35737 e!137703)))

(declare-fun res!103314 () Bool)

(assert (=> b!211560 (=> (not res!103314) (not e!137703))))

(assert (=> b!211560 (= res!103314 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun b!211561 () Bool)

(declare-fun e!137702 () ListLongMap!3035)

(declare-fun call!20025 () ListLongMap!3035)

(assert (=> b!211561 (= e!137702 call!20025)))

(declare-fun b!211562 () Bool)

(declare-fun e!137699 () Bool)

(assert (=> b!211562 (= e!137699 (= lt!108849 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211563 () Bool)

(assert (=> b!211563 (= e!137703 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211563 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!20022 () Bool)

(assert (=> bm!20022 (= call!20025 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108662 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211564 () Bool)

(assert (=> b!211564 (= e!137699 (isEmpty!501 lt!108849))))

(declare-fun b!211565 () Bool)

(declare-fun res!103315 () Bool)

(assert (=> b!211565 (=> (not res!103315) (not e!137698))))

(assert (=> b!211565 (= res!103315 (not (contains!1388 lt!108849 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211566 () Bool)

(assert (=> b!211566 (= e!137700 e!137702)))

(declare-fun c!35739 () Bool)

(assert (=> b!211566 (= c!35739 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211567 () Bool)

(assert (=> b!211567 (= e!137700 (ListLongMap!3036 Nil!3003))))

(declare-fun b!211568 () Bool)

(assert (=> b!211568 (= e!137697 e!137699)))

(declare-fun c!35736 () Bool)

(assert (=> b!211568 (= c!35736 (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun b!211569 () Bool)

(assert (=> b!211569 (= e!137697 e!137701)))

(assert (=> b!211569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(declare-fun res!103317 () Bool)

(assert (=> b!211569 (= res!103317 (contains!1388 lt!108849 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211569 (=> (not res!103317) (not e!137701))))

(declare-fun b!211570 () Bool)

(declare-fun lt!108852 () Unit!6408)

(declare-fun lt!108851 () Unit!6408)

(assert (=> b!211570 (= lt!108852 lt!108851)))

(declare-fun lt!108847 () V!6889)

(declare-fun lt!108846 () ListLongMap!3035)

(declare-fun lt!108850 () (_ BitVec 64))

(declare-fun lt!108848 () (_ BitVec 64))

(assert (=> b!211570 (not (contains!1388 (+!562 lt!108846 (tuple2!4121 lt!108848 lt!108847)) lt!108850))))

(assert (=> b!211570 (= lt!108851 (addStillNotContains!105 lt!108846 lt!108848 lt!108847 lt!108850))))

(assert (=> b!211570 (= lt!108850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211570 (= lt!108847 (get!2566 (select (arr!4775 lt!108662) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211570 (= lt!108848 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211570 (= lt!108846 call!20025)))

(assert (=> b!211570 (= e!137702 (+!562 call!20025 (tuple2!4121 (select (arr!4776 _keys!825) #b00000000000000000000000000000000) (get!2566 (select (arr!4775 lt!108662) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!58131 c!35738) b!211567))

(assert (= (and d!58131 (not c!35738)) b!211566))

(assert (= (and b!211566 c!35739) b!211570))

(assert (= (and b!211566 (not c!35739)) b!211561))

(assert (= (or b!211570 b!211561) bm!20022))

(assert (= (and d!58131 res!103316) b!211565))

(assert (= (and b!211565 res!103315) b!211560))

(assert (= (and b!211560 res!103314) b!211563))

(assert (= (and b!211560 c!35737) b!211569))

(assert (= (and b!211560 (not c!35737)) b!211568))

(assert (= (and b!211569 res!103317) b!211559))

(assert (= (and b!211568 c!35736) b!211562))

(assert (= (and b!211568 (not c!35736)) b!211564))

(declare-fun b_lambda!7689 () Bool)

(assert (=> (not b_lambda!7689) (not b!211559)))

(assert (=> b!211559 t!7944))

(declare-fun b_and!12403 () Bool)

(assert (= b_and!12401 (and (=> t!7944 result!4983) b_and!12403)))

(declare-fun b_lambda!7691 () Bool)

(assert (=> (not b_lambda!7691) (not b!211570)))

(assert (=> b!211570 t!7944))

(declare-fun b_and!12405 () Bool)

(assert (= b_and!12403 (and (=> t!7944 result!4983) b_and!12405)))

(assert (=> b!211566 m!239301))

(assert (=> b!211566 m!239301))

(assert (=> b!211566 m!239303))

(assert (=> b!211559 m!239409))

(assert (=> b!211559 m!239409))

(assert (=> b!211559 m!239335))

(assert (=> b!211559 m!239411))

(assert (=> b!211559 m!239335))

(assert (=> b!211559 m!239301))

(declare-fun m!239473 () Bool)

(assert (=> b!211559 m!239473))

(assert (=> b!211559 m!239301))

(declare-fun m!239475 () Bool)

(assert (=> d!58131 m!239475))

(assert (=> d!58131 m!239219))

(assert (=> b!211563 m!239301))

(assert (=> b!211563 m!239301))

(assert (=> b!211563 m!239303))

(declare-fun m!239477 () Bool)

(assert (=> b!211564 m!239477))

(declare-fun m!239479 () Bool)

(assert (=> b!211562 m!239479))

(assert (=> b!211570 m!239409))

(assert (=> b!211570 m!239335))

(assert (=> b!211570 m!239411))

(assert (=> b!211570 m!239335))

(declare-fun m!239481 () Bool)

(assert (=> b!211570 m!239481))

(declare-fun m!239483 () Bool)

(assert (=> b!211570 m!239483))

(declare-fun m!239485 () Bool)

(assert (=> b!211570 m!239485))

(assert (=> b!211570 m!239409))

(declare-fun m!239487 () Bool)

(assert (=> b!211570 m!239487))

(assert (=> b!211570 m!239481))

(assert (=> b!211570 m!239301))

(declare-fun m!239489 () Bool)

(assert (=> b!211565 m!239489))

(assert (=> b!211569 m!239301))

(assert (=> b!211569 m!239301))

(declare-fun m!239491 () Bool)

(assert (=> b!211569 m!239491))

(assert (=> bm!20022 m!239479))

(assert (=> b!211333 d!58131))

(declare-fun d!58133 () Bool)

(assert (=> d!58133 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21022 d!58133))

(declare-fun d!58135 () Bool)

(assert (=> d!58135 (= (array_inv!3135 _values!649) (bvsge (size!5100 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21022 d!58135))

(declare-fun d!58137 () Bool)

(assert (=> d!58137 (= (array_inv!3136 _keys!825) (bvsge (size!5101 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21022 d!58137))

(declare-fun d!58139 () Bool)

(declare-fun res!103322 () Bool)

(declare-fun e!137711 () Bool)

(assert (=> d!58139 (=> res!103322 e!137711)))

(assert (=> d!58139 (= res!103322 (bvsge #b00000000000000000000000000000000 (size!5101 _keys!825)))))

(assert (=> d!58139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137711)))

(declare-fun bm!20025 () Bool)

(declare-fun call!20028 () Bool)

(assert (=> bm!20025 (= call!20028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!211579 () Bool)

(declare-fun e!137710 () Bool)

(assert (=> b!211579 (= e!137711 e!137710)))

(declare-fun c!35742 () Bool)

(assert (=> b!211579 (= c!35742 (validKeyInArray!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211580 () Bool)

(declare-fun e!137712 () Bool)

(assert (=> b!211580 (= e!137710 e!137712)))

(declare-fun lt!108859 () (_ BitVec 64))

(assert (=> b!211580 (= lt!108859 (select (arr!4776 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108860 () Unit!6408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10061 (_ BitVec 64) (_ BitVec 32)) Unit!6408)

(assert (=> b!211580 (= lt!108860 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108859 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211580 (arrayContainsKey!0 _keys!825 lt!108859 #b00000000000000000000000000000000)))

(declare-fun lt!108861 () Unit!6408)

(assert (=> b!211580 (= lt!108861 lt!108860)))

(declare-fun res!103323 () Bool)

(declare-datatypes ((SeekEntryResult!698 0))(
  ( (MissingZero!698 (index!4962 (_ BitVec 32))) (Found!698 (index!4963 (_ BitVec 32))) (Intermediate!698 (undefined!1510 Bool) (index!4964 (_ BitVec 32)) (x!22087 (_ BitVec 32))) (Undefined!698) (MissingVacant!698 (index!4965 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10061 (_ BitVec 32)) SeekEntryResult!698)

(assert (=> b!211580 (= res!103323 (= (seekEntryOrOpen!0 (select (arr!4776 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!698 #b00000000000000000000000000000000)))))

(assert (=> b!211580 (=> (not res!103323) (not e!137712))))

(declare-fun b!211581 () Bool)

(assert (=> b!211581 (= e!137712 call!20028)))

(declare-fun b!211582 () Bool)

(assert (=> b!211582 (= e!137710 call!20028)))

(assert (= (and d!58139 (not res!103322)) b!211579))

(assert (= (and b!211579 c!35742) b!211580))

(assert (= (and b!211579 (not c!35742)) b!211582))

(assert (= (and b!211580 res!103323) b!211581))

(assert (= (or b!211581 b!211582) bm!20025))

(declare-fun m!239493 () Bool)

(assert (=> bm!20025 m!239493))

(assert (=> b!211579 m!239301))

(assert (=> b!211579 m!239301))

(assert (=> b!211579 m!239303))

(assert (=> b!211580 m!239301))

(declare-fun m!239495 () Bool)

(assert (=> b!211580 m!239495))

(declare-fun m!239497 () Bool)

(assert (=> b!211580 m!239497))

(assert (=> b!211580 m!239301))

(declare-fun m!239499 () Bool)

(assert (=> b!211580 m!239499))

(assert (=> b!211328 d!58139))

(declare-fun mapNonEmpty!9239 () Bool)

(declare-fun mapRes!9239 () Bool)

(declare-fun tp!19778 () Bool)

(declare-fun e!137718 () Bool)

(assert (=> mapNonEmpty!9239 (= mapRes!9239 (and tp!19778 e!137718))))

(declare-fun mapRest!9239 () (Array (_ BitVec 32) ValueCell!2372))

(declare-fun mapKey!9239 () (_ BitVec 32))

(declare-fun mapValue!9239 () ValueCell!2372)

(assert (=> mapNonEmpty!9239 (= mapRest!9230 (store mapRest!9239 mapKey!9239 mapValue!9239))))

(declare-fun b!211590 () Bool)

(declare-fun e!137717 () Bool)

(assert (=> b!211590 (= e!137717 tp_is_empty!5431)))

(declare-fun b!211589 () Bool)

(assert (=> b!211589 (= e!137718 tp_is_empty!5431)))

(declare-fun condMapEmpty!9239 () Bool)

(declare-fun mapDefault!9239 () ValueCell!2372)

(assert (=> mapNonEmpty!9230 (= condMapEmpty!9239 (= mapRest!9230 ((as const (Array (_ BitVec 32) ValueCell!2372)) mapDefault!9239)))))

(assert (=> mapNonEmpty!9230 (= tp!19763 (and e!137717 mapRes!9239))))

(declare-fun mapIsEmpty!9239 () Bool)

(assert (=> mapIsEmpty!9239 mapRes!9239))

(assert (= (and mapNonEmpty!9230 condMapEmpty!9239) mapIsEmpty!9239))

(assert (= (and mapNonEmpty!9230 (not condMapEmpty!9239)) mapNonEmpty!9239))

(assert (= (and mapNonEmpty!9239 ((_ is ValueCellFull!2372) mapValue!9239)) b!211589))

(assert (= (and mapNonEmpty!9230 ((_ is ValueCellFull!2372) mapDefault!9239)) b!211590))

(declare-fun m!239501 () Bool)

(assert (=> mapNonEmpty!9239 m!239501))

(declare-fun b_lambda!7693 () Bool)

(assert (= b_lambda!7687 (or (and start!21022 b_free!5569) b_lambda!7693)))

(declare-fun b_lambda!7695 () Bool)

(assert (= b_lambda!7685 (or (and start!21022 b_free!5569) b_lambda!7695)))

(declare-fun b_lambda!7697 () Bool)

(assert (= b_lambda!7689 (or (and start!21022 b_free!5569) b_lambda!7697)))

(declare-fun b_lambda!7699 () Bool)

(assert (= b_lambda!7683 (or (and start!21022 b_free!5569) b_lambda!7699)))

(declare-fun b_lambda!7701 () Bool)

(assert (= b_lambda!7691 (or (and start!21022 b_free!5569) b_lambda!7701)))

(declare-fun b_lambda!7703 () Bool)

(assert (= b_lambda!7681 (or (and start!21022 b_free!5569) b_lambda!7703)))

(check-sat (not b!211562) (not b!211528) (not d!58131) (not b!211424) (not b!211450) (not b!211517) tp_is_empty!5431 (not b!211422) (not b!211539) (not d!58129) (not b!211461) (not b!211529) (not b!211460) (not b!211515) (not bm!20008) (not b!211532) (not b!211453) (not b!211545) (not bm!19987) (not bm!20022) (not d!58123) (not b!211549) (not b!211557) (not b!211536) (not b!211526) (not bm!20016) (not b_lambda!7701) (not b!211580) (not d!58125) (not b!211423) (not b_lambda!7697) (not b!211456) (not b!211547) (not b!211455) (not bm!20015) (not d!58121) (not b_next!5569) (not b_lambda!7703) (not mapNonEmpty!9239) (not bm!19992) (not d!58119) (not b!211454) (not b!211579) (not bm!20009) (not b!211538) (not b!211518) (not b!211425) (not b!211569) (not b!211570) (not b!211524) (not b!211553) (not b!211414) b_and!12405 (not bm!20011) (not bm!20012) (not d!58127) (not b!211565) (not b_lambda!7693) (not b!211559) (not b!211550) (not b!211564) (not bm!19984) (not b!211416) (not bm!20018) (not b!211558) (not b!211470) (not b_lambda!7695) (not bm!20025) (not b!211563) (not d!58117) (not bm!20019) (not bm!19993) (not b!211413) (not b_lambda!7699) (not b!211457) (not b!211566))
(check-sat b_and!12405 (not b_next!5569))
