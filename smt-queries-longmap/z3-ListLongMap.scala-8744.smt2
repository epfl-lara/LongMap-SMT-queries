; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106068 () Bool)

(assert start!106068)

(declare-fun b_free!27501 () Bool)

(declare-fun b_next!27501 () Bool)

(assert (=> start!106068 (= b_free!27501 (not b_next!27501))))

(declare-fun tp!96053 () Bool)

(declare-fun b_and!45475 () Bool)

(assert (=> start!106068 (= tp!96053 b_and!45475)))

(declare-fun b!1263066 () Bool)

(declare-fun e!719061 () Bool)

(declare-fun tp_is_empty!32403 () Bool)

(assert (=> b!1263066 (= e!719061 tp_is_empty!32403)))

(declare-fun b!1263067 () Bool)

(declare-fun e!719060 () Bool)

(declare-fun e!719064 () Bool)

(assert (=> b!1263067 (= e!719060 (not e!719064))))

(declare-fun res!841388 () Bool)

(assert (=> b!1263067 (=> res!841388 e!719064)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263067 (= res!841388 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48569 0))(
  ( (V!48570 (val!16264 Int)) )
))
(declare-datatypes ((tuple2!21054 0))(
  ( (tuple2!21055 (_1!10538 (_ BitVec 64)) (_2!10538 V!48569)) )
))
(declare-datatypes ((List!28245 0))(
  ( (Nil!28242) (Cons!28241 (h!29450 tuple2!21054) (t!41756 List!28245)) )
))
(declare-datatypes ((ListLongMap!18927 0))(
  ( (ListLongMap!18928 (toList!9479 List!28245)) )
))
(declare-fun lt!572727 () ListLongMap!18927)

(declare-fun lt!572726 () ListLongMap!18927)

