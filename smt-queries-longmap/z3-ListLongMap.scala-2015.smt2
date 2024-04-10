; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35116 () Bool)

(assert start!35116)

(declare-fun b_free!7761 () Bool)

(declare-fun b_next!7761 () Bool)

(assert (=> start!35116 (= b_free!7761 (not b_next!7761))))

(declare-fun tp!26868 () Bool)

(declare-fun b_and!14995 () Bool)

(assert (=> start!35116 (= tp!26868 b_and!14995)))

(declare-fun b!352122 () Bool)

(declare-fun e!215622 () Bool)

(declare-fun tp_is_empty!7713 () Bool)

(assert (=> b!352122 (= e!215622 tp_is_empty!7713)))

(declare-fun b!352123 () Bool)

(declare-fun res!195292 () Bool)

(declare-fun e!215625 () Bool)

(assert (=> b!352123 (=> (not res!195292) (not e!215625))))

(declare-datatypes ((array!19015 0))(
  ( (array!19016 (arr!9011 (Array (_ BitVec 32) (_ BitVec 64))) (size!9363 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19015)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19015 (_ BitVec 32)) Bool)

(assert (=> b!352123 (= res!195292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352124 () Bool)

(declare-fun res!195286 () Bool)

(assert (=> b!352124 (=> (not res!195286) (not e!215625))))

(declare-datatypes ((List!5245 0))(
  ( (Nil!5242) (Cons!5241 (h!6097 (_ BitVec 64)) (t!10387 List!5245)) )
))
(declare-fun arrayNoDuplicates!0 (array!19015 (_ BitVec 32) List!5245) Bool)

(assert (=> b!352124 (= res!195286 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5242))))

(declare-fun b!352125 () Bool)

(declare-datatypes ((Unit!10889 0))(
  ( (Unit!10890) )
))
(declare-fun e!215627 () Unit!10889)

(declare-fun Unit!10891 () Unit!10889)

(assert (=> b!352125 (= e!215627 Unit!10891)))

(declare-datatypes ((V!11261 0))(
  ( (V!11262 (val!3901 Int)) )
))
(declare-fun zeroValue!1467 () V!11261)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3513 0))(
  ( (ValueCellFull!3513 (v!6090 V!11261)) (EmptyCell!3513) )
))
(declare-datatypes ((array!19017 0))(
  ( (array!19018 (arr!9012 (Array (_ BitVec 32) ValueCell!3513)) (size!9364 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19017)

(declare-fun lt!165066 () Unit!10889)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11261)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!333 (array!19015 array!19017 (_ BitVec 32) (_ BitVec 32) V!11261 V!11261 (_ BitVec 64) (_ BitVec 32) Int) Unit!10889)

(declare-fun arrayScanForKey!0 (array!19015 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352125 (= lt!165066 (lemmaArrayContainsKeyThenInListMap!333 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352125 false))

(declare-fun mapIsEmpty!13047 () Bool)

(declare-fun mapRes!13047 () Bool)

(assert (=> mapIsEmpty!13047 mapRes!13047))

(declare-fun b!352126 () Bool)

(declare-fun Unit!10892 () Unit!10889)

(assert (=> b!352126 (= e!215627 Unit!10892)))

(declare-fun b!352127 () Bool)

(declare-fun res!195289 () Bool)

(declare-fun e!215624 () Bool)

(assert (=> b!352127 (=> (not res!195289) (not e!215624))))

(declare-datatypes ((SeekEntryResult!3466 0))(
  ( (MissingZero!3466 (index!16043 (_ BitVec 32))) (Found!3466 (index!16044 (_ BitVec 32))) (Intermediate!3466 (undefined!4278 Bool) (index!16045 (_ BitVec 32)) (x!35038 (_ BitVec 32))) (Undefined!3466) (MissingVacant!3466 (index!16046 (_ BitVec 32))) )
))
(declare-fun lt!165067 () SeekEntryResult!3466)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!352127 (= res!195289 (inRange!0 (index!16046 lt!165067) mask!2385))))

(declare-fun res!195293 () Bool)

(assert (=> start!35116 (=> (not res!195293) (not e!215625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35116 (= res!195293 (validMask!0 mask!2385))))

(assert (=> start!35116 e!215625))

(assert (=> start!35116 true))

(assert (=> start!35116 tp_is_empty!7713))

(assert (=> start!35116 tp!26868))

(declare-fun e!215623 () Bool)

(declare-fun array_inv!6644 (array!19017) Bool)

(assert (=> start!35116 (and (array_inv!6644 _values!1525) e!215623)))

(declare-fun array_inv!6645 (array!19015) Bool)

(assert (=> start!35116 (array_inv!6645 _keys!1895)))

(declare-fun b!352128 () Bool)

(declare-fun e!215626 () Bool)

(assert (=> b!352128 (= e!215626 e!215624)))

(declare-fun res!195291 () Bool)

(assert (=> b!352128 (=> (not res!195291) (not e!215624))))

(declare-fun lt!165064 () Bool)

(assert (=> b!352128 (= res!195291 (not lt!165064))))

(declare-fun lt!165065 () Unit!10889)

(assert (=> b!352128 (= lt!165065 e!215627)))

(declare-fun c!53520 () Bool)

(assert (=> b!352128 (= c!53520 lt!165064)))

(declare-fun arrayContainsKey!0 (array!19015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352128 (= lt!165064 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!352129 () Bool)

(declare-fun res!195288 () Bool)

(assert (=> b!352129 (=> (not res!195288) (not e!215625))))

(assert (=> b!352129 (= res!195288 (and (= (size!9364 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9363 _keys!1895) (size!9364 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352130 () Bool)

(declare-fun res!195285 () Bool)

(assert (=> b!352130 (=> (not res!195285) (not e!215625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352130 (= res!195285 (validKeyInArray!0 k0!1348))))

(declare-fun b!352131 () Bool)

(assert (=> b!352131 (= e!215624 (or (bvslt (index!16046 lt!165067) #b00000000000000000000000000000000) (bvsge (index!16046 lt!165067) (size!9363 _keys!1895))))))

(declare-fun b!352132 () Bool)

(declare-fun e!215621 () Bool)

(assert (=> b!352132 (= e!215621 tp_is_empty!7713)))

(declare-fun mapNonEmpty!13047 () Bool)

(declare-fun tp!26867 () Bool)

(assert (=> mapNonEmpty!13047 (= mapRes!13047 (and tp!26867 e!215622))))

(declare-fun mapRest!13047 () (Array (_ BitVec 32) ValueCell!3513))

(declare-fun mapKey!13047 () (_ BitVec 32))

(declare-fun mapValue!13047 () ValueCell!3513)

(assert (=> mapNonEmpty!13047 (= (arr!9012 _values!1525) (store mapRest!13047 mapKey!13047 mapValue!13047))))

(declare-fun b!352133 () Bool)

(declare-fun res!195290 () Bool)

(assert (=> b!352133 (=> (not res!195290) (not e!215625))))

(declare-datatypes ((tuple2!5624 0))(
  ( (tuple2!5625 (_1!2823 (_ BitVec 64)) (_2!2823 V!11261)) )
))
(declare-datatypes ((List!5246 0))(
  ( (Nil!5243) (Cons!5242 (h!6098 tuple2!5624) (t!10388 List!5246)) )
))
(declare-datatypes ((ListLongMap!4537 0))(
  ( (ListLongMap!4538 (toList!2284 List!5246)) )
))
(declare-fun contains!2355 (ListLongMap!4537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1805 (array!19015 array!19017 (_ BitVec 32) (_ BitVec 32) V!11261 V!11261 (_ BitVec 32) Int) ListLongMap!4537)

(assert (=> b!352133 (= res!195290 (not (contains!2355 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352134 () Bool)

(assert (=> b!352134 (= e!215623 (and e!215621 mapRes!13047))))

(declare-fun condMapEmpty!13047 () Bool)

(declare-fun mapDefault!13047 () ValueCell!3513)

(assert (=> b!352134 (= condMapEmpty!13047 (= (arr!9012 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3513)) mapDefault!13047)))))

(declare-fun b!352135 () Bool)

(assert (=> b!352135 (= e!215625 e!215626)))

(declare-fun res!195287 () Bool)

(assert (=> b!352135 (=> (not res!195287) (not e!215626))))

(get-info :version)

(assert (=> b!352135 (= res!195287 (and (not ((_ is Found!3466) lt!165067)) (not ((_ is MissingZero!3466) lt!165067)) ((_ is MissingVacant!3466) lt!165067)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19015 (_ BitVec 32)) SeekEntryResult!3466)

(assert (=> b!352135 (= lt!165067 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!35116 res!195293) b!352129))

(assert (= (and b!352129 res!195288) b!352123))

(assert (= (and b!352123 res!195292) b!352124))

(assert (= (and b!352124 res!195286) b!352130))

(assert (= (and b!352130 res!195285) b!352133))

(assert (= (and b!352133 res!195290) b!352135))

(assert (= (and b!352135 res!195287) b!352128))

(assert (= (and b!352128 c!53520) b!352125))

(assert (= (and b!352128 (not c!53520)) b!352126))

(assert (= (and b!352128 res!195291) b!352127))

(assert (= (and b!352127 res!195289) b!352131))

(assert (= (and b!352134 condMapEmpty!13047) mapIsEmpty!13047))

(assert (= (and b!352134 (not condMapEmpty!13047)) mapNonEmpty!13047))

(assert (= (and mapNonEmpty!13047 ((_ is ValueCellFull!3513) mapValue!13047)) b!352122))

(assert (= (and b!352134 ((_ is ValueCellFull!3513) mapDefault!13047)) b!352132))

(assert (= start!35116 b!352134))

(declare-fun m!351857 () Bool)

(assert (=> start!35116 m!351857))

(declare-fun m!351859 () Bool)

(assert (=> start!35116 m!351859))

(declare-fun m!351861 () Bool)

(assert (=> start!35116 m!351861))

(declare-fun m!351863 () Bool)

(assert (=> b!352124 m!351863))

(declare-fun m!351865 () Bool)

(assert (=> b!352133 m!351865))

(assert (=> b!352133 m!351865))

(declare-fun m!351867 () Bool)

(assert (=> b!352133 m!351867))

(declare-fun m!351869 () Bool)

(assert (=> mapNonEmpty!13047 m!351869))

(declare-fun m!351871 () Bool)

(assert (=> b!352123 m!351871))

(declare-fun m!351873 () Bool)

(assert (=> b!352127 m!351873))

(declare-fun m!351875 () Bool)

(assert (=> b!352130 m!351875))

(declare-fun m!351877 () Bool)

(assert (=> b!352128 m!351877))

(declare-fun m!351879 () Bool)

(assert (=> b!352135 m!351879))

(declare-fun m!351881 () Bool)

(assert (=> b!352125 m!351881))

(assert (=> b!352125 m!351881))

(declare-fun m!351883 () Bool)

(assert (=> b!352125 m!351883))

(check-sat (not b!352133) (not start!35116) (not b!352125) (not b!352124) b_and!14995 (not b!352123) (not mapNonEmpty!13047) (not b_next!7761) (not b!352128) (not b!352135) tp_is_empty!7713 (not b!352127) (not b!352130))
(check-sat b_and!14995 (not b_next!7761))
(get-model)

(declare-fun b!352190 () Bool)

(declare-fun e!215659 () SeekEntryResult!3466)

(declare-fun e!215660 () SeekEntryResult!3466)

(assert (=> b!352190 (= e!215659 e!215660)))

(declare-fun lt!165087 () (_ BitVec 64))

(declare-fun lt!165088 () SeekEntryResult!3466)

(assert (=> b!352190 (= lt!165087 (select (arr!9011 _keys!1895) (index!16045 lt!165088)))))

(declare-fun c!53531 () Bool)

(assert (=> b!352190 (= c!53531 (= lt!165087 k0!1348))))

(declare-fun d!71505 () Bool)

(declare-fun lt!165086 () SeekEntryResult!3466)

(assert (=> d!71505 (and (or ((_ is Undefined!3466) lt!165086) (not ((_ is Found!3466) lt!165086)) (and (bvsge (index!16044 lt!165086) #b00000000000000000000000000000000) (bvslt (index!16044 lt!165086) (size!9363 _keys!1895)))) (or ((_ is Undefined!3466) lt!165086) ((_ is Found!3466) lt!165086) (not ((_ is MissingZero!3466) lt!165086)) (and (bvsge (index!16043 lt!165086) #b00000000000000000000000000000000) (bvslt (index!16043 lt!165086) (size!9363 _keys!1895)))) (or ((_ is Undefined!3466) lt!165086) ((_ is Found!3466) lt!165086) ((_ is MissingZero!3466) lt!165086) (not ((_ is MissingVacant!3466) lt!165086)) (and (bvsge (index!16046 lt!165086) #b00000000000000000000000000000000) (bvslt (index!16046 lt!165086) (size!9363 _keys!1895)))) (or ((_ is Undefined!3466) lt!165086) (ite ((_ is Found!3466) lt!165086) (= (select (arr!9011 _keys!1895) (index!16044 lt!165086)) k0!1348) (ite ((_ is MissingZero!3466) lt!165086) (= (select (arr!9011 _keys!1895) (index!16043 lt!165086)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3466) lt!165086) (= (select (arr!9011 _keys!1895) (index!16046 lt!165086)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71505 (= lt!165086 e!215659)))

(declare-fun c!53532 () Bool)

(assert (=> d!71505 (= c!53532 (and ((_ is Intermediate!3466) lt!165088) (undefined!4278 lt!165088)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19015 (_ BitVec 32)) SeekEntryResult!3466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71505 (= lt!165088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71505 (validMask!0 mask!2385)))

(assert (=> d!71505 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165086)))

(declare-fun b!352191 () Bool)

(declare-fun e!215661 () SeekEntryResult!3466)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19015 (_ BitVec 32)) SeekEntryResult!3466)

(assert (=> b!352191 (= e!215661 (seekKeyOrZeroReturnVacant!0 (x!35038 lt!165088) (index!16045 lt!165088) (index!16045 lt!165088) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352192 () Bool)

(assert (=> b!352192 (= e!215661 (MissingZero!3466 (index!16045 lt!165088)))))

(declare-fun b!352193 () Bool)

(declare-fun c!53530 () Bool)

(assert (=> b!352193 (= c!53530 (= lt!165087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!352193 (= e!215660 e!215661)))

(declare-fun b!352194 () Bool)

(assert (=> b!352194 (= e!215659 Undefined!3466)))

(declare-fun b!352195 () Bool)

(assert (=> b!352195 (= e!215660 (Found!3466 (index!16045 lt!165088)))))

(assert (= (and d!71505 c!53532) b!352194))

(assert (= (and d!71505 (not c!53532)) b!352190))

(assert (= (and b!352190 c!53531) b!352195))

(assert (= (and b!352190 (not c!53531)) b!352193))

(assert (= (and b!352193 c!53530) b!352192))

(assert (= (and b!352193 (not c!53530)) b!352191))

(declare-fun m!351913 () Bool)

(assert (=> b!352190 m!351913))

(declare-fun m!351915 () Bool)

(assert (=> d!71505 m!351915))

(declare-fun m!351917 () Bool)

(assert (=> d!71505 m!351917))

(declare-fun m!351919 () Bool)

(assert (=> d!71505 m!351919))

(assert (=> d!71505 m!351857))

(assert (=> d!71505 m!351917))

(declare-fun m!351921 () Bool)

(assert (=> d!71505 m!351921))

(declare-fun m!351923 () Bool)

(assert (=> d!71505 m!351923))

(declare-fun m!351925 () Bool)

(assert (=> b!352191 m!351925))

(assert (=> b!352135 d!71505))

(declare-fun d!71507 () Bool)

(assert (=> d!71507 (= (inRange!0 (index!16046 lt!165067) mask!2385) (and (bvsge (index!16046 lt!165067) #b00000000000000000000000000000000) (bvslt (index!16046 lt!165067) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!352127 d!71507))

(declare-fun d!71509 () Bool)

(declare-fun res!195325 () Bool)

(declare-fun e!215669 () Bool)

(assert (=> d!71509 (=> res!195325 e!215669)))

(assert (=> d!71509 (= res!195325 (bvsge #b00000000000000000000000000000000 (size!9363 _keys!1895)))))

(assert (=> d!71509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215669)))

(declare-fun b!352204 () Bool)

(declare-fun e!215668 () Bool)

(declare-fun e!215670 () Bool)

(assert (=> b!352204 (= e!215668 e!215670)))

(declare-fun lt!165096 () (_ BitVec 64))

(assert (=> b!352204 (= lt!165096 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165095 () Unit!10889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19015 (_ BitVec 64) (_ BitVec 32)) Unit!10889)

(assert (=> b!352204 (= lt!165095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165096 #b00000000000000000000000000000000))))

(assert (=> b!352204 (arrayContainsKey!0 _keys!1895 lt!165096 #b00000000000000000000000000000000)))

(declare-fun lt!165097 () Unit!10889)

(assert (=> b!352204 (= lt!165097 lt!165095)))

(declare-fun res!195326 () Bool)

(assert (=> b!352204 (= res!195326 (= (seekEntryOrOpen!0 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3466 #b00000000000000000000000000000000)))))

(assert (=> b!352204 (=> (not res!195326) (not e!215670))))

(declare-fun b!352205 () Bool)

(declare-fun call!27037 () Bool)

(assert (=> b!352205 (= e!215670 call!27037)))

(declare-fun b!352206 () Bool)

(assert (=> b!352206 (= e!215668 call!27037)))

(declare-fun b!352207 () Bool)

(assert (=> b!352207 (= e!215669 e!215668)))

(declare-fun c!53535 () Bool)

(assert (=> b!352207 (= c!53535 (validKeyInArray!0 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27034 () Bool)

(assert (=> bm!27034 (= call!27037 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71509 (not res!195325)) b!352207))

(assert (= (and b!352207 c!53535) b!352204))

(assert (= (and b!352207 (not c!53535)) b!352206))

(assert (= (and b!352204 res!195326) b!352205))

(assert (= (or b!352205 b!352206) bm!27034))

(declare-fun m!351927 () Bool)

(assert (=> b!352204 m!351927))

(declare-fun m!351929 () Bool)

(assert (=> b!352204 m!351929))

(declare-fun m!351931 () Bool)

(assert (=> b!352204 m!351931))

(assert (=> b!352204 m!351927))

(declare-fun m!351933 () Bool)

(assert (=> b!352204 m!351933))

(assert (=> b!352207 m!351927))

(assert (=> b!352207 m!351927))

(declare-fun m!351935 () Bool)

(assert (=> b!352207 m!351935))

(declare-fun m!351937 () Bool)

(assert (=> bm!27034 m!351937))

(assert (=> b!352123 d!71509))

(declare-fun b!352218 () Bool)

(declare-fun e!215682 () Bool)

(declare-fun e!215680 () Bool)

(assert (=> b!352218 (= e!215682 e!215680)))

(declare-fun res!195335 () Bool)

(assert (=> b!352218 (=> (not res!195335) (not e!215680))))

(declare-fun e!215681 () Bool)

(assert (=> b!352218 (= res!195335 (not e!215681))))

(declare-fun res!195334 () Bool)

(assert (=> b!352218 (=> (not res!195334) (not e!215681))))

(assert (=> b!352218 (= res!195334 (validKeyInArray!0 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352219 () Bool)

(declare-fun e!215679 () Bool)

(assert (=> b!352219 (= e!215680 e!215679)))

(declare-fun c!53538 () Bool)

(assert (=> b!352219 (= c!53538 (validKeyInArray!0 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27037 () Bool)

(declare-fun call!27040 () Bool)

(assert (=> bm!27037 (= call!27040 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53538 (Cons!5241 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000) Nil!5242) Nil!5242)))))

(declare-fun d!71511 () Bool)

(declare-fun res!195333 () Bool)

(assert (=> d!71511 (=> res!195333 e!215682)))

(assert (=> d!71511 (= res!195333 (bvsge #b00000000000000000000000000000000 (size!9363 _keys!1895)))))

(assert (=> d!71511 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5242) e!215682)))

(declare-fun b!352220 () Bool)

(declare-fun contains!2357 (List!5245 (_ BitVec 64)) Bool)

(assert (=> b!352220 (= e!215681 (contains!2357 Nil!5242 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352221 () Bool)

(assert (=> b!352221 (= e!215679 call!27040)))

(declare-fun b!352222 () Bool)

(assert (=> b!352222 (= e!215679 call!27040)))

(assert (= (and d!71511 (not res!195333)) b!352218))

(assert (= (and b!352218 res!195334) b!352220))

(assert (= (and b!352218 res!195335) b!352219))

(assert (= (and b!352219 c!53538) b!352222))

(assert (= (and b!352219 (not c!53538)) b!352221))

(assert (= (or b!352222 b!352221) bm!27037))

(assert (=> b!352218 m!351927))

(assert (=> b!352218 m!351927))

(assert (=> b!352218 m!351935))

(assert (=> b!352219 m!351927))

(assert (=> b!352219 m!351927))

(assert (=> b!352219 m!351935))

(assert (=> bm!27037 m!351927))

(declare-fun m!351939 () Bool)

(assert (=> bm!27037 m!351939))

(assert (=> b!352220 m!351927))

(assert (=> b!352220 m!351927))

(declare-fun m!351941 () Bool)

(assert (=> b!352220 m!351941))

(assert (=> b!352124 d!71511))

(declare-fun d!71513 () Bool)

(declare-fun res!195340 () Bool)

(declare-fun e!215687 () Bool)

(assert (=> d!71513 (=> res!195340 e!215687)))

(assert (=> d!71513 (= res!195340 (= (select (arr!9011 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71513 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215687)))

(declare-fun b!352227 () Bool)

(declare-fun e!215688 () Bool)

(assert (=> b!352227 (= e!215687 e!215688)))

(declare-fun res!195341 () Bool)

(assert (=> b!352227 (=> (not res!195341) (not e!215688))))

(assert (=> b!352227 (= res!195341 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9363 _keys!1895)))))

(declare-fun b!352228 () Bool)

(assert (=> b!352228 (= e!215688 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71513 (not res!195340)) b!352227))

(assert (= (and b!352227 res!195341) b!352228))

(assert (=> d!71513 m!351927))

(declare-fun m!351943 () Bool)

(assert (=> b!352228 m!351943))

(assert (=> b!352128 d!71513))

(declare-fun d!71515 () Bool)

(declare-fun e!215693 () Bool)

(assert (=> d!71515 e!215693))

(declare-fun res!195344 () Bool)

(assert (=> d!71515 (=> res!195344 e!215693)))

(declare-fun lt!165106 () Bool)

(assert (=> d!71515 (= res!195344 (not lt!165106))))

(declare-fun lt!165108 () Bool)

(assert (=> d!71515 (= lt!165106 lt!165108)))

(declare-fun lt!165109 () Unit!10889)

(declare-fun e!215694 () Unit!10889)

(assert (=> d!71515 (= lt!165109 e!215694)))

(declare-fun c!53541 () Bool)

(assert (=> d!71515 (= c!53541 lt!165108)))

(declare-fun containsKey!343 (List!5246 (_ BitVec 64)) Bool)

(assert (=> d!71515 (= lt!165108 (containsKey!343 (toList!2284 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71515 (= (contains!2355 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165106)))

(declare-fun b!352235 () Bool)

(declare-fun lt!165107 () Unit!10889)

(assert (=> b!352235 (= e!215694 lt!165107)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!291 (List!5246 (_ BitVec 64)) Unit!10889)

(assert (=> b!352235 (= lt!165107 (lemmaContainsKeyImpliesGetValueByKeyDefined!291 (toList!2284 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!357 0))(
  ( (Some!356 (v!6092 V!11261)) (None!355) )
))
(declare-fun isDefined!292 (Option!357) Bool)

(declare-fun getValueByKey!351 (List!5246 (_ BitVec 64)) Option!357)

(assert (=> b!352235 (isDefined!292 (getValueByKey!351 (toList!2284 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352236 () Bool)

(declare-fun Unit!10897 () Unit!10889)

(assert (=> b!352236 (= e!215694 Unit!10897)))

(declare-fun b!352237 () Bool)

(assert (=> b!352237 (= e!215693 (isDefined!292 (getValueByKey!351 (toList!2284 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71515 c!53541) b!352235))

(assert (= (and d!71515 (not c!53541)) b!352236))

(assert (= (and d!71515 (not res!195344)) b!352237))

(declare-fun m!351945 () Bool)

(assert (=> d!71515 m!351945))

(declare-fun m!351947 () Bool)

(assert (=> b!352235 m!351947))

(declare-fun m!351949 () Bool)

(assert (=> b!352235 m!351949))

(assert (=> b!352235 m!351949))

(declare-fun m!351951 () Bool)

(assert (=> b!352235 m!351951))

(assert (=> b!352237 m!351949))

(assert (=> b!352237 m!351949))

(assert (=> b!352237 m!351951))

(assert (=> b!352133 d!71515))

(declare-fun b!352280 () Bool)

(declare-fun e!215729 () ListLongMap!4537)

(declare-fun call!27058 () ListLongMap!4537)

(assert (=> b!352280 (= e!215729 call!27058)))

(declare-fun b!352281 () Bool)

(declare-fun e!215728 () ListLongMap!4537)

(declare-fun call!27057 () ListLongMap!4537)

(assert (=> b!352281 (= e!215728 call!27057)))

(declare-fun b!352282 () Bool)

(declare-fun e!215733 () ListLongMap!4537)

(assert (=> b!352282 (= e!215733 e!215729)))

(declare-fun c!53555 () Bool)

(assert (=> b!352282 (= c!53555 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352283 () Bool)

(declare-fun res!195369 () Bool)

(declare-fun e!215721 () Bool)

(assert (=> b!352283 (=> (not res!195369) (not e!215721))))

(declare-fun e!215732 () Bool)

(assert (=> b!352283 (= res!195369 e!215732)))

(declare-fun c!53559 () Bool)

(assert (=> b!352283 (= c!53559 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27052 () Bool)

(declare-fun call!27060 () ListLongMap!4537)

(declare-fun call!27055 () ListLongMap!4537)

(assert (=> bm!27052 (= call!27060 call!27055)))

(declare-fun c!53554 () Bool)

(declare-fun bm!27053 () Bool)

(declare-fun call!27056 () ListLongMap!4537)

(declare-fun +!742 (ListLongMap!4537 tuple2!5624) ListLongMap!4537)

(assert (=> bm!27053 (= call!27056 (+!742 (ite c!53554 call!27055 (ite c!53555 call!27060 call!27057)) (ite (or c!53554 c!53555) (tuple2!5625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!27054 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!615 (array!19015 array!19017 (_ BitVec 32) (_ BitVec 32) V!11261 V!11261 (_ BitVec 32) Int) ListLongMap!4537)

(assert (=> bm!27054 (= call!27055 (getCurrentListMapNoExtraKeys!615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!352285 () Bool)

(declare-fun e!215730 () Bool)

(declare-fun lt!165172 () ListLongMap!4537)

(declare-fun apply!293 (ListLongMap!4537 (_ BitVec 64)) V!11261)

(assert (=> b!352285 (= e!215730 (= (apply!293 lt!165172 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!352286 () Bool)

(declare-fun e!215723 () Bool)

(declare-fun get!4809 (ValueCell!3513 V!11261) V!11261)

(declare-fun dynLambda!636 (Int (_ BitVec 64)) V!11261)

(assert (=> b!352286 (= e!215723 (= (apply!293 lt!165172 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)) (get!4809 (select (arr!9012 _values!1525) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9364 _values!1525)))))

(assert (=> b!352286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9363 _keys!1895)))))

(declare-fun b!352287 () Bool)

(declare-fun e!215725 () Bool)

(assert (=> b!352287 (= e!215725 (= (apply!293 lt!165172 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!27055 () Bool)

(assert (=> bm!27055 (= call!27058 call!27056)))

(declare-fun bm!27056 () Bool)

(declare-fun call!27059 () Bool)

(assert (=> bm!27056 (= call!27059 (contains!2355 lt!165172 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352288 () Bool)

(declare-fun e!215726 () Bool)

(assert (=> b!352288 (= e!215726 (not call!27059))))

(declare-fun bm!27057 () Bool)

(assert (=> bm!27057 (= call!27057 call!27060)))

(declare-fun b!352289 () Bool)

(assert (=> b!352289 (= e!215728 call!27058)))

(declare-fun b!352290 () Bool)

(declare-fun c!53558 () Bool)

(assert (=> b!352290 (= c!53558 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!352290 (= e!215729 e!215728)))

(declare-fun b!352291 () Bool)

(declare-fun call!27061 () Bool)

(assert (=> b!352291 (= e!215732 (not call!27061))))

(declare-fun b!352292 () Bool)

(declare-fun e!215727 () Bool)

(assert (=> b!352292 (= e!215727 e!215723)))

(declare-fun res!195367 () Bool)

(assert (=> b!352292 (=> (not res!195367) (not e!215723))))

(assert (=> b!352292 (= res!195367 (contains!2355 lt!165172 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9363 _keys!1895)))))

(declare-fun b!352293 () Bool)

(assert (=> b!352293 (= e!215721 e!215726)))

(declare-fun c!53556 () Bool)

(assert (=> b!352293 (= c!53556 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352294 () Bool)

(assert (=> b!352294 (= e!215726 e!215730)))

(declare-fun res!195366 () Bool)

(assert (=> b!352294 (= res!195366 call!27059)))

(assert (=> b!352294 (=> (not res!195366) (not e!215730))))

(declare-fun bm!27058 () Bool)

(assert (=> bm!27058 (= call!27061 (contains!2355 lt!165172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352295 () Bool)

(declare-fun e!215722 () Bool)

(assert (=> b!352295 (= e!215722 (validKeyInArray!0 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352284 () Bool)

(assert (=> b!352284 (= e!215733 (+!742 call!27056 (tuple2!5625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun d!71517 () Bool)

(assert (=> d!71517 e!215721))

(declare-fun res!195365 () Bool)

(assert (=> d!71517 (=> (not res!195365) (not e!215721))))

(assert (=> d!71517 (= res!195365 (or (bvsge #b00000000000000000000000000000000 (size!9363 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9363 _keys!1895)))))))

(declare-fun lt!165160 () ListLongMap!4537)

(assert (=> d!71517 (= lt!165172 lt!165160)))

(declare-fun lt!165166 () Unit!10889)

(declare-fun e!215731 () Unit!10889)

(assert (=> d!71517 (= lt!165166 e!215731)))

(declare-fun c!53557 () Bool)

(declare-fun e!215724 () Bool)

(assert (=> d!71517 (= c!53557 e!215724)))

(declare-fun res!195364 () Bool)

(assert (=> d!71517 (=> (not res!195364) (not e!215724))))

(assert (=> d!71517 (= res!195364 (bvslt #b00000000000000000000000000000000 (size!9363 _keys!1895)))))

(assert (=> d!71517 (= lt!165160 e!215733)))

(assert (=> d!71517 (= c!53554 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71517 (validMask!0 mask!2385)))

(assert (=> d!71517 (= (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165172)))

(declare-fun b!352296 () Bool)

(declare-fun res!195371 () Bool)

(assert (=> b!352296 (=> (not res!195371) (not e!215721))))

(assert (=> b!352296 (= res!195371 e!215727)))

(declare-fun res!195363 () Bool)

(assert (=> b!352296 (=> res!195363 e!215727)))

(assert (=> b!352296 (= res!195363 (not e!215722))))

(declare-fun res!195368 () Bool)

(assert (=> b!352296 (=> (not res!195368) (not e!215722))))

(assert (=> b!352296 (= res!195368 (bvslt #b00000000000000000000000000000000 (size!9363 _keys!1895)))))

(declare-fun b!352297 () Bool)

(declare-fun lt!165165 () Unit!10889)

(assert (=> b!352297 (= e!215731 lt!165165)))

(declare-fun lt!165162 () ListLongMap!4537)

(assert (=> b!352297 (= lt!165162 (getCurrentListMapNoExtraKeys!615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165157 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165161 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165161 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165175 () Unit!10889)

(declare-fun addStillContains!269 (ListLongMap!4537 (_ BitVec 64) V!11261 (_ BitVec 64)) Unit!10889)

(assert (=> b!352297 (= lt!165175 (addStillContains!269 lt!165162 lt!165157 zeroValue!1467 lt!165161))))

(assert (=> b!352297 (contains!2355 (+!742 lt!165162 (tuple2!5625 lt!165157 zeroValue!1467)) lt!165161)))

(declare-fun lt!165171 () Unit!10889)

(assert (=> b!352297 (= lt!165171 lt!165175)))

(declare-fun lt!165155 () ListLongMap!4537)

(assert (=> b!352297 (= lt!165155 (getCurrentListMapNoExtraKeys!615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165154 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165154 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165173 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165173 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165164 () Unit!10889)

(declare-fun addApplyDifferent!269 (ListLongMap!4537 (_ BitVec 64) V!11261 (_ BitVec 64)) Unit!10889)

(assert (=> b!352297 (= lt!165164 (addApplyDifferent!269 lt!165155 lt!165154 minValue!1467 lt!165173))))

(assert (=> b!352297 (= (apply!293 (+!742 lt!165155 (tuple2!5625 lt!165154 minValue!1467)) lt!165173) (apply!293 lt!165155 lt!165173))))

(declare-fun lt!165158 () Unit!10889)

(assert (=> b!352297 (= lt!165158 lt!165164)))

(declare-fun lt!165159 () ListLongMap!4537)

(assert (=> b!352297 (= lt!165159 (getCurrentListMapNoExtraKeys!615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165169 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165168 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165168 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165167 () Unit!10889)

(assert (=> b!352297 (= lt!165167 (addApplyDifferent!269 lt!165159 lt!165169 zeroValue!1467 lt!165168))))

(assert (=> b!352297 (= (apply!293 (+!742 lt!165159 (tuple2!5625 lt!165169 zeroValue!1467)) lt!165168) (apply!293 lt!165159 lt!165168))))

(declare-fun lt!165170 () Unit!10889)

(assert (=> b!352297 (= lt!165170 lt!165167)))

(declare-fun lt!165156 () ListLongMap!4537)

(assert (=> b!352297 (= lt!165156 (getCurrentListMapNoExtraKeys!615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165174 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165163 () (_ BitVec 64))

(assert (=> b!352297 (= lt!165163 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352297 (= lt!165165 (addApplyDifferent!269 lt!165156 lt!165174 minValue!1467 lt!165163))))

(assert (=> b!352297 (= (apply!293 (+!742 lt!165156 (tuple2!5625 lt!165174 minValue!1467)) lt!165163) (apply!293 lt!165156 lt!165163))))

(declare-fun b!352298 () Bool)

(declare-fun Unit!10898 () Unit!10889)

(assert (=> b!352298 (= e!215731 Unit!10898)))

(declare-fun b!352299 () Bool)

(assert (=> b!352299 (= e!215724 (validKeyInArray!0 (select (arr!9011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352300 () Bool)

(assert (=> b!352300 (= e!215732 e!215725)))

(declare-fun res!195370 () Bool)

(assert (=> b!352300 (= res!195370 call!27061)))

(assert (=> b!352300 (=> (not res!195370) (not e!215725))))

(assert (= (and d!71517 c!53554) b!352284))

(assert (= (and d!71517 (not c!53554)) b!352282))

(assert (= (and b!352282 c!53555) b!352280))

(assert (= (and b!352282 (not c!53555)) b!352290))

(assert (= (and b!352290 c!53558) b!352289))

(assert (= (and b!352290 (not c!53558)) b!352281))

(assert (= (or b!352289 b!352281) bm!27057))

(assert (= (or b!352280 bm!27057) bm!27052))

(assert (= (or b!352280 b!352289) bm!27055))

(assert (= (or b!352284 bm!27052) bm!27054))

(assert (= (or b!352284 bm!27055) bm!27053))

(assert (= (and d!71517 res!195364) b!352299))

(assert (= (and d!71517 c!53557) b!352297))

(assert (= (and d!71517 (not c!53557)) b!352298))

(assert (= (and d!71517 res!195365) b!352296))

(assert (= (and b!352296 res!195368) b!352295))

(assert (= (and b!352296 (not res!195363)) b!352292))

(assert (= (and b!352292 res!195367) b!352286))

(assert (= (and b!352296 res!195371) b!352283))

(assert (= (and b!352283 c!53559) b!352300))

(assert (= (and b!352283 (not c!53559)) b!352291))

(assert (= (and b!352300 res!195370) b!352287))

(assert (= (or b!352300 b!352291) bm!27058))

(assert (= (and b!352283 res!195369) b!352293))

(assert (= (and b!352293 c!53556) b!352294))

(assert (= (and b!352293 (not c!53556)) b!352288))

(assert (= (and b!352294 res!195366) b!352285))

(assert (= (or b!352294 b!352288) bm!27056))

(declare-fun b_lambda!8511 () Bool)

(assert (=> (not b_lambda!8511) (not b!352286)))

(declare-fun t!10391 () Bool)

(declare-fun tb!3101 () Bool)

(assert (=> (and start!35116 (= defaultEntry!1528 defaultEntry!1528) t!10391) tb!3101))

(declare-fun result!5633 () Bool)

(assert (=> tb!3101 (= result!5633 tp_is_empty!7713)))

(assert (=> b!352286 t!10391))

(declare-fun b_and!14999 () Bool)

(assert (= b_and!14995 (and (=> t!10391 result!5633) b_and!14999)))

(declare-fun m!351953 () Bool)

(assert (=> bm!27056 m!351953))

(declare-fun m!351955 () Bool)

(assert (=> bm!27053 m!351955))

(declare-fun m!351957 () Bool)

(assert (=> b!352287 m!351957))

(assert (=> d!71517 m!351857))

(assert (=> b!352292 m!351927))

(assert (=> b!352292 m!351927))

(declare-fun m!351959 () Bool)

(assert (=> b!352292 m!351959))

(declare-fun m!351961 () Bool)

(assert (=> b!352284 m!351961))

(declare-fun m!351963 () Bool)

(assert (=> b!352285 m!351963))

(assert (=> b!352299 m!351927))

(assert (=> b!352299 m!351927))

(assert (=> b!352299 m!351935))

(declare-fun m!351965 () Bool)

(assert (=> b!352286 m!351965))

(assert (=> b!352286 m!351927))

(declare-fun m!351967 () Bool)

(assert (=> b!352286 m!351967))

(assert (=> b!352286 m!351965))

(declare-fun m!351969 () Bool)

(assert (=> b!352286 m!351969))

(assert (=> b!352286 m!351967))

(assert (=> b!352286 m!351927))

(declare-fun m!351971 () Bool)

(assert (=> b!352286 m!351971))

(declare-fun m!351973 () Bool)

(assert (=> b!352297 m!351973))

(assert (=> b!352297 m!351927))

(declare-fun m!351975 () Bool)

(assert (=> b!352297 m!351975))

(declare-fun m!351977 () Bool)

(assert (=> b!352297 m!351977))

(declare-fun m!351979 () Bool)

(assert (=> b!352297 m!351979))

(declare-fun m!351981 () Bool)

(assert (=> b!352297 m!351981))

(declare-fun m!351983 () Bool)

(assert (=> b!352297 m!351983))

(declare-fun m!351985 () Bool)

(assert (=> b!352297 m!351985))

(assert (=> b!352297 m!351981))

(declare-fun m!351987 () Bool)

(assert (=> b!352297 m!351987))

(assert (=> b!352297 m!351985))

(declare-fun m!351989 () Bool)

(assert (=> b!352297 m!351989))

(assert (=> b!352297 m!351973))

(declare-fun m!351991 () Bool)

(assert (=> b!352297 m!351991))

(assert (=> b!352297 m!351975))

(declare-fun m!351993 () Bool)

(assert (=> b!352297 m!351993))

(declare-fun m!351995 () Bool)

(assert (=> b!352297 m!351995))

(declare-fun m!351997 () Bool)

(assert (=> b!352297 m!351997))

(declare-fun m!351999 () Bool)

(assert (=> b!352297 m!351999))

(declare-fun m!352001 () Bool)

(assert (=> b!352297 m!352001))

(declare-fun m!352003 () Bool)

(assert (=> b!352297 m!352003))

(assert (=> bm!27054 m!351993))

(declare-fun m!352005 () Bool)

(assert (=> bm!27058 m!352005))

(assert (=> b!352295 m!351927))

(assert (=> b!352295 m!351927))

(assert (=> b!352295 m!351935))

(assert (=> b!352133 d!71517))

(declare-fun d!71519 () Bool)

(assert (=> d!71519 (contains!2355 (getCurrentListMap!1805 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!165178 () Unit!10889)

(declare-fun choose!1308 (array!19015 array!19017 (_ BitVec 32) (_ BitVec 32) V!11261 V!11261 (_ BitVec 64) (_ BitVec 32) Int) Unit!10889)

(assert (=> d!71519 (= lt!165178 (choose!1308 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71519 (validMask!0 mask!2385)))

(assert (=> d!71519 (= (lemmaArrayContainsKeyThenInListMap!333 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!165178)))

(declare-fun bs!11986 () Bool)

(assert (= bs!11986 d!71519))

(assert (=> bs!11986 m!351865))

(assert (=> bs!11986 m!351865))

(assert (=> bs!11986 m!351867))

(assert (=> bs!11986 m!351881))

(declare-fun m!352007 () Bool)

(assert (=> bs!11986 m!352007))

(assert (=> bs!11986 m!351857))

(assert (=> b!352125 d!71519))

(declare-fun d!71521 () Bool)

(declare-fun lt!165181 () (_ BitVec 32))

(assert (=> d!71521 (and (or (bvslt lt!165181 #b00000000000000000000000000000000) (bvsge lt!165181 (size!9363 _keys!1895)) (and (bvsge lt!165181 #b00000000000000000000000000000000) (bvslt lt!165181 (size!9363 _keys!1895)))) (bvsge lt!165181 #b00000000000000000000000000000000) (bvslt lt!165181 (size!9363 _keys!1895)) (= (select (arr!9011 _keys!1895) lt!165181) k0!1348))))

(declare-fun e!215736 () (_ BitVec 32))

(assert (=> d!71521 (= lt!165181 e!215736)))

(declare-fun c!53562 () Bool)

(assert (=> d!71521 (= c!53562 (= (select (arr!9011 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9363 _keys!1895)) (bvslt (size!9363 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71521 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!165181)))

(declare-fun b!352307 () Bool)

(assert (=> b!352307 (= e!215736 #b00000000000000000000000000000000)))

(declare-fun b!352308 () Bool)

(assert (=> b!352308 (= e!215736 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71521 c!53562) b!352307))

(assert (= (and d!71521 (not c!53562)) b!352308))

(declare-fun m!352009 () Bool)

(assert (=> d!71521 m!352009))

(assert (=> d!71521 m!351927))

(declare-fun m!352011 () Bool)

(assert (=> b!352308 m!352011))

(assert (=> b!352125 d!71521))

(declare-fun d!71523 () Bool)

(assert (=> d!71523 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35116 d!71523))

(declare-fun d!71525 () Bool)

(assert (=> d!71525 (= (array_inv!6644 _values!1525) (bvsge (size!9364 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35116 d!71525))

(declare-fun d!71527 () Bool)

(assert (=> d!71527 (= (array_inv!6645 _keys!1895) (bvsge (size!9363 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35116 d!71527))

(declare-fun d!71529 () Bool)

(assert (=> d!71529 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352130 d!71529))

(declare-fun b!352316 () Bool)

(declare-fun e!215742 () Bool)

(assert (=> b!352316 (= e!215742 tp_is_empty!7713)))

(declare-fun b!352315 () Bool)

(declare-fun e!215741 () Bool)

(assert (=> b!352315 (= e!215741 tp_is_empty!7713)))

(declare-fun mapNonEmpty!13053 () Bool)

(declare-fun mapRes!13053 () Bool)

(declare-fun tp!26877 () Bool)

(assert (=> mapNonEmpty!13053 (= mapRes!13053 (and tp!26877 e!215741))))

(declare-fun mapKey!13053 () (_ BitVec 32))

(declare-fun mapRest!13053 () (Array (_ BitVec 32) ValueCell!3513))

(declare-fun mapValue!13053 () ValueCell!3513)

(assert (=> mapNonEmpty!13053 (= mapRest!13047 (store mapRest!13053 mapKey!13053 mapValue!13053))))

(declare-fun condMapEmpty!13053 () Bool)

(declare-fun mapDefault!13053 () ValueCell!3513)

(assert (=> mapNonEmpty!13047 (= condMapEmpty!13053 (= mapRest!13047 ((as const (Array (_ BitVec 32) ValueCell!3513)) mapDefault!13053)))))

(assert (=> mapNonEmpty!13047 (= tp!26867 (and e!215742 mapRes!13053))))

(declare-fun mapIsEmpty!13053 () Bool)

(assert (=> mapIsEmpty!13053 mapRes!13053))

(assert (= (and mapNonEmpty!13047 condMapEmpty!13053) mapIsEmpty!13053))

(assert (= (and mapNonEmpty!13047 (not condMapEmpty!13053)) mapNonEmpty!13053))

(assert (= (and mapNonEmpty!13053 ((_ is ValueCellFull!3513) mapValue!13053)) b!352315))

(assert (= (and mapNonEmpty!13047 ((_ is ValueCellFull!3513) mapDefault!13053)) b!352316))

(declare-fun m!352013 () Bool)

(assert (=> mapNonEmpty!13053 m!352013))

(declare-fun b_lambda!8513 () Bool)

(assert (= b_lambda!8511 (or (and start!35116 b_free!7761) b_lambda!8513)))

(check-sat (not bm!27034) (not d!71519) (not b!352292) (not b!352228) b_and!14999 (not b!352308) (not bm!27054) (not b!352295) (not b!352207) (not b!352286) (not b!352237) (not b_lambda!8513) (not b!352220) tp_is_empty!7713 (not bm!27037) (not b!352218) (not b!352299) (not b!352191) (not mapNonEmpty!13053) (not b!352219) (not d!71515) (not b!352284) (not b!352287) (not b!352204) (not b!352235) (not bm!27053) (not b!352285) (not bm!27056) (not d!71505) (not b!352297) (not d!71517) (not b_next!7761) (not bm!27058))
(check-sat b_and!14999 (not b_next!7761))
