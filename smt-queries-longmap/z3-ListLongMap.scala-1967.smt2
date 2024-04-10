; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34606 () Bool)

(assert start!34606)

(declare-fun b_free!7473 () Bool)

(declare-fun b_next!7473 () Bool)

(assert (=> start!34606 (= b_free!7473 (not b_next!7473))))

(declare-fun tp!25974 () Bool)

(declare-fun b_and!14687 () Bool)

(assert (=> start!34606 (= tp!25974 b_and!14687)))

(declare-fun b!345839 () Bool)

(declare-fun res!191310 () Bool)

(declare-fun e!211967 () Bool)

(assert (=> b!345839 (=> (not res!191310) (not e!211967))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345839 (= res!191310 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12585 () Bool)

(declare-fun mapRes!12585 () Bool)

(assert (=> mapIsEmpty!12585 mapRes!12585))

(declare-fun mapNonEmpty!12585 () Bool)

(declare-fun tp!25973 () Bool)

(declare-fun e!211968 () Bool)

(assert (=> mapNonEmpty!12585 (= mapRes!12585 (and tp!25973 e!211968))))

(declare-datatypes ((V!10877 0))(
  ( (V!10878 (val!3757 Int)) )
))
(declare-datatypes ((ValueCell!3369 0))(
  ( (ValueCellFull!3369 (v!5936 V!10877)) (EmptyCell!3369) )
))
(declare-fun mapRest!12585 () (Array (_ BitVec 32) ValueCell!3369))

(declare-datatypes ((array!18437 0))(
  ( (array!18438 (arr!8732 (Array (_ BitVec 32) ValueCell!3369)) (size!9084 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18437)

(declare-fun mapKey!12585 () (_ BitVec 32))

(declare-fun mapValue!12585 () ValueCell!3369)

(assert (=> mapNonEmpty!12585 (= (arr!8732 _values!1525) (store mapRest!12585 mapKey!12585 mapValue!12585))))

(declare-fun b!345840 () Bool)

(declare-fun res!191309 () Bool)

(assert (=> b!345840 (=> (not res!191309) (not e!211967))))

(declare-datatypes ((array!18439 0))(
  ( (array!18440 (arr!8733 (Array (_ BitVec 32) (_ BitVec 64))) (size!9085 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18439)

(declare-datatypes ((List!5056 0))(
  ( (Nil!5053) (Cons!5052 (h!5908 (_ BitVec 64)) (t!10178 List!5056)) )
))
(declare-fun arrayNoDuplicates!0 (array!18439 (_ BitVec 32) List!5056) Bool)

(assert (=> b!345840 (= res!191309 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5053))))

(declare-fun b!345841 () Bool)

(declare-fun res!191314 () Bool)

(assert (=> b!345841 (=> (not res!191314) (not e!211967))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18439 (_ BitVec 32)) Bool)

(assert (=> b!345841 (= res!191314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345842 () Bool)

(declare-fun tp_is_empty!7425 () Bool)

(assert (=> b!345842 (= e!211968 tp_is_empty!7425)))

(declare-fun b!345843 () Bool)

(declare-fun res!191312 () Bool)

(declare-fun e!211963 () Bool)

(assert (=> b!345843 (=> (not res!191312) (not e!211963))))

(declare-datatypes ((SeekEntryResult!3366 0))(
  ( (MissingZero!3366 (index!15643 (_ BitVec 32))) (Found!3366 (index!15644 (_ BitVec 32))) (Intermediate!3366 (undefined!4178 Bool) (index!15645 (_ BitVec 32)) (x!34454 (_ BitVec 32))) (Undefined!3366) (MissingVacant!3366 (index!15646 (_ BitVec 32))) )
))
(declare-fun lt!163072 () SeekEntryResult!3366)

(declare-fun arrayContainsKey!0 (array!18439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345843 (= res!191312 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15644 lt!163072)))))

(declare-fun b!345844 () Bool)

(declare-fun e!211965 () Bool)

(assert (=> b!345844 (= e!211965 tp_is_empty!7425)))

(declare-fun b!345846 () Bool)

(declare-fun res!191313 () Bool)

(assert (=> b!345846 (=> (not res!191313) (not e!211967))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345846 (= res!191313 (and (= (size!9084 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9085 _keys!1895) (size!9084 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345847 () Bool)

(assert (=> b!345847 (= e!211963 (bvslt (index!15644 lt!163072) #b00000000000000000000000000000000))))

(declare-fun b!345848 () Bool)

(declare-fun e!211966 () Bool)

(assert (=> b!345848 (= e!211966 (and e!211965 mapRes!12585))))

(declare-fun condMapEmpty!12585 () Bool)

(declare-fun mapDefault!12585 () ValueCell!3369)

(assert (=> b!345848 (= condMapEmpty!12585 (= (arr!8732 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3369)) mapDefault!12585)))))

(declare-fun b!345849 () Bool)

(declare-fun res!191308 () Bool)

(assert (=> b!345849 (=> (not res!191308) (not e!211967))))

(declare-fun zeroValue!1467 () V!10877)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10877)

(declare-datatypes ((tuple2!5432 0))(
  ( (tuple2!5433 (_1!2727 (_ BitVec 64)) (_2!2727 V!10877)) )
))
(declare-datatypes ((List!5057 0))(
  ( (Nil!5054) (Cons!5053 (h!5909 tuple2!5432) (t!10179 List!5057)) )
))
(declare-datatypes ((ListLongMap!4345 0))(
  ( (ListLongMap!4346 (toList!2188 List!5057)) )
))
(declare-fun contains!2249 (ListLongMap!4345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1709 (array!18439 array!18437 (_ BitVec 32) (_ BitVec 32) V!10877 V!10877 (_ BitVec 32) Int) ListLongMap!4345)

(assert (=> b!345849 (= res!191308 (not (contains!2249 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345845 () Bool)

(assert (=> b!345845 (= e!211967 e!211963)))

(declare-fun res!191311 () Bool)

(assert (=> b!345845 (=> (not res!191311) (not e!211963))))

(get-info :version)

(assert (=> b!345845 (= res!191311 (and ((_ is Found!3366) lt!163072) (= (select (arr!8733 _keys!1895) (index!15644 lt!163072)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18439 (_ BitVec 32)) SeekEntryResult!3366)

(assert (=> b!345845 (= lt!163072 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!191315 () Bool)

(assert (=> start!34606 (=> (not res!191315) (not e!211967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34606 (= res!191315 (validMask!0 mask!2385))))

(assert (=> start!34606 e!211967))

(assert (=> start!34606 true))

(assert (=> start!34606 tp_is_empty!7425))

(assert (=> start!34606 tp!25974))

(declare-fun array_inv!6464 (array!18437) Bool)

(assert (=> start!34606 (and (array_inv!6464 _values!1525) e!211966)))

(declare-fun array_inv!6465 (array!18439) Bool)

(assert (=> start!34606 (array_inv!6465 _keys!1895)))

(assert (= (and start!34606 res!191315) b!345846))

(assert (= (and b!345846 res!191313) b!345841))

(assert (= (and b!345841 res!191314) b!345840))

(assert (= (and b!345840 res!191309) b!345839))

(assert (= (and b!345839 res!191310) b!345849))

(assert (= (and b!345849 res!191308) b!345845))

(assert (= (and b!345845 res!191311) b!345843))

(assert (= (and b!345843 res!191312) b!345847))

(assert (= (and b!345848 condMapEmpty!12585) mapIsEmpty!12585))

(assert (= (and b!345848 (not condMapEmpty!12585)) mapNonEmpty!12585))

(assert (= (and mapNonEmpty!12585 ((_ is ValueCellFull!3369) mapValue!12585)) b!345842))

(assert (= (and b!345848 ((_ is ValueCellFull!3369) mapDefault!12585)) b!345844))

(assert (= start!34606 b!345848))

(declare-fun m!347103 () Bool)

(assert (=> b!345849 m!347103))

(assert (=> b!345849 m!347103))

(declare-fun m!347105 () Bool)

(assert (=> b!345849 m!347105))

(declare-fun m!347107 () Bool)

(assert (=> start!34606 m!347107))

(declare-fun m!347109 () Bool)

(assert (=> start!34606 m!347109))

(declare-fun m!347111 () Bool)

(assert (=> start!34606 m!347111))

(declare-fun m!347113 () Bool)

(assert (=> mapNonEmpty!12585 m!347113))

(declare-fun m!347115 () Bool)

(assert (=> b!345845 m!347115))

(declare-fun m!347117 () Bool)

(assert (=> b!345845 m!347117))

(declare-fun m!347119 () Bool)

(assert (=> b!345839 m!347119))

(declare-fun m!347121 () Bool)

(assert (=> b!345843 m!347121))

(declare-fun m!347123 () Bool)

(assert (=> b!345840 m!347123))

(declare-fun m!347125 () Bool)

(assert (=> b!345841 m!347125))

(check-sat b_and!14687 (not b!345845) (not b!345839) tp_is_empty!7425 (not b!345849) (not start!34606) (not b!345843) (not b!345841) (not b!345840) (not b_next!7473) (not mapNonEmpty!12585))
(check-sat b_and!14687 (not b_next!7473))
(get-model)

(declare-fun d!71181 () Bool)

(declare-fun e!211991 () Bool)

(assert (=> d!71181 e!211991))

(declare-fun res!191342 () Bool)

(assert (=> d!71181 (=> res!191342 e!211991)))

(declare-fun lt!163086 () Bool)

(assert (=> d!71181 (= res!191342 (not lt!163086))))

(declare-fun lt!163084 () Bool)

(assert (=> d!71181 (= lt!163086 lt!163084)))

(declare-datatypes ((Unit!10741 0))(
  ( (Unit!10742) )
))
(declare-fun lt!163085 () Unit!10741)

(declare-fun e!211992 () Unit!10741)

(assert (=> d!71181 (= lt!163085 e!211992)))

(declare-fun c!53067 () Bool)

(assert (=> d!71181 (= c!53067 lt!163084)))

(declare-fun containsKey!333 (List!5057 (_ BitVec 64)) Bool)

(assert (=> d!71181 (= lt!163084 (containsKey!333 (toList!2188 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71181 (= (contains!2249 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163086)))

(declare-fun b!345889 () Bool)

(declare-fun lt!163087 () Unit!10741)

(assert (=> b!345889 (= e!211992 lt!163087)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!281 (List!5057 (_ BitVec 64)) Unit!10741)

(assert (=> b!345889 (= lt!163087 (lemmaContainsKeyImpliesGetValueByKeyDefined!281 (toList!2188 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!347 0))(
  ( (Some!346 (v!5938 V!10877)) (None!345) )
))
(declare-fun isDefined!282 (Option!347) Bool)

(declare-fun getValueByKey!341 (List!5057 (_ BitVec 64)) Option!347)

(assert (=> b!345889 (isDefined!282 (getValueByKey!341 (toList!2188 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345890 () Bool)

(declare-fun Unit!10743 () Unit!10741)

(assert (=> b!345890 (= e!211992 Unit!10743)))

(declare-fun b!345891 () Bool)

(assert (=> b!345891 (= e!211991 (isDefined!282 (getValueByKey!341 (toList!2188 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71181 c!53067) b!345889))

(assert (= (and d!71181 (not c!53067)) b!345890))

(assert (= (and d!71181 (not res!191342)) b!345891))

(declare-fun m!347151 () Bool)

(assert (=> d!71181 m!347151))

(declare-fun m!347153 () Bool)

(assert (=> b!345889 m!347153))

(declare-fun m!347155 () Bool)

(assert (=> b!345889 m!347155))

(assert (=> b!345889 m!347155))

(declare-fun m!347157 () Bool)

(assert (=> b!345889 m!347157))

(assert (=> b!345891 m!347155))

(assert (=> b!345891 m!347155))

(assert (=> b!345891 m!347157))

(assert (=> b!345849 d!71181))

(declare-fun d!71183 () Bool)

(declare-fun e!212027 () Bool)

(assert (=> d!71183 e!212027))

(declare-fun res!191361 () Bool)

(assert (=> d!71183 (=> (not res!191361) (not e!212027))))

(assert (=> d!71183 (= res!191361 (or (bvsge #b00000000000000000000000000000000 (size!9085 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))))

(declare-fun lt!163139 () ListLongMap!4345)

(declare-fun lt!163152 () ListLongMap!4345)

(assert (=> d!71183 (= lt!163139 lt!163152)))

(declare-fun lt!163142 () Unit!10741)

(declare-fun e!212026 () Unit!10741)

(assert (=> d!71183 (= lt!163142 e!212026)))

(declare-fun c!53080 () Bool)

(declare-fun e!212023 () Bool)

(assert (=> d!71183 (= c!53080 e!212023)))

(declare-fun res!191366 () Bool)

(assert (=> d!71183 (=> (not res!191366) (not e!212023))))

(assert (=> d!71183 (= res!191366 (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun e!212029 () ListLongMap!4345)

(assert (=> d!71183 (= lt!163152 e!212029)))

(declare-fun c!53081 () Bool)

(assert (=> d!71183 (= c!53081 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71183 (validMask!0 mask!2385)))

(assert (=> d!71183 (= (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163139)))

(declare-fun b!345934 () Bool)

(declare-fun e!212021 () ListLongMap!4345)

(declare-fun call!26774 () ListLongMap!4345)

(assert (=> b!345934 (= e!212021 call!26774)))

(declare-fun b!345935 () Bool)

(declare-fun res!191362 () Bool)

(assert (=> b!345935 (=> (not res!191362) (not e!212027))))

(declare-fun e!212020 () Bool)

(assert (=> b!345935 (= res!191362 e!212020)))

(declare-fun c!53085 () Bool)

(assert (=> b!345935 (= c!53085 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345936 () Bool)

(declare-fun Unit!10744 () Unit!10741)

(assert (=> b!345936 (= e!212026 Unit!10744)))

(declare-fun bm!26767 () Bool)

(declare-fun call!26776 () Bool)

(assert (=> bm!26767 (= call!26776 (contains!2249 lt!163139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26768 () Bool)

(declare-fun call!26770 () ListLongMap!4345)

(declare-fun call!26775 () ListLongMap!4345)

(assert (=> bm!26768 (= call!26770 call!26775)))

(declare-fun b!345937 () Bool)

(declare-fun e!212025 () Bool)

(declare-fun call!26771 () Bool)

(assert (=> b!345937 (= e!212025 (not call!26771))))

(declare-fun e!212031 () Bool)

(declare-fun b!345938 () Bool)

(declare-fun apply!283 (ListLongMap!4345 (_ BitVec 64)) V!10877)

(declare-fun get!4703 (ValueCell!3369 V!10877) V!10877)

(declare-fun dynLambda!626 (Int (_ BitVec 64)) V!10877)

(assert (=> b!345938 (= e!212031 (= (apply!283 lt!163139 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)) (get!4703 (select (arr!8732 _values!1525) #b00000000000000000000000000000000) (dynLambda!626 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9084 _values!1525)))))

(assert (=> b!345938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun b!345939 () Bool)

(assert (=> b!345939 (= e!212020 (not call!26776))))

(declare-fun b!345940 () Bool)

(declare-fun lt!163137 () Unit!10741)

(assert (=> b!345940 (= e!212026 lt!163137)))

(declare-fun lt!163149 () ListLongMap!4345)

(declare-fun getCurrentListMapNoExtraKeys!605 (array!18439 array!18437 (_ BitVec 32) (_ BitVec 32) V!10877 V!10877 (_ BitVec 32) Int) ListLongMap!4345)

(assert (=> b!345940 (= lt!163149 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163135 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163134 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163134 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163140 () Unit!10741)

(declare-fun addStillContains!259 (ListLongMap!4345 (_ BitVec 64) V!10877 (_ BitVec 64)) Unit!10741)

(assert (=> b!345940 (= lt!163140 (addStillContains!259 lt!163149 lt!163135 zeroValue!1467 lt!163134))))

(declare-fun +!732 (ListLongMap!4345 tuple2!5432) ListLongMap!4345)

(assert (=> b!345940 (contains!2249 (+!732 lt!163149 (tuple2!5433 lt!163135 zeroValue!1467)) lt!163134)))

(declare-fun lt!163153 () Unit!10741)

(assert (=> b!345940 (= lt!163153 lt!163140)))

(declare-fun lt!163145 () ListLongMap!4345)

(assert (=> b!345940 (= lt!163145 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163148 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163144 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163144 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163150 () Unit!10741)

(declare-fun addApplyDifferent!259 (ListLongMap!4345 (_ BitVec 64) V!10877 (_ BitVec 64)) Unit!10741)

(assert (=> b!345940 (= lt!163150 (addApplyDifferent!259 lt!163145 lt!163148 minValue!1467 lt!163144))))

(assert (=> b!345940 (= (apply!283 (+!732 lt!163145 (tuple2!5433 lt!163148 minValue!1467)) lt!163144) (apply!283 lt!163145 lt!163144))))

(declare-fun lt!163146 () Unit!10741)

(assert (=> b!345940 (= lt!163146 lt!163150)))

(declare-fun lt!163132 () ListLongMap!4345)

(assert (=> b!345940 (= lt!163132 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163138 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163151 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163151 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163141 () Unit!10741)

(assert (=> b!345940 (= lt!163141 (addApplyDifferent!259 lt!163132 lt!163138 zeroValue!1467 lt!163151))))

(assert (=> b!345940 (= (apply!283 (+!732 lt!163132 (tuple2!5433 lt!163138 zeroValue!1467)) lt!163151) (apply!283 lt!163132 lt!163151))))

(declare-fun lt!163133 () Unit!10741)

(assert (=> b!345940 (= lt!163133 lt!163141)))

(declare-fun lt!163143 () ListLongMap!4345)

(assert (=> b!345940 (= lt!163143 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163136 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163136 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163147 () (_ BitVec 64))

(assert (=> b!345940 (= lt!163147 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345940 (= lt!163137 (addApplyDifferent!259 lt!163143 lt!163136 minValue!1467 lt!163147))))

(assert (=> b!345940 (= (apply!283 (+!732 lt!163143 (tuple2!5433 lt!163136 minValue!1467)) lt!163147) (apply!283 lt!163143 lt!163147))))

(declare-fun b!345941 () Bool)

(declare-fun e!212019 () ListLongMap!4345)

(assert (=> b!345941 (= e!212019 call!26774)))

(declare-fun b!345942 () Bool)

(assert (=> b!345942 (= e!212029 e!212019)))

(declare-fun c!53082 () Bool)

(assert (=> b!345942 (= c!53082 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345943 () Bool)

(declare-fun e!212022 () Bool)

(assert (=> b!345943 (= e!212022 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345944 () Bool)

(assert (=> b!345944 (= e!212027 e!212025)))

(declare-fun c!53084 () Bool)

(assert (=> b!345944 (= c!53084 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345945 () Bool)

(declare-fun res!191363 () Bool)

(assert (=> b!345945 (=> (not res!191363) (not e!212027))))

(declare-fun e!212030 () Bool)

(assert (=> b!345945 (= res!191363 e!212030)))

(declare-fun res!191369 () Bool)

(assert (=> b!345945 (=> res!191369 e!212030)))

(assert (=> b!345945 (= res!191369 (not e!212022))))

(declare-fun res!191367 () Bool)

(assert (=> b!345945 (=> (not res!191367) (not e!212022))))

(assert (=> b!345945 (= res!191367 (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun b!345946 () Bool)

(declare-fun e!212024 () Bool)

(assert (=> b!345946 (= e!212025 e!212024)))

(declare-fun res!191368 () Bool)

(assert (=> b!345946 (= res!191368 call!26771)))

(assert (=> b!345946 (=> (not res!191368) (not e!212024))))

(declare-fun b!345947 () Bool)

(declare-fun e!212028 () Bool)

(assert (=> b!345947 (= e!212020 e!212028)))

(declare-fun res!191365 () Bool)

(assert (=> b!345947 (= res!191365 call!26776)))

(assert (=> b!345947 (=> (not res!191365) (not e!212028))))

(declare-fun bm!26769 () Bool)

(declare-fun call!26772 () ListLongMap!4345)

(assert (=> bm!26769 (= call!26772 call!26770)))

(declare-fun b!345948 () Bool)

(assert (=> b!345948 (= e!212030 e!212031)))

(declare-fun res!191364 () Bool)

(assert (=> b!345948 (=> (not res!191364) (not e!212031))))

(assert (=> b!345948 (= res!191364 (contains!2249 lt!163139 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345948 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun b!345949 () Bool)

(declare-fun c!53083 () Bool)

(assert (=> b!345949 (= c!53083 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345949 (= e!212019 e!212021)))

(declare-fun b!345950 () Bool)

(assert (=> b!345950 (= e!212023 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345951 () Bool)

(assert (=> b!345951 (= e!212028 (= (apply!283 lt!163139 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345952 () Bool)

(assert (=> b!345952 (= e!212024 (= (apply!283 lt!163139 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26770 () Bool)

(declare-fun call!26773 () ListLongMap!4345)

(assert (=> bm!26770 (= call!26774 call!26773)))

(declare-fun b!345953 () Bool)

(assert (=> b!345953 (= e!212021 call!26772)))

(declare-fun bm!26771 () Bool)

(assert (=> bm!26771 (= call!26771 (contains!2249 lt!163139 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26772 () Bool)

(assert (=> bm!26772 (= call!26773 (+!732 (ite c!53081 call!26775 (ite c!53082 call!26770 call!26772)) (ite (or c!53081 c!53082) (tuple2!5433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26773 () Bool)

(assert (=> bm!26773 (= call!26775 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345954 () Bool)

(assert (=> b!345954 (= e!212029 (+!732 call!26773 (tuple2!5433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(assert (= (and d!71183 c!53081) b!345954))

(assert (= (and d!71183 (not c!53081)) b!345942))

(assert (= (and b!345942 c!53082) b!345941))

(assert (= (and b!345942 (not c!53082)) b!345949))

(assert (= (and b!345949 c!53083) b!345934))

(assert (= (and b!345949 (not c!53083)) b!345953))

(assert (= (or b!345934 b!345953) bm!26769))

(assert (= (or b!345941 bm!26769) bm!26768))

(assert (= (or b!345941 b!345934) bm!26770))

(assert (= (or b!345954 bm!26768) bm!26773))

(assert (= (or b!345954 bm!26770) bm!26772))

(assert (= (and d!71183 res!191366) b!345950))

(assert (= (and d!71183 c!53080) b!345940))

(assert (= (and d!71183 (not c!53080)) b!345936))

(assert (= (and d!71183 res!191361) b!345945))

(assert (= (and b!345945 res!191367) b!345943))

(assert (= (and b!345945 (not res!191369)) b!345948))

(assert (= (and b!345948 res!191364) b!345938))

(assert (= (and b!345945 res!191363) b!345935))

(assert (= (and b!345935 c!53085) b!345947))

(assert (= (and b!345935 (not c!53085)) b!345939))

(assert (= (and b!345947 res!191365) b!345951))

(assert (= (or b!345947 b!345939) bm!26767))

(assert (= (and b!345935 res!191362) b!345944))

(assert (= (and b!345944 c!53084) b!345946))

(assert (= (and b!345944 (not c!53084)) b!345937))

(assert (= (and b!345946 res!191368) b!345952))

(assert (= (or b!345946 b!345937) bm!26771))

(declare-fun b_lambda!8471 () Bool)

(assert (=> (not b_lambda!8471) (not b!345938)))

(declare-fun t!10182 () Bool)

(declare-fun tb!3081 () Bool)

(assert (=> (and start!34606 (= defaultEntry!1528 defaultEntry!1528) t!10182) tb!3081))

(declare-fun result!5573 () Bool)

(assert (=> tb!3081 (= result!5573 tp_is_empty!7425)))

(assert (=> b!345938 t!10182))

(declare-fun b_and!14691 () Bool)

(assert (= b_and!14687 (and (=> t!10182 result!5573) b_and!14691)))

(declare-fun m!347159 () Bool)

(assert (=> b!345940 m!347159))

(declare-fun m!347161 () Bool)

(assert (=> b!345940 m!347161))

(declare-fun m!347163 () Bool)

(assert (=> b!345940 m!347163))

(declare-fun m!347165 () Bool)

(assert (=> b!345940 m!347165))

(declare-fun m!347167 () Bool)

(assert (=> b!345940 m!347167))

(declare-fun m!347169 () Bool)

(assert (=> b!345940 m!347169))

(declare-fun m!347171 () Bool)

(assert (=> b!345940 m!347171))

(declare-fun m!347173 () Bool)

(assert (=> b!345940 m!347173))

(declare-fun m!347175 () Bool)

(assert (=> b!345940 m!347175))

(declare-fun m!347177 () Bool)

(assert (=> b!345940 m!347177))

(assert (=> b!345940 m!347175))

(declare-fun m!347179 () Bool)

(assert (=> b!345940 m!347179))

(assert (=> b!345940 m!347173))

(declare-fun m!347181 () Bool)

(assert (=> b!345940 m!347181))

(declare-fun m!347183 () Bool)

(assert (=> b!345940 m!347183))

(declare-fun m!347185 () Bool)

(assert (=> b!345940 m!347185))

(declare-fun m!347187 () Bool)

(assert (=> b!345940 m!347187))

(declare-fun m!347189 () Bool)

(assert (=> b!345940 m!347189))

(assert (=> b!345940 m!347183))

(declare-fun m!347191 () Bool)

(assert (=> b!345940 m!347191))

(assert (=> b!345940 m!347163))

(assert (=> b!345938 m!347161))

(declare-fun m!347193 () Bool)

(assert (=> b!345938 m!347193))

(assert (=> b!345938 m!347193))

(declare-fun m!347195 () Bool)

(assert (=> b!345938 m!347195))

(declare-fun m!347197 () Bool)

(assert (=> b!345938 m!347197))

(assert (=> b!345938 m!347195))

(assert (=> b!345938 m!347161))

(declare-fun m!347199 () Bool)

(assert (=> b!345938 m!347199))

(assert (=> b!345948 m!347161))

(assert (=> b!345948 m!347161))

(declare-fun m!347201 () Bool)

(assert (=> b!345948 m!347201))

(assert (=> b!345950 m!347161))

(assert (=> b!345950 m!347161))

(declare-fun m!347203 () Bool)

(assert (=> b!345950 m!347203))

(declare-fun m!347205 () Bool)

(assert (=> b!345954 m!347205))

(declare-fun m!347207 () Bool)

(assert (=> b!345951 m!347207))

(assert (=> b!345943 m!347161))

(assert (=> b!345943 m!347161))

(assert (=> b!345943 m!347203))

(declare-fun m!347209 () Bool)

(assert (=> b!345952 m!347209))

(declare-fun m!347211 () Bool)

(assert (=> bm!26772 m!347211))

(declare-fun m!347213 () Bool)

(assert (=> bm!26767 m!347213))

(declare-fun m!347215 () Bool)

(assert (=> bm!26771 m!347215))

(assert (=> bm!26773 m!347185))

(assert (=> d!71183 m!347107))

(assert (=> b!345849 d!71183))

(declare-fun d!71185 () Bool)

(declare-fun res!191374 () Bool)

(declare-fun e!212036 () Bool)

(assert (=> d!71185 (=> res!191374 e!212036)))

(assert (=> d!71185 (= res!191374 (= (select (arr!8733 _keys!1895) (index!15644 lt!163072)) k0!1348))))

(assert (=> d!71185 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15644 lt!163072)) e!212036)))

(declare-fun b!345961 () Bool)

(declare-fun e!212037 () Bool)

(assert (=> b!345961 (= e!212036 e!212037)))

(declare-fun res!191375 () Bool)

(assert (=> b!345961 (=> (not res!191375) (not e!212037))))

(assert (=> b!345961 (= res!191375 (bvslt (bvadd (index!15644 lt!163072) #b00000000000000000000000000000001) (size!9085 _keys!1895)))))

(declare-fun b!345962 () Bool)

(assert (=> b!345962 (= e!212037 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15644 lt!163072) #b00000000000000000000000000000001)))))

(assert (= (and d!71185 (not res!191374)) b!345961))

(assert (= (and b!345961 res!191375) b!345962))

(assert (=> d!71185 m!347115))

(declare-fun m!347217 () Bool)

(assert (=> b!345962 m!347217))

(assert (=> b!345843 d!71185))

(declare-fun d!71187 () Bool)

(assert (=> d!71187 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345839 d!71187))

(declare-fun b!345971 () Bool)

(declare-fun e!212046 () Bool)

(declare-fun call!26779 () Bool)

(assert (=> b!345971 (= e!212046 call!26779)))

(declare-fun bm!26776 () Bool)

(assert (=> bm!26776 (= call!26779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71189 () Bool)

(declare-fun res!191380 () Bool)

(declare-fun e!212045 () Bool)

(assert (=> d!71189 (=> res!191380 e!212045)))

(assert (=> d!71189 (= res!191380 (bvsge #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(assert (=> d!71189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212045)))

(declare-fun b!345972 () Bool)

(assert (=> b!345972 (= e!212045 e!212046)))

(declare-fun c!53088 () Bool)

(assert (=> b!345972 (= c!53088 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345973 () Bool)

(declare-fun e!212044 () Bool)

(assert (=> b!345973 (= e!212044 call!26779)))

(declare-fun b!345974 () Bool)

(assert (=> b!345974 (= e!212046 e!212044)))

(declare-fun lt!163160 () (_ BitVec 64))

(assert (=> b!345974 (= lt!163160 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163162 () Unit!10741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18439 (_ BitVec 64) (_ BitVec 32)) Unit!10741)

(assert (=> b!345974 (= lt!163162 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163160 #b00000000000000000000000000000000))))

(assert (=> b!345974 (arrayContainsKey!0 _keys!1895 lt!163160 #b00000000000000000000000000000000)))

(declare-fun lt!163161 () Unit!10741)

(assert (=> b!345974 (= lt!163161 lt!163162)))

(declare-fun res!191381 () Bool)

(assert (=> b!345974 (= res!191381 (= (seekEntryOrOpen!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3366 #b00000000000000000000000000000000)))))

(assert (=> b!345974 (=> (not res!191381) (not e!212044))))

(assert (= (and d!71189 (not res!191380)) b!345972))

(assert (= (and b!345972 c!53088) b!345974))

(assert (= (and b!345972 (not c!53088)) b!345971))

(assert (= (and b!345974 res!191381) b!345973))

(assert (= (or b!345973 b!345971) bm!26776))

(declare-fun m!347219 () Bool)

(assert (=> bm!26776 m!347219))

(assert (=> b!345972 m!347161))

(assert (=> b!345972 m!347161))

(assert (=> b!345972 m!347203))

(assert (=> b!345974 m!347161))

(declare-fun m!347221 () Bool)

(assert (=> b!345974 m!347221))

(declare-fun m!347223 () Bool)

(assert (=> b!345974 m!347223))

(assert (=> b!345974 m!347161))

(declare-fun m!347225 () Bool)

(assert (=> b!345974 m!347225))

(assert (=> b!345841 d!71189))

(declare-fun d!71191 () Bool)

(assert (=> d!71191 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34606 d!71191))

(declare-fun d!71193 () Bool)

(assert (=> d!71193 (= (array_inv!6464 _values!1525) (bvsge (size!9084 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34606 d!71193))

(declare-fun d!71195 () Bool)

(assert (=> d!71195 (= (array_inv!6465 _keys!1895) (bvsge (size!9085 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34606 d!71195))

(declare-fun b!345985 () Bool)

(declare-fun e!212055 () Bool)

(declare-fun contains!2251 (List!5056 (_ BitVec 64)) Bool)

(assert (=> b!345985 (= e!212055 (contains!2251 Nil!5053 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345987 () Bool)

(declare-fun e!212056 () Bool)

(declare-fun call!26782 () Bool)

(assert (=> b!345987 (= e!212056 call!26782)))

(declare-fun bm!26779 () Bool)

(declare-fun c!53091 () Bool)

(assert (=> bm!26779 (= call!26782 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53091 (Cons!5052 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000) Nil!5053) Nil!5053)))))

(declare-fun b!345988 () Bool)

(assert (=> b!345988 (= e!212056 call!26782)))

(declare-fun b!345989 () Bool)

(declare-fun e!212058 () Bool)

(assert (=> b!345989 (= e!212058 e!212056)))

(assert (=> b!345989 (= c!53091 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71197 () Bool)

(declare-fun res!191390 () Bool)

(declare-fun e!212057 () Bool)

(assert (=> d!71197 (=> res!191390 e!212057)))

(assert (=> d!71197 (= res!191390 (bvsge #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(assert (=> d!71197 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5053) e!212057)))

(declare-fun b!345986 () Bool)

(assert (=> b!345986 (= e!212057 e!212058)))

(declare-fun res!191389 () Bool)

(assert (=> b!345986 (=> (not res!191389) (not e!212058))))

(assert (=> b!345986 (= res!191389 (not e!212055))))

(declare-fun res!191388 () Bool)

(assert (=> b!345986 (=> (not res!191388) (not e!212055))))

(assert (=> b!345986 (= res!191388 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71197 (not res!191390)) b!345986))

(assert (= (and b!345986 res!191388) b!345985))

(assert (= (and b!345986 res!191389) b!345989))

(assert (= (and b!345989 c!53091) b!345987))

(assert (= (and b!345989 (not c!53091)) b!345988))

(assert (= (or b!345987 b!345988) bm!26779))

(assert (=> b!345985 m!347161))

(assert (=> b!345985 m!347161))

(declare-fun m!347227 () Bool)

(assert (=> b!345985 m!347227))

(assert (=> bm!26779 m!347161))

(declare-fun m!347229 () Bool)

(assert (=> bm!26779 m!347229))

(assert (=> b!345989 m!347161))

(assert (=> b!345989 m!347161))

(assert (=> b!345989 m!347203))

(assert (=> b!345986 m!347161))

(assert (=> b!345986 m!347161))

(assert (=> b!345986 m!347203))

(assert (=> b!345840 d!71197))

(declare-fun b!346002 () Bool)

(declare-fun e!212065 () SeekEntryResult!3366)

(declare-fun e!212067 () SeekEntryResult!3366)

(assert (=> b!346002 (= e!212065 e!212067)))

(declare-fun lt!163169 () (_ BitVec 64))

(declare-fun lt!163170 () SeekEntryResult!3366)

(assert (=> b!346002 (= lt!163169 (select (arr!8733 _keys!1895) (index!15645 lt!163170)))))

(declare-fun c!53100 () Bool)

(assert (=> b!346002 (= c!53100 (= lt!163169 k0!1348))))

(declare-fun b!346003 () Bool)

(assert (=> b!346003 (= e!212067 (Found!3366 (index!15645 lt!163170)))))

(declare-fun b!346004 () Bool)

(declare-fun e!212066 () SeekEntryResult!3366)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18439 (_ BitVec 32)) SeekEntryResult!3366)

(assert (=> b!346004 (= e!212066 (seekKeyOrZeroReturnVacant!0 (x!34454 lt!163170) (index!15645 lt!163170) (index!15645 lt!163170) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346005 () Bool)

(declare-fun c!53098 () Bool)

(assert (=> b!346005 (= c!53098 (= lt!163169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!346005 (= e!212067 e!212066)))

(declare-fun b!346006 () Bool)

(assert (=> b!346006 (= e!212066 (MissingZero!3366 (index!15645 lt!163170)))))

(declare-fun b!346007 () Bool)

(assert (=> b!346007 (= e!212065 Undefined!3366)))

(declare-fun d!71199 () Bool)

(declare-fun lt!163171 () SeekEntryResult!3366)

(assert (=> d!71199 (and (or ((_ is Undefined!3366) lt!163171) (not ((_ is Found!3366) lt!163171)) (and (bvsge (index!15644 lt!163171) #b00000000000000000000000000000000) (bvslt (index!15644 lt!163171) (size!9085 _keys!1895)))) (or ((_ is Undefined!3366) lt!163171) ((_ is Found!3366) lt!163171) (not ((_ is MissingZero!3366) lt!163171)) (and (bvsge (index!15643 lt!163171) #b00000000000000000000000000000000) (bvslt (index!15643 lt!163171) (size!9085 _keys!1895)))) (or ((_ is Undefined!3366) lt!163171) ((_ is Found!3366) lt!163171) ((_ is MissingZero!3366) lt!163171) (not ((_ is MissingVacant!3366) lt!163171)) (and (bvsge (index!15646 lt!163171) #b00000000000000000000000000000000) (bvslt (index!15646 lt!163171) (size!9085 _keys!1895)))) (or ((_ is Undefined!3366) lt!163171) (ite ((_ is Found!3366) lt!163171) (= (select (arr!8733 _keys!1895) (index!15644 lt!163171)) k0!1348) (ite ((_ is MissingZero!3366) lt!163171) (= (select (arr!8733 _keys!1895) (index!15643 lt!163171)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3366) lt!163171) (= (select (arr!8733 _keys!1895) (index!15646 lt!163171)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71199 (= lt!163171 e!212065)))

(declare-fun c!53099 () Bool)

(assert (=> d!71199 (= c!53099 (and ((_ is Intermediate!3366) lt!163170) (undefined!4178 lt!163170)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18439 (_ BitVec 32)) SeekEntryResult!3366)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71199 (= lt!163170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71199 (validMask!0 mask!2385)))

(assert (=> d!71199 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163171)))

(assert (= (and d!71199 c!53099) b!346007))

(assert (= (and d!71199 (not c!53099)) b!346002))

(assert (= (and b!346002 c!53100) b!346003))

(assert (= (and b!346002 (not c!53100)) b!346005))

(assert (= (and b!346005 c!53098) b!346006))

(assert (= (and b!346005 (not c!53098)) b!346004))

(declare-fun m!347231 () Bool)

(assert (=> b!346002 m!347231))

(declare-fun m!347233 () Bool)

(assert (=> b!346004 m!347233))

(assert (=> d!71199 m!347107))

(declare-fun m!347235 () Bool)

(assert (=> d!71199 m!347235))

(declare-fun m!347237 () Bool)

(assert (=> d!71199 m!347237))

(declare-fun m!347239 () Bool)

(assert (=> d!71199 m!347239))

(declare-fun m!347241 () Bool)

(assert (=> d!71199 m!347241))

(assert (=> d!71199 m!347237))

(declare-fun m!347243 () Bool)

(assert (=> d!71199 m!347243))

(assert (=> b!345845 d!71199))

(declare-fun mapIsEmpty!12591 () Bool)

(declare-fun mapRes!12591 () Bool)

(assert (=> mapIsEmpty!12591 mapRes!12591))

(declare-fun mapNonEmpty!12591 () Bool)

(declare-fun tp!25983 () Bool)

(declare-fun e!212072 () Bool)

(assert (=> mapNonEmpty!12591 (= mapRes!12591 (and tp!25983 e!212072))))

(declare-fun mapRest!12591 () (Array (_ BitVec 32) ValueCell!3369))

(declare-fun mapKey!12591 () (_ BitVec 32))

(declare-fun mapValue!12591 () ValueCell!3369)

(assert (=> mapNonEmpty!12591 (= mapRest!12585 (store mapRest!12591 mapKey!12591 mapValue!12591))))

(declare-fun b!346014 () Bool)

(assert (=> b!346014 (= e!212072 tp_is_empty!7425)))

(declare-fun b!346015 () Bool)

(declare-fun e!212073 () Bool)

(assert (=> b!346015 (= e!212073 tp_is_empty!7425)))

(declare-fun condMapEmpty!12591 () Bool)

(declare-fun mapDefault!12591 () ValueCell!3369)

(assert (=> mapNonEmpty!12585 (= condMapEmpty!12591 (= mapRest!12585 ((as const (Array (_ BitVec 32) ValueCell!3369)) mapDefault!12591)))))

(assert (=> mapNonEmpty!12585 (= tp!25973 (and e!212073 mapRes!12591))))

(assert (= (and mapNonEmpty!12585 condMapEmpty!12591) mapIsEmpty!12591))

(assert (= (and mapNonEmpty!12585 (not condMapEmpty!12591)) mapNonEmpty!12591))

(assert (= (and mapNonEmpty!12591 ((_ is ValueCellFull!3369) mapValue!12591)) b!346014))

(assert (= (and mapNonEmpty!12585 ((_ is ValueCellFull!3369) mapDefault!12591)) b!346015))

(declare-fun m!347245 () Bool)

(assert (=> mapNonEmpty!12591 m!347245))

(declare-fun b_lambda!8473 () Bool)

(assert (= b_lambda!8471 (or (and start!34606 b_free!7473) b_lambda!8473)))

(check-sat (not b!345950) (not b!345952) (not b!345986) (not bm!26779) b_and!14691 (not b!345989) (not b!345972) (not b!346004) (not b!345974) (not b!345951) (not b_lambda!8473) (not b!345985) (not d!71181) (not b!345891) (not b!345962) tp_is_empty!7425 (not bm!26773) (not bm!26776) (not b!345940) (not b!345938) (not b!345954) (not mapNonEmpty!12591) (not bm!26772) (not b!345943) (not bm!26767) (not b_next!7473) (not bm!26771) (not d!71183) (not b!345948) (not d!71199) (not b!345889))
(check-sat b_and!14691 (not b_next!7473))