(assert (=> b!1263067 (= lt!572727 lt!572726)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48569)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82426 0))(
  ( (array!82427 (arr!39760 (Array (_ BitVec 32) (_ BitVec 64))) (size!40296 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82426)

(declare-datatypes ((ValueCell!15438 0))(
  ( (ValueCellFull!15438 (v!18973 V!48569)) (EmptyCell!15438) )
))
(declare-datatypes ((array!82428 0))(
  ( (array!82429 (arr!39761 (Array (_ BitVec 32) ValueCell!15438)) (size!40297 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82428)

(declare-fun minValueBefore!43 () V!48569)

(declare-fun zeroValue!871 () V!48569)

(declare-datatypes ((Unit!42105 0))(
  ( (Unit!42106) )
))
(declare-fun lt!572728 () Unit!42105)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1185 (array!82426 array!82428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48569 V!48569 V!48569 V!48569 (_ BitVec 32) Int) Unit!42105)

(assert (=> b!1263067 (= lt!572728 (lemmaNoChangeToArrayThenSameMapNoExtras!1185 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5843 (array!82426 array!82428 (_ BitVec 32) (_ BitVec 32) V!48569 V!48569 (_ BitVec 32) Int) ListLongMap!18927)

(assert (=> b!1263067 (= lt!572726 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263067 (= lt!572727 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263068 () Bool)

(declare-fun contains!7599 (ListLongMap!18927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4646 (array!82426 array!82428 (_ BitVec 32) (_ BitVec 32) V!48569 V!48569 (_ BitVec 32) Int) ListLongMap!18927)

(assert (=> b!1263068 (= e!719064 (not (contains!7599 (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263069 () Bool)

(declare-fun res!841386 () Bool)

(assert (=> b!1263069 (=> (not res!841386) (not e!719060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82426 (_ BitVec 32)) Bool)

(assert (=> b!1263069 (= res!841386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263070 () Bool)

(declare-fun e!719063 () Bool)

(declare-fun e!719059 () Bool)

(declare-fun mapRes!50425 () Bool)

(assert (=> b!1263070 (= e!719063 (and e!719059 mapRes!50425))))

(declare-fun condMapEmpty!50425 () Bool)

(declare-fun mapDefault!50425 () ValueCell!15438)

(assert (=> b!1263070 (= condMapEmpty!50425 (= (arr!39761 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15438)) mapDefault!50425)))))

(declare-fun b!1263071 () Bool)

(assert (=> b!1263071 (= e!719059 tp_is_empty!32403)))

(declare-fun b!1263072 () Bool)

(declare-fun res!841389 () Bool)

(assert (=> b!1263072 (=> (not res!841389) (not e!719060))))

(assert (=> b!1263072 (= res!841389 (and (= (size!40297 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40296 _keys!1118) (size!40297 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50425 () Bool)

(declare-fun tp!96052 () Bool)

(assert (=> mapNonEmpty!50425 (= mapRes!50425 (and tp!96052 e!719061))))

(declare-fun mapValue!50425 () ValueCell!15438)

(declare-fun mapKey!50425 () (_ BitVec 32))

(declare-fun mapRest!50425 () (Array (_ BitVec 32) ValueCell!15438))

(assert (=> mapNonEmpty!50425 (= (arr!39761 _values!914) (store mapRest!50425 mapKey!50425 mapValue!50425))))

(declare-fun res!841390 () Bool)

(assert (=> start!106068 (=> (not res!841390) (not e!719060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106068 (= res!841390 (validMask!0 mask!1466))))

(assert (=> start!106068 e!719060))

(assert (=> start!106068 true))

(assert (=> start!106068 tp!96053))

(assert (=> start!106068 tp_is_empty!32403))

(declare-fun array_inv!30261 (array!82426) Bool)

(assert (=> start!106068 (array_inv!30261 _keys!1118)))

(declare-fun array_inv!30262 (array!82428) Bool)

(assert (=> start!106068 (and (array_inv!30262 _values!914) e!719063)))

(declare-fun b!1263073 () Bool)

(declare-fun res!841387 () Bool)

(assert (=> b!1263073 (=> (not res!841387) (not e!719060))))

(declare-datatypes ((List!28246 0))(
  ( (Nil!28243) (Cons!28242 (h!29451 (_ BitVec 64)) (t!41757 List!28246)) )
))
(declare-fun arrayNoDuplicates!0 (array!82426 (_ BitVec 32) List!28246) Bool)

(assert (=> b!1263073 (= res!841387 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28243))))

(declare-fun mapIsEmpty!50425 () Bool)

(assert (=> mapIsEmpty!50425 mapRes!50425))

(assert (= (and start!106068 res!841390) b!1263072))

(assert (= (and b!1263072 res!841389) b!1263069))

(assert (= (and b!1263069 res!841386) b!1263073))

(assert (= (and b!1263073 res!841387) b!1263067))

(assert (= (and b!1263067 (not res!841388)) b!1263068))

(assert (= (and b!1263070 condMapEmpty!50425) mapIsEmpty!50425))

(assert (= (and b!1263070 (not condMapEmpty!50425)) mapNonEmpty!50425))

(get-info :version)

(assert (= (and mapNonEmpty!50425 ((_ is ValueCellFull!15438) mapValue!50425)) b!1263066))

(assert (= (and b!1263070 ((_ is ValueCellFull!15438) mapDefault!50425)) b!1263071))

(assert (= start!106068 b!1263070))

(declare-fun m!1163593 () Bool)

(assert (=> b!1263073 m!1163593))

(declare-fun m!1163595 () Bool)

(assert (=> b!1263069 m!1163595))

(declare-fun m!1163597 () Bool)

(assert (=> mapNonEmpty!50425 m!1163597))

(declare-fun m!1163599 () Bool)

(assert (=> b!1263068 m!1163599))

(assert (=> b!1263068 m!1163599))

(declare-fun m!1163601 () Bool)

(assert (=> b!1263068 m!1163601))

(declare-fun m!1163603 () Bool)

(assert (=> b!1263067 m!1163603))

(declare-fun m!1163605 () Bool)

(assert (=> b!1263067 m!1163605))

(declare-fun m!1163607 () Bool)

(assert (=> b!1263067 m!1163607))

(declare-fun m!1163609 () Bool)

(assert (=> start!106068 m!1163609))

(declare-fun m!1163611 () Bool)

(assert (=> start!106068 m!1163611))

(declare-fun m!1163613 () Bool)

(assert (=> start!106068 m!1163613))

(check-sat (not b_next!27501) (not mapNonEmpty!50425) (not start!106068) b_and!45475 (not b!1263069) (not b!1263073) (not b!1263068) tp_is_empty!32403 (not b!1263067))
(check-sat b_and!45475 (not b_next!27501))
(get-model)

(declare-fun d!138591 () Bool)

(assert (=> d!138591 (= (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572740 () Unit!42105)

(declare-fun choose!1874 (array!82426 array!82428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48569 V!48569 V!48569 V!48569 (_ BitVec 32) Int) Unit!42105)

(assert (=> d!138591 (= lt!572740 (choose!1874 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138591 (validMask!0 mask!1466)))

(assert (=> d!138591 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1185 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572740)))

(declare-fun bs!35740 () Bool)

(assert (= bs!35740 d!138591))

(assert (=> bs!35740 m!1163607))

(assert (=> bs!35740 m!1163605))

(declare-fun m!1163637 () Bool)

(assert (=> bs!35740 m!1163637))

(assert (=> bs!35740 m!1163609))

(assert (=> b!1263067 d!138591))

(declare-fun b!1263122 () Bool)

(declare-fun e!719097 () Bool)

(declare-fun e!719099 () Bool)

(assert (=> b!1263122 (= e!719097 e!719099)))

(declare-fun c!122912 () Bool)

(assert (=> b!1263122 (= c!122912 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263123 () Bool)

(declare-fun res!841416 () Bool)

(declare-fun e!719103 () Bool)

(assert (=> b!1263123 (=> (not res!841416) (not e!719103))))

(declare-fun lt!572758 () ListLongMap!18927)

(assert (=> b!1263123 (= res!841416 (not (contains!7599 lt!572758 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263124 () Bool)

(declare-fun lt!572756 () Unit!42105)

(declare-fun lt!572759 () Unit!42105)

(assert (=> b!1263124 (= lt!572756 lt!572759)))

(declare-fun lt!572757 () (_ BitVec 64))

(declare-fun lt!572755 () V!48569)

(declare-fun lt!572760 () ListLongMap!18927)

(declare-fun lt!572761 () (_ BitVec 64))

(declare-fun +!4252 (ListLongMap!18927 tuple2!21054) ListLongMap!18927)

(assert (=> b!1263124 (not (contains!7599 (+!4252 lt!572760 (tuple2!21055 lt!572757 lt!572755)) lt!572761))))

(declare-fun addStillNotContains!328 (ListLongMap!18927 (_ BitVec 64) V!48569 (_ BitVec 64)) Unit!42105)

(assert (=> b!1263124 (= lt!572759 (addStillNotContains!328 lt!572760 lt!572757 lt!572755 lt!572761))))

(assert (=> b!1263124 (= lt!572761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20285 (ValueCell!15438 V!48569) V!48569)

(declare-fun dynLambda!3398 (Int (_ BitVec 64)) V!48569)

(assert (=> b!1263124 (= lt!572755 (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263124 (= lt!572757 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62152 () ListLongMap!18927)

(assert (=> b!1263124 (= lt!572760 call!62152)))

(declare-fun e!719100 () ListLongMap!18927)

(assert (=> b!1263124 (= e!719100 (+!4252 call!62152 (tuple2!21055 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000) (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263125 () Bool)

(assert (=> b!1263125 (= e!719100 call!62152)))

(declare-fun b!1263126 () Bool)

(declare-fun e!719102 () ListLongMap!18927)

(assert (=> b!1263126 (= e!719102 e!719100)))

(declare-fun c!122915 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263126 (= c!122915 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138593 () Bool)

(assert (=> d!138593 e!719103))

(declare-fun res!841415 () Bool)

(assert (=> d!138593 (=> (not res!841415) (not e!719103))))

(assert (=> d!138593 (= res!841415 (not (contains!7599 lt!572758 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138593 (= lt!572758 e!719102)))

(declare-fun c!122913 () Bool)

(assert (=> d!138593 (= c!122913 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!138593 (validMask!0 mask!1466)))

(assert (=> d!138593 (= (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572758)))

(declare-fun b!1263127 () Bool)

(declare-fun e!719098 () Bool)

(assert (=> b!1263127 (= e!719097 e!719098)))

(assert (=> b!1263127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun res!841417 () Bool)

(assert (=> b!1263127 (= res!841417 (contains!7599 lt!572758 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263127 (=> (not res!841417) (not e!719098))))

(declare-fun b!1263128 () Bool)

(assert (=> b!1263128 (= e!719099 (= lt!572758 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62149 () Bool)

(assert (=> bm!62149 (= call!62152 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263129 () Bool)

(assert (=> b!1263129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> b!1263129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(declare-fun apply!1000 (ListLongMap!18927 (_ BitVec 64)) V!48569)

(assert (=> b!1263129 (= e!719098 (= (apply!1000 lt!572758 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)) (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263130 () Bool)

(assert (=> b!1263130 (= e!719102 (ListLongMap!18928 Nil!28242))))

(declare-fun b!1263131 () Bool)

(assert (=> b!1263131 (= e!719103 e!719097)))

(declare-fun c!122914 () Bool)

(declare-fun e!719101 () Bool)

(assert (=> b!1263131 (= c!122914 e!719101)))

(declare-fun res!841414 () Bool)

(assert (=> b!1263131 (=> (not res!841414) (not e!719101))))

(assert (=> b!1263131 (= res!841414 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263132 () Bool)

(assert (=> b!1263132 (= e!719101 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263132 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263133 () Bool)

(declare-fun isEmpty!1042 (ListLongMap!18927) Bool)

(assert (=> b!1263133 (= e!719099 (isEmpty!1042 lt!572758))))

(assert (= (and d!138593 c!122913) b!1263130))

(assert (= (and d!138593 (not c!122913)) b!1263126))

(assert (= (and b!1263126 c!122915) b!1263124))

(assert (= (and b!1263126 (not c!122915)) b!1263125))

(assert (= (or b!1263124 b!1263125) bm!62149))

(assert (= (and d!138593 res!841415) b!1263123))

(assert (= (and b!1263123 res!841416) b!1263131))

(assert (= (and b!1263131 res!841414) b!1263132))

(assert (= (and b!1263131 c!122914) b!1263127))

(assert (= (and b!1263131 (not c!122914)) b!1263122))

(assert (= (and b!1263127 res!841417) b!1263129))

(assert (= (and b!1263122 c!122912) b!1263128))

(assert (= (and b!1263122 (not c!122912)) b!1263133))

(declare-fun b_lambda!22923 () Bool)

(assert (=> (not b_lambda!22923) (not b!1263124)))

(declare-fun t!41761 () Bool)

(declare-fun tb!11327 () Bool)

(assert (=> (and start!106068 (= defaultEntry!922 defaultEntry!922) t!41761) tb!11327))

(declare-fun result!23389 () Bool)

(assert (=> tb!11327 (= result!23389 tp_is_empty!32403)))

(assert (=> b!1263124 t!41761))

(declare-fun b_and!45479 () Bool)

(assert (= b_and!45475 (and (=> t!41761 result!23389) b_and!45479)))

(declare-fun b_lambda!22925 () Bool)

(assert (=> (not b_lambda!22925) (not b!1263129)))

(assert (=> b!1263129 t!41761))

(declare-fun b_and!45481 () Bool)

(assert (= b_and!45479 (and (=> t!41761 result!23389) b_and!45481)))

(declare-fun m!1163639 () Bool)

(assert (=> b!1263129 m!1163639))

(declare-fun m!1163641 () Bool)

(assert (=> b!1263129 m!1163641))

(declare-fun m!1163643 () Bool)

(assert (=> b!1263129 m!1163643))

(assert (=> b!1263129 m!1163639))

(declare-fun m!1163645 () Bool)

(assert (=> b!1263129 m!1163645))

(declare-fun m!1163647 () Bool)

(assert (=> b!1263129 m!1163647))

(assert (=> b!1263129 m!1163641))

(assert (=> b!1263129 m!1163645))

(declare-fun m!1163649 () Bool)

(assert (=> d!138593 m!1163649))

(assert (=> d!138593 m!1163609))

(declare-fun m!1163651 () Bool)

(assert (=> b!1263133 m!1163651))

(assert (=> b!1263126 m!1163641))

(assert (=> b!1263126 m!1163641))

(declare-fun m!1163653 () Bool)

(assert (=> b!1263126 m!1163653))

(assert (=> b!1263132 m!1163641))

(assert (=> b!1263132 m!1163641))

(assert (=> b!1263132 m!1163653))

(declare-fun m!1163655 () Bool)

(assert (=> b!1263123 m!1163655))

(declare-fun m!1163657 () Bool)

(assert (=> b!1263128 m!1163657))

(assert (=> b!1263127 m!1163641))

(assert (=> b!1263127 m!1163641))

(declare-fun m!1163659 () Bool)

(assert (=> b!1263127 m!1163659))

(assert (=> bm!62149 m!1163657))

(declare-fun m!1163661 () Bool)

(assert (=> b!1263124 m!1163661))

(declare-fun m!1163663 () Bool)

(assert (=> b!1263124 m!1163663))

(assert (=> b!1263124 m!1163639))

(assert (=> b!1263124 m!1163661))

(declare-fun m!1163665 () Bool)

(assert (=> b!1263124 m!1163665))

(assert (=> b!1263124 m!1163639))

(assert (=> b!1263124 m!1163645))

(assert (=> b!1263124 m!1163647))

(assert (=> b!1263124 m!1163645))

(assert (=> b!1263124 m!1163641))

(declare-fun m!1163667 () Bool)

(assert (=> b!1263124 m!1163667))

(assert (=> b!1263067 d!138593))

(declare-fun b!1263136 () Bool)

(declare-fun e!719104 () Bool)

(declare-fun e!719106 () Bool)

(assert (=> b!1263136 (= e!719104 e!719106)))

(declare-fun c!122916 () Bool)

(assert (=> b!1263136 (= c!122916 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263137 () Bool)

(declare-fun res!841420 () Bool)

(declare-fun e!719110 () Bool)

(assert (=> b!1263137 (=> (not res!841420) (not e!719110))))

(declare-fun lt!572765 () ListLongMap!18927)

(assert (=> b!1263137 (= res!841420 (not (contains!7599 lt!572765 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263138 () Bool)

(declare-fun lt!572763 () Unit!42105)

(declare-fun lt!572766 () Unit!42105)

(assert (=> b!1263138 (= lt!572763 lt!572766)))

(declare-fun lt!572768 () (_ BitVec 64))

(declare-fun lt!572764 () (_ BitVec 64))

(declare-fun lt!572767 () ListLongMap!18927)

(declare-fun lt!572762 () V!48569)

(assert (=> b!1263138 (not (contains!7599 (+!4252 lt!572767 (tuple2!21055 lt!572764 lt!572762)) lt!572768))))

(assert (=> b!1263138 (= lt!572766 (addStillNotContains!328 lt!572767 lt!572764 lt!572762 lt!572768))))

(assert (=> b!1263138 (= lt!572768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263138 (= lt!572762 (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263138 (= lt!572764 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62153 () ListLongMap!18927)

(assert (=> b!1263138 (= lt!572767 call!62153)))

(declare-fun e!719107 () ListLongMap!18927)

(assert (=> b!1263138 (= e!719107 (+!4252 call!62153 (tuple2!21055 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000) (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263139 () Bool)

(assert (=> b!1263139 (= e!719107 call!62153)))

(declare-fun b!1263140 () Bool)

(declare-fun e!719109 () ListLongMap!18927)

(assert (=> b!1263140 (= e!719109 e!719107)))

(declare-fun c!122919 () Bool)

(assert (=> b!1263140 (= c!122919 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138595 () Bool)

(assert (=> d!138595 e!719110))

(declare-fun res!841419 () Bool)

(assert (=> d!138595 (=> (not res!841419) (not e!719110))))

(assert (=> d!138595 (= res!841419 (not (contains!7599 lt!572765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138595 (= lt!572765 e!719109)))

(declare-fun c!122917 () Bool)

(assert (=> d!138595 (= c!122917 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!138595 (validMask!0 mask!1466)))

(assert (=> d!138595 (= (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572765)))

(declare-fun b!1263141 () Bool)

(declare-fun e!719105 () Bool)

(assert (=> b!1263141 (= e!719104 e!719105)))

(assert (=> b!1263141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun res!841421 () Bool)

(assert (=> b!1263141 (= res!841421 (contains!7599 lt!572765 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263141 (=> (not res!841421) (not e!719105))))

(declare-fun b!1263142 () Bool)

(assert (=> b!1263142 (= e!719106 (= lt!572765 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62150 () Bool)

(assert (=> bm!62150 (= call!62153 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263143 () Bool)

(assert (=> b!1263143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> b!1263143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(assert (=> b!1263143 (= e!719105 (= (apply!1000 lt!572765 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)) (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263144 () Bool)

(assert (=> b!1263144 (= e!719109 (ListLongMap!18928 Nil!28242))))

(declare-fun b!1263145 () Bool)

(assert (=> b!1263145 (= e!719110 e!719104)))

(declare-fun c!122918 () Bool)

(declare-fun e!719108 () Bool)

(assert (=> b!1263145 (= c!122918 e!719108)))

(declare-fun res!841418 () Bool)

(assert (=> b!1263145 (=> (not res!841418) (not e!719108))))

(assert (=> b!1263145 (= res!841418 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263146 () Bool)

(assert (=> b!1263146 (= e!719108 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263146 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263147 () Bool)

(assert (=> b!1263147 (= e!719106 (isEmpty!1042 lt!572765))))

(assert (= (and d!138595 c!122917) b!1263144))

(assert (= (and d!138595 (not c!122917)) b!1263140))

(assert (= (and b!1263140 c!122919) b!1263138))

(assert (= (and b!1263140 (not c!122919)) b!1263139))

(assert (= (or b!1263138 b!1263139) bm!62150))

(assert (= (and d!138595 res!841419) b!1263137))

(assert (= (and b!1263137 res!841420) b!1263145))

(assert (= (and b!1263145 res!841418) b!1263146))

(assert (= (and b!1263145 c!122918) b!1263141))

(assert (= (and b!1263145 (not c!122918)) b!1263136))

(assert (= (and b!1263141 res!841421) b!1263143))

(assert (= (and b!1263136 c!122916) b!1263142))

(assert (= (and b!1263136 (not c!122916)) b!1263147))

(declare-fun b_lambda!22927 () Bool)

(assert (=> (not b_lambda!22927) (not b!1263138)))

(assert (=> b!1263138 t!41761))

(declare-fun b_and!45483 () Bool)

(assert (= b_and!45481 (and (=> t!41761 result!23389) b_and!45483)))

(declare-fun b_lambda!22929 () Bool)

(assert (=> (not b_lambda!22929) (not b!1263143)))

(assert (=> b!1263143 t!41761))

(declare-fun b_and!45485 () Bool)

(assert (= b_and!45483 (and (=> t!41761 result!23389) b_and!45485)))

(assert (=> b!1263143 m!1163639))

(assert (=> b!1263143 m!1163641))

(declare-fun m!1163669 () Bool)

(assert (=> b!1263143 m!1163669))

(assert (=> b!1263143 m!1163639))

(assert (=> b!1263143 m!1163645))

(assert (=> b!1263143 m!1163647))

(assert (=> b!1263143 m!1163641))

(assert (=> b!1263143 m!1163645))

(declare-fun m!1163671 () Bool)

(assert (=> d!138595 m!1163671))

(assert (=> d!138595 m!1163609))

(declare-fun m!1163673 () Bool)

(assert (=> b!1263147 m!1163673))

(assert (=> b!1263140 m!1163641))

(assert (=> b!1263140 m!1163641))

(assert (=> b!1263140 m!1163653))

(assert (=> b!1263146 m!1163641))

(assert (=> b!1263146 m!1163641))

(assert (=> b!1263146 m!1163653))

(declare-fun m!1163675 () Bool)

(assert (=> b!1263137 m!1163675))

(declare-fun m!1163677 () Bool)

(assert (=> b!1263142 m!1163677))

(assert (=> b!1263141 m!1163641))

(assert (=> b!1263141 m!1163641))

(declare-fun m!1163679 () Bool)

(assert (=> b!1263141 m!1163679))

(assert (=> bm!62150 m!1163677))

(declare-fun m!1163681 () Bool)

(assert (=> b!1263138 m!1163681))

(declare-fun m!1163683 () Bool)

(assert (=> b!1263138 m!1163683))

(assert (=> b!1263138 m!1163639))

(assert (=> b!1263138 m!1163681))

(declare-fun m!1163685 () Bool)

(assert (=> b!1263138 m!1163685))

(assert (=> b!1263138 m!1163639))

(assert (=> b!1263138 m!1163645))

(assert (=> b!1263138 m!1163647))

(assert (=> b!1263138 m!1163645))

(assert (=> b!1263138 m!1163641))

(declare-fun m!1163687 () Bool)

(assert (=> b!1263138 m!1163687))

(assert (=> b!1263067 d!138595))

(declare-fun d!138597 () Bool)

(assert (=> d!138597 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106068 d!138597))

(declare-fun d!138599 () Bool)

(assert (=> d!138599 (= (array_inv!30261 _keys!1118) (bvsge (size!40296 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106068 d!138599))

(declare-fun d!138601 () Bool)

(assert (=> d!138601 (= (array_inv!30262 _values!914) (bvsge (size!40297 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106068 d!138601))

(declare-fun d!138603 () Bool)

(declare-fun e!719115 () Bool)

(assert (=> d!138603 e!719115))

(declare-fun res!841424 () Bool)

(assert (=> d!138603 (=> res!841424 e!719115)))

(declare-fun lt!572777 () Bool)

(assert (=> d!138603 (= res!841424 (not lt!572777))))

(declare-fun lt!572779 () Bool)

(assert (=> d!138603 (= lt!572777 lt!572779)))

(declare-fun lt!572778 () Unit!42105)

(declare-fun e!719116 () Unit!42105)

(assert (=> d!138603 (= lt!572778 e!719116)))

(declare-fun c!122922 () Bool)

(assert (=> d!138603 (= c!122922 lt!572779)))

(declare-fun containsKey!625 (List!28245 (_ BitVec 64)) Bool)

(assert (=> d!138603 (= lt!572779 (containsKey!625 (toList!9479 (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138603 (= (contains!7599 (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000) lt!572777)))

(declare-fun b!1263154 () Bool)

(declare-fun lt!572780 () Unit!42105)

(assert (=> b!1263154 (= e!719116 lt!572780)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!434 (List!28245 (_ BitVec 64)) Unit!42105)

(assert (=> b!1263154 (= lt!572780 (lemmaContainsKeyImpliesGetValueByKeyDefined!434 (toList!9479 (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!716 0))(
  ( (Some!715 (v!18975 V!48569)) (None!714) )
))
(declare-fun isDefined!473 (Option!716) Bool)

(declare-fun getValueByKey!665 (List!28245 (_ BitVec 64)) Option!716)

(assert (=> b!1263154 (isDefined!473 (getValueByKey!665 (toList!9479 (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263155 () Bool)

(declare-fun Unit!42107 () Unit!42105)

(assert (=> b!1263155 (= e!719116 Unit!42107)))

(declare-fun b!1263156 () Bool)

(assert (=> b!1263156 (= e!719115 (isDefined!473 (getValueByKey!665 (toList!9479 (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138603 c!122922) b!1263154))

(assert (= (and d!138603 (not c!122922)) b!1263155))

(assert (= (and d!138603 (not res!841424)) b!1263156))

(declare-fun m!1163689 () Bool)

(assert (=> d!138603 m!1163689))

(declare-fun m!1163691 () Bool)

(assert (=> b!1263154 m!1163691))

(declare-fun m!1163693 () Bool)

(assert (=> b!1263154 m!1163693))

(assert (=> b!1263154 m!1163693))

(declare-fun m!1163695 () Bool)

(assert (=> b!1263154 m!1163695))

(assert (=> b!1263156 m!1163693))

(assert (=> b!1263156 m!1163693))

(assert (=> b!1263156 m!1163695))

(assert (=> b!1263068 d!138603))

(declare-fun b!1263199 () Bool)

(declare-fun e!719150 () Bool)

(declare-fun lt!572827 () ListLongMap!18927)

(assert (=> b!1263199 (= e!719150 (= (apply!1000 lt!572827 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263200 () Bool)

(declare-fun c!122939 () Bool)

(assert (=> b!1263200 (= c!122939 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719145 () ListLongMap!18927)

(declare-fun e!719155 () ListLongMap!18927)

(assert (=> b!1263200 (= e!719145 e!719155)))

(declare-fun b!1263201 () Bool)

(declare-fun e!719149 () ListLongMap!18927)

(assert (=> b!1263201 (= e!719149 e!719145)))

(declare-fun c!122935 () Bool)

(assert (=> b!1263201 (= c!122935 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263203 () Bool)

(declare-fun e!719148 () Unit!42105)

(declare-fun lt!572846 () Unit!42105)

(assert (=> b!1263203 (= e!719148 lt!572846)))

(declare-fun lt!572841 () ListLongMap!18927)

(assert (=> b!1263203 (= lt!572841 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572837 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572834 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572834 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572831 () Unit!42105)

(declare-fun addStillContains!1090 (ListLongMap!18927 (_ BitVec 64) V!48569 (_ BitVec 64)) Unit!42105)

(assert (=> b!1263203 (= lt!572831 (addStillContains!1090 lt!572841 lt!572837 zeroValue!871 lt!572834))))

(assert (=> b!1263203 (contains!7599 (+!4252 lt!572841 (tuple2!21055 lt!572837 zeroValue!871)) lt!572834)))

(declare-fun lt!572825 () Unit!42105)

(assert (=> b!1263203 (= lt!572825 lt!572831)))

(declare-fun lt!572830 () ListLongMap!18927)

(assert (=> b!1263203 (= lt!572830 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572842 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572839 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572839 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572845 () Unit!42105)

(declare-fun addApplyDifferent!544 (ListLongMap!18927 (_ BitVec 64) V!48569 (_ BitVec 64)) Unit!42105)

(assert (=> b!1263203 (= lt!572845 (addApplyDifferent!544 lt!572830 lt!572842 minValueBefore!43 lt!572839))))

(assert (=> b!1263203 (= (apply!1000 (+!4252 lt!572830 (tuple2!21055 lt!572842 minValueBefore!43)) lt!572839) (apply!1000 lt!572830 lt!572839))))

(declare-fun lt!572829 () Unit!42105)

(assert (=> b!1263203 (= lt!572829 lt!572845)))

(declare-fun lt!572844 () ListLongMap!18927)

(assert (=> b!1263203 (= lt!572844 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572838 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572836 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572836 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572828 () Unit!42105)

(assert (=> b!1263203 (= lt!572828 (addApplyDifferent!544 lt!572844 lt!572838 zeroValue!871 lt!572836))))

(assert (=> b!1263203 (= (apply!1000 (+!4252 lt!572844 (tuple2!21055 lt!572838 zeroValue!871)) lt!572836) (apply!1000 lt!572844 lt!572836))))

(declare-fun lt!572833 () Unit!42105)

(assert (=> b!1263203 (= lt!572833 lt!572828)))

(declare-fun lt!572832 () ListLongMap!18927)

(assert (=> b!1263203 (= lt!572832 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572840 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572840 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572826 () (_ BitVec 64))

(assert (=> b!1263203 (= lt!572826 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263203 (= lt!572846 (addApplyDifferent!544 lt!572832 lt!572840 minValueBefore!43 lt!572826))))

(assert (=> b!1263203 (= (apply!1000 (+!4252 lt!572832 (tuple2!21055 lt!572840 minValueBefore!43)) lt!572826) (apply!1000 lt!572832 lt!572826))))

(declare-fun b!1263204 () Bool)

(declare-fun e!719144 () Bool)

(declare-fun call!62168 () Bool)

(assert (=> b!1263204 (= e!719144 (not call!62168))))

(declare-fun b!1263205 () Bool)

(declare-fun res!841449 () Bool)

(declare-fun e!719153 () Bool)

(assert (=> b!1263205 (=> (not res!841449) (not e!719153))))

(declare-fun e!719151 () Bool)

(assert (=> b!1263205 (= res!841449 e!719151)))

(declare-fun c!122938 () Bool)

(assert (=> b!1263205 (= c!122938 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!122940 () Bool)

(declare-fun call!62171 () ListLongMap!18927)

(declare-fun call!62173 () ListLongMap!18927)

(declare-fun bm!62165 () Bool)

(declare-fun call!62174 () ListLongMap!18927)

(declare-fun call!62170 () ListLongMap!18927)

(assert (=> bm!62165 (= call!62170 (+!4252 (ite c!122940 call!62171 (ite c!122935 call!62173 call!62174)) (ite (or c!122940 c!122935) (tuple2!21055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21055 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62166 () Bool)

(assert (=> bm!62166 (= call!62168 (contains!7599 lt!572827 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263206 () Bool)

(declare-fun Unit!42108 () Unit!42105)

(assert (=> b!1263206 (= e!719148 Unit!42108)))

(declare-fun b!1263207 () Bool)

(declare-fun call!62169 () ListLongMap!18927)

(assert (=> b!1263207 (= e!719155 call!62169)))

(declare-fun bm!62167 () Bool)

(assert (=> bm!62167 (= call!62173 call!62171)))

(declare-fun bm!62168 () Bool)

(assert (=> bm!62168 (= call!62169 call!62170)))

(declare-fun b!1263208 () Bool)

(assert (=> b!1263208 (= e!719155 call!62174)))

(declare-fun b!1263209 () Bool)

(declare-fun e!719154 () Bool)

(assert (=> b!1263209 (= e!719151 e!719154)))

(declare-fun res!841448 () Bool)

(declare-fun call!62172 () Bool)

(assert (=> b!1263209 (= res!841448 call!62172)))

(assert (=> b!1263209 (=> (not res!841448) (not e!719154))))

(declare-fun bm!62169 () Bool)

(assert (=> bm!62169 (= call!62174 call!62173)))

(declare-fun b!1263210 () Bool)

(declare-fun res!841447 () Bool)

(assert (=> b!1263210 (=> (not res!841447) (not e!719153))))

(declare-fun e!719147 () Bool)

(assert (=> b!1263210 (= res!841447 e!719147)))

(declare-fun res!841443 () Bool)

(assert (=> b!1263210 (=> res!841443 e!719147)))

(declare-fun e!719152 () Bool)

(assert (=> b!1263210 (= res!841443 (not e!719152))))

(declare-fun res!841446 () Bool)

(assert (=> b!1263210 (=> (not res!841446) (not e!719152))))

(assert (=> b!1263210 (= res!841446 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263211 () Bool)

(assert (=> b!1263211 (= e!719149 (+!4252 call!62170 (tuple2!21055 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62170 () Bool)

(assert (=> bm!62170 (= call!62171 (getCurrentListMapNoExtraKeys!5843 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun d!138605 () Bool)

(assert (=> d!138605 e!719153))

(declare-fun res!841450 () Bool)

(assert (=> d!138605 (=> (not res!841450) (not e!719153))))

(assert (=> d!138605 (= res!841450 (or (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))))

(declare-fun lt!572835 () ListLongMap!18927)

(assert (=> d!138605 (= lt!572827 lt!572835)))

(declare-fun lt!572843 () Unit!42105)

(assert (=> d!138605 (= lt!572843 e!719148)))

(declare-fun c!122937 () Bool)

(declare-fun e!719143 () Bool)

(assert (=> d!138605 (= c!122937 e!719143)))

(declare-fun res!841451 () Bool)

(assert (=> d!138605 (=> (not res!841451) (not e!719143))))

(assert (=> d!138605 (= res!841451 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!138605 (= lt!572835 e!719149)))

(assert (=> d!138605 (= c!122940 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138605 (validMask!0 mask!1466)))

(assert (=> d!138605 (= (getCurrentListMap!4646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572827)))

(declare-fun b!1263202 () Bool)

(assert (=> b!1263202 (= e!719154 (= (apply!1000 lt!572827 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263212 () Bool)

(assert (=> b!1263212 (= e!719144 e!719150)))

(declare-fun res!841444 () Bool)

(assert (=> b!1263212 (= res!841444 call!62168)))

(assert (=> b!1263212 (=> (not res!841444) (not e!719150))))

(declare-fun b!1263213 () Bool)

(declare-fun e!719146 () Bool)

(assert (=> b!1263213 (= e!719146 (= (apply!1000 lt!572827 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)) (get!20285 (select (arr!39761 _values!914) #b00000000000000000000000000000000) (dynLambda!3398 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(assert (=> b!1263213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263214 () Bool)

(assert (=> b!1263214 (= e!719145 call!62169)))

(declare-fun b!1263215 () Bool)

(assert (=> b!1263215 (= e!719151 (not call!62172))))

(declare-fun bm!62171 () Bool)

(assert (=> bm!62171 (= call!62172 (contains!7599 lt!572827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263216 () Bool)

(assert (=> b!1263216 (= e!719152 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263217 () Bool)

(assert (=> b!1263217 (= e!719153 e!719144)))

(declare-fun c!122936 () Bool)

(assert (=> b!1263217 (= c!122936 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263218 () Bool)

(assert (=> b!1263218 (= e!719147 e!719146)))

(declare-fun res!841445 () Bool)

(assert (=> b!1263218 (=> (not res!841445) (not e!719146))))

(assert (=> b!1263218 (= res!841445 (contains!7599 lt!572827 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1263219 () Bool)

(assert (=> b!1263219 (= e!719143 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138605 c!122940) b!1263211))

(assert (= (and d!138605 (not c!122940)) b!1263201))

(assert (= (and b!1263201 c!122935) b!1263214))

(assert (= (and b!1263201 (not c!122935)) b!1263200))

(assert (= (and b!1263200 c!122939) b!1263207))

(assert (= (and b!1263200 (not c!122939)) b!1263208))

(assert (= (or b!1263207 b!1263208) bm!62169))

(assert (= (or b!1263214 bm!62169) bm!62167))

(assert (= (or b!1263214 b!1263207) bm!62168))

(assert (= (or b!1263211 bm!62167) bm!62170))

(assert (= (or b!1263211 bm!62168) bm!62165))

(assert (= (and d!138605 res!841451) b!1263219))

(assert (= (and d!138605 c!122937) b!1263203))

(assert (= (and d!138605 (not c!122937)) b!1263206))

(assert (= (and d!138605 res!841450) b!1263210))

(assert (= (and b!1263210 res!841446) b!1263216))

(assert (= (and b!1263210 (not res!841443)) b!1263218))

(assert (= (and b!1263218 res!841445) b!1263213))

(assert (= (and b!1263210 res!841447) b!1263205))

(assert (= (and b!1263205 c!122938) b!1263209))

(assert (= (and b!1263205 (not c!122938)) b!1263215))

(assert (= (and b!1263209 res!841448) b!1263202))

(assert (= (or b!1263209 b!1263215) bm!62171))

(assert (= (and b!1263205 res!841449) b!1263217))

(assert (= (and b!1263217 c!122936) b!1263212))

(assert (= (and b!1263217 (not c!122936)) b!1263204))

(assert (= (and b!1263212 res!841444) b!1263199))

(assert (= (or b!1263212 b!1263204) bm!62166))

(declare-fun b_lambda!22931 () Bool)

(assert (=> (not b_lambda!22931) (not b!1263213)))

(assert (=> b!1263213 t!41761))

(declare-fun b_and!45487 () Bool)

(assert (= b_and!45485 (and (=> t!41761 result!23389) b_and!45487)))

(declare-fun m!1163697 () Bool)

(assert (=> b!1263211 m!1163697))

(assert (=> b!1263218 m!1163641))

(assert (=> b!1263218 m!1163641))

(declare-fun m!1163699 () Bool)

(assert (=> b!1263218 m!1163699))

(declare-fun m!1163701 () Bool)

(assert (=> bm!62166 m!1163701))

(declare-fun m!1163703 () Bool)

(assert (=> bm!62171 m!1163703))

(assert (=> b!1263216 m!1163641))

(assert (=> b!1263216 m!1163641))

(assert (=> b!1263216 m!1163653))

(declare-fun m!1163705 () Bool)

(assert (=> bm!62165 m!1163705))

(declare-fun m!1163707 () Bool)

(assert (=> b!1263202 m!1163707))

(assert (=> d!138605 m!1163609))

(declare-fun m!1163709 () Bool)

(assert (=> b!1263203 m!1163709))

(declare-fun m!1163711 () Bool)

(assert (=> b!1263203 m!1163711))

(declare-fun m!1163713 () Bool)

(assert (=> b!1263203 m!1163713))

(declare-fun m!1163715 () Bool)

(assert (=> b!1263203 m!1163715))

(declare-fun m!1163717 () Bool)

(assert (=> b!1263203 m!1163717))

(declare-fun m!1163719 () Bool)

(assert (=> b!1263203 m!1163719))

(declare-fun m!1163721 () Bool)

(assert (=> b!1263203 m!1163721))

(assert (=> b!1263203 m!1163711))

(declare-fun m!1163723 () Bool)

(assert (=> b!1263203 m!1163723))

(assert (=> b!1263203 m!1163715))

(declare-fun m!1163725 () Bool)

(assert (=> b!1263203 m!1163725))

(assert (=> b!1263203 m!1163641))

(assert (=> b!1263203 m!1163725))

(declare-fun m!1163727 () Bool)

(assert (=> b!1263203 m!1163727))

(declare-fun m!1163729 () Bool)

(assert (=> b!1263203 m!1163729))

(declare-fun m!1163731 () Bool)

(assert (=> b!1263203 m!1163731))

(declare-fun m!1163733 () Bool)

(assert (=> b!1263203 m!1163733))

(declare-fun m!1163735 () Bool)

(assert (=> b!1263203 m!1163735))

(assert (=> b!1263203 m!1163607))

(assert (=> b!1263203 m!1163733))

(declare-fun m!1163737 () Bool)

(assert (=> b!1263203 m!1163737))

(declare-fun m!1163739 () Bool)

(assert (=> b!1263199 m!1163739))

(assert (=> bm!62170 m!1163607))

(assert (=> b!1263219 m!1163641))

(assert (=> b!1263219 m!1163641))

(assert (=> b!1263219 m!1163653))

(assert (=> b!1263213 m!1163639))

(assert (=> b!1263213 m!1163641))

(assert (=> b!1263213 m!1163645))

(assert (=> b!1263213 m!1163641))

(declare-fun m!1163741 () Bool)

(assert (=> b!1263213 m!1163741))

(assert (=> b!1263213 m!1163639))

(assert (=> b!1263213 m!1163645))

(assert (=> b!1263213 m!1163647))

(assert (=> b!1263068 d!138605))

(declare-fun b!1263228 () Bool)

(declare-fun e!719162 () Bool)

(declare-fun e!719164 () Bool)

(assert (=> b!1263228 (= e!719162 e!719164)))

(declare-fun c!122943 () Bool)

(assert (=> b!1263228 (= c!122943 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138607 () Bool)

(declare-fun res!841456 () Bool)

(assert (=> d!138607 (=> res!841456 e!719162)))

(assert (=> d!138607 (= res!841456 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!138607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719162)))

(declare-fun b!1263229 () Bool)

(declare-fun e!719163 () Bool)

(declare-fun call!62177 () Bool)

(assert (=> b!1263229 (= e!719163 call!62177)))

(declare-fun b!1263230 () Bool)

(assert (=> b!1263230 (= e!719164 e!719163)))

(declare-fun lt!572853 () (_ BitVec 64))

(assert (=> b!1263230 (= lt!572853 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572855 () Unit!42105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82426 (_ BitVec 64) (_ BitVec 32)) Unit!42105)

(assert (=> b!1263230 (= lt!572855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572853 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263230 (arrayContainsKey!0 _keys!1118 lt!572853 #b00000000000000000000000000000000)))

(declare-fun lt!572854 () Unit!42105)

(assert (=> b!1263230 (= lt!572854 lt!572855)))

(declare-fun res!841457 () Bool)

(declare-datatypes ((SeekEntryResult!9978 0))(
  ( (MissingZero!9978 (index!42283 (_ BitVec 32))) (Found!9978 (index!42284 (_ BitVec 32))) (Intermediate!9978 (undefined!10790 Bool) (index!42285 (_ BitVec 32)) (x!111305 (_ BitVec 32))) (Undefined!9978) (MissingVacant!9978 (index!42286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82426 (_ BitVec 32)) SeekEntryResult!9978)

(assert (=> b!1263230 (= res!841457 (= (seekEntryOrOpen!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9978 #b00000000000000000000000000000000)))))

(assert (=> b!1263230 (=> (not res!841457) (not e!719163))))

(declare-fun bm!62174 () Bool)

(assert (=> bm!62174 (= call!62177 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263231 () Bool)

(assert (=> b!1263231 (= e!719164 call!62177)))

(assert (= (and d!138607 (not res!841456)) b!1263228))

(assert (= (and b!1263228 c!122943) b!1263230))

(assert (= (and b!1263228 (not c!122943)) b!1263231))

(assert (= (and b!1263230 res!841457) b!1263229))

(assert (= (or b!1263229 b!1263231) bm!62174))

(assert (=> b!1263228 m!1163641))

(assert (=> b!1263228 m!1163641))

(assert (=> b!1263228 m!1163653))

(assert (=> b!1263230 m!1163641))

(declare-fun m!1163743 () Bool)

(assert (=> b!1263230 m!1163743))

(declare-fun m!1163745 () Bool)

(assert (=> b!1263230 m!1163745))

(assert (=> b!1263230 m!1163641))

(declare-fun m!1163747 () Bool)

(assert (=> b!1263230 m!1163747))

(declare-fun m!1163749 () Bool)

(assert (=> bm!62174 m!1163749))

(assert (=> b!1263069 d!138607))

(declare-fun d!138609 () Bool)

(declare-fun res!841465 () Bool)

(declare-fun e!719173 () Bool)

(assert (=> d!138609 (=> res!841465 e!719173)))

(assert (=> d!138609 (= res!841465 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!138609 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28243) e!719173)))

(declare-fun b!1263242 () Bool)

(declare-fun e!719176 () Bool)

(assert (=> b!1263242 (= e!719173 e!719176)))

(declare-fun res!841464 () Bool)

(assert (=> b!1263242 (=> (not res!841464) (not e!719176))))

(declare-fun e!719174 () Bool)

(assert (=> b!1263242 (= res!841464 (not e!719174))))

(declare-fun res!841466 () Bool)

(assert (=> b!1263242 (=> (not res!841466) (not e!719174))))

(assert (=> b!1263242 (= res!841466 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263243 () Bool)

(declare-fun e!719175 () Bool)

(declare-fun call!62180 () Bool)

(assert (=> b!1263243 (= e!719175 call!62180)))

(declare-fun b!1263244 () Bool)

(assert (=> b!1263244 (= e!719175 call!62180)))

(declare-fun b!1263245 () Bool)

(declare-fun contains!7601 (List!28246 (_ BitVec 64)) Bool)

(assert (=> b!1263245 (= e!719174 (contains!7601 Nil!28243 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62177 () Bool)

(declare-fun c!122946 () Bool)

(assert (=> bm!62177 (= call!62180 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122946 (Cons!28242 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000) Nil!28243) Nil!28243)))))

(declare-fun b!1263246 () Bool)

(assert (=> b!1263246 (= e!719176 e!719175)))

(assert (=> b!1263246 (= c!122946 (validKeyInArray!0 (select (arr!39760 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138609 (not res!841465)) b!1263242))

(assert (= (and b!1263242 res!841466) b!1263245))

(assert (= (and b!1263242 res!841464) b!1263246))

(assert (= (and b!1263246 c!122946) b!1263243))

(assert (= (and b!1263246 (not c!122946)) b!1263244))

(assert (= (or b!1263243 b!1263244) bm!62177))

(assert (=> b!1263242 m!1163641))

(assert (=> b!1263242 m!1163641))

(assert (=> b!1263242 m!1163653))

(assert (=> b!1263245 m!1163641))

(assert (=> b!1263245 m!1163641))

(declare-fun m!1163751 () Bool)

(assert (=> b!1263245 m!1163751))

(assert (=> bm!62177 m!1163641))

(declare-fun m!1163753 () Bool)

(assert (=> bm!62177 m!1163753))

(assert (=> b!1263246 m!1163641))

(assert (=> b!1263246 m!1163641))

(assert (=> b!1263246 m!1163653))

(assert (=> b!1263073 d!138609))

(declare-fun b!1263254 () Bool)

(declare-fun e!719182 () Bool)

(assert (=> b!1263254 (= e!719182 tp_is_empty!32403)))

(declare-fun b!1263253 () Bool)

(declare-fun e!719181 () Bool)

(assert (=> b!1263253 (= e!719181 tp_is_empty!32403)))

(declare-fun mapNonEmpty!50431 () Bool)

(declare-fun mapRes!50431 () Bool)

(declare-fun tp!96062 () Bool)

(assert (=> mapNonEmpty!50431 (= mapRes!50431 (and tp!96062 e!719181))))

(declare-fun mapRest!50431 () (Array (_ BitVec 32) ValueCell!15438))

(declare-fun mapValue!50431 () ValueCell!15438)

(declare-fun mapKey!50431 () (_ BitVec 32))

(assert (=> mapNonEmpty!50431 (= mapRest!50425 (store mapRest!50431 mapKey!50431 mapValue!50431))))

(declare-fun condMapEmpty!50431 () Bool)

(declare-fun mapDefault!50431 () ValueCell!15438)

(assert (=> mapNonEmpty!50425 (= condMapEmpty!50431 (= mapRest!50425 ((as const (Array (_ BitVec 32) ValueCell!15438)) mapDefault!50431)))))

(assert (=> mapNonEmpty!50425 (= tp!96052 (and e!719182 mapRes!50431))))

(declare-fun mapIsEmpty!50431 () Bool)

(assert (=> mapIsEmpty!50431 mapRes!50431))

(assert (= (and mapNonEmpty!50425 condMapEmpty!50431) mapIsEmpty!50431))

(assert (= (and mapNonEmpty!50425 (not condMapEmpty!50431)) mapNonEmpty!50431))

(assert (= (and mapNonEmpty!50431 ((_ is ValueCellFull!15438) mapValue!50431)) b!1263253))

(assert (= (and mapNonEmpty!50425 ((_ is ValueCellFull!15438) mapDefault!50431)) b!1263254))

(declare-fun m!1163755 () Bool)

(assert (=> mapNonEmpty!50431 m!1163755))

(declare-fun b_lambda!22933 () Bool)

(assert (= b_lambda!22931 (or (and start!106068 b_free!27501) b_lambda!22933)))

(declare-fun b_lambda!22935 () Bool)

(assert (= b_lambda!22927 (or (and start!106068 b_free!27501) b_lambda!22935)))

(declare-fun b_lambda!22937 () Bool)

(assert (= b_lambda!22923 (or (and start!106068 b_free!27501) b_lambda!22937)))

(declare-fun b_lambda!22939 () Bool)

(assert (= b_lambda!22929 (or (and start!106068 b_free!27501) b_lambda!22939)))

(declare-fun b_lambda!22941 () Bool)

(assert (= b_lambda!22925 (or (and start!106068 b_free!27501) b_lambda!22941)))

(check-sat (not d!138605) (not b_lambda!22939) (not b!1263156) (not b!1263138) (not d!138593) (not b!1263126) (not mapNonEmpty!50431) (not b_lambda!22937) (not bm!62150) (not b!1263141) (not b!1263154) (not b!1263123) (not b!1263143) (not b_next!27501) (not bm!62166) (not b!1263147) (not b!1263203) (not b_lambda!22933) (not d!138603) (not b!1263142) (not bm!62165) (not b!1263211) (not bm!62149) (not b!1263219) (not b!1263218) (not b!1263230) (not bm!62174) (not b!1263228) (not d!138595) (not b!1263140) (not b!1263199) (not b!1263132) b_and!45487 (not b!1263124) (not b!1263246) (not bm!62171) (not b!1263133) (not b!1263202) (not b_lambda!22935) (not bm!62170) (not d!138591) (not b_lambda!22941) (not bm!62177) (not b!1263146) (not b!1263129) (not b!1263127) (not b!1263245) (not b!1263128) (not b!1263213) (not b!1263242) (not b!1263216) (not b!1263137) tp_is_empty!32403)
(check-sat b_and!45487 (not b_next!27501))
