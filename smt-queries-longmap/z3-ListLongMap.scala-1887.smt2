; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33742 () Bool)

(assert start!33742)

(declare-fun b_free!6991 () Bool)

(declare-fun b_next!6991 () Bool)

(assert (=> start!33742 (= b_free!6991 (not b_next!6991))))

(declare-fun tp!24476 () Bool)

(declare-fun b_and!14185 () Bool)

(assert (=> start!33742 (= tp!24476 b_and!14185)))

(declare-fun b!335781 () Bool)

(declare-fun res!185381 () Bool)

(declare-fun e!206114 () Bool)

(assert (=> b!335781 (=> (not res!185381) (not e!206114))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335781 (= res!185381 (validKeyInArray!0 k0!1348))))

(declare-fun b!335782 () Bool)

(declare-fun e!206116 () Bool)

(declare-fun tp_is_empty!6943 () Bool)

(assert (=> b!335782 (= e!206116 tp_is_empty!6943)))

(declare-fun b!335783 () Bool)

(declare-fun res!185382 () Bool)

(assert (=> b!335783 (=> (not res!185382) (not e!206114))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10235 0))(
  ( (V!10236 (val!3516 Int)) )
))
(declare-datatypes ((ValueCell!3128 0))(
  ( (ValueCellFull!3128 (v!5679 V!10235)) (EmptyCell!3128) )
))
(declare-datatypes ((array!17464 0))(
  ( (array!17465 (arr!8262 (Array (_ BitVec 32) ValueCell!3128)) (size!8614 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17464)

(declare-datatypes ((array!17466 0))(
  ( (array!17467 (arr!8263 (Array (_ BitVec 32) (_ BitVec 64))) (size!8615 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17466)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335783 (= res!185382 (and (= (size!8614 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8615 _keys!1895) (size!8614 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335784 () Bool)

(declare-datatypes ((SeekEntryResult!3160 0))(
  ( (MissingZero!3160 (index!14819 (_ BitVec 32))) (Found!3160 (index!14820 (_ BitVec 32))) (Intermediate!3160 (undefined!3972 Bool) (index!14821 (_ BitVec 32)) (x!33435 (_ BitVec 32))) (Undefined!3160) (MissingVacant!3160 (index!14822 (_ BitVec 32))) )
))
(declare-fun lt!159967 () SeekEntryResult!3160)

(get-info :version)

(assert (=> b!335784 (= e!206114 (and (not ((_ is Found!3160) lt!159967)) ((_ is MissingZero!3160) lt!159967) (bvsge #b00000000000000000000000000000000 (size!8615 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17466 (_ BitVec 32)) SeekEntryResult!3160)

(assert (=> b!335784 (= lt!159967 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!185379 () Bool)

(assert (=> start!33742 (=> (not res!185379) (not e!206114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33742 (= res!185379 (validMask!0 mask!2385))))

(assert (=> start!33742 e!206114))

(assert (=> start!33742 true))

(assert (=> start!33742 tp_is_empty!6943))

(assert (=> start!33742 tp!24476))

(declare-fun e!206113 () Bool)

(declare-fun array_inv!6142 (array!17464) Bool)

(assert (=> start!33742 (and (array_inv!6142 _values!1525) e!206113)))

(declare-fun array_inv!6143 (array!17466) Bool)

(assert (=> start!33742 (array_inv!6143 _keys!1895)))

(declare-fun mapIsEmpty!11811 () Bool)

(declare-fun mapRes!11811 () Bool)

(assert (=> mapIsEmpty!11811 mapRes!11811))

(declare-fun b!335785 () Bool)

(declare-fun e!206117 () Bool)

(assert (=> b!335785 (= e!206117 tp_is_empty!6943)))

(declare-fun b!335786 () Bool)

(declare-fun res!185383 () Bool)

(assert (=> b!335786 (=> (not res!185383) (not e!206114))))

(declare-datatypes ((List!4643 0))(
  ( (Nil!4640) (Cons!4639 (h!5495 (_ BitVec 64)) (t!9723 List!4643)) )
))
(declare-fun arrayNoDuplicates!0 (array!17466 (_ BitVec 32) List!4643) Bool)

(assert (=> b!335786 (= res!185383 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4640))))

(declare-fun mapNonEmpty!11811 () Bool)

(declare-fun tp!24477 () Bool)

(assert (=> mapNonEmpty!11811 (= mapRes!11811 (and tp!24477 e!206117))))

(declare-fun mapRest!11811 () (Array (_ BitVec 32) ValueCell!3128))

(declare-fun mapKey!11811 () (_ BitVec 32))

(declare-fun mapValue!11811 () ValueCell!3128)

(assert (=> mapNonEmpty!11811 (= (arr!8262 _values!1525) (store mapRest!11811 mapKey!11811 mapValue!11811))))

(declare-fun b!335787 () Bool)

(declare-fun res!185384 () Bool)

(assert (=> b!335787 (=> (not res!185384) (not e!206114))))

(declare-fun zeroValue!1467 () V!10235)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10235)

(declare-datatypes ((tuple2!5026 0))(
  ( (tuple2!5027 (_1!2524 (_ BitVec 64)) (_2!2524 V!10235)) )
))
(declare-datatypes ((List!4644 0))(
  ( (Nil!4641) (Cons!4640 (h!5496 tuple2!5026) (t!9724 List!4644)) )
))
(declare-datatypes ((ListLongMap!3941 0))(
  ( (ListLongMap!3942 (toList!1986 List!4644)) )
))
(declare-fun contains!2049 (ListLongMap!3941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1515 (array!17466 array!17464 (_ BitVec 32) (_ BitVec 32) V!10235 V!10235 (_ BitVec 32) Int) ListLongMap!3941)

(assert (=> b!335787 (= res!185384 (not (contains!2049 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!335788 () Bool)

(assert (=> b!335788 (= e!206113 (and e!206116 mapRes!11811))))

(declare-fun condMapEmpty!11811 () Bool)

(declare-fun mapDefault!11811 () ValueCell!3128)

(assert (=> b!335788 (= condMapEmpty!11811 (= (arr!8262 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3128)) mapDefault!11811)))))

(declare-fun b!335789 () Bool)

(declare-fun res!185380 () Bool)

(assert (=> b!335789 (=> (not res!185380) (not e!206114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17466 (_ BitVec 32)) Bool)

(assert (=> b!335789 (= res!185380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33742 res!185379) b!335783))

(assert (= (and b!335783 res!185382) b!335789))

(assert (= (and b!335789 res!185380) b!335786))

(assert (= (and b!335786 res!185383) b!335781))

(assert (= (and b!335781 res!185381) b!335787))

(assert (= (and b!335787 res!185384) b!335784))

(assert (= (and b!335788 condMapEmpty!11811) mapIsEmpty!11811))

(assert (= (and b!335788 (not condMapEmpty!11811)) mapNonEmpty!11811))

(assert (= (and mapNonEmpty!11811 ((_ is ValueCellFull!3128) mapValue!11811)) b!335785))

(assert (= (and b!335788 ((_ is ValueCellFull!3128) mapDefault!11811)) b!335782))

(assert (= start!33742 b!335788))

(declare-fun m!340025 () Bool)

(assert (=> start!33742 m!340025))

(declare-fun m!340027 () Bool)

(assert (=> start!33742 m!340027))

(declare-fun m!340029 () Bool)

(assert (=> start!33742 m!340029))

(declare-fun m!340031 () Bool)

(assert (=> b!335789 m!340031))

(declare-fun m!340033 () Bool)

(assert (=> b!335784 m!340033))

(declare-fun m!340035 () Bool)

(assert (=> b!335781 m!340035))

(declare-fun m!340037 () Bool)

(assert (=> b!335787 m!340037))

(assert (=> b!335787 m!340037))

(declare-fun m!340039 () Bool)

(assert (=> b!335787 m!340039))

(declare-fun m!340041 () Bool)

(assert (=> b!335786 m!340041))

(declare-fun m!340043 () Bool)

(assert (=> mapNonEmpty!11811 m!340043))

(check-sat b_and!14185 (not b!335781) (not b!335784) (not mapNonEmpty!11811) (not start!33742) (not b!335787) (not b_next!6991) tp_is_empty!6943 (not b!335786) (not b!335789))
(check-sat b_and!14185 (not b_next!6991))
(get-model)

(declare-fun d!70681 () Bool)

(declare-fun e!206152 () Bool)

(assert (=> d!70681 e!206152))

(declare-fun res!185423 () Bool)

(assert (=> d!70681 (=> res!185423 e!206152)))

(declare-fun lt!159984 () Bool)

(assert (=> d!70681 (= res!185423 (not lt!159984))))

(declare-fun lt!159982 () Bool)

(assert (=> d!70681 (= lt!159984 lt!159982)))

(declare-datatypes ((Unit!10425 0))(
  ( (Unit!10426) )
))
(declare-fun lt!159985 () Unit!10425)

(declare-fun e!206153 () Unit!10425)

(assert (=> d!70681 (= lt!159985 e!206153)))

(declare-fun c!52172 () Bool)

(assert (=> d!70681 (= c!52172 lt!159982)))

(declare-fun containsKey!316 (List!4644 (_ BitVec 64)) Bool)

(assert (=> d!70681 (= lt!159982 (containsKey!316 (toList!1986 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70681 (= (contains!2049 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159984)))

(declare-fun b!335850 () Bool)

(declare-fun lt!159983 () Unit!10425)

(assert (=> b!335850 (= e!206153 lt!159983)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!264 (List!4644 (_ BitVec 64)) Unit!10425)

(assert (=> b!335850 (= lt!159983 (lemmaContainsKeyImpliesGetValueByKeyDefined!264 (toList!1986 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!331 0))(
  ( (Some!330 (v!5682 V!10235)) (None!329) )
))
(declare-fun isDefined!265 (Option!331) Bool)

(declare-fun getValueByKey!325 (List!4644 (_ BitVec 64)) Option!331)

(assert (=> b!335850 (isDefined!265 (getValueByKey!325 (toList!1986 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!335851 () Bool)

(declare-fun Unit!10427 () Unit!10425)

(assert (=> b!335851 (= e!206153 Unit!10427)))

(declare-fun b!335852 () Bool)

(assert (=> b!335852 (= e!206152 (isDefined!265 (getValueByKey!325 (toList!1986 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70681 c!52172) b!335850))

(assert (= (and d!70681 (not c!52172)) b!335851))

(assert (= (and d!70681 (not res!185423)) b!335852))

(declare-fun m!340085 () Bool)

(assert (=> d!70681 m!340085))

(declare-fun m!340087 () Bool)

(assert (=> b!335850 m!340087))

(declare-fun m!340089 () Bool)

(assert (=> b!335850 m!340089))

(assert (=> b!335850 m!340089))

(declare-fun m!340091 () Bool)

(assert (=> b!335850 m!340091))

(assert (=> b!335852 m!340089))

(assert (=> b!335852 m!340089))

(assert (=> b!335852 m!340091))

(assert (=> b!335787 d!70681))

(declare-fun b!335895 () Bool)

(declare-fun e!206181 () Bool)

(assert (=> b!335895 (= e!206181 (validKeyInArray!0 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335896 () Bool)

(declare-fun e!206184 () Bool)

(declare-fun call!26297 () Bool)

(assert (=> b!335896 (= e!206184 (not call!26297))))

(declare-fun b!335897 () Bool)

(declare-fun res!185449 () Bool)

(declare-fun e!206183 () Bool)

(assert (=> b!335897 (=> (not res!185449) (not e!206183))))

(declare-fun e!206180 () Bool)

(assert (=> b!335897 (= res!185449 e!206180)))

(declare-fun res!185446 () Bool)

(assert (=> b!335897 (=> res!185446 e!206180)))

(assert (=> b!335897 (= res!185446 (not e!206181))))

(declare-fun res!185447 () Bool)

(assert (=> b!335897 (=> (not res!185447) (not e!206181))))

(assert (=> b!335897 (= res!185447 (bvslt #b00000000000000000000000000000000 (size!8615 _keys!1895)))))

(declare-fun b!335898 () Bool)

(assert (=> b!335898 (= e!206183 e!206184)))

(declare-fun c!52188 () Bool)

(assert (=> b!335898 (= c!52188 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!335899 () Bool)

(declare-fun res!185444 () Bool)

(assert (=> b!335899 (=> (not res!185444) (not e!206183))))

(declare-fun e!206182 () Bool)

(assert (=> b!335899 (= res!185444 e!206182)))

(declare-fun c!52189 () Bool)

(assert (=> b!335899 (= c!52189 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!335900 () Bool)

(declare-fun e!206190 () ListLongMap!3941)

(declare-fun call!26300 () ListLongMap!3941)

(assert (=> b!335900 (= e!206190 call!26300)))

(declare-fun b!335901 () Bool)

(declare-fun e!206187 () Unit!10425)

(declare-fun lt!160035 () Unit!10425)

(assert (=> b!335901 (= e!206187 lt!160035)))

(declare-fun lt!160046 () ListLongMap!3941)

(declare-fun getCurrentListMapNoExtraKeys!582 (array!17466 array!17464 (_ BitVec 32) (_ BitVec 32) V!10235 V!10235 (_ BitVec 32) Int) ListLongMap!3941)

(assert (=> b!335901 (= lt!160046 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160036 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160032 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160032 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160034 () Unit!10425)

(declare-fun addStillContains!242 (ListLongMap!3941 (_ BitVec 64) V!10235 (_ BitVec 64)) Unit!10425)

(assert (=> b!335901 (= lt!160034 (addStillContains!242 lt!160046 lt!160036 zeroValue!1467 lt!160032))))

(declare-fun +!717 (ListLongMap!3941 tuple2!5026) ListLongMap!3941)

(assert (=> b!335901 (contains!2049 (+!717 lt!160046 (tuple2!5027 lt!160036 zeroValue!1467)) lt!160032)))

(declare-fun lt!160030 () Unit!10425)

(assert (=> b!335901 (= lt!160030 lt!160034)))

(declare-fun lt!160033 () ListLongMap!3941)

(assert (=> b!335901 (= lt!160033 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160044 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160050 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160050 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160042 () Unit!10425)

(declare-fun addApplyDifferent!242 (ListLongMap!3941 (_ BitVec 64) V!10235 (_ BitVec 64)) Unit!10425)

(assert (=> b!335901 (= lt!160042 (addApplyDifferent!242 lt!160033 lt!160044 minValue!1467 lt!160050))))

(declare-fun apply!266 (ListLongMap!3941 (_ BitVec 64)) V!10235)

(assert (=> b!335901 (= (apply!266 (+!717 lt!160033 (tuple2!5027 lt!160044 minValue!1467)) lt!160050) (apply!266 lt!160033 lt!160050))))

(declare-fun lt!160047 () Unit!10425)

(assert (=> b!335901 (= lt!160047 lt!160042)))

(declare-fun lt!160043 () ListLongMap!3941)

(assert (=> b!335901 (= lt!160043 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160037 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160031 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160031 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160040 () Unit!10425)

(assert (=> b!335901 (= lt!160040 (addApplyDifferent!242 lt!160043 lt!160037 zeroValue!1467 lt!160031))))

(assert (=> b!335901 (= (apply!266 (+!717 lt!160043 (tuple2!5027 lt!160037 zeroValue!1467)) lt!160031) (apply!266 lt!160043 lt!160031))))

(declare-fun lt!160038 () Unit!10425)

(assert (=> b!335901 (= lt!160038 lt!160040)))

(declare-fun lt!160039 () ListLongMap!3941)

(assert (=> b!335901 (= lt!160039 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160048 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160048 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160051 () (_ BitVec 64))

(assert (=> b!335901 (= lt!160051 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!335901 (= lt!160035 (addApplyDifferent!242 lt!160039 lt!160048 minValue!1467 lt!160051))))

(assert (=> b!335901 (= (apply!266 (+!717 lt!160039 (tuple2!5027 lt!160048 minValue!1467)) lt!160051) (apply!266 lt!160039 lt!160051))))

(declare-fun b!335903 () Bool)

(declare-fun Unit!10428 () Unit!10425)

(assert (=> b!335903 (= e!206187 Unit!10428)))

(declare-fun b!335904 () Bool)

(declare-fun e!206191 () Bool)

(assert (=> b!335904 (= e!206184 e!206191)))

(declare-fun res!185445 () Bool)

(assert (=> b!335904 (= res!185445 call!26297)))

(assert (=> b!335904 (=> (not res!185445) (not e!206191))))

(declare-fun bm!26294 () Bool)

(declare-fun c!52187 () Bool)

(declare-fun call!26303 () ListLongMap!3941)

(declare-fun c!52186 () Bool)

(declare-fun call!26301 () ListLongMap!3941)

(declare-fun call!26299 () ListLongMap!3941)

(assert (=> bm!26294 (= call!26303 (+!717 (ite c!52187 call!26299 (ite c!52186 call!26301 call!26300)) (ite (or c!52187 c!52186) (tuple2!5027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5027 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26295 () Bool)

(declare-fun lt!160045 () ListLongMap!3941)

(assert (=> bm!26295 (= call!26297 (contains!2049 lt!160045 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26296 () Bool)

(declare-fun call!26298 () ListLongMap!3941)

(assert (=> bm!26296 (= call!26298 call!26303)))

(declare-fun b!335905 () Bool)

(declare-fun call!26302 () Bool)

(assert (=> b!335905 (= e!206182 (not call!26302))))

(declare-fun b!335906 () Bool)

(declare-fun e!206185 () Bool)

(assert (=> b!335906 (= e!206182 e!206185)))

(declare-fun res!185448 () Bool)

(assert (=> b!335906 (= res!185448 call!26302)))

(assert (=> b!335906 (=> (not res!185448) (not e!206185))))

(declare-fun bm!26297 () Bool)

(assert (=> bm!26297 (= call!26302 (contains!2049 lt!160045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!206188 () Bool)

(declare-fun b!335907 () Bool)

(declare-fun get!4532 (ValueCell!3128 V!10235) V!10235)

(declare-fun dynLambda!609 (Int (_ BitVec 64)) V!10235)

(assert (=> b!335907 (= e!206188 (= (apply!266 lt!160045 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)) (get!4532 (select (arr!8262 _values!1525) #b00000000000000000000000000000000) (dynLambda!609 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8614 _values!1525)))))

(assert (=> b!335907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8615 _keys!1895)))))

(declare-fun b!335908 () Bool)

(declare-fun e!206186 () ListLongMap!3941)

(assert (=> b!335908 (= e!206186 (+!717 call!26303 (tuple2!5027 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26298 () Bool)

(assert (=> bm!26298 (= call!26301 call!26299)))

(declare-fun b!335909 () Bool)

(assert (=> b!335909 (= e!206190 call!26298)))

(declare-fun b!335910 () Bool)

(assert (=> b!335910 (= e!206191 (= (apply!266 lt!160045 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!335911 () Bool)

(declare-fun c!52190 () Bool)

(assert (=> b!335911 (= c!52190 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!206192 () ListLongMap!3941)

(assert (=> b!335911 (= e!206192 e!206190)))

(declare-fun b!335912 () Bool)

(assert (=> b!335912 (= e!206192 call!26298)))

(declare-fun b!335913 () Bool)

(assert (=> b!335913 (= e!206185 (= (apply!266 lt!160045 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26299 () Bool)

(assert (=> bm!26299 (= call!26300 call!26301)))

(declare-fun b!335914 () Bool)

(declare-fun e!206189 () Bool)

(assert (=> b!335914 (= e!206189 (validKeyInArray!0 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70683 () Bool)

(assert (=> d!70683 e!206183))

(declare-fun res!185443 () Bool)

(assert (=> d!70683 (=> (not res!185443) (not e!206183))))

(assert (=> d!70683 (= res!185443 (or (bvsge #b00000000000000000000000000000000 (size!8615 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8615 _keys!1895)))))))

(declare-fun lt!160041 () ListLongMap!3941)

(assert (=> d!70683 (= lt!160045 lt!160041)))

(declare-fun lt!160049 () Unit!10425)

(assert (=> d!70683 (= lt!160049 e!206187)))

(declare-fun c!52185 () Bool)

(assert (=> d!70683 (= c!52185 e!206189)))

(declare-fun res!185450 () Bool)

(assert (=> d!70683 (=> (not res!185450) (not e!206189))))

(assert (=> d!70683 (= res!185450 (bvslt #b00000000000000000000000000000000 (size!8615 _keys!1895)))))

(assert (=> d!70683 (= lt!160041 e!206186)))

(assert (=> d!70683 (= c!52187 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70683 (validMask!0 mask!2385)))

(assert (=> d!70683 (= (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160045)))

(declare-fun b!335902 () Bool)

(assert (=> b!335902 (= e!206186 e!206192)))

(assert (=> b!335902 (= c!52186 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26300 () Bool)

(assert (=> bm!26300 (= call!26299 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335915 () Bool)

(assert (=> b!335915 (= e!206180 e!206188)))

(declare-fun res!185442 () Bool)

(assert (=> b!335915 (=> (not res!185442) (not e!206188))))

(assert (=> b!335915 (= res!185442 (contains!2049 lt!160045 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!335915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8615 _keys!1895)))))

(assert (= (and d!70683 c!52187) b!335908))

(assert (= (and d!70683 (not c!52187)) b!335902))

(assert (= (and b!335902 c!52186) b!335912))

(assert (= (and b!335902 (not c!52186)) b!335911))

(assert (= (and b!335911 c!52190) b!335909))

(assert (= (and b!335911 (not c!52190)) b!335900))

(assert (= (or b!335909 b!335900) bm!26299))

(assert (= (or b!335912 bm!26299) bm!26298))

(assert (= (or b!335912 b!335909) bm!26296))

(assert (= (or b!335908 bm!26298) bm!26300))

(assert (= (or b!335908 bm!26296) bm!26294))

(assert (= (and d!70683 res!185450) b!335914))

(assert (= (and d!70683 c!52185) b!335901))

(assert (= (and d!70683 (not c!52185)) b!335903))

(assert (= (and d!70683 res!185443) b!335897))

(assert (= (and b!335897 res!185447) b!335895))

(assert (= (and b!335897 (not res!185446)) b!335915))

(assert (= (and b!335915 res!185442) b!335907))

(assert (= (and b!335897 res!185449) b!335899))

(assert (= (and b!335899 c!52189) b!335906))

(assert (= (and b!335899 (not c!52189)) b!335905))

(assert (= (and b!335906 res!185448) b!335913))

(assert (= (or b!335906 b!335905) bm!26297))

(assert (= (and b!335899 res!185444) b!335898))

(assert (= (and b!335898 c!52188) b!335904))

(assert (= (and b!335898 (not c!52188)) b!335896))

(assert (= (and b!335904 res!185445) b!335910))

(assert (= (or b!335904 b!335896) bm!26295))

(declare-fun b_lambda!8425 () Bool)

(assert (=> (not b_lambda!8425) (not b!335907)))

(declare-fun t!9728 () Bool)

(declare-fun tb!3039 () Bool)

(assert (=> (and start!33742 (= defaultEntry!1528 defaultEntry!1528) t!9728) tb!3039))

(declare-fun result!5463 () Bool)

(assert (=> tb!3039 (= result!5463 tp_is_empty!6943)))

(assert (=> b!335907 t!9728))

(declare-fun b_and!14191 () Bool)

(assert (= b_and!14185 (and (=> t!9728 result!5463) b_and!14191)))

(declare-fun m!340093 () Bool)

(assert (=> b!335907 m!340093))

(declare-fun m!340095 () Bool)

(assert (=> b!335907 m!340095))

(declare-fun m!340097 () Bool)

(assert (=> b!335907 m!340097))

(assert (=> b!335907 m!340095))

(declare-fun m!340099 () Bool)

(assert (=> b!335907 m!340099))

(assert (=> b!335907 m!340093))

(declare-fun m!340101 () Bool)

(assert (=> b!335907 m!340101))

(assert (=> b!335907 m!340099))

(declare-fun m!340103 () Bool)

(assert (=> bm!26295 m!340103))

(declare-fun m!340105 () Bool)

(assert (=> bm!26297 m!340105))

(assert (=> b!335895 m!340095))

(assert (=> b!335895 m!340095))

(declare-fun m!340107 () Bool)

(assert (=> b!335895 m!340107))

(assert (=> b!335915 m!340095))

(assert (=> b!335915 m!340095))

(declare-fun m!340109 () Bool)

(assert (=> b!335915 m!340109))

(declare-fun m!340111 () Bool)

(assert (=> b!335910 m!340111))

(assert (=> b!335914 m!340095))

(assert (=> b!335914 m!340095))

(assert (=> b!335914 m!340107))

(declare-fun m!340113 () Bool)

(assert (=> b!335901 m!340113))

(declare-fun m!340115 () Bool)

(assert (=> b!335901 m!340115))

(declare-fun m!340117 () Bool)

(assert (=> b!335901 m!340117))

(declare-fun m!340119 () Bool)

(assert (=> b!335901 m!340119))

(declare-fun m!340121 () Bool)

(assert (=> b!335901 m!340121))

(declare-fun m!340123 () Bool)

(assert (=> b!335901 m!340123))

(assert (=> b!335901 m!340123))

(declare-fun m!340125 () Bool)

(assert (=> b!335901 m!340125))

(declare-fun m!340127 () Bool)

(assert (=> b!335901 m!340127))

(declare-fun m!340129 () Bool)

(assert (=> b!335901 m!340129))

(declare-fun m!340131 () Bool)

(assert (=> b!335901 m!340131))

(assert (=> b!335901 m!340127))

(declare-fun m!340133 () Bool)

(assert (=> b!335901 m!340133))

(assert (=> b!335901 m!340115))

(declare-fun m!340135 () Bool)

(assert (=> b!335901 m!340135))

(declare-fun m!340137 () Bool)

(assert (=> b!335901 m!340137))

(assert (=> b!335901 m!340095))

(declare-fun m!340139 () Bool)

(assert (=> b!335901 m!340139))

(declare-fun m!340141 () Bool)

(assert (=> b!335901 m!340141))

(assert (=> b!335901 m!340137))

(declare-fun m!340143 () Bool)

(assert (=> b!335901 m!340143))

(declare-fun m!340145 () Bool)

(assert (=> bm!26294 m!340145))

(declare-fun m!340147 () Bool)

(assert (=> b!335913 m!340147))

(declare-fun m!340149 () Bool)

(assert (=> b!335908 m!340149))

(assert (=> d!70683 m!340025))

(assert (=> bm!26300 m!340135))

(assert (=> b!335787 d!70683))

(declare-fun d!70685 () Bool)

(assert (=> d!70685 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33742 d!70685))

(declare-fun d!70687 () Bool)

(assert (=> d!70687 (= (array_inv!6142 _values!1525) (bvsge (size!8614 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33742 d!70687))

(declare-fun d!70689 () Bool)

(assert (=> d!70689 (= (array_inv!6143 _keys!1895) (bvsge (size!8615 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33742 d!70689))

(declare-fun b!335928 () Bool)

(declare-fun e!206203 () Bool)

(declare-fun e!206202 () Bool)

(assert (=> b!335928 (= e!206203 e!206202)))

(declare-fun c!52193 () Bool)

(assert (=> b!335928 (= c!52193 (validKeyInArray!0 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335929 () Bool)

(declare-fun call!26306 () Bool)

(assert (=> b!335929 (= e!206202 call!26306)))

(declare-fun bm!26303 () Bool)

(assert (=> bm!26303 (= call!26306 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52193 (Cons!4639 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000) Nil!4640) Nil!4640)))))

(declare-fun b!335930 () Bool)

(assert (=> b!335930 (= e!206202 call!26306)))

(declare-fun d!70691 () Bool)

(declare-fun res!185458 () Bool)

(declare-fun e!206204 () Bool)

(assert (=> d!70691 (=> res!185458 e!206204)))

(assert (=> d!70691 (= res!185458 (bvsge #b00000000000000000000000000000000 (size!8615 _keys!1895)))))

(assert (=> d!70691 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4640) e!206204)))

(declare-fun b!335931 () Bool)

(declare-fun e!206201 () Bool)

(declare-fun contains!2052 (List!4643 (_ BitVec 64)) Bool)

(assert (=> b!335931 (= e!206201 (contains!2052 Nil!4640 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335932 () Bool)

(assert (=> b!335932 (= e!206204 e!206203)))

(declare-fun res!185459 () Bool)

(assert (=> b!335932 (=> (not res!185459) (not e!206203))))

(assert (=> b!335932 (= res!185459 (not e!206201))))

(declare-fun res!185457 () Bool)

(assert (=> b!335932 (=> (not res!185457) (not e!206201))))

(assert (=> b!335932 (= res!185457 (validKeyInArray!0 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70691 (not res!185458)) b!335932))

(assert (= (and b!335932 res!185457) b!335931))

(assert (= (and b!335932 res!185459) b!335928))

(assert (= (and b!335928 c!52193) b!335930))

(assert (= (and b!335928 (not c!52193)) b!335929))

(assert (= (or b!335930 b!335929) bm!26303))

(assert (=> b!335928 m!340095))

(assert (=> b!335928 m!340095))

(assert (=> b!335928 m!340107))

(assert (=> bm!26303 m!340095))

(declare-fun m!340151 () Bool)

(assert (=> bm!26303 m!340151))

(assert (=> b!335931 m!340095))

(assert (=> b!335931 m!340095))

(declare-fun m!340153 () Bool)

(assert (=> b!335931 m!340153))

(assert (=> b!335932 m!340095))

(assert (=> b!335932 m!340095))

(assert (=> b!335932 m!340107))

(assert (=> b!335786 d!70691))

(declare-fun d!70693 () Bool)

(assert (=> d!70693 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335781 d!70693))

(declare-fun b!335941 () Bool)

(declare-fun e!206213 () Bool)

(declare-fun e!206211 () Bool)

(assert (=> b!335941 (= e!206213 e!206211)))

(declare-fun c!52196 () Bool)

(assert (=> b!335941 (= c!52196 (validKeyInArray!0 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26306 () Bool)

(declare-fun call!26309 () Bool)

(assert (=> bm!26306 (= call!26309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!335943 () Bool)

(declare-fun e!206212 () Bool)

(assert (=> b!335943 (= e!206212 call!26309)))

(declare-fun b!335944 () Bool)

(assert (=> b!335944 (= e!206211 e!206212)))

(declare-fun lt!160059 () (_ BitVec 64))

(assert (=> b!335944 (= lt!160059 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160058 () Unit!10425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17466 (_ BitVec 64) (_ BitVec 32)) Unit!10425)

(assert (=> b!335944 (= lt!160058 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160059 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335944 (arrayContainsKey!0 _keys!1895 lt!160059 #b00000000000000000000000000000000)))

(declare-fun lt!160060 () Unit!10425)

(assert (=> b!335944 (= lt!160060 lt!160058)))

(declare-fun res!185464 () Bool)

(assert (=> b!335944 (= res!185464 (= (seekEntryOrOpen!0 (select (arr!8263 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3160 #b00000000000000000000000000000000)))))

(assert (=> b!335944 (=> (not res!185464) (not e!206212))))

(declare-fun b!335942 () Bool)

(assert (=> b!335942 (= e!206211 call!26309)))

(declare-fun d!70695 () Bool)

(declare-fun res!185465 () Bool)

(assert (=> d!70695 (=> res!185465 e!206213)))

(assert (=> d!70695 (= res!185465 (bvsge #b00000000000000000000000000000000 (size!8615 _keys!1895)))))

(assert (=> d!70695 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206213)))

(assert (= (and d!70695 (not res!185465)) b!335941))

(assert (= (and b!335941 c!52196) b!335944))

(assert (= (and b!335941 (not c!52196)) b!335942))

(assert (= (and b!335944 res!185464) b!335943))

(assert (= (or b!335943 b!335942) bm!26306))

(assert (=> b!335941 m!340095))

(assert (=> b!335941 m!340095))

(assert (=> b!335941 m!340107))

(declare-fun m!340155 () Bool)

(assert (=> bm!26306 m!340155))

(assert (=> b!335944 m!340095))

(declare-fun m!340157 () Bool)

(assert (=> b!335944 m!340157))

(declare-fun m!340159 () Bool)

(assert (=> b!335944 m!340159))

(assert (=> b!335944 m!340095))

(declare-fun m!340161 () Bool)

(assert (=> b!335944 m!340161))

(assert (=> b!335789 d!70695))

(declare-fun d!70697 () Bool)

(declare-fun lt!160067 () SeekEntryResult!3160)

(assert (=> d!70697 (and (or ((_ is Undefined!3160) lt!160067) (not ((_ is Found!3160) lt!160067)) (and (bvsge (index!14820 lt!160067) #b00000000000000000000000000000000) (bvslt (index!14820 lt!160067) (size!8615 _keys!1895)))) (or ((_ is Undefined!3160) lt!160067) ((_ is Found!3160) lt!160067) (not ((_ is MissingZero!3160) lt!160067)) (and (bvsge (index!14819 lt!160067) #b00000000000000000000000000000000) (bvslt (index!14819 lt!160067) (size!8615 _keys!1895)))) (or ((_ is Undefined!3160) lt!160067) ((_ is Found!3160) lt!160067) ((_ is MissingZero!3160) lt!160067) (not ((_ is MissingVacant!3160) lt!160067)) (and (bvsge (index!14822 lt!160067) #b00000000000000000000000000000000) (bvslt (index!14822 lt!160067) (size!8615 _keys!1895)))) (or ((_ is Undefined!3160) lt!160067) (ite ((_ is Found!3160) lt!160067) (= (select (arr!8263 _keys!1895) (index!14820 lt!160067)) k0!1348) (ite ((_ is MissingZero!3160) lt!160067) (= (select (arr!8263 _keys!1895) (index!14819 lt!160067)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3160) lt!160067) (= (select (arr!8263 _keys!1895) (index!14822 lt!160067)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!206222 () SeekEntryResult!3160)

(assert (=> d!70697 (= lt!160067 e!206222)))

(declare-fun c!52205 () Bool)

(declare-fun lt!160069 () SeekEntryResult!3160)

(assert (=> d!70697 (= c!52205 (and ((_ is Intermediate!3160) lt!160069) (undefined!3972 lt!160069)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17466 (_ BitVec 32)) SeekEntryResult!3160)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70697 (= lt!160069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70697 (validMask!0 mask!2385)))

(assert (=> d!70697 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160067)))

(declare-fun b!335957 () Bool)

(declare-fun e!206220 () SeekEntryResult!3160)

(assert (=> b!335957 (= e!206220 (MissingZero!3160 (index!14821 lt!160069)))))

(declare-fun b!335958 () Bool)

(declare-fun c!52204 () Bool)

(declare-fun lt!160068 () (_ BitVec 64))

(assert (=> b!335958 (= c!52204 (= lt!160068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!206221 () SeekEntryResult!3160)

(assert (=> b!335958 (= e!206221 e!206220)))

(declare-fun b!335959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17466 (_ BitVec 32)) SeekEntryResult!3160)

(assert (=> b!335959 (= e!206220 (seekKeyOrZeroReturnVacant!0 (x!33435 lt!160069) (index!14821 lt!160069) (index!14821 lt!160069) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335960 () Bool)

(assert (=> b!335960 (= e!206221 (Found!3160 (index!14821 lt!160069)))))

(declare-fun b!335961 () Bool)

(assert (=> b!335961 (= e!206222 Undefined!3160)))

(declare-fun b!335962 () Bool)

(assert (=> b!335962 (= e!206222 e!206221)))

(assert (=> b!335962 (= lt!160068 (select (arr!8263 _keys!1895) (index!14821 lt!160069)))))

(declare-fun c!52203 () Bool)

(assert (=> b!335962 (= c!52203 (= lt!160068 k0!1348))))

(assert (= (and d!70697 c!52205) b!335961))

(assert (= (and d!70697 (not c!52205)) b!335962))

(assert (= (and b!335962 c!52203) b!335960))

(assert (= (and b!335962 (not c!52203)) b!335958))

(assert (= (and b!335958 c!52204) b!335957))

(assert (= (and b!335958 (not c!52204)) b!335959))

(declare-fun m!340163 () Bool)

(assert (=> d!70697 m!340163))

(assert (=> d!70697 m!340025))

(declare-fun m!340165 () Bool)

(assert (=> d!70697 m!340165))

(declare-fun m!340167 () Bool)

(assert (=> d!70697 m!340167))

(declare-fun m!340169 () Bool)

(assert (=> d!70697 m!340169))

(assert (=> d!70697 m!340163))

(declare-fun m!340171 () Bool)

(assert (=> d!70697 m!340171))

(declare-fun m!340173 () Bool)

(assert (=> b!335959 m!340173))

(declare-fun m!340175 () Bool)

(assert (=> b!335962 m!340175))

(assert (=> b!335784 d!70697))

(declare-fun mapIsEmpty!11820 () Bool)

(declare-fun mapRes!11820 () Bool)

(assert (=> mapIsEmpty!11820 mapRes!11820))

(declare-fun b!335970 () Bool)

(declare-fun e!206228 () Bool)

(assert (=> b!335970 (= e!206228 tp_is_empty!6943)))

(declare-fun b!335969 () Bool)

(declare-fun e!206227 () Bool)

(assert (=> b!335969 (= e!206227 tp_is_empty!6943)))

(declare-fun mapNonEmpty!11820 () Bool)

(declare-fun tp!24492 () Bool)

(assert (=> mapNonEmpty!11820 (= mapRes!11820 (and tp!24492 e!206227))))

(declare-fun mapKey!11820 () (_ BitVec 32))

(declare-fun mapValue!11820 () ValueCell!3128)

(declare-fun mapRest!11820 () (Array (_ BitVec 32) ValueCell!3128))

(assert (=> mapNonEmpty!11820 (= mapRest!11811 (store mapRest!11820 mapKey!11820 mapValue!11820))))

(declare-fun condMapEmpty!11820 () Bool)

(declare-fun mapDefault!11820 () ValueCell!3128)

(assert (=> mapNonEmpty!11811 (= condMapEmpty!11820 (= mapRest!11811 ((as const (Array (_ BitVec 32) ValueCell!3128)) mapDefault!11820)))))

(assert (=> mapNonEmpty!11811 (= tp!24477 (and e!206228 mapRes!11820))))

(assert (= (and mapNonEmpty!11811 condMapEmpty!11820) mapIsEmpty!11820))

(assert (= (and mapNonEmpty!11811 (not condMapEmpty!11820)) mapNonEmpty!11820))

(assert (= (and mapNonEmpty!11820 ((_ is ValueCellFull!3128) mapValue!11820)) b!335969))

(assert (= (and mapNonEmpty!11811 ((_ is ValueCellFull!3128) mapDefault!11820)) b!335970))

(declare-fun m!340177 () Bool)

(assert (=> mapNonEmpty!11820 m!340177))

(declare-fun b_lambda!8427 () Bool)

(assert (= b_lambda!8425 (or (and start!33742 b_free!6991) b_lambda!8427)))

(check-sat (not b!335913) (not b!335895) (not b!335931) (not d!70681) (not bm!26306) (not d!70683) (not b!335907) (not bm!26300) (not bm!26295) (not b_lambda!8427) b_and!14191 (not bm!26294) (not b!335850) (not b_next!6991) tp_is_empty!6943 (not b!335959) (not b!335932) (not b!335941) (not b!335928) (not bm!26303) (not b!335944) (not b!335914) (not bm!26297) (not mapNonEmpty!11820) (not b!335908) (not b!335915) (not d!70697) (not b!335901) (not b!335910) (not b!335852))
(check-sat b_and!14191 (not b_next!6991))
