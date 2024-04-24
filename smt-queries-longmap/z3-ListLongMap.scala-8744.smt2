; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106290 () Bool)

(assert start!106290)

(declare-fun b_free!27499 () Bool)

(declare-fun b_next!27499 () Bool)

(assert (=> start!106290 (= b_free!27499 (not b_next!27499))))

(declare-fun tp!96046 () Bool)

(declare-fun b_and!45475 () Bool)

(assert (=> start!106290 (= tp!96046 b_and!45475)))

(declare-fun b!1264347 () Bool)

(declare-fun e!719889 () Bool)

(declare-fun e!719892 () Bool)

(assert (=> b!1264347 (= e!719889 (not e!719892))))

(declare-fun res!841894 () Bool)

(assert (=> b!1264347 (=> res!841894 e!719892)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264347 (= res!841894 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48567 0))(
  ( (V!48568 (val!16263 Int)) )
))
(declare-datatypes ((tuple2!21060 0))(
  ( (tuple2!21061 (_1!10541 (_ BitVec 64)) (_2!10541 V!48567)) )
))
(declare-datatypes ((List!28284 0))(
  ( (Nil!28281) (Cons!28280 (h!29498 tuple2!21060) (t!41787 List!28284)) )
))
(declare-datatypes ((ListLongMap!18941 0))(
  ( (ListLongMap!18942 (toList!9486 List!28284)) )
))
(declare-fun lt!573203 () ListLongMap!18941)

(declare-fun lt!573202 () ListLongMap!18941)

(assert (=> b!1264347 (= lt!573203 lt!573202)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48567)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48567)

