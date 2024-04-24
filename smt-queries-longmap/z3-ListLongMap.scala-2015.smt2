; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35100 () Bool)

(assert start!35100)

(declare-fun b_free!7759 () Bool)

(declare-fun b_next!7759 () Bool)

(assert (=> start!35100 (= b_free!7759 (not b_next!7759))))

(declare-fun tp!26861 () Bool)

(declare-fun b_and!15007 () Bool)

(assert (=> start!35100 (= tp!26861 b_and!15007)))

(declare-fun b!352027 () Bool)

(declare-datatypes ((Unit!10865 0))(
  ( (Unit!10866) )
))
(declare-fun e!215566 () Unit!10865)

(declare-fun Unit!10867 () Unit!10865)

(assert (=> b!352027 (= e!215566 Unit!10867)))

(declare-fun res!195258 () Bool)

(declare-fun e!215568 () Bool)

(assert (=> start!35100 (=> (not res!195258) (not e!215568))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35100 (= res!195258 (validMask!0 mask!2385))))

(assert (=> start!35100 e!215568))

(assert (=> start!35100 true))

(declare-fun tp_is_empty!7711 () Bool)

(assert (=> start!35100 tp_is_empty!7711))

(assert (=> start!35100 tp!26861))

(declare-datatypes ((V!11259 0))(
  ( (V!11260 (val!3900 Int)) )
))
(declare-datatypes ((ValueCell!3512 0))(
  ( (ValueCellFull!3512 (v!6090 V!11259)) (EmptyCell!3512) )
))
(declare-datatypes ((array!19000 0))(
  ( (array!19001 (arr!9003 (Array (_ BitVec 32) ValueCell!3512)) (size!9355 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19000)

(declare-fun e!215567 () Bool)

(declare-fun array_inv!6650 (array!19000) Bool)

(assert (=> start!35100 (and (array_inv!6650 _values!1525) e!215567)))

(declare-datatypes ((array!19002 0))(
  ( (array!19003 (arr!9004 (Array (_ BitVec 32) (_ BitVec 64))) (size!9356 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19002)

(declare-fun array_inv!6651 (array!19002) Bool)

(assert (=> start!35100 (array_inv!6651 _keys!1895)))

(declare-fun b!352028 () Bool)

(declare-fun Unit!10868 () Unit!10865)

(assert (=> b!352028 (= e!215566 Unit!10868)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11259)

(declare-fun lt!165071 () Unit!10865)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11259)

(declare-fun lemmaArrayContainsKeyThenInListMap!342 (array!19002 array!19000 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 64) (_ BitVec 32) Int) Unit!10865)

(declare-fun arrayScanForKey!0 (array!19002 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352028 (= lt!165071 (lemmaArrayContainsKeyThenInListMap!342 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352028 false))

(declare-fun b!352029 () Bool)

(declare-fun e!215569 () Bool)

(declare-fun e!215570 () Bool)

(assert (=> b!352029 (= e!215569 e!215570)))

(declare-fun res!195260 () Bool)

(assert (=> b!352029 (=> (not res!195260) (not e!215570))))

(declare-fun lt!165070 () Bool)

(assert (=> b!352029 (= res!195260 (not lt!165070))))

(declare-fun lt!165073 () Unit!10865)

(assert (=> b!352029 (= lt!165073 e!215566)))

(declare-fun c!53492 () Bool)

(assert (=> b!352029 (= c!53492 lt!165070)))

(declare-fun arrayContainsKey!0 (array!19002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352029 (= lt!165070 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!352030 () Bool)

(declare-fun e!215564 () Bool)

(assert (=> b!352030 (= e!215564 tp_is_empty!7711)))

(declare-fun b!352031 () Bool)

(assert (=> b!352031 (= e!215568 e!215569)))

(declare-fun res!195257 () Bool)

(assert (=> b!352031 (=> (not res!195257) (not e!215569))))

(declare-datatypes ((SeekEntryResult!3418 0))(
  ( (MissingZero!3418 (index!15851 (_ BitVec 32))) (Found!3418 (index!15852 (_ BitVec 32))) (Intermediate!3418 (undefined!4230 Bool) (index!15853 (_ BitVec 32)) (x!34987 (_ BitVec 32))) (Undefined!3418) (MissingVacant!3418 (index!15854 (_ BitVec 32))) )
))
(declare-fun lt!165072 () SeekEntryResult!3418)

(get-info :version)

(assert (=> b!352031 (= res!195257 (and (not ((_ is Found!3418) lt!165072)) (not ((_ is MissingZero!3418) lt!165072)) ((_ is MissingVacant!3418) lt!165072)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19002 (_ BitVec 32)) SeekEntryResult!3418)

(assert (=> b!352031 (= lt!165072 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352032 () Bool)

(declare-fun res!195263 () Bool)

(assert (=> b!352032 (=> (not res!195263) (not e!215568))))

(assert (=> b!352032 (= res!195263 (and (= (size!9355 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9356 _keys!1895) (size!9355 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352033 () Bool)

(declare-fun res!195261 () Bool)

(assert (=> b!352033 (=> (not res!195261) (not e!215568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352033 (= res!195261 (validKeyInArray!0 k0!1348))))

(declare-fun b!352034 () Bool)

(declare-fun e!215565 () Bool)

(declare-fun mapRes!13044 () Bool)

(assert (=> b!352034 (= e!215567 (and e!215565 mapRes!13044))))

(declare-fun condMapEmpty!13044 () Bool)

(declare-fun mapDefault!13044 () ValueCell!3512)

(assert (=> b!352034 (= condMapEmpty!13044 (= (arr!9003 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3512)) mapDefault!13044)))))

(declare-fun b!352035 () Bool)

(declare-fun res!195256 () Bool)

(assert (=> b!352035 (=> (not res!195256) (not e!215568))))

(declare-datatypes ((tuple2!5542 0))(
  ( (tuple2!5543 (_1!2782 (_ BitVec 64)) (_2!2782 V!11259)) )
))
(declare-datatypes ((List!5146 0))(
  ( (Nil!5143) (Cons!5142 (h!5998 tuple2!5542) (t!10280 List!5146)) )
))
(declare-datatypes ((ListLongMap!4457 0))(
  ( (ListLongMap!4458 (toList!2244 List!5146)) )
))
(declare-fun contains!2334 (ListLongMap!4457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1772 (array!19002 array!19000 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 32) Int) ListLongMap!4457)

(assert (=> b!352035 (= res!195256 (not (contains!2334 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13044 () Bool)

(declare-fun tp!26862 () Bool)

(assert (=> mapNonEmpty!13044 (= mapRes!13044 (and tp!26862 e!215564))))

(declare-fun mapValue!13044 () ValueCell!3512)

(declare-fun mapRest!13044 () (Array (_ BitVec 32) ValueCell!3512))

(declare-fun mapKey!13044 () (_ BitVec 32))

(assert (=> mapNonEmpty!13044 (= (arr!9003 _values!1525) (store mapRest!13044 mapKey!13044 mapValue!13044))))

(declare-fun b!352036 () Bool)

(assert (=> b!352036 (= e!215565 tp_is_empty!7711)))

(declare-fun b!352037 () Bool)

(declare-fun res!195255 () Bool)

(assert (=> b!352037 (=> (not res!195255) (not e!215568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19002 (_ BitVec 32)) Bool)

(assert (=> b!352037 (= res!195255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352038 () Bool)

(declare-fun res!195259 () Bool)

(assert (=> b!352038 (=> (not res!195259) (not e!215568))))

(declare-datatypes ((List!5147 0))(
  ( (Nil!5144) (Cons!5143 (h!5999 (_ BitVec 64)) (t!10281 List!5147)) )
))
(declare-fun arrayNoDuplicates!0 (array!19002 (_ BitVec 32) List!5147) Bool)

(assert (=> b!352038 (= res!195259 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5144))))

(declare-fun b!352039 () Bool)

(declare-fun res!195262 () Bool)

(assert (=> b!352039 (=> (not res!195262) (not e!215570))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!352039 (= res!195262 (inRange!0 (index!15854 lt!165072) mask!2385))))

(declare-fun mapIsEmpty!13044 () Bool)

(assert (=> mapIsEmpty!13044 mapRes!13044))

(declare-fun b!352040 () Bool)

(assert (=> b!352040 (= e!215570 (or (bvslt (index!15854 lt!165072) #b00000000000000000000000000000000) (bvsge (index!15854 lt!165072) (size!9356 _keys!1895))))))

(assert (= (and start!35100 res!195258) b!352032))

(assert (= (and b!352032 res!195263) b!352037))

(assert (= (and b!352037 res!195255) b!352038))

(assert (= (and b!352038 res!195259) b!352033))

(assert (= (and b!352033 res!195261) b!352035))

(assert (= (and b!352035 res!195256) b!352031))

(assert (= (and b!352031 res!195257) b!352029))

(assert (= (and b!352029 c!53492) b!352028))

(assert (= (and b!352029 (not c!53492)) b!352027))

(assert (= (and b!352029 res!195260) b!352039))

(assert (= (and b!352039 res!195262) b!352040))

(assert (= (and b!352034 condMapEmpty!13044) mapIsEmpty!13044))

(assert (= (and b!352034 (not condMapEmpty!13044)) mapNonEmpty!13044))

(assert (= (and mapNonEmpty!13044 ((_ is ValueCellFull!3512) mapValue!13044)) b!352030))

(assert (= (and b!352034 ((_ is ValueCellFull!3512) mapDefault!13044)) b!352036))

(assert (= start!35100 b!352034))

(declare-fun m!352053 () Bool)

(assert (=> b!352037 m!352053))

(declare-fun m!352055 () Bool)

(assert (=> start!35100 m!352055))

(declare-fun m!352057 () Bool)

(assert (=> start!35100 m!352057))

(declare-fun m!352059 () Bool)

(assert (=> start!35100 m!352059))

(declare-fun m!352061 () Bool)

(assert (=> b!352039 m!352061))

(declare-fun m!352063 () Bool)

(assert (=> mapNonEmpty!13044 m!352063))

(declare-fun m!352065 () Bool)

(assert (=> b!352029 m!352065))

(declare-fun m!352067 () Bool)

(assert (=> b!352038 m!352067))

(declare-fun m!352069 () Bool)

(assert (=> b!352031 m!352069))

(declare-fun m!352071 () Bool)

(assert (=> b!352035 m!352071))

(assert (=> b!352035 m!352071))

(declare-fun m!352073 () Bool)

(assert (=> b!352035 m!352073))

(declare-fun m!352075 () Bool)

(assert (=> b!352028 m!352075))

(assert (=> b!352028 m!352075))

(declare-fun m!352077 () Bool)

(assert (=> b!352028 m!352077))

(declare-fun m!352079 () Bool)

(assert (=> b!352033 m!352079))

(check-sat b_and!15007 (not b!352028) (not b!352033) (not b!352035) (not b!352039) (not b_next!7759) (not b!352038) tp_is_empty!7711 (not start!35100) (not b!352037) (not b!352031) (not b!352029) (not mapNonEmpty!13044))
(check-sat b_and!15007 (not b_next!7759))
(get-model)

(declare-fun d!71533 () Bool)

(declare-fun e!215623 () Bool)

(assert (=> d!71533 e!215623))

(declare-fun res!195320 () Bool)

(assert (=> d!71533 (=> res!195320 e!215623)))

(declare-fun lt!165108 () Bool)

(assert (=> d!71533 (= res!195320 (not lt!165108))))

(declare-fun lt!165107 () Bool)

(assert (=> d!71533 (= lt!165108 lt!165107)))

(declare-fun lt!165109 () Unit!10865)

(declare-fun e!215624 () Unit!10865)

(assert (=> d!71533 (= lt!165109 e!215624)))

(declare-fun c!53501 () Bool)

(assert (=> d!71533 (= c!53501 lt!165107)))

(declare-fun containsKey!343 (List!5146 (_ BitVec 64)) Bool)

(assert (=> d!71533 (= lt!165107 (containsKey!343 (toList!2244 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71533 (= (contains!2334 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165108)))

(declare-fun b!352131 () Bool)

(declare-fun lt!165106 () Unit!10865)

(assert (=> b!352131 (= e!215624 lt!165106)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!291 (List!5146 (_ BitVec 64)) Unit!10865)

(assert (=> b!352131 (= lt!165106 (lemmaContainsKeyImpliesGetValueByKeyDefined!291 (toList!2244 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!358 0))(
  ( (Some!357 (v!6093 V!11259)) (None!356) )
))
(declare-fun isDefined!292 (Option!358) Bool)

(declare-fun getValueByKey!352 (List!5146 (_ BitVec 64)) Option!358)

(assert (=> b!352131 (isDefined!292 (getValueByKey!352 (toList!2244 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352132 () Bool)

(declare-fun Unit!10876 () Unit!10865)

(assert (=> b!352132 (= e!215624 Unit!10876)))

(declare-fun b!352133 () Bool)

(assert (=> b!352133 (= e!215623 (isDefined!292 (getValueByKey!352 (toList!2244 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71533 c!53501) b!352131))

(assert (= (and d!71533 (not c!53501)) b!352132))

(assert (= (and d!71533 (not res!195320)) b!352133))

(declare-fun m!352137 () Bool)

(assert (=> d!71533 m!352137))

(declare-fun m!352139 () Bool)

(assert (=> b!352131 m!352139))

(declare-fun m!352141 () Bool)

(assert (=> b!352131 m!352141))

(assert (=> b!352131 m!352141))

(declare-fun m!352143 () Bool)

(assert (=> b!352131 m!352143))

(assert (=> b!352133 m!352141))

(assert (=> b!352133 m!352141))

(assert (=> b!352133 m!352143))

(assert (=> b!352035 d!71533))

(declare-fun b!352176 () Bool)

(declare-fun e!215652 () Unit!10865)

(declare-fun lt!165163 () Unit!10865)

(assert (=> b!352176 (= e!215652 lt!165163)))

(declare-fun lt!165165 () ListLongMap!4457)

(declare-fun getCurrentListMapNoExtraKeys!609 (array!19002 array!19000 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 32) Int) ListLongMap!4457)

(assert (=> b!352176 (= lt!165165 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165173 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165170 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165170 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165155 () Unit!10865)

(declare-fun addStillContains!269 (ListLongMap!4457 (_ BitVec 64) V!11259 (_ BitVec 64)) Unit!10865)

(assert (=> b!352176 (= lt!165155 (addStillContains!269 lt!165165 lt!165173 zeroValue!1467 lt!165170))))

(declare-fun +!744 (ListLongMap!4457 tuple2!5542) ListLongMap!4457)

(assert (=> b!352176 (contains!2334 (+!744 lt!165165 (tuple2!5543 lt!165173 zeroValue!1467)) lt!165170)))

(declare-fun lt!165166 () Unit!10865)

(assert (=> b!352176 (= lt!165166 lt!165155)))

(declare-fun lt!165167 () ListLongMap!4457)

(assert (=> b!352176 (= lt!165167 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165164 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165164 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165174 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165174 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165159 () Unit!10865)

(declare-fun addApplyDifferent!269 (ListLongMap!4457 (_ BitVec 64) V!11259 (_ BitVec 64)) Unit!10865)

(assert (=> b!352176 (= lt!165159 (addApplyDifferent!269 lt!165167 lt!165164 minValue!1467 lt!165174))))

(declare-fun apply!293 (ListLongMap!4457 (_ BitVec 64)) V!11259)

(assert (=> b!352176 (= (apply!293 (+!744 lt!165167 (tuple2!5543 lt!165164 minValue!1467)) lt!165174) (apply!293 lt!165167 lt!165174))))

(declare-fun lt!165162 () Unit!10865)

(assert (=> b!352176 (= lt!165162 lt!165159)))

(declare-fun lt!165175 () ListLongMap!4457)

(assert (=> b!352176 (= lt!165175 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165171 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165161 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165161 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165154 () Unit!10865)

(assert (=> b!352176 (= lt!165154 (addApplyDifferent!269 lt!165175 lt!165171 zeroValue!1467 lt!165161))))

(assert (=> b!352176 (= (apply!293 (+!744 lt!165175 (tuple2!5543 lt!165171 zeroValue!1467)) lt!165161) (apply!293 lt!165175 lt!165161))))

(declare-fun lt!165169 () Unit!10865)

(assert (=> b!352176 (= lt!165169 lt!165154)))

(declare-fun lt!165160 () ListLongMap!4457)

(assert (=> b!352176 (= lt!165160 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165168 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165158 () (_ BitVec 64))

(assert (=> b!352176 (= lt!165158 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352176 (= lt!165163 (addApplyDifferent!269 lt!165160 lt!165168 minValue!1467 lt!165158))))

(assert (=> b!352176 (= (apply!293 (+!744 lt!165160 (tuple2!5543 lt!165168 minValue!1467)) lt!165158) (apply!293 lt!165160 lt!165158))))

(declare-fun b!352177 () Bool)

(declare-fun c!53515 () Bool)

(assert (=> b!352177 (= c!53515 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!215653 () ListLongMap!4457)

(declare-fun e!215660 () ListLongMap!4457)

(assert (=> b!352177 (= e!215653 e!215660)))

(declare-fun e!215657 () Bool)

(declare-fun lt!165157 () ListLongMap!4457)

(declare-fun b!352178 () Bool)

(declare-fun get!4815 (ValueCell!3512 V!11259) V!11259)

(declare-fun dynLambda!636 (Int (_ BitVec 64)) V!11259)

(assert (=> b!352178 (= e!215657 (= (apply!293 lt!165157 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)) (get!4815 (select (arr!9003 _values!1525) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9355 _values!1525)))))

(assert (=> b!352178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9356 _keys!1895)))))

(declare-fun b!352179 () Bool)

(declare-fun e!215651 () Bool)

(declare-fun e!215663 () Bool)

(assert (=> b!352179 (= e!215651 e!215663)))

(declare-fun res!195343 () Bool)

(declare-fun call!27040 () Bool)

(assert (=> b!352179 (= res!195343 call!27040)))

(assert (=> b!352179 (=> (not res!195343) (not e!215663))))

(declare-fun b!352180 () Bool)

(declare-fun e!215661 () Bool)

(assert (=> b!352180 (= e!215661 (= (apply!293 lt!165157 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!352181 () Bool)

(declare-fun call!27036 () ListLongMap!4457)

(assert (=> b!352181 (= e!215660 call!27036)))

(declare-fun bm!27032 () Bool)

(declare-fun call!27037 () ListLongMap!4457)

(assert (=> bm!27032 (= call!27037 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!352182 () Bool)

(declare-fun res!195341 () Bool)

(declare-fun e!215659 () Bool)

(assert (=> b!352182 (=> (not res!195341) (not e!215659))))

(declare-fun e!215654 () Bool)

(assert (=> b!352182 (= res!195341 e!215654)))

(declare-fun res!195339 () Bool)

(assert (=> b!352182 (=> res!195339 e!215654)))

(declare-fun e!215662 () Bool)

(assert (=> b!352182 (= res!195339 (not e!215662))))

(declare-fun res!195347 () Bool)

(assert (=> b!352182 (=> (not res!195347) (not e!215662))))

(assert (=> b!352182 (= res!195347 (bvslt #b00000000000000000000000000000000 (size!9356 _keys!1895)))))

(declare-fun b!352183 () Bool)

(declare-fun e!215655 () ListLongMap!4457)

(declare-fun call!27035 () ListLongMap!4457)

(assert (=> b!352183 (= e!215655 (+!744 call!27035 (tuple2!5543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!352184 () Bool)

(declare-fun call!27038 () ListLongMap!4457)

(assert (=> b!352184 (= e!215660 call!27038)))

(declare-fun b!352185 () Bool)

(declare-fun Unit!10877 () Unit!10865)

(assert (=> b!352185 (= e!215652 Unit!10877)))

(declare-fun b!352186 () Bool)

(assert (=> b!352186 (= e!215662 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27034 () Bool)

(assert (=> bm!27034 (= call!27036 call!27035)))

(declare-fun b!352187 () Bool)

(declare-fun e!215658 () Bool)

(assert (=> b!352187 (= e!215658 e!215661)))

(declare-fun res!195340 () Bool)

(declare-fun call!27041 () Bool)

(assert (=> b!352187 (= res!195340 call!27041)))

(assert (=> b!352187 (=> (not res!195340) (not e!215661))))

(declare-fun b!352188 () Bool)

(assert (=> b!352188 (= e!215655 e!215653)))

(declare-fun c!53519 () Bool)

(assert (=> b!352188 (= c!53519 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352189 () Bool)

(assert (=> b!352189 (= e!215654 e!215657)))

(declare-fun res!195342 () Bool)

(assert (=> b!352189 (=> (not res!195342) (not e!215657))))

(assert (=> b!352189 (= res!195342 (contains!2334 lt!165157 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9356 _keys!1895)))))

(declare-fun bm!27035 () Bool)

(assert (=> bm!27035 (= call!27041 (contains!2334 lt!165157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352190 () Bool)

(assert (=> b!352190 (= e!215659 e!215651)))

(declare-fun c!53514 () Bool)

(assert (=> b!352190 (= c!53514 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!53517 () Bool)

(declare-fun bm!27036 () Bool)

(declare-fun call!27039 () ListLongMap!4457)

(assert (=> bm!27036 (= call!27035 (+!744 (ite c!53517 call!27037 (ite c!53519 call!27039 call!27038)) (ite (or c!53517 c!53519) (tuple2!5543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!352191 () Bool)

(assert (=> b!352191 (= e!215653 call!27036)))

(declare-fun bm!27037 () Bool)

(assert (=> bm!27037 (= call!27040 (contains!2334 lt!165157 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352192 () Bool)

(assert (=> b!352192 (= e!215658 (not call!27041))))

(declare-fun b!352193 () Bool)

(declare-fun res!195344 () Bool)

(assert (=> b!352193 (=> (not res!195344) (not e!215659))))

(assert (=> b!352193 (= res!195344 e!215658)))

(declare-fun c!53518 () Bool)

(assert (=> b!352193 (= c!53518 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27033 () Bool)

(assert (=> bm!27033 (= call!27038 call!27039)))

(declare-fun d!71535 () Bool)

(assert (=> d!71535 e!215659))

(declare-fun res!195346 () Bool)

(assert (=> d!71535 (=> (not res!195346) (not e!215659))))

(assert (=> d!71535 (= res!195346 (or (bvsge #b00000000000000000000000000000000 (size!9356 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9356 _keys!1895)))))))

(declare-fun lt!165156 () ListLongMap!4457)

(assert (=> d!71535 (= lt!165157 lt!165156)))

(declare-fun lt!165172 () Unit!10865)

(assert (=> d!71535 (= lt!165172 e!215652)))

(declare-fun c!53516 () Bool)

(declare-fun e!215656 () Bool)

(assert (=> d!71535 (= c!53516 e!215656)))

(declare-fun res!195345 () Bool)

(assert (=> d!71535 (=> (not res!195345) (not e!215656))))

(assert (=> d!71535 (= res!195345 (bvslt #b00000000000000000000000000000000 (size!9356 _keys!1895)))))

(assert (=> d!71535 (= lt!165156 e!215655)))

(assert (=> d!71535 (= c!53517 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71535 (validMask!0 mask!2385)))

(assert (=> d!71535 (= (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165157)))

(declare-fun b!352194 () Bool)

(assert (=> b!352194 (= e!215651 (not call!27040))))

(declare-fun bm!27038 () Bool)

(assert (=> bm!27038 (= call!27039 call!27037)))

(declare-fun b!352195 () Bool)

(assert (=> b!352195 (= e!215656 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352196 () Bool)

(assert (=> b!352196 (= e!215663 (= (apply!293 lt!165157 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(assert (= (and d!71535 c!53517) b!352183))

(assert (= (and d!71535 (not c!53517)) b!352188))

(assert (= (and b!352188 c!53519) b!352191))

(assert (= (and b!352188 (not c!53519)) b!352177))

(assert (= (and b!352177 c!53515) b!352181))

(assert (= (and b!352177 (not c!53515)) b!352184))

(assert (= (or b!352181 b!352184) bm!27033))

(assert (= (or b!352191 bm!27033) bm!27038))

(assert (= (or b!352191 b!352181) bm!27034))

(assert (= (or b!352183 bm!27038) bm!27032))

(assert (= (or b!352183 bm!27034) bm!27036))

(assert (= (and d!71535 res!195345) b!352195))

(assert (= (and d!71535 c!53516) b!352176))

(assert (= (and d!71535 (not c!53516)) b!352185))

(assert (= (and d!71535 res!195346) b!352182))

(assert (= (and b!352182 res!195347) b!352186))

(assert (= (and b!352182 (not res!195339)) b!352189))

(assert (= (and b!352189 res!195342) b!352178))

(assert (= (and b!352182 res!195341) b!352193))

(assert (= (and b!352193 c!53518) b!352187))

(assert (= (and b!352193 (not c!53518)) b!352192))

(assert (= (and b!352187 res!195340) b!352180))

(assert (= (or b!352187 b!352192) bm!27035))

(assert (= (and b!352193 res!195344) b!352190))

(assert (= (and b!352190 c!53514) b!352179))

(assert (= (and b!352190 (not c!53514)) b!352194))

(assert (= (and b!352179 res!195343) b!352196))

(assert (= (or b!352179 b!352194) bm!27037))

(declare-fun b_lambda!8533 () Bool)

(assert (=> (not b_lambda!8533) (not b!352178)))

(declare-fun t!10286 () Bool)

(declare-fun tb!3093 () Bool)

(assert (=> (and start!35100 (= defaultEntry!1528 defaultEntry!1528) t!10286) tb!3093))

(declare-fun result!5625 () Bool)

(assert (=> tb!3093 (= result!5625 tp_is_empty!7711)))

(assert (=> b!352178 t!10286))

(declare-fun b_and!15013 () Bool)

(assert (= b_and!15007 (and (=> t!10286 result!5625) b_and!15013)))

(declare-fun m!352145 () Bool)

(assert (=> b!352180 m!352145))

(declare-fun m!352147 () Bool)

(assert (=> bm!27035 m!352147))

(declare-fun m!352149 () Bool)

(assert (=> bm!27036 m!352149))

(declare-fun m!352151 () Bool)

(assert (=> b!352189 m!352151))

(assert (=> b!352189 m!352151))

(declare-fun m!352153 () Bool)

(assert (=> b!352189 m!352153))

(declare-fun m!352155 () Bool)

(assert (=> bm!27037 m!352155))

(assert (=> d!71535 m!352055))

(declare-fun m!352157 () Bool)

(assert (=> b!352178 m!352157))

(assert (=> b!352178 m!352151))

(declare-fun m!352159 () Bool)

(assert (=> b!352178 m!352159))

(assert (=> b!352178 m!352157))

(assert (=> b!352178 m!352159))

(declare-fun m!352161 () Bool)

(assert (=> b!352178 m!352161))

(assert (=> b!352178 m!352151))

(declare-fun m!352163 () Bool)

(assert (=> b!352178 m!352163))

(assert (=> b!352195 m!352151))

(assert (=> b!352195 m!352151))

(declare-fun m!352165 () Bool)

(assert (=> b!352195 m!352165))

(assert (=> b!352176 m!352151))

(declare-fun m!352167 () Bool)

(assert (=> b!352176 m!352167))

(declare-fun m!352169 () Bool)

(assert (=> b!352176 m!352169))

(declare-fun m!352171 () Bool)

(assert (=> b!352176 m!352171))

(declare-fun m!352173 () Bool)

(assert (=> b!352176 m!352173))

(declare-fun m!352175 () Bool)

(assert (=> b!352176 m!352175))

(declare-fun m!352177 () Bool)

(assert (=> b!352176 m!352177))

(declare-fun m!352179 () Bool)

(assert (=> b!352176 m!352179))

(declare-fun m!352181 () Bool)

(assert (=> b!352176 m!352181))

(declare-fun m!352183 () Bool)

(assert (=> b!352176 m!352183))

(declare-fun m!352185 () Bool)

(assert (=> b!352176 m!352185))

(assert (=> b!352176 m!352167))

(declare-fun m!352187 () Bool)

(assert (=> b!352176 m!352187))

(declare-fun m!352189 () Bool)

(assert (=> b!352176 m!352189))

(declare-fun m!352191 () Bool)

(assert (=> b!352176 m!352191))

(assert (=> b!352176 m!352177))

(declare-fun m!352193 () Bool)

(assert (=> b!352176 m!352193))

(declare-fun m!352195 () Bool)

(assert (=> b!352176 m!352195))

(assert (=> b!352176 m!352181))

(assert (=> b!352176 m!352191))

(declare-fun m!352197 () Bool)

(assert (=> b!352176 m!352197))

(assert (=> b!352186 m!352151))

(assert (=> b!352186 m!352151))

(assert (=> b!352186 m!352165))

(declare-fun m!352199 () Bool)

(assert (=> b!352183 m!352199))

(declare-fun m!352201 () Bool)

(assert (=> b!352196 m!352201))

(assert (=> bm!27032 m!352175))

(assert (=> b!352035 d!71535))

(declare-fun d!71537 () Bool)

(assert (=> d!71537 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35100 d!71537))

(declare-fun d!71539 () Bool)

(assert (=> d!71539 (= (array_inv!6650 _values!1525) (bvsge (size!9355 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35100 d!71539))

(declare-fun d!71541 () Bool)

(assert (=> d!71541 (= (array_inv!6651 _keys!1895) (bvsge (size!9356 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35100 d!71541))

(declare-fun b!352211 () Bool)

(declare-fun e!215672 () SeekEntryResult!3418)

(declare-fun lt!165183 () SeekEntryResult!3418)

(assert (=> b!352211 (= e!215672 (MissingZero!3418 (index!15853 lt!165183)))))

(declare-fun b!352212 () Bool)

(declare-fun c!53527 () Bool)

(declare-fun lt!165184 () (_ BitVec 64))

(assert (=> b!352212 (= c!53527 (= lt!165184 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!215670 () SeekEntryResult!3418)

(assert (=> b!352212 (= e!215670 e!215672)))

(declare-fun b!352213 () Bool)

(assert (=> b!352213 (= e!215670 (Found!3418 (index!15853 lt!165183)))))

(declare-fun b!352214 () Bool)

(declare-fun e!215671 () SeekEntryResult!3418)

(assert (=> b!352214 (= e!215671 e!215670)))

(assert (=> b!352214 (= lt!165184 (select (arr!9004 _keys!1895) (index!15853 lt!165183)))))

(declare-fun c!53528 () Bool)

(assert (=> b!352214 (= c!53528 (= lt!165184 k0!1348))))

(declare-fun d!71543 () Bool)

(declare-fun lt!165182 () SeekEntryResult!3418)

(assert (=> d!71543 (and (or ((_ is Undefined!3418) lt!165182) (not ((_ is Found!3418) lt!165182)) (and (bvsge (index!15852 lt!165182) #b00000000000000000000000000000000) (bvslt (index!15852 lt!165182) (size!9356 _keys!1895)))) (or ((_ is Undefined!3418) lt!165182) ((_ is Found!3418) lt!165182) (not ((_ is MissingZero!3418) lt!165182)) (and (bvsge (index!15851 lt!165182) #b00000000000000000000000000000000) (bvslt (index!15851 lt!165182) (size!9356 _keys!1895)))) (or ((_ is Undefined!3418) lt!165182) ((_ is Found!3418) lt!165182) ((_ is MissingZero!3418) lt!165182) (not ((_ is MissingVacant!3418) lt!165182)) (and (bvsge (index!15854 lt!165182) #b00000000000000000000000000000000) (bvslt (index!15854 lt!165182) (size!9356 _keys!1895)))) (or ((_ is Undefined!3418) lt!165182) (ite ((_ is Found!3418) lt!165182) (= (select (arr!9004 _keys!1895) (index!15852 lt!165182)) k0!1348) (ite ((_ is MissingZero!3418) lt!165182) (= (select (arr!9004 _keys!1895) (index!15851 lt!165182)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3418) lt!165182) (= (select (arr!9004 _keys!1895) (index!15854 lt!165182)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71543 (= lt!165182 e!215671)))

(declare-fun c!53526 () Bool)

(assert (=> d!71543 (= c!53526 (and ((_ is Intermediate!3418) lt!165183) (undefined!4230 lt!165183)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19002 (_ BitVec 32)) SeekEntryResult!3418)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71543 (= lt!165183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71543 (validMask!0 mask!2385)))

(assert (=> d!71543 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165182)))

(declare-fun b!352215 () Bool)

(assert (=> b!352215 (= e!215671 Undefined!3418)))

(declare-fun b!352216 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19002 (_ BitVec 32)) SeekEntryResult!3418)

(assert (=> b!352216 (= e!215672 (seekKeyOrZeroReturnVacant!0 (x!34987 lt!165183) (index!15853 lt!165183) (index!15853 lt!165183) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71543 c!53526) b!352215))

(assert (= (and d!71543 (not c!53526)) b!352214))

(assert (= (and b!352214 c!53528) b!352213))

(assert (= (and b!352214 (not c!53528)) b!352212))

(assert (= (and b!352212 c!53527) b!352211))

(assert (= (and b!352212 (not c!53527)) b!352216))

(declare-fun m!352203 () Bool)

(assert (=> b!352214 m!352203))

(declare-fun m!352205 () Bool)

(assert (=> d!71543 m!352205))

(assert (=> d!71543 m!352055))

(declare-fun m!352207 () Bool)

(assert (=> d!71543 m!352207))

(declare-fun m!352209 () Bool)

(assert (=> d!71543 m!352209))

(declare-fun m!352211 () Bool)

(assert (=> d!71543 m!352211))

(assert (=> d!71543 m!352209))

(declare-fun m!352213 () Bool)

(assert (=> d!71543 m!352213))

(declare-fun m!352215 () Bool)

(assert (=> b!352216 m!352215))

(assert (=> b!352031 d!71543))

(declare-fun d!71545 () Bool)

(assert (=> d!71545 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352033 d!71545))

(declare-fun d!71547 () Bool)

(assert (=> d!71547 (contains!2334 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!165187 () Unit!10865)

(declare-fun choose!1315 (array!19002 array!19000 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 64) (_ BitVec 32) Int) Unit!10865)

(assert (=> d!71547 (= lt!165187 (choose!1315 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71547 (validMask!0 mask!2385)))

(assert (=> d!71547 (= (lemmaArrayContainsKeyThenInListMap!342 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!165187)))

(declare-fun bs!12002 () Bool)

(assert (= bs!12002 d!71547))

(assert (=> bs!12002 m!352071))

(assert (=> bs!12002 m!352071))

(assert (=> bs!12002 m!352073))

(assert (=> bs!12002 m!352075))

(declare-fun m!352217 () Bool)

(assert (=> bs!12002 m!352217))

(assert (=> bs!12002 m!352055))

(assert (=> b!352028 d!71547))

(declare-fun d!71549 () Bool)

(declare-fun lt!165190 () (_ BitVec 32))

(assert (=> d!71549 (and (or (bvslt lt!165190 #b00000000000000000000000000000000) (bvsge lt!165190 (size!9356 _keys!1895)) (and (bvsge lt!165190 #b00000000000000000000000000000000) (bvslt lt!165190 (size!9356 _keys!1895)))) (bvsge lt!165190 #b00000000000000000000000000000000) (bvslt lt!165190 (size!9356 _keys!1895)) (= (select (arr!9004 _keys!1895) lt!165190) k0!1348))))

(declare-fun e!215675 () (_ BitVec 32))

(assert (=> d!71549 (= lt!165190 e!215675)))

(declare-fun c!53531 () Bool)

(assert (=> d!71549 (= c!53531 (= (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9356 _keys!1895)) (bvslt (size!9356 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71549 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!165190)))

(declare-fun b!352221 () Bool)

(assert (=> b!352221 (= e!215675 #b00000000000000000000000000000000)))

(declare-fun b!352222 () Bool)

(assert (=> b!352222 (= e!215675 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71549 c!53531) b!352221))

(assert (= (and d!71549 (not c!53531)) b!352222))

(declare-fun m!352219 () Bool)

(assert (=> d!71549 m!352219))

(assert (=> d!71549 m!352151))

(declare-fun m!352221 () Bool)

(assert (=> b!352222 m!352221))

(assert (=> b!352028 d!71549))

(declare-fun bm!27041 () Bool)

(declare-fun call!27044 () Bool)

(assert (=> bm!27041 (= call!27044 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71551 () Bool)

(declare-fun res!195352 () Bool)

(declare-fun e!215683 () Bool)

(assert (=> d!71551 (=> res!195352 e!215683)))

(assert (=> d!71551 (= res!195352 (bvsge #b00000000000000000000000000000000 (size!9356 _keys!1895)))))

(assert (=> d!71551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215683)))

(declare-fun b!352231 () Bool)

(declare-fun e!215682 () Bool)

(assert (=> b!352231 (= e!215682 call!27044)))

(declare-fun b!352232 () Bool)

(declare-fun e!215684 () Bool)

(assert (=> b!352232 (= e!215684 call!27044)))

(declare-fun b!352233 () Bool)

(assert (=> b!352233 (= e!215683 e!215682)))

(declare-fun c!53534 () Bool)

(assert (=> b!352233 (= c!53534 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352234 () Bool)

(assert (=> b!352234 (= e!215682 e!215684)))

(declare-fun lt!165198 () (_ BitVec 64))

(assert (=> b!352234 (= lt!165198 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165197 () Unit!10865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19002 (_ BitVec 64) (_ BitVec 32)) Unit!10865)

(assert (=> b!352234 (= lt!165197 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165198 #b00000000000000000000000000000000))))

(assert (=> b!352234 (arrayContainsKey!0 _keys!1895 lt!165198 #b00000000000000000000000000000000)))

(declare-fun lt!165199 () Unit!10865)

(assert (=> b!352234 (= lt!165199 lt!165197)))

(declare-fun res!195353 () Bool)

(assert (=> b!352234 (= res!195353 (= (seekEntryOrOpen!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3418 #b00000000000000000000000000000000)))))

(assert (=> b!352234 (=> (not res!195353) (not e!215684))))

(assert (= (and d!71551 (not res!195352)) b!352233))

(assert (= (and b!352233 c!53534) b!352234))

(assert (= (and b!352233 (not c!53534)) b!352231))

(assert (= (and b!352234 res!195353) b!352232))

(assert (= (or b!352232 b!352231) bm!27041))

(declare-fun m!352223 () Bool)

(assert (=> bm!27041 m!352223))

(assert (=> b!352233 m!352151))

(assert (=> b!352233 m!352151))

(assert (=> b!352233 m!352165))

(assert (=> b!352234 m!352151))

(declare-fun m!352225 () Bool)

(assert (=> b!352234 m!352225))

(declare-fun m!352227 () Bool)

(assert (=> b!352234 m!352227))

(assert (=> b!352234 m!352151))

(declare-fun m!352229 () Bool)

(assert (=> b!352234 m!352229))

(assert (=> b!352037 d!71551))

(declare-fun d!71553 () Bool)

(declare-fun res!195358 () Bool)

(declare-fun e!215689 () Bool)

(assert (=> d!71553 (=> res!195358 e!215689)))

(assert (=> d!71553 (= res!195358 (= (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71553 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215689)))

(declare-fun b!352239 () Bool)

(declare-fun e!215690 () Bool)

(assert (=> b!352239 (= e!215689 e!215690)))

(declare-fun res!195359 () Bool)

(assert (=> b!352239 (=> (not res!195359) (not e!215690))))

(assert (=> b!352239 (= res!195359 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9356 _keys!1895)))))

(declare-fun b!352240 () Bool)

(assert (=> b!352240 (= e!215690 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71553 (not res!195358)) b!352239))

(assert (= (and b!352239 res!195359) b!352240))

(assert (=> d!71553 m!352151))

(declare-fun m!352231 () Bool)

(assert (=> b!352240 m!352231))

(assert (=> b!352029 d!71553))

(declare-fun d!71555 () Bool)

(assert (=> d!71555 (= (inRange!0 (index!15854 lt!165072) mask!2385) (and (bvsge (index!15854 lt!165072) #b00000000000000000000000000000000) (bvslt (index!15854 lt!165072) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!352039 d!71555))

(declare-fun d!71557 () Bool)

(declare-fun res!195366 () Bool)

(declare-fun e!215702 () Bool)

(assert (=> d!71557 (=> res!195366 e!215702)))

(assert (=> d!71557 (= res!195366 (bvsge #b00000000000000000000000000000000 (size!9356 _keys!1895)))))

(assert (=> d!71557 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5144) e!215702)))

(declare-fun b!352251 () Bool)

(declare-fun e!215701 () Bool)

(declare-fun call!27047 () Bool)

(assert (=> b!352251 (= e!215701 call!27047)))

(declare-fun b!352252 () Bool)

(assert (=> b!352252 (= e!215701 call!27047)))

(declare-fun b!352253 () Bool)

(declare-fun e!215699 () Bool)

(declare-fun contains!2336 (List!5147 (_ BitVec 64)) Bool)

(assert (=> b!352253 (= e!215699 (contains!2336 Nil!5144 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352254 () Bool)

(declare-fun e!215700 () Bool)

(assert (=> b!352254 (= e!215700 e!215701)))

(declare-fun c!53537 () Bool)

(assert (=> b!352254 (= c!53537 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27044 () Bool)

(assert (=> bm!27044 (= call!27047 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53537 (Cons!5143 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) Nil!5144) Nil!5144)))))

(declare-fun b!352255 () Bool)

(assert (=> b!352255 (= e!215702 e!215700)))

(declare-fun res!195368 () Bool)

(assert (=> b!352255 (=> (not res!195368) (not e!215700))))

(assert (=> b!352255 (= res!195368 (not e!215699))))

(declare-fun res!195367 () Bool)

(assert (=> b!352255 (=> (not res!195367) (not e!215699))))

(assert (=> b!352255 (= res!195367 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71557 (not res!195366)) b!352255))

(assert (= (and b!352255 res!195367) b!352253))

(assert (= (and b!352255 res!195368) b!352254))

(assert (= (and b!352254 c!53537) b!352251))

(assert (= (and b!352254 (not c!53537)) b!352252))

(assert (= (or b!352251 b!352252) bm!27044))

(assert (=> b!352253 m!352151))

(assert (=> b!352253 m!352151))

(declare-fun m!352233 () Bool)

(assert (=> b!352253 m!352233))

(assert (=> b!352254 m!352151))

(assert (=> b!352254 m!352151))

(assert (=> b!352254 m!352165))

(assert (=> bm!27044 m!352151))

(declare-fun m!352235 () Bool)

(assert (=> bm!27044 m!352235))

(assert (=> b!352255 m!352151))

(assert (=> b!352255 m!352151))

(assert (=> b!352255 m!352165))

(assert (=> b!352038 d!71557))

(declare-fun b!352262 () Bool)

(declare-fun e!215708 () Bool)

(assert (=> b!352262 (= e!215708 tp_is_empty!7711)))

(declare-fun mapNonEmpty!13053 () Bool)

(declare-fun mapRes!13053 () Bool)

(declare-fun tp!26877 () Bool)

(assert (=> mapNonEmpty!13053 (= mapRes!13053 (and tp!26877 e!215708))))

(declare-fun mapRest!13053 () (Array (_ BitVec 32) ValueCell!3512))

(declare-fun mapValue!13053 () ValueCell!3512)

(declare-fun mapKey!13053 () (_ BitVec 32))

(assert (=> mapNonEmpty!13053 (= mapRest!13044 (store mapRest!13053 mapKey!13053 mapValue!13053))))

(declare-fun b!352263 () Bool)

(declare-fun e!215707 () Bool)

(assert (=> b!352263 (= e!215707 tp_is_empty!7711)))

(declare-fun condMapEmpty!13053 () Bool)

(declare-fun mapDefault!13053 () ValueCell!3512)

(assert (=> mapNonEmpty!13044 (= condMapEmpty!13053 (= mapRest!13044 ((as const (Array (_ BitVec 32) ValueCell!3512)) mapDefault!13053)))))

(assert (=> mapNonEmpty!13044 (= tp!26862 (and e!215707 mapRes!13053))))

(declare-fun mapIsEmpty!13053 () Bool)

(assert (=> mapIsEmpty!13053 mapRes!13053))

(assert (= (and mapNonEmpty!13044 condMapEmpty!13053) mapIsEmpty!13053))

(assert (= (and mapNonEmpty!13044 (not condMapEmpty!13053)) mapNonEmpty!13053))

(assert (= (and mapNonEmpty!13053 ((_ is ValueCellFull!3512) mapValue!13053)) b!352262))

(assert (= (and mapNonEmpty!13044 ((_ is ValueCellFull!3512) mapDefault!13053)) b!352263))

(declare-fun m!352237 () Bool)

(assert (=> mapNonEmpty!13053 m!352237))

(declare-fun b_lambda!8535 () Bool)

(assert (= b_lambda!8533 (or (and start!35100 b_free!7759) b_lambda!8535)))

(check-sat b_and!15013 (not b!352133) (not bm!27032) (not d!71547) (not bm!27044) (not b_next!7759) (not b!352186) (not b!352253) (not bm!27037) (not d!71535) (not bm!27036) (not b!352216) (not b!352222) (not b!352180) (not d!71543) (not b!352255) (not b!352234) (not b!352233) (not b!352240) (not b!352178) (not b!352195) (not b!352254) (not b!352131) (not bm!27035) (not b!352189) tp_is_empty!7711 (not mapNonEmpty!13053) (not b_lambda!8535) (not d!71533) (not b!352176) (not bm!27041) (not b!352196) (not b!352183))
(check-sat b_and!15013 (not b_next!7759))