(declare-datatypes ((array!82467 0))(
  ( (array!82468 (arr!39776 (Array (_ BitVec 32) (_ BitVec 64))) (size!40313 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82467)

(declare-datatypes ((ValueCell!15437 0))(
  ( (ValueCellFull!15437 (v!18968 V!48567)) (EmptyCell!15437) )
))
(declare-datatypes ((array!82469 0))(
  ( (array!82470 (arr!39777 (Array (_ BitVec 32) ValueCell!15437)) (size!40314 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82469)

(declare-fun minValueBefore!43 () V!48567)

(declare-datatypes ((Unit!42074 0))(
  ( (Unit!42075) )
))
(declare-fun lt!573201 () Unit!42074)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1180 (array!82467 array!82469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 V!48567 V!48567 (_ BitVec 32) Int) Unit!42074)

(assert (=> b!1264347 (= lt!573201 (lemmaNoChangeToArrayThenSameMapNoExtras!1180 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5890 (array!82467 array!82469 (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 (_ BitVec 32) Int) ListLongMap!18941)

(assert (=> b!1264347 (= lt!573202 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264347 (= lt!573203 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264348 () Bool)

(declare-fun res!841893 () Bool)

(assert (=> b!1264348 (=> (not res!841893) (not e!719889))))

(assert (=> b!1264348 (= res!841893 (and (= (size!40314 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40313 _keys!1118) (size!40314 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264349 () Bool)

(declare-fun e!719893 () Bool)

(declare-fun tp_is_empty!32401 () Bool)

(assert (=> b!1264349 (= e!719893 tp_is_empty!32401)))

(declare-fun b!1264350 () Bool)

(declare-fun contains!7625 (ListLongMap!18941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4639 (array!82467 array!82469 (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 (_ BitVec 32) Int) ListLongMap!18941)

(assert (=> b!1264350 (= e!719892 (not (contains!7625 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264351 () Bool)

(declare-fun res!841895 () Bool)

(assert (=> b!1264351 (=> (not res!841895) (not e!719889))))

(declare-datatypes ((List!28285 0))(
  ( (Nil!28282) (Cons!28281 (h!29499 (_ BitVec 64)) (t!41788 List!28285)) )
))
(declare-fun arrayNoDuplicates!0 (array!82467 (_ BitVec 32) List!28285) Bool)

(assert (=> b!1264351 (= res!841895 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28282))))

(declare-fun b!1264352 () Bool)

(declare-fun e!719890 () Bool)

(assert (=> b!1264352 (= e!719890 tp_is_empty!32401)))

(declare-fun mapNonEmpty!50422 () Bool)

(declare-fun mapRes!50422 () Bool)

(declare-fun tp!96047 () Bool)

(assert (=> mapNonEmpty!50422 (= mapRes!50422 (and tp!96047 e!719890))))

(declare-fun mapValue!50422 () ValueCell!15437)

(declare-fun mapKey!50422 () (_ BitVec 32))

(declare-fun mapRest!50422 () (Array (_ BitVec 32) ValueCell!15437))

(assert (=> mapNonEmpty!50422 (= (arr!39777 _values!914) (store mapRest!50422 mapKey!50422 mapValue!50422))))

(declare-fun b!1264353 () Bool)

(declare-fun e!719891 () Bool)

(assert (=> b!1264353 (= e!719891 (and e!719893 mapRes!50422))))

(declare-fun condMapEmpty!50422 () Bool)

(declare-fun mapDefault!50422 () ValueCell!15437)

(assert (=> b!1264353 (= condMapEmpty!50422 (= (arr!39777 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15437)) mapDefault!50422)))))

(declare-fun b!1264354 () Bool)

(declare-fun res!841891 () Bool)

(assert (=> b!1264354 (=> (not res!841891) (not e!719889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82467 (_ BitVec 32)) Bool)

(assert (=> b!1264354 (= res!841891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50422 () Bool)

(assert (=> mapIsEmpty!50422 mapRes!50422))

(declare-fun res!841892 () Bool)

(assert (=> start!106290 (=> (not res!841892) (not e!719889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106290 (= res!841892 (validMask!0 mask!1466))))

(assert (=> start!106290 e!719889))

(assert (=> start!106290 true))

(assert (=> start!106290 tp!96046))

(assert (=> start!106290 tp_is_empty!32401))

(declare-fun array_inv!30435 (array!82467) Bool)

(assert (=> start!106290 (array_inv!30435 _keys!1118)))

(declare-fun array_inv!30436 (array!82469) Bool)

(assert (=> start!106290 (and (array_inv!30436 _values!914) e!719891)))

(assert (= (and start!106290 res!841892) b!1264348))

(assert (= (and b!1264348 res!841893) b!1264354))

(assert (= (and b!1264354 res!841891) b!1264351))

(assert (= (and b!1264351 res!841895) b!1264347))

(assert (= (and b!1264347 (not res!841894)) b!1264350))

(assert (= (and b!1264353 condMapEmpty!50422) mapIsEmpty!50422))

(assert (= (and b!1264353 (not condMapEmpty!50422)) mapNonEmpty!50422))

(get-info :version)

(assert (= (and mapNonEmpty!50422 ((_ is ValueCellFull!15437) mapValue!50422)) b!1264352))

(assert (= (and b!1264353 ((_ is ValueCellFull!15437) mapDefault!50422)) b!1264349))

(assert (= start!106290 b!1264353))

(declare-fun m!1165183 () Bool)

(assert (=> mapNonEmpty!50422 m!1165183))

(declare-fun m!1165185 () Bool)

(assert (=> b!1264350 m!1165185))

(assert (=> b!1264350 m!1165185))

(declare-fun m!1165187 () Bool)

(assert (=> b!1264350 m!1165187))

(declare-fun m!1165189 () Bool)

(assert (=> b!1264354 m!1165189))

(declare-fun m!1165191 () Bool)

(assert (=> b!1264351 m!1165191))

(declare-fun m!1165193 () Bool)

(assert (=> start!106290 m!1165193))

(declare-fun m!1165195 () Bool)

(assert (=> start!106290 m!1165195))

(declare-fun m!1165197 () Bool)

(assert (=> start!106290 m!1165197))

(declare-fun m!1165199 () Bool)

(assert (=> b!1264347 m!1165199))

(declare-fun m!1165201 () Bool)

(assert (=> b!1264347 m!1165201))

(declare-fun m!1165203 () Bool)

(assert (=> b!1264347 m!1165203))

(check-sat b_and!45475 (not start!106290) (not b!1264350) (not b!1264354) tp_is_empty!32401 (not mapNonEmpty!50422) (not b!1264351) (not b!1264347) (not b_next!27499))
(check-sat b_and!45475 (not b_next!27499))
(get-model)

(declare-fun d!139039 () Bool)

(assert (=> d!139039 (= (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573224 () Unit!42074)

(declare-fun choose!1878 (array!82467 array!82469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 V!48567 V!48567 (_ BitVec 32) Int) Unit!42074)

(assert (=> d!139039 (= lt!573224 (choose!1878 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!139039 (validMask!0 mask!1466)))

(assert (=> d!139039 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1180 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573224)))

(declare-fun bs!35756 () Bool)

(assert (= bs!35756 d!139039))

(assert (=> bs!35756 m!1165203))

(assert (=> bs!35756 m!1165201))

(declare-fun m!1165249 () Bool)

(assert (=> bs!35756 m!1165249))

(assert (=> bs!35756 m!1165193))

(assert (=> b!1264347 d!139039))

(declare-fun b!1264427 () Bool)

(declare-fun e!719950 () ListLongMap!18941)

(declare-fun call!62217 () ListLongMap!18941)

(assert (=> b!1264427 (= e!719950 call!62217)))

(declare-fun b!1264428 () Bool)

(declare-fun e!719947 () Bool)

(declare-fun e!719946 () Bool)

(assert (=> b!1264428 (= e!719947 e!719946)))

(declare-fun c!123313 () Bool)

(declare-fun e!719949 () Bool)

(assert (=> b!1264428 (= c!123313 e!719949)))

(declare-fun res!841935 () Bool)

(assert (=> b!1264428 (=> (not res!841935) (not e!719949))))

(assert (=> b!1264428 (= res!841935 (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun bm!62214 () Bool)

(assert (=> bm!62214 (= call!62217 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264429 () Bool)

(declare-fun e!719945 () ListLongMap!18941)

(assert (=> b!1264429 (= e!719945 (ListLongMap!18942 Nil!28281))))

(declare-fun b!1264430 () Bool)

(declare-fun lt!573245 () Unit!42074)

(declare-fun lt!573242 () Unit!42074)

(assert (=> b!1264430 (= lt!573245 lt!573242)))

(declare-fun lt!573243 () (_ BitVec 64))

(declare-fun lt!573241 () ListLongMap!18941)

(declare-fun lt!573240 () V!48567)

(declare-fun lt!573239 () (_ BitVec 64))

(declare-fun +!4298 (ListLongMap!18941 tuple2!21060) ListLongMap!18941)

(assert (=> b!1264430 (not (contains!7625 (+!4298 lt!573241 (tuple2!21061 lt!573239 lt!573240)) lt!573243))))

(declare-fun addStillNotContains!330 (ListLongMap!18941 (_ BitVec 64) V!48567 (_ BitVec 64)) Unit!42074)

(assert (=> b!1264430 (= lt!573242 (addStillNotContains!330 lt!573241 lt!573239 lt!573240 lt!573243))))

(assert (=> b!1264430 (= lt!573243 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20336 (ValueCell!15437 V!48567) V!48567)

(declare-fun dynLambda!3461 (Int (_ BitVec 64)) V!48567)

(assert (=> b!1264430 (= lt!573240 (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264430 (= lt!573239 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264430 (= lt!573241 call!62217)))

(assert (=> b!1264430 (= e!719950 (+!4298 call!62217 (tuple2!21061 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000) (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264431 () Bool)

(declare-fun e!719944 () Bool)

(declare-fun lt!573244 () ListLongMap!18941)

(declare-fun isEmpty!1046 (ListLongMap!18941) Bool)

(assert (=> b!1264431 (= e!719944 (isEmpty!1046 lt!573244))))

(declare-fun b!1264432 () Bool)

(assert (=> b!1264432 (= e!719944 (= lt!573244 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264433 () Bool)

(assert (=> b!1264433 (= e!719945 e!719950)))

(declare-fun c!123314 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1264433 (= c!123314 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264434 () Bool)

(declare-fun res!841937 () Bool)

(assert (=> b!1264434 (=> (not res!841937) (not e!719947))))

(assert (=> b!1264434 (= res!841937 (not (contains!7625 lt!573244 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!139041 () Bool)

(assert (=> d!139041 e!719947))

(declare-fun res!841934 () Bool)

(assert (=> d!139041 (=> (not res!841934) (not e!719947))))

(assert (=> d!139041 (= res!841934 (not (contains!7625 lt!573244 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139041 (= lt!573244 e!719945)))

(declare-fun c!123312 () Bool)

(assert (=> d!139041 (= c!123312 (bvsge #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> d!139041 (validMask!0 mask!1466)))

(assert (=> d!139041 (= (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573244)))

(declare-fun b!1264435 () Bool)

(assert (=> b!1264435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> b!1264435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _values!914)))))

(declare-fun e!719948 () Bool)

(declare-fun apply!1009 (ListLongMap!18941 (_ BitVec 64)) V!48567)

(assert (=> b!1264435 (= e!719948 (= (apply!1009 lt!573244 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)) (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1264436 () Bool)

(assert (=> b!1264436 (= e!719946 e!719944)))

(declare-fun c!123315 () Bool)

(assert (=> b!1264436 (= c!123315 (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun b!1264437 () Bool)

(assert (=> b!1264437 (= e!719949 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264437 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1264438 () Bool)

(assert (=> b!1264438 (= e!719946 e!719948)))

(assert (=> b!1264438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun res!841936 () Bool)

(assert (=> b!1264438 (= res!841936 (contains!7625 lt!573244 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264438 (=> (not res!841936) (not e!719948))))

(assert (= (and d!139041 c!123312) b!1264429))

(assert (= (and d!139041 (not c!123312)) b!1264433))

(assert (= (and b!1264433 c!123314) b!1264430))

(assert (= (and b!1264433 (not c!123314)) b!1264427))

(assert (= (or b!1264430 b!1264427) bm!62214))

(assert (= (and d!139041 res!841934) b!1264434))

(assert (= (and b!1264434 res!841937) b!1264428))

(assert (= (and b!1264428 res!841935) b!1264437))

(assert (= (and b!1264428 c!123313) b!1264438))

(assert (= (and b!1264428 (not c!123313)) b!1264436))

(assert (= (and b!1264438 res!841936) b!1264435))

(assert (= (and b!1264436 c!123315) b!1264432))

(assert (= (and b!1264436 (not c!123315)) b!1264431))

(declare-fun b_lambda!22917 () Bool)

(assert (=> (not b_lambda!22917) (not b!1264430)))

(declare-fun t!41792 () Bool)

(declare-fun tb!11319 () Bool)

(assert (=> (and start!106290 (= defaultEntry!922 defaultEntry!922) t!41792) tb!11319))

(declare-fun result!23381 () Bool)

(assert (=> tb!11319 (= result!23381 tp_is_empty!32401)))

(assert (=> b!1264430 t!41792))

(declare-fun b_and!45481 () Bool)

(assert (= b_and!45475 (and (=> t!41792 result!23381) b_and!45481)))

(declare-fun b_lambda!22919 () Bool)

(assert (=> (not b_lambda!22919) (not b!1264435)))

(assert (=> b!1264435 t!41792))

(declare-fun b_and!45483 () Bool)

(assert (= b_and!45481 (and (=> t!41792 result!23381) b_and!45483)))

(declare-fun m!1165251 () Bool)

(assert (=> b!1264434 m!1165251))

(declare-fun m!1165253 () Bool)

(assert (=> b!1264430 m!1165253))

(declare-fun m!1165255 () Bool)

(assert (=> b!1264430 m!1165255))

(declare-fun m!1165257 () Bool)

(assert (=> b!1264430 m!1165257))

(declare-fun m!1165259 () Bool)

(assert (=> b!1264430 m!1165259))

(declare-fun m!1165261 () Bool)

(assert (=> b!1264430 m!1165261))

(assert (=> b!1264430 m!1165253))

(assert (=> b!1264430 m!1165261))

(declare-fun m!1165263 () Bool)

(assert (=> b!1264430 m!1165263))

(declare-fun m!1165265 () Bool)

(assert (=> b!1264430 m!1165265))

(declare-fun m!1165267 () Bool)

(assert (=> b!1264430 m!1165267))

(assert (=> b!1264430 m!1165255))

(assert (=> b!1264435 m!1165265))

(declare-fun m!1165269 () Bool)

(assert (=> b!1264435 m!1165269))

(assert (=> b!1264435 m!1165253))

(assert (=> b!1264435 m!1165261))

(assert (=> b!1264435 m!1165253))

(assert (=> b!1264435 m!1165261))

(assert (=> b!1264435 m!1165263))

(assert (=> b!1264435 m!1165265))

(assert (=> b!1264437 m!1165265))

(assert (=> b!1264437 m!1165265))

(declare-fun m!1165271 () Bool)

(assert (=> b!1264437 m!1165271))

(declare-fun m!1165273 () Bool)

(assert (=> b!1264431 m!1165273))

(assert (=> b!1264438 m!1165265))

(assert (=> b!1264438 m!1165265))

(declare-fun m!1165275 () Bool)

(assert (=> b!1264438 m!1165275))

(assert (=> b!1264433 m!1165265))

(assert (=> b!1264433 m!1165265))

(assert (=> b!1264433 m!1165271))

(declare-fun m!1165277 () Bool)

(assert (=> b!1264432 m!1165277))

(declare-fun m!1165279 () Bool)

(assert (=> d!139041 m!1165279))

(assert (=> d!139041 m!1165193))

(assert (=> bm!62214 m!1165277))

(assert (=> b!1264347 d!139041))

(declare-fun b!1264441 () Bool)

(declare-fun e!719957 () ListLongMap!18941)

(declare-fun call!62218 () ListLongMap!18941)

(assert (=> b!1264441 (= e!719957 call!62218)))

(declare-fun b!1264442 () Bool)

(declare-fun e!719954 () Bool)

(declare-fun e!719953 () Bool)

(assert (=> b!1264442 (= e!719954 e!719953)))

(declare-fun c!123317 () Bool)

(declare-fun e!719956 () Bool)

(assert (=> b!1264442 (= c!123317 e!719956)))

(declare-fun res!841939 () Bool)

(assert (=> b!1264442 (=> (not res!841939) (not e!719956))))

(assert (=> b!1264442 (= res!841939 (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun bm!62215 () Bool)

(assert (=> bm!62215 (= call!62218 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264443 () Bool)

(declare-fun e!719952 () ListLongMap!18941)

(assert (=> b!1264443 (= e!719952 (ListLongMap!18942 Nil!28281))))

(declare-fun b!1264444 () Bool)

(declare-fun lt!573252 () Unit!42074)

(declare-fun lt!573249 () Unit!42074)

(assert (=> b!1264444 (= lt!573252 lt!573249)))

(declare-fun lt!573246 () (_ BitVec 64))

(declare-fun lt!573247 () V!48567)

(declare-fun lt!573250 () (_ BitVec 64))

(declare-fun lt!573248 () ListLongMap!18941)

(assert (=> b!1264444 (not (contains!7625 (+!4298 lt!573248 (tuple2!21061 lt!573246 lt!573247)) lt!573250))))

(assert (=> b!1264444 (= lt!573249 (addStillNotContains!330 lt!573248 lt!573246 lt!573247 lt!573250))))

(assert (=> b!1264444 (= lt!573250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264444 (= lt!573247 (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264444 (= lt!573246 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264444 (= lt!573248 call!62218)))

(assert (=> b!1264444 (= e!719957 (+!4298 call!62218 (tuple2!21061 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000) (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264445 () Bool)

(declare-fun e!719951 () Bool)

(declare-fun lt!573251 () ListLongMap!18941)

(assert (=> b!1264445 (= e!719951 (isEmpty!1046 lt!573251))))

(declare-fun b!1264446 () Bool)

(assert (=> b!1264446 (= e!719951 (= lt!573251 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264447 () Bool)

(assert (=> b!1264447 (= e!719952 e!719957)))

(declare-fun c!123318 () Bool)

(assert (=> b!1264447 (= c!123318 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264448 () Bool)

(declare-fun res!841941 () Bool)

(assert (=> b!1264448 (=> (not res!841941) (not e!719954))))

(assert (=> b!1264448 (= res!841941 (not (contains!7625 lt!573251 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!139043 () Bool)

(assert (=> d!139043 e!719954))

(declare-fun res!841938 () Bool)

(assert (=> d!139043 (=> (not res!841938) (not e!719954))))

(assert (=> d!139043 (= res!841938 (not (contains!7625 lt!573251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139043 (= lt!573251 e!719952)))

(declare-fun c!123316 () Bool)

(assert (=> d!139043 (= c!123316 (bvsge #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> d!139043 (validMask!0 mask!1466)))

(assert (=> d!139043 (= (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573251)))

(declare-fun b!1264449 () Bool)

(assert (=> b!1264449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> b!1264449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _values!914)))))

(declare-fun e!719955 () Bool)

(assert (=> b!1264449 (= e!719955 (= (apply!1009 lt!573251 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)) (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1264450 () Bool)

(assert (=> b!1264450 (= e!719953 e!719951)))

(declare-fun c!123319 () Bool)

(assert (=> b!1264450 (= c!123319 (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun b!1264451 () Bool)

(assert (=> b!1264451 (= e!719956 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264451 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1264452 () Bool)

(assert (=> b!1264452 (= e!719953 e!719955)))

(assert (=> b!1264452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun res!841940 () Bool)

(assert (=> b!1264452 (= res!841940 (contains!7625 lt!573251 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264452 (=> (not res!841940) (not e!719955))))

(assert (= (and d!139043 c!123316) b!1264443))

(assert (= (and d!139043 (not c!123316)) b!1264447))

(assert (= (and b!1264447 c!123318) b!1264444))

(assert (= (and b!1264447 (not c!123318)) b!1264441))

(assert (= (or b!1264444 b!1264441) bm!62215))

(assert (= (and d!139043 res!841938) b!1264448))

(assert (= (and b!1264448 res!841941) b!1264442))

(assert (= (and b!1264442 res!841939) b!1264451))

(assert (= (and b!1264442 c!123317) b!1264452))

(assert (= (and b!1264442 (not c!123317)) b!1264450))

(assert (= (and b!1264452 res!841940) b!1264449))

(assert (= (and b!1264450 c!123319) b!1264446))

(assert (= (and b!1264450 (not c!123319)) b!1264445))

(declare-fun b_lambda!22921 () Bool)

(assert (=> (not b_lambda!22921) (not b!1264444)))

(assert (=> b!1264444 t!41792))

(declare-fun b_and!45485 () Bool)

(assert (= b_and!45483 (and (=> t!41792 result!23381) b_and!45485)))

(declare-fun b_lambda!22923 () Bool)

(assert (=> (not b_lambda!22923) (not b!1264449)))

(assert (=> b!1264449 t!41792))

(declare-fun b_and!45487 () Bool)

(assert (= b_and!45485 (and (=> t!41792 result!23381) b_and!45487)))

(declare-fun m!1165281 () Bool)

(assert (=> b!1264448 m!1165281))

(assert (=> b!1264444 m!1165253))

(declare-fun m!1165283 () Bool)

(assert (=> b!1264444 m!1165283))

(declare-fun m!1165285 () Bool)

(assert (=> b!1264444 m!1165285))

(declare-fun m!1165287 () Bool)

(assert (=> b!1264444 m!1165287))

(assert (=> b!1264444 m!1165261))

(assert (=> b!1264444 m!1165253))

(assert (=> b!1264444 m!1165261))

(assert (=> b!1264444 m!1165263))

(assert (=> b!1264444 m!1165265))

(declare-fun m!1165289 () Bool)

(assert (=> b!1264444 m!1165289))

(assert (=> b!1264444 m!1165283))

(assert (=> b!1264449 m!1165265))

(declare-fun m!1165291 () Bool)

(assert (=> b!1264449 m!1165291))

(assert (=> b!1264449 m!1165253))

(assert (=> b!1264449 m!1165261))

(assert (=> b!1264449 m!1165253))

(assert (=> b!1264449 m!1165261))

(assert (=> b!1264449 m!1165263))

(assert (=> b!1264449 m!1165265))

(assert (=> b!1264451 m!1165265))

(assert (=> b!1264451 m!1165265))

(assert (=> b!1264451 m!1165271))

(declare-fun m!1165293 () Bool)

(assert (=> b!1264445 m!1165293))

(assert (=> b!1264452 m!1165265))

(assert (=> b!1264452 m!1165265))

(declare-fun m!1165295 () Bool)

(assert (=> b!1264452 m!1165295))

(assert (=> b!1264447 m!1165265))

(assert (=> b!1264447 m!1165265))

(assert (=> b!1264447 m!1165271))

(declare-fun m!1165297 () Bool)

(assert (=> b!1264446 m!1165297))

(declare-fun m!1165299 () Bool)

(assert (=> d!139043 m!1165299))

(assert (=> d!139043 m!1165193))

(assert (=> bm!62215 m!1165297))

(assert (=> b!1264347 d!139043))

(declare-fun d!139045 () Bool)

(declare-fun e!719962 () Bool)

(assert (=> d!139045 e!719962))

(declare-fun res!841944 () Bool)

(assert (=> d!139045 (=> res!841944 e!719962)))

(declare-fun lt!573262 () Bool)

(assert (=> d!139045 (= res!841944 (not lt!573262))))

(declare-fun lt!573264 () Bool)

(assert (=> d!139045 (= lt!573262 lt!573264)))

(declare-fun lt!573263 () Unit!42074)

(declare-fun e!719963 () Unit!42074)

(assert (=> d!139045 (= lt!573263 e!719963)))

(declare-fun c!123322 () Bool)

(assert (=> d!139045 (= c!123322 lt!573264)))

(declare-fun containsKey!625 (List!28284 (_ BitVec 64)) Bool)

(assert (=> d!139045 (= lt!573264 (containsKey!625 (toList!9486 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!139045 (= (contains!7625 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000) lt!573262)))

(declare-fun b!1264459 () Bool)

(declare-fun lt!573261 () Unit!42074)

(assert (=> b!1264459 (= e!719963 lt!573261)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!434 (List!28284 (_ BitVec 64)) Unit!42074)

(assert (=> b!1264459 (= lt!573261 (lemmaContainsKeyImpliesGetValueByKeyDefined!434 (toList!9486 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!712 0))(
  ( (Some!711 (v!18971 V!48567)) (None!710) )
))
(declare-fun isDefined!472 (Option!712) Bool)

(declare-fun getValueByKey!661 (List!28284 (_ BitVec 64)) Option!712)

(assert (=> b!1264459 (isDefined!472 (getValueByKey!661 (toList!9486 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264460 () Bool)

(declare-fun Unit!42078 () Unit!42074)

(assert (=> b!1264460 (= e!719963 Unit!42078)))

(declare-fun b!1264461 () Bool)

(assert (=> b!1264461 (= e!719962 (isDefined!472 (getValueByKey!661 (toList!9486 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!139045 c!123322) b!1264459))

(assert (= (and d!139045 (not c!123322)) b!1264460))

(assert (= (and d!139045 (not res!841944)) b!1264461))

(declare-fun m!1165301 () Bool)

(assert (=> d!139045 m!1165301))

(declare-fun m!1165303 () Bool)

(assert (=> b!1264459 m!1165303))

(declare-fun m!1165305 () Bool)

(assert (=> b!1264459 m!1165305))

(assert (=> b!1264459 m!1165305))

(declare-fun m!1165307 () Bool)

(assert (=> b!1264459 m!1165307))

(assert (=> b!1264461 m!1165305))

(assert (=> b!1264461 m!1165305))

(assert (=> b!1264461 m!1165307))

(assert (=> b!1264350 d!139045))

(declare-fun b!1264504 () Bool)

(declare-fun e!720002 () Bool)

(declare-fun e!719997 () Bool)

(assert (=> b!1264504 (= e!720002 e!719997)))

(declare-fun res!841970 () Bool)

(assert (=> b!1264504 (=> (not res!841970) (not e!719997))))

(declare-fun lt!573312 () ListLongMap!18941)

(assert (=> b!1264504 (= res!841970 (contains!7625 lt!573312 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun b!1264505 () Bool)

(declare-fun e!719994 () Bool)

(assert (=> b!1264505 (= e!719994 (= (apply!1009 lt!573312 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1264506 () Bool)

(declare-fun e!719999 () ListLongMap!18941)

(declare-fun e!719996 () ListLongMap!18941)

(assert (=> b!1264506 (= e!719999 e!719996)))

(declare-fun c!123340 () Bool)

(assert (=> b!1264506 (= c!123340 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264507 () Bool)

(declare-fun res!841963 () Bool)

(declare-fun e!720001 () Bool)

(assert (=> b!1264507 (=> (not res!841963) (not e!720001))))

(assert (=> b!1264507 (= res!841963 e!720002)))

(declare-fun res!841966 () Bool)

(assert (=> b!1264507 (=> res!841966 e!720002)))

(declare-fun e!719993 () Bool)

(assert (=> b!1264507 (= res!841966 (not e!719993))))

(declare-fun res!841967 () Bool)

(assert (=> b!1264507 (=> (not res!841967) (not e!719993))))

(assert (=> b!1264507 (= res!841967 (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun b!1264508 () Bool)

(declare-fun e!719991 () Bool)

(assert (=> b!1264508 (= e!719991 e!719994)))

(declare-fun res!841968 () Bool)

(declare-fun call!62235 () Bool)

(assert (=> b!1264508 (= res!841968 call!62235)))

(assert (=> b!1264508 (=> (not res!841968) (not e!719994))))

(declare-fun bm!62230 () Bool)

(declare-fun call!62237 () ListLongMap!18941)

(declare-fun call!62239 () ListLongMap!18941)

(assert (=> bm!62230 (= call!62237 call!62239)))

(declare-fun b!1264510 () Bool)

(declare-fun c!123339 () Bool)

(assert (=> b!1264510 (= c!123339 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!720000 () ListLongMap!18941)

(assert (=> b!1264510 (= e!719996 e!720000)))

(declare-fun b!1264511 () Bool)

(declare-fun res!841964 () Bool)

(assert (=> b!1264511 (=> (not res!841964) (not e!720001))))

(declare-fun e!719992 () Bool)

(assert (=> b!1264511 (= res!841964 e!719992)))

(declare-fun c!123336 () Bool)

(assert (=> b!1264511 (= c!123336 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264512 () Bool)

(declare-fun call!62238 () ListLongMap!18941)

(assert (=> b!1264512 (= e!720000 call!62238)))

(declare-fun b!1264513 () Bool)

(declare-fun e!719995 () Bool)

(assert (=> b!1264513 (= e!719995 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264514 () Bool)

(assert (=> b!1264514 (= e!720000 call!62237)))

(declare-fun bm!62231 () Bool)

(declare-fun call!62234 () Bool)

(assert (=> bm!62231 (= call!62234 (contains!7625 lt!573312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62232 () Bool)

(declare-fun call!62236 () ListLongMap!18941)

(declare-fun call!62233 () ListLongMap!18941)

(assert (=> bm!62232 (= call!62236 call!62233)))

(declare-fun b!1264515 () Bool)

(assert (=> b!1264515 (= e!719999 (+!4298 call!62239 (tuple2!21061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1264516 () Bool)

(assert (=> b!1264516 (= e!719991 (not call!62235))))

(declare-fun bm!62233 () Bool)

(declare-fun c!123338 () Bool)

(assert (=> bm!62233 (= call!62239 (+!4298 (ite c!123338 call!62233 (ite c!123340 call!62236 call!62238)) (ite (or c!123338 c!123340) (tuple2!21061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62234 () Bool)

(assert (=> bm!62234 (= call!62233 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264509 () Bool)

(assert (=> b!1264509 (= e!719996 call!62237)))

(declare-fun d!139047 () Bool)

(assert (=> d!139047 e!720001))

(declare-fun res!841965 () Bool)

(assert (=> d!139047 (=> (not res!841965) (not e!720001))))

(assert (=> d!139047 (= res!841965 (or (bvsge #b00000000000000000000000000000000 (size!40313 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))))

(declare-fun lt!573320 () ListLongMap!18941)

(assert (=> d!139047 (= lt!573312 lt!573320)))

(declare-fun lt!573314 () Unit!42074)

(declare-fun e!719998 () Unit!42074)

(assert (=> d!139047 (= lt!573314 e!719998)))

(declare-fun c!123335 () Bool)

(assert (=> d!139047 (= c!123335 e!719995)))

(declare-fun res!841969 () Bool)

(assert (=> d!139047 (=> (not res!841969) (not e!719995))))

(assert (=> d!139047 (= res!841969 (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> d!139047 (= lt!573320 e!719999)))

(assert (=> d!139047 (= c!123338 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139047 (validMask!0 mask!1466)))

(assert (=> d!139047 (= (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573312)))

(declare-fun b!1264517 () Bool)

(assert (=> b!1264517 (= e!719993 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264518 () Bool)

(declare-fun Unit!42079 () Unit!42074)

(assert (=> b!1264518 (= e!719998 Unit!42079)))

(declare-fun bm!62235 () Bool)

(assert (=> bm!62235 (= call!62238 call!62236)))

(declare-fun b!1264519 () Bool)

(declare-fun lt!573318 () Unit!42074)

(assert (=> b!1264519 (= e!719998 lt!573318)))

(declare-fun lt!573326 () ListLongMap!18941)

(assert (=> b!1264519 (= lt!573326 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573316 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573316 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573310 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573310 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573329 () Unit!42074)

(declare-fun addStillContains!1098 (ListLongMap!18941 (_ BitVec 64) V!48567 (_ BitVec 64)) Unit!42074)

(assert (=> b!1264519 (= lt!573329 (addStillContains!1098 lt!573326 lt!573316 zeroValue!871 lt!573310))))

(assert (=> b!1264519 (contains!7625 (+!4298 lt!573326 (tuple2!21061 lt!573316 zeroValue!871)) lt!573310)))

(declare-fun lt!573311 () Unit!42074)

(assert (=> b!1264519 (= lt!573311 lt!573329)))

(declare-fun lt!573328 () ListLongMap!18941)

(assert (=> b!1264519 (= lt!573328 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573317 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573317 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573330 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573330 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573309 () Unit!42074)

(declare-fun addApplyDifferent!540 (ListLongMap!18941 (_ BitVec 64) V!48567 (_ BitVec 64)) Unit!42074)

(assert (=> b!1264519 (= lt!573309 (addApplyDifferent!540 lt!573328 lt!573317 minValueBefore!43 lt!573330))))

(assert (=> b!1264519 (= (apply!1009 (+!4298 lt!573328 (tuple2!21061 lt!573317 minValueBefore!43)) lt!573330) (apply!1009 lt!573328 lt!573330))))

(declare-fun lt!573327 () Unit!42074)

(assert (=> b!1264519 (= lt!573327 lt!573309)))

(declare-fun lt!573313 () ListLongMap!18941)

(assert (=> b!1264519 (= lt!573313 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573322 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573321 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573321 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573323 () Unit!42074)

(assert (=> b!1264519 (= lt!573323 (addApplyDifferent!540 lt!573313 lt!573322 zeroValue!871 lt!573321))))

(assert (=> b!1264519 (= (apply!1009 (+!4298 lt!573313 (tuple2!21061 lt!573322 zeroValue!871)) lt!573321) (apply!1009 lt!573313 lt!573321))))

(declare-fun lt!573319 () Unit!42074)

(assert (=> b!1264519 (= lt!573319 lt!573323)))

(declare-fun lt!573324 () ListLongMap!18941)

(assert (=> b!1264519 (= lt!573324 (getCurrentListMapNoExtraKeys!5890 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573315 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573315 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573325 () (_ BitVec 64))

(assert (=> b!1264519 (= lt!573325 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264519 (= lt!573318 (addApplyDifferent!540 lt!573324 lt!573315 minValueBefore!43 lt!573325))))

(assert (=> b!1264519 (= (apply!1009 (+!4298 lt!573324 (tuple2!21061 lt!573315 minValueBefore!43)) lt!573325) (apply!1009 lt!573324 lt!573325))))

(declare-fun b!1264520 () Bool)

(declare-fun e!719990 () Bool)

(assert (=> b!1264520 (= e!719990 (= (apply!1009 lt!573312 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264521 () Bool)

(assert (=> b!1264521 (= e!719992 e!719990)))

(declare-fun res!841971 () Bool)

(assert (=> b!1264521 (= res!841971 call!62234)))

(assert (=> b!1264521 (=> (not res!841971) (not e!719990))))

(declare-fun bm!62236 () Bool)

(assert (=> bm!62236 (= call!62235 (contains!7625 lt!573312 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264522 () Bool)

(assert (=> b!1264522 (= e!719997 (= (apply!1009 lt!573312 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)) (get!20336 (select (arr!39777 _values!914) #b00000000000000000000000000000000) (dynLambda!3461 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _values!914)))))

(assert (=> b!1264522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(declare-fun b!1264523 () Bool)

(assert (=> b!1264523 (= e!719992 (not call!62234))))

(declare-fun b!1264524 () Bool)

(assert (=> b!1264524 (= e!720001 e!719991)))

(declare-fun c!123337 () Bool)

(assert (=> b!1264524 (= c!123337 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!139047 c!123338) b!1264515))

(assert (= (and d!139047 (not c!123338)) b!1264506))

(assert (= (and b!1264506 c!123340) b!1264509))

(assert (= (and b!1264506 (not c!123340)) b!1264510))

(assert (= (and b!1264510 c!123339) b!1264514))

(assert (= (and b!1264510 (not c!123339)) b!1264512))

(assert (= (or b!1264514 b!1264512) bm!62235))

(assert (= (or b!1264509 bm!62235) bm!62232))

(assert (= (or b!1264509 b!1264514) bm!62230))

(assert (= (or b!1264515 bm!62232) bm!62234))

(assert (= (or b!1264515 bm!62230) bm!62233))

(assert (= (and d!139047 res!841969) b!1264513))

(assert (= (and d!139047 c!123335) b!1264519))

(assert (= (and d!139047 (not c!123335)) b!1264518))

(assert (= (and d!139047 res!841965) b!1264507))

(assert (= (and b!1264507 res!841967) b!1264517))

(assert (= (and b!1264507 (not res!841966)) b!1264504))

(assert (= (and b!1264504 res!841970) b!1264522))

(assert (= (and b!1264507 res!841963) b!1264511))

(assert (= (and b!1264511 c!123336) b!1264521))

(assert (= (and b!1264511 (not c!123336)) b!1264523))

(assert (= (and b!1264521 res!841971) b!1264520))

(assert (= (or b!1264521 b!1264523) bm!62231))

(assert (= (and b!1264511 res!841964) b!1264524))

(assert (= (and b!1264524 c!123337) b!1264508))

(assert (= (and b!1264524 (not c!123337)) b!1264516))

(assert (= (and b!1264508 res!841968) b!1264505))

(assert (= (or b!1264508 b!1264516) bm!62236))

(declare-fun b_lambda!22925 () Bool)

(assert (=> (not b_lambda!22925) (not b!1264522)))

(assert (=> b!1264522 t!41792))

(declare-fun b_and!45489 () Bool)

(assert (= b_and!45487 (and (=> t!41792 result!23381) b_and!45489)))

(assert (=> b!1264513 m!1165265))

(assert (=> b!1264513 m!1165265))

(assert (=> b!1264513 m!1165271))

(declare-fun m!1165309 () Bool)

(assert (=> b!1264515 m!1165309))

(assert (=> b!1264517 m!1165265))

(assert (=> b!1264517 m!1165265))

(assert (=> b!1264517 m!1165271))

(declare-fun m!1165311 () Bool)

(assert (=> bm!62233 m!1165311))

(assert (=> b!1264522 m!1165265))

(declare-fun m!1165313 () Bool)

(assert (=> b!1264522 m!1165313))

(assert (=> b!1264522 m!1165253))

(assert (=> b!1264522 m!1165265))

(assert (=> b!1264522 m!1165261))

(assert (=> b!1264522 m!1165253))

(assert (=> b!1264522 m!1165261))

(assert (=> b!1264522 m!1165263))

(declare-fun m!1165315 () Bool)

(assert (=> bm!62231 m!1165315))

(assert (=> bm!62234 m!1165203))

(declare-fun m!1165317 () Bool)

(assert (=> b!1264505 m!1165317))

(assert (=> d!139047 m!1165193))

(declare-fun m!1165319 () Bool)

(assert (=> bm!62236 m!1165319))

(assert (=> b!1264504 m!1165265))

(assert (=> b!1264504 m!1165265))

(declare-fun m!1165321 () Bool)

(assert (=> b!1264504 m!1165321))

(declare-fun m!1165323 () Bool)

(assert (=> b!1264520 m!1165323))

(declare-fun m!1165325 () Bool)

(assert (=> b!1264519 m!1165325))

(declare-fun m!1165327 () Bool)

(assert (=> b!1264519 m!1165327))

(declare-fun m!1165329 () Bool)

(assert (=> b!1264519 m!1165329))

(assert (=> b!1264519 m!1165329))

(declare-fun m!1165331 () Bool)

(assert (=> b!1264519 m!1165331))

(declare-fun m!1165333 () Bool)

(assert (=> b!1264519 m!1165333))

(assert (=> b!1264519 m!1165203))

(declare-fun m!1165335 () Bool)

(assert (=> b!1264519 m!1165335))

(declare-fun m!1165337 () Bool)

(assert (=> b!1264519 m!1165337))

(assert (=> b!1264519 m!1165335))

(assert (=> b!1264519 m!1165327))

(declare-fun m!1165339 () Bool)

(assert (=> b!1264519 m!1165339))

(declare-fun m!1165341 () Bool)

(assert (=> b!1264519 m!1165341))

(declare-fun m!1165343 () Bool)

(assert (=> b!1264519 m!1165343))

(assert (=> b!1264519 m!1165265))

(declare-fun m!1165345 () Bool)

(assert (=> b!1264519 m!1165345))

(declare-fun m!1165347 () Bool)

(assert (=> b!1264519 m!1165347))

(declare-fun m!1165349 () Bool)

(assert (=> b!1264519 m!1165349))

(assert (=> b!1264519 m!1165325))

(declare-fun m!1165351 () Bool)

(assert (=> b!1264519 m!1165351))

(declare-fun m!1165353 () Bool)

(assert (=> b!1264519 m!1165353))

(assert (=> b!1264350 d!139047))

(declare-fun b!1264535 () Bool)

(declare-fun e!720014 () Bool)

(declare-fun e!720012 () Bool)

(assert (=> b!1264535 (= e!720014 e!720012)))

(declare-fun res!841980 () Bool)

(assert (=> b!1264535 (=> (not res!841980) (not e!720012))))

(declare-fun e!720011 () Bool)

(assert (=> b!1264535 (= res!841980 (not e!720011))))

(declare-fun res!841979 () Bool)

(assert (=> b!1264535 (=> (not res!841979) (not e!720011))))

(assert (=> b!1264535 (= res!841979 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264536 () Bool)

(declare-fun e!720013 () Bool)

(declare-fun call!62242 () Bool)

(assert (=> b!1264536 (= e!720013 call!62242)))

(declare-fun d!139049 () Bool)

(declare-fun res!841978 () Bool)

(assert (=> d!139049 (=> res!841978 e!720014)))

(assert (=> d!139049 (= res!841978 (bvsge #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> d!139049 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28282) e!720014)))

(declare-fun bm!62239 () Bool)

(declare-fun c!123343 () Bool)

(assert (=> bm!62239 (= call!62242 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123343 (Cons!28281 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000) Nil!28282) Nil!28282)))))

(declare-fun b!1264537 () Bool)

(assert (=> b!1264537 (= e!720013 call!62242)))

(declare-fun b!1264538 () Bool)

(assert (=> b!1264538 (= e!720012 e!720013)))

(assert (=> b!1264538 (= c!123343 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264539 () Bool)

(declare-fun contains!7627 (List!28285 (_ BitVec 64)) Bool)

(assert (=> b!1264539 (= e!720011 (contains!7627 Nil!28282 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!139049 (not res!841978)) b!1264535))

(assert (= (and b!1264535 res!841979) b!1264539))

(assert (= (and b!1264535 res!841980) b!1264538))

(assert (= (and b!1264538 c!123343) b!1264537))

(assert (= (and b!1264538 (not c!123343)) b!1264536))

(assert (= (or b!1264537 b!1264536) bm!62239))

(assert (=> b!1264535 m!1165265))

(assert (=> b!1264535 m!1165265))

(assert (=> b!1264535 m!1165271))

(assert (=> bm!62239 m!1165265))

(declare-fun m!1165355 () Bool)

(assert (=> bm!62239 m!1165355))

(assert (=> b!1264538 m!1165265))

(assert (=> b!1264538 m!1165265))

(assert (=> b!1264538 m!1165271))

(assert (=> b!1264539 m!1165265))

(assert (=> b!1264539 m!1165265))

(declare-fun m!1165357 () Bool)

(assert (=> b!1264539 m!1165357))

(assert (=> b!1264351 d!139049))

(declare-fun d!139051 () Bool)

(assert (=> d!139051 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106290 d!139051))

(declare-fun d!139053 () Bool)

(assert (=> d!139053 (= (array_inv!30435 _keys!1118) (bvsge (size!40313 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106290 d!139053))

(declare-fun d!139055 () Bool)

(assert (=> d!139055 (= (array_inv!30436 _values!914) (bvsge (size!40314 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106290 d!139055))

(declare-fun b!1264548 () Bool)

(declare-fun e!720023 () Bool)

(declare-fun e!720022 () Bool)

(assert (=> b!1264548 (= e!720023 e!720022)))

(declare-fun lt!573339 () (_ BitVec 64))

(assert (=> b!1264548 (= lt!573339 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573337 () Unit!42074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82467 (_ BitVec 64) (_ BitVec 32)) Unit!42074)

(assert (=> b!1264548 (= lt!573337 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573339 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1264548 (arrayContainsKey!0 _keys!1118 lt!573339 #b00000000000000000000000000000000)))

(declare-fun lt!573338 () Unit!42074)

(assert (=> b!1264548 (= lt!573338 lt!573337)))

(declare-fun res!841986 () Bool)

(declare-datatypes ((SeekEntryResult!9934 0))(
  ( (MissingZero!9934 (index!42107 (_ BitVec 32))) (Found!9934 (index!42108 (_ BitVec 32))) (Intermediate!9934 (undefined!10746 Bool) (index!42109 (_ BitVec 32)) (x!111283 (_ BitVec 32))) (Undefined!9934) (MissingVacant!9934 (index!42110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82467 (_ BitVec 32)) SeekEntryResult!9934)

(assert (=> b!1264548 (= res!841986 (= (seekEntryOrOpen!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9934 #b00000000000000000000000000000000)))))

(assert (=> b!1264548 (=> (not res!841986) (not e!720022))))

(declare-fun b!1264549 () Bool)

(declare-fun e!720021 () Bool)

(assert (=> b!1264549 (= e!720021 e!720023)))

(declare-fun c!123346 () Bool)

(assert (=> b!1264549 (= c!123346 (validKeyInArray!0 (select (arr!39776 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62242 () Bool)

(declare-fun call!62245 () Bool)

(assert (=> bm!62242 (= call!62245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1264551 () Bool)

(assert (=> b!1264551 (= e!720023 call!62245)))

(declare-fun d!139057 () Bool)

(declare-fun res!841985 () Bool)

(assert (=> d!139057 (=> res!841985 e!720021)))

(assert (=> d!139057 (= res!841985 (bvsge #b00000000000000000000000000000000 (size!40313 _keys!1118)))))

(assert (=> d!139057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!720021)))

(declare-fun b!1264550 () Bool)

(assert (=> b!1264550 (= e!720022 call!62245)))

(assert (= (and d!139057 (not res!841985)) b!1264549))

(assert (= (and b!1264549 c!123346) b!1264548))

(assert (= (and b!1264549 (not c!123346)) b!1264551))

(assert (= (and b!1264548 res!841986) b!1264550))

(assert (= (or b!1264550 b!1264551) bm!62242))

(assert (=> b!1264548 m!1165265))

(declare-fun m!1165359 () Bool)

(assert (=> b!1264548 m!1165359))

(declare-fun m!1165361 () Bool)

(assert (=> b!1264548 m!1165361))

(assert (=> b!1264548 m!1165265))

(declare-fun m!1165363 () Bool)

(assert (=> b!1264548 m!1165363))

(assert (=> b!1264549 m!1165265))

(assert (=> b!1264549 m!1165265))

(assert (=> b!1264549 m!1165271))

(declare-fun m!1165365 () Bool)

(assert (=> bm!62242 m!1165365))

(assert (=> b!1264354 d!139057))

(declare-fun b!1264559 () Bool)

(declare-fun e!720029 () Bool)

(assert (=> b!1264559 (= e!720029 tp_is_empty!32401)))

(declare-fun condMapEmpty!50431 () Bool)

(declare-fun mapDefault!50431 () ValueCell!15437)

(assert (=> mapNonEmpty!50422 (= condMapEmpty!50431 (= mapRest!50422 ((as const (Array (_ BitVec 32) ValueCell!15437)) mapDefault!50431)))))

(declare-fun mapRes!50431 () Bool)

(assert (=> mapNonEmpty!50422 (= tp!96047 (and e!720029 mapRes!50431))))

(declare-fun b!1264558 () Bool)

(declare-fun e!720028 () Bool)

(assert (=> b!1264558 (= e!720028 tp_is_empty!32401)))

(declare-fun mapIsEmpty!50431 () Bool)

(assert (=> mapIsEmpty!50431 mapRes!50431))

(declare-fun mapNonEmpty!50431 () Bool)

(declare-fun tp!96062 () Bool)

(assert (=> mapNonEmpty!50431 (= mapRes!50431 (and tp!96062 e!720028))))

(declare-fun mapRest!50431 () (Array (_ BitVec 32) ValueCell!15437))

(declare-fun mapValue!50431 () ValueCell!15437)

(declare-fun mapKey!50431 () (_ BitVec 32))

(assert (=> mapNonEmpty!50431 (= mapRest!50422 (store mapRest!50431 mapKey!50431 mapValue!50431))))

(assert (= (and mapNonEmpty!50422 condMapEmpty!50431) mapIsEmpty!50431))

(assert (= (and mapNonEmpty!50422 (not condMapEmpty!50431)) mapNonEmpty!50431))

(assert (= (and mapNonEmpty!50431 ((_ is ValueCellFull!15437) mapValue!50431)) b!1264558))

(assert (= (and mapNonEmpty!50422 ((_ is ValueCellFull!15437) mapDefault!50431)) b!1264559))

(declare-fun m!1165367 () Bool)

(assert (=> mapNonEmpty!50431 m!1165367))

(declare-fun b_lambda!22927 () Bool)

(assert (= b_lambda!22917 (or (and start!106290 b_free!27499) b_lambda!22927)))

(declare-fun b_lambda!22929 () Bool)

(assert (= b_lambda!22921 (or (and start!106290 b_free!27499) b_lambda!22929)))

(declare-fun b_lambda!22931 () Bool)

(assert (= b_lambda!22925 (or (and start!106290 b_free!27499) b_lambda!22931)))

(declare-fun b_lambda!22933 () Bool)

(assert (= b_lambda!22919 (or (and start!106290 b_free!27499) b_lambda!22933)))

(declare-fun b_lambda!22935 () Bool)

(assert (= b_lambda!22923 (or (and start!106290 b_free!27499) b_lambda!22935)))

(check-sat (not b!1264519) (not b!1264431) (not b!1264437) (not b!1264461) (not bm!62231) (not b!1264513) (not b_lambda!22929) (not b_next!27499) (not b!1264504) (not b!1264434) (not b!1264451) (not b!1264505) (not b!1264433) (not bm!62233) (not b!1264444) (not bm!62236) (not b!1264517) (not d!139043) (not b!1264430) (not bm!62239) (not b!1264448) (not b!1264538) (not b!1264445) (not b!1264446) (not b!1264522) (not b!1264447) (not b!1264549) (not bm!62214) (not b!1264432) (not b_lambda!22933) (not b!1264548) (not b!1264438) (not d!139039) (not b!1264435) (not d!139047) (not mapNonEmpty!50431) (not b!1264449) (not bm!62242) (not b_lambda!22935) tp_is_empty!32401 (not b!1264535) (not d!139041) (not b_lambda!22927) (not b_lambda!22931) (not b!1264520) b_and!45489 (not bm!62234) (not b!1264539) (not d!139045) (not b!1264452) (not bm!62215) (not b!1264515) (not b!1264459))
(check-sat b_and!45489 (not b_next!27499))
