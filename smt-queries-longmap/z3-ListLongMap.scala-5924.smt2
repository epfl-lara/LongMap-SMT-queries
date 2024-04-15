; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77104 () Bool)

(assert start!77104)

(declare-fun b!900016 () Bool)

(declare-fun b_free!16045 () Bool)

(declare-fun b_next!16045 () Bool)

(assert (=> b!900016 (= b_free!16045 (not b_next!16045))))

(declare-fun tp!56224 () Bool)

(declare-fun b_and!26339 () Bool)

(assert (=> b!900016 (= tp!56224 b_and!26339)))

(declare-fun mapNonEmpty!29233 () Bool)

(declare-fun mapRes!29233 () Bool)

(declare-fun tp!56223 () Bool)

(declare-fun e!503682 () Bool)

(assert (=> mapNonEmpty!29233 (= mapRes!29233 (and tp!56223 e!503682))))

(declare-fun mapKey!29233 () (_ BitVec 32))

(declare-datatypes ((array!52777 0))(
  ( (array!52778 (arr!25361 (Array (_ BitVec 32) (_ BitVec 64))) (size!25822 (_ BitVec 32))) )
))
(declare-datatypes ((V!29463 0))(
  ( (V!29464 (val!9237 Int)) )
))
(declare-datatypes ((ValueCell!8705 0))(
  ( (ValueCellFull!8705 (v!11730 V!29463)) (EmptyCell!8705) )
))
(declare-datatypes ((array!52779 0))(
  ( (array!52780 (arr!25362 (Array (_ BitVec 32) ValueCell!8705)) (size!25823 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4426 0))(
  ( (LongMapFixedSize!4427 (defaultEntry!5445 Int) (mask!26218 (_ BitVec 32)) (extraKeys!5170 (_ BitVec 32)) (zeroValue!5274 V!29463) (minValue!5274 V!29463) (_size!2268 (_ BitVec 32)) (_keys!10241 array!52777) (_values!5461 array!52779) (_vacant!2268 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4426)

(declare-fun mapRest!29233 () (Array (_ BitVec 32) ValueCell!8705))

(declare-fun mapValue!29233 () ValueCell!8705)

(assert (=> mapNonEmpty!29233 (= (arr!25362 (_values!5461 thiss!1181)) (store mapRest!29233 mapKey!29233 mapValue!29233))))

(declare-fun mapIsEmpty!29233 () Bool)

(assert (=> mapIsEmpty!29233 mapRes!29233))

(declare-fun b!900009 () Bool)

(declare-fun e!503689 () Bool)

(declare-fun e!503690 () Bool)

(assert (=> b!900009 (= e!503689 (not e!503690))))

(declare-fun res!607874 () Bool)

(assert (=> b!900009 (=> res!607874 e!503690)))

(declare-datatypes ((SeekEntryResult!8938 0))(
  ( (MissingZero!8938 (index!38123 (_ BitVec 32))) (Found!8938 (index!38124 (_ BitVec 32))) (Intermediate!8938 (undefined!9750 Bool) (index!38125 (_ BitVec 32)) (x!76702 (_ BitVec 32))) (Undefined!8938) (MissingVacant!8938 (index!38126 (_ BitVec 32))) )
))
(declare-fun lt!406501 () SeekEntryResult!8938)

(get-info :version)

(assert (=> b!900009 (= res!607874 (not ((_ is Found!8938) lt!406501)))))

(declare-fun e!503687 () Bool)

(assert (=> b!900009 e!503687))

(declare-fun res!607876 () Bool)

(assert (=> b!900009 (=> res!607876 e!503687)))

(assert (=> b!900009 (= res!607876 (not ((_ is Found!8938) lt!406501)))))

(declare-datatypes ((Unit!30524 0))(
  ( (Unit!30525) )
))
(declare-fun lt!406498 () Unit!30524)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!102 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 64)) Unit!30524)

(assert (=> b!900009 (= lt!406498 (lemmaSeekEntryGivesInRangeIndex!102 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8938)

(assert (=> b!900009 (= lt!406501 (seekEntry!0 key!785 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(declare-fun b!900010 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900010 (= e!503687 (inRange!0 (index!38124 lt!406501) (mask!26218 thiss!1181)))))

(declare-fun b!900011 () Bool)

(declare-fun res!607873 () Bool)

(assert (=> b!900011 (=> (not res!607873) (not e!503689))))

(assert (=> b!900011 (= res!607873 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900012 () Bool)

(declare-fun res!607872 () Bool)

(declare-fun e!503684 () Bool)

(assert (=> b!900012 (=> res!607872 e!503684)))

(assert (=> b!900012 (= res!607872 (or (not (= (size!25823 (_values!5461 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26218 thiss!1181)))) (not (= (size!25822 (_keys!10241 thiss!1181)) (size!25823 (_values!5461 thiss!1181)))) (bvslt (mask!26218 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5170 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5170 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900014 () Bool)

(declare-fun e!503683 () Bool)

(declare-fun tp_is_empty!18373 () Bool)

(assert (=> b!900014 (= e!503683 tp_is_empty!18373)))

(declare-fun b!900015 () Bool)

(declare-fun e!503688 () Bool)

(assert (=> b!900015 (= e!503688 (and e!503683 mapRes!29233))))

(declare-fun condMapEmpty!29233 () Bool)

(declare-fun mapDefault!29233 () ValueCell!8705)

(assert (=> b!900015 (= condMapEmpty!29233 (= (arr!25362 (_values!5461 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8705)) mapDefault!29233)))))

(declare-fun e!503685 () Bool)

(declare-fun array_inv!19950 (array!52777) Bool)

(declare-fun array_inv!19951 (array!52779) Bool)

(assert (=> b!900016 (= e!503685 (and tp!56224 tp_is_empty!18373 (array_inv!19950 (_keys!10241 thiss!1181)) (array_inv!19951 (_values!5461 thiss!1181)) e!503688))))

(declare-fun b!900017 () Bool)

(assert (=> b!900017 (= e!503690 e!503684)))

(declare-fun res!607877 () Bool)

(assert (=> b!900017 (=> res!607877 e!503684)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900017 (= res!607877 (not (validMask!0 (mask!26218 thiss!1181))))))

(declare-datatypes ((tuple2!12074 0))(
  ( (tuple2!12075 (_1!6048 (_ BitVec 64)) (_2!6048 V!29463)) )
))
(declare-datatypes ((List!17863 0))(
  ( (Nil!17860) (Cons!17859 (h!19005 tuple2!12074) (t!25205 List!17863)) )
))
(declare-datatypes ((ListLongMap!10761 0))(
  ( (ListLongMap!10762 (toList!5396 List!17863)) )
))
(declare-fun contains!4399 (ListLongMap!10761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2615 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) ListLongMap!10761)

(assert (=> b!900017 (contains!4399 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501)))))

(declare-fun lt!406499 () Unit!30524)

(declare-fun lemmaValidKeyInArrayIsInListMap!251 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) Unit!30524)

(assert (=> b!900017 (= lt!406499 (lemmaValidKeyInArrayIsInListMap!251 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) (index!38124 lt!406501) (defaultEntry!5445 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900017 (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406500 () Unit!30524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52777 (_ BitVec 64) (_ BitVec 32)) Unit!30524)

(assert (=> b!900017 (= lt!406500 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10241 thiss!1181) key!785 (index!38124 lt!406501)))))

(declare-fun b!900018 () Bool)

(assert (=> b!900018 (= e!503682 tp_is_empty!18373)))

(declare-fun res!607875 () Bool)

(assert (=> start!77104 (=> (not res!607875) (not e!503689))))

(declare-fun valid!1709 (LongMapFixedSize!4426) Bool)

(assert (=> start!77104 (= res!607875 (valid!1709 thiss!1181))))

(assert (=> start!77104 e!503689))

(assert (=> start!77104 e!503685))

(assert (=> start!77104 true))

(declare-fun b!900013 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52777 (_ BitVec 32)) Bool)

(assert (=> b!900013 (= e!503684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(assert (= (and start!77104 res!607875) b!900011))

(assert (= (and b!900011 res!607873) b!900009))

(assert (= (and b!900009 (not res!607876)) b!900010))

(assert (= (and b!900009 (not res!607874)) b!900017))

(assert (= (and b!900017 (not res!607877)) b!900012))

(assert (= (and b!900012 (not res!607872)) b!900013))

(assert (= (and b!900015 condMapEmpty!29233) mapIsEmpty!29233))

(assert (= (and b!900015 (not condMapEmpty!29233)) mapNonEmpty!29233))

(assert (= (and mapNonEmpty!29233 ((_ is ValueCellFull!8705) mapValue!29233)) b!900018))

(assert (= (and b!900015 ((_ is ValueCellFull!8705) mapDefault!29233)) b!900014))

(assert (= b!900016 b!900015))

(assert (= start!77104 b!900016))

(declare-fun m!835967 () Bool)

(assert (=> mapNonEmpty!29233 m!835967))

(declare-fun m!835969 () Bool)

(assert (=> b!900013 m!835969))

(declare-fun m!835971 () Bool)

(assert (=> b!900016 m!835971))

(declare-fun m!835973 () Bool)

(assert (=> b!900016 m!835973))

(declare-fun m!835975 () Bool)

(assert (=> start!77104 m!835975))

(declare-fun m!835977 () Bool)

(assert (=> b!900009 m!835977))

(declare-fun m!835979 () Bool)

(assert (=> b!900009 m!835979))

(declare-fun m!835981 () Bool)

(assert (=> b!900017 m!835981))

(declare-fun m!835983 () Bool)

(assert (=> b!900017 m!835983))

(declare-fun m!835985 () Bool)

(assert (=> b!900017 m!835985))

(declare-fun m!835987 () Bool)

(assert (=> b!900017 m!835987))

(declare-fun m!835989 () Bool)

(assert (=> b!900017 m!835989))

(assert (=> b!900017 m!835981))

(declare-fun m!835991 () Bool)

(assert (=> b!900017 m!835991))

(declare-fun m!835993 () Bool)

(assert (=> b!900017 m!835993))

(assert (=> b!900017 m!835989))

(declare-fun m!835995 () Bool)

(assert (=> b!900010 m!835995))

(check-sat tp_is_empty!18373 (not b!900010) (not b!900017) (not mapNonEmpty!29233) b_and!26339 (not b_next!16045) (not b!900009) (not b!900016) (not start!77104) (not b!900013))
(check-sat b_and!26339 (not b_next!16045))
(get-model)

(declare-fun d!111507 () Bool)

(declare-fun res!607920 () Bool)

(declare-fun e!503747 () Bool)

(assert (=> d!111507 (=> (not res!607920) (not e!503747))))

(declare-fun simpleValid!329 (LongMapFixedSize!4426) Bool)

(assert (=> d!111507 (= res!607920 (simpleValid!329 thiss!1181))))

(assert (=> d!111507 (= (valid!1709 thiss!1181) e!503747)))

(declare-fun b!900085 () Bool)

(declare-fun res!607921 () Bool)

(assert (=> b!900085 (=> (not res!607921) (not e!503747))))

(declare-fun arrayCountValidKeys!0 (array!52777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900085 (= res!607921 (= (arrayCountValidKeys!0 (_keys!10241 thiss!1181) #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))) (_size!2268 thiss!1181)))))

(declare-fun b!900086 () Bool)

(declare-fun res!607922 () Bool)

(assert (=> b!900086 (=> (not res!607922) (not e!503747))))

(assert (=> b!900086 (= res!607922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(declare-fun b!900087 () Bool)

(declare-datatypes ((List!17865 0))(
  ( (Nil!17862) (Cons!17861 (h!19007 (_ BitVec 64)) (t!25209 List!17865)) )
))
(declare-fun arrayNoDuplicates!0 (array!52777 (_ BitVec 32) List!17865) Bool)

(assert (=> b!900087 (= e!503747 (arrayNoDuplicates!0 (_keys!10241 thiss!1181) #b00000000000000000000000000000000 Nil!17862))))

(assert (= (and d!111507 res!607920) b!900085))

(assert (= (and b!900085 res!607921) b!900086))

(assert (= (and b!900086 res!607922) b!900087))

(declare-fun m!836057 () Bool)

(assert (=> d!111507 m!836057))

(declare-fun m!836059 () Bool)

(assert (=> b!900085 m!836059))

(assert (=> b!900086 m!835969))

(declare-fun m!836061 () Bool)

(assert (=> b!900087 m!836061))

(assert (=> start!77104 d!111507))

(declare-fun d!111509 () Bool)

(declare-fun e!503750 () Bool)

(assert (=> d!111509 e!503750))

(declare-fun res!607925 () Bool)

(assert (=> d!111509 (=> (not res!607925) (not e!503750))))

(assert (=> d!111509 (= res!607925 (and (bvsge (index!38124 lt!406501) #b00000000000000000000000000000000) (bvslt (index!38124 lt!406501) (size!25822 (_keys!10241 thiss!1181)))))))

(declare-fun lt!406528 () Unit!30524)

(declare-fun choose!1521 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) Unit!30524)

(assert (=> d!111509 (= lt!406528 (choose!1521 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) (index!38124 lt!406501) (defaultEntry!5445 thiss!1181)))))

(assert (=> d!111509 (validMask!0 (mask!26218 thiss!1181))))

(assert (=> d!111509 (= (lemmaValidKeyInArrayIsInListMap!251 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) (index!38124 lt!406501) (defaultEntry!5445 thiss!1181)) lt!406528)))

(declare-fun b!900090 () Bool)

(assert (=> b!900090 (= e!503750 (contains!4399 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501))))))

(assert (= (and d!111509 res!607925) b!900090))

(declare-fun m!836063 () Bool)

(assert (=> d!111509 m!836063))

(assert (=> d!111509 m!835993))

(assert (=> b!900090 m!835989))

(assert (=> b!900090 m!835981))

(assert (=> b!900090 m!835989))

(assert (=> b!900090 m!835981))

(assert (=> b!900090 m!835991))

(assert (=> b!900017 d!111509))

(declare-fun d!111511 () Bool)

(assert (=> d!111511 (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406531 () Unit!30524)

(declare-fun choose!13 (array!52777 (_ BitVec 64) (_ BitVec 32)) Unit!30524)

(assert (=> d!111511 (= lt!406531 (choose!13 (_keys!10241 thiss!1181) key!785 (index!38124 lt!406501)))))

(assert (=> d!111511 (bvsge (index!38124 lt!406501) #b00000000000000000000000000000000)))

(assert (=> d!111511 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10241 thiss!1181) key!785 (index!38124 lt!406501)) lt!406531)))

(declare-fun bs!25253 () Bool)

(assert (= bs!25253 d!111511))

(assert (=> bs!25253 m!835987))

(declare-fun m!836065 () Bool)

(assert (=> bs!25253 m!836065))

(assert (=> b!900017 d!111511))

(declare-fun d!111513 () Bool)

(assert (=> d!111513 (= (validMask!0 (mask!26218 thiss!1181)) (and (or (= (mask!26218 thiss!1181) #b00000000000000000000000000000111) (= (mask!26218 thiss!1181) #b00000000000000000000000000001111) (= (mask!26218 thiss!1181) #b00000000000000000000000000011111) (= (mask!26218 thiss!1181) #b00000000000000000000000000111111) (= (mask!26218 thiss!1181) #b00000000000000000000000001111111) (= (mask!26218 thiss!1181) #b00000000000000000000000011111111) (= (mask!26218 thiss!1181) #b00000000000000000000000111111111) (= (mask!26218 thiss!1181) #b00000000000000000000001111111111) (= (mask!26218 thiss!1181) #b00000000000000000000011111111111) (= (mask!26218 thiss!1181) #b00000000000000000000111111111111) (= (mask!26218 thiss!1181) #b00000000000000000001111111111111) (= (mask!26218 thiss!1181) #b00000000000000000011111111111111) (= (mask!26218 thiss!1181) #b00000000000000000111111111111111) (= (mask!26218 thiss!1181) #b00000000000000001111111111111111) (= (mask!26218 thiss!1181) #b00000000000000011111111111111111) (= (mask!26218 thiss!1181) #b00000000000000111111111111111111) (= (mask!26218 thiss!1181) #b00000000000001111111111111111111) (= (mask!26218 thiss!1181) #b00000000000011111111111111111111) (= (mask!26218 thiss!1181) #b00000000000111111111111111111111) (= (mask!26218 thiss!1181) #b00000000001111111111111111111111) (= (mask!26218 thiss!1181) #b00000000011111111111111111111111) (= (mask!26218 thiss!1181) #b00000000111111111111111111111111) (= (mask!26218 thiss!1181) #b00000001111111111111111111111111) (= (mask!26218 thiss!1181) #b00000011111111111111111111111111) (= (mask!26218 thiss!1181) #b00000111111111111111111111111111) (= (mask!26218 thiss!1181) #b00001111111111111111111111111111) (= (mask!26218 thiss!1181) #b00011111111111111111111111111111) (= (mask!26218 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26218 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900017 d!111513))

(declare-fun d!111515 () Bool)

(declare-fun res!607930 () Bool)

(declare-fun e!503755 () Bool)

(assert (=> d!111515 (=> res!607930 e!503755)))

(assert (=> d!111515 (= res!607930 (= (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111515 (= (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 #b00000000000000000000000000000000) e!503755)))

(declare-fun b!900095 () Bool)

(declare-fun e!503756 () Bool)

(assert (=> b!900095 (= e!503755 e!503756)))

(declare-fun res!607931 () Bool)

(assert (=> b!900095 (=> (not res!607931) (not e!503756))))

(assert (=> b!900095 (= res!607931 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25822 (_keys!10241 thiss!1181))))))

(declare-fun b!900096 () Bool)

(assert (=> b!900096 (= e!503756 (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111515 (not res!607930)) b!900095))

(assert (= (and b!900095 res!607931) b!900096))

(declare-fun m!836067 () Bool)

(assert (=> d!111515 m!836067))

(declare-fun m!836069 () Bool)

(assert (=> b!900096 m!836069))

(assert (=> b!900017 d!111515))

(declare-fun d!111517 () Bool)

(declare-fun e!503762 () Bool)

(assert (=> d!111517 e!503762))

(declare-fun res!607934 () Bool)

(assert (=> d!111517 (=> res!607934 e!503762)))

(declare-fun lt!406542 () Bool)

(assert (=> d!111517 (= res!607934 (not lt!406542))))

(declare-fun lt!406540 () Bool)

(assert (=> d!111517 (= lt!406542 lt!406540)))

(declare-fun lt!406543 () Unit!30524)

(declare-fun e!503761 () Unit!30524)

(assert (=> d!111517 (= lt!406543 e!503761)))

(declare-fun c!95251 () Bool)

(assert (=> d!111517 (= c!95251 lt!406540)))

(declare-fun containsKey!430 (List!17863 (_ BitVec 64)) Bool)

(assert (=> d!111517 (= lt!406540 (containsKey!430 (toList!5396 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501))))))

(assert (=> d!111517 (= (contains!4399 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501))) lt!406542)))

(declare-fun b!900103 () Bool)

(declare-fun lt!406541 () Unit!30524)

(assert (=> b!900103 (= e!503761 lt!406541)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!325 (List!17863 (_ BitVec 64)) Unit!30524)

(assert (=> b!900103 (= lt!406541 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5396 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501))))))

(declare-datatypes ((Option!468 0))(
  ( (Some!467 (v!11733 V!29463)) (None!466) )
))
(declare-fun isDefined!338 (Option!468) Bool)

(declare-fun getValueByKey!462 (List!17863 (_ BitVec 64)) Option!468)

(assert (=> b!900103 (isDefined!338 (getValueByKey!462 (toList!5396 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501))))))

(declare-fun b!900104 () Bool)

(declare-fun Unit!30528 () Unit!30524)

(assert (=> b!900104 (= e!503761 Unit!30528)))

(declare-fun b!900105 () Bool)

(assert (=> b!900105 (= e!503762 (isDefined!338 (getValueByKey!462 (toList!5396 (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406501)))))))

(assert (= (and d!111517 c!95251) b!900103))

(assert (= (and d!111517 (not c!95251)) b!900104))

(assert (= (and d!111517 (not res!607934)) b!900105))

(assert (=> d!111517 m!835981))

(declare-fun m!836071 () Bool)

(assert (=> d!111517 m!836071))

(assert (=> b!900103 m!835981))

(declare-fun m!836073 () Bool)

(assert (=> b!900103 m!836073))

(assert (=> b!900103 m!835981))

(declare-fun m!836075 () Bool)

(assert (=> b!900103 m!836075))

(assert (=> b!900103 m!836075))

(declare-fun m!836077 () Bool)

(assert (=> b!900103 m!836077))

(assert (=> b!900105 m!835981))

(assert (=> b!900105 m!836075))

(assert (=> b!900105 m!836075))

(assert (=> b!900105 m!836077))

(assert (=> b!900017 d!111517))

(declare-fun bm!39995 () Bool)

(declare-fun call!40004 () ListLongMap!10761)

(declare-fun getCurrentListMapNoExtraKeys!3319 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) ListLongMap!10761)

(assert (=> bm!39995 (= call!40004 (getCurrentListMapNoExtraKeys!3319 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun b!900148 () Bool)

(declare-fun e!503799 () ListLongMap!10761)

(declare-fun call!39999 () ListLongMap!10761)

(declare-fun +!2622 (ListLongMap!10761 tuple2!12074) ListLongMap!10761)

(assert (=> b!900148 (= e!503799 (+!2622 call!39999 (tuple2!12075 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5274 thiss!1181))))))

(declare-fun d!111519 () Bool)

(declare-fun e!503801 () Bool)

(assert (=> d!111519 e!503801))

(declare-fun res!607958 () Bool)

(assert (=> d!111519 (=> (not res!607958) (not e!503801))))

(assert (=> d!111519 (= res!607958 (or (bvsge #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))))))))

(declare-fun lt!406598 () ListLongMap!10761)

(declare-fun lt!406606 () ListLongMap!10761)

(assert (=> d!111519 (= lt!406598 lt!406606)))

(declare-fun lt!406597 () Unit!30524)

(declare-fun e!503792 () Unit!30524)

(assert (=> d!111519 (= lt!406597 e!503792)))

(declare-fun c!95264 () Bool)

(declare-fun e!503789 () Bool)

(assert (=> d!111519 (= c!95264 e!503789)))

(declare-fun res!607961 () Bool)

(assert (=> d!111519 (=> (not res!607961) (not e!503789))))

(assert (=> d!111519 (= res!607961 (bvslt #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))))))

(assert (=> d!111519 (= lt!406606 e!503799)))

(declare-fun c!95268 () Bool)

(assert (=> d!111519 (= c!95268 (and (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111519 (validMask!0 (mask!26218 thiss!1181))))

(assert (=> d!111519 (= (getCurrentListMap!2615 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) lt!406598)))

(declare-fun b!900149 () Bool)

(declare-fun e!503797 () Bool)

(declare-fun apply!411 (ListLongMap!10761 (_ BitVec 64)) V!29463)

(declare-fun get!13348 (ValueCell!8705 V!29463) V!29463)

(declare-fun dynLambda!1305 (Int (_ BitVec 64)) V!29463)

(assert (=> b!900149 (= e!503797 (= (apply!411 lt!406598 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)) (get!13348 (select (arr!25362 (_values!5461 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5445 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25823 (_values!5461 thiss!1181))))))

(assert (=> b!900149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))))))

(declare-fun b!900150 () Bool)

(declare-fun e!503795 () Bool)

(declare-fun call!40000 () Bool)

(assert (=> b!900150 (= e!503795 (not call!40000))))

(declare-fun b!900151 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900151 (= e!503789 (validKeyInArray!0 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39996 () Bool)

(declare-fun call!40002 () ListLongMap!10761)

(assert (=> bm!39996 (= call!40002 call!40004)))

(declare-fun b!900152 () Bool)

(declare-fun e!503791 () ListLongMap!10761)

(declare-fun call!39998 () ListLongMap!10761)

(assert (=> b!900152 (= e!503791 call!39998)))

(declare-fun b!900153 () Bool)

(declare-fun res!607956 () Bool)

(assert (=> b!900153 (=> (not res!607956) (not e!503801))))

(declare-fun e!503800 () Bool)

(assert (=> b!900153 (= res!607956 e!503800)))

(declare-fun c!95265 () Bool)

(assert (=> b!900153 (= c!95265 (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39997 () Bool)

(declare-fun c!95267 () Bool)

(assert (=> bm!39997 (= call!39999 (+!2622 (ite c!95268 call!40004 (ite c!95267 call!40002 call!39998)) (ite (or c!95268 c!95267) (tuple2!12075 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5274 thiss!1181)) (tuple2!12075 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5274 thiss!1181)))))))

(declare-fun b!900154 () Bool)

(assert (=> b!900154 (= e!503801 e!503795)))

(declare-fun c!95266 () Bool)

(assert (=> b!900154 (= c!95266 (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900155 () Bool)

(declare-fun Unit!30529 () Unit!30524)

(assert (=> b!900155 (= e!503792 Unit!30529)))

(declare-fun b!900156 () Bool)

(declare-fun call!40003 () Bool)

(assert (=> b!900156 (= e!503800 (not call!40003))))

(declare-fun b!900157 () Bool)

(declare-fun e!503798 () Bool)

(assert (=> b!900157 (= e!503798 (= (apply!411 lt!406598 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5274 thiss!1181)))))

(declare-fun bm!39998 () Bool)

(assert (=> bm!39998 (= call!40003 (contains!4399 lt!406598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900158 () Bool)

(assert (=> b!900158 (= e!503795 e!503798)))

(declare-fun res!607957 () Bool)

(assert (=> b!900158 (= res!607957 call!40000)))

(assert (=> b!900158 (=> (not res!607957) (not e!503798))))

(declare-fun b!900159 () Bool)

(declare-fun res!607954 () Bool)

(assert (=> b!900159 (=> (not res!607954) (not e!503801))))

(declare-fun e!503794 () Bool)

(assert (=> b!900159 (= res!607954 e!503794)))

(declare-fun res!607960 () Bool)

(assert (=> b!900159 (=> res!607960 e!503794)))

(declare-fun e!503790 () Bool)

(assert (=> b!900159 (= res!607960 (not e!503790))))

(declare-fun res!607953 () Bool)

(assert (=> b!900159 (=> (not res!607953) (not e!503790))))

(assert (=> b!900159 (= res!607953 (bvslt #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))))))

(declare-fun b!900160 () Bool)

(declare-fun c!95269 () Bool)

(assert (=> b!900160 (= c!95269 (and (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503796 () ListLongMap!10761)

(assert (=> b!900160 (= e!503796 e!503791)))

(declare-fun bm!39999 () Bool)

(declare-fun call!40001 () ListLongMap!10761)

(assert (=> bm!39999 (= call!40001 call!39999)))

(declare-fun b!900161 () Bool)

(declare-fun lt!406609 () Unit!30524)

(assert (=> b!900161 (= e!503792 lt!406609)))

(declare-fun lt!406593 () ListLongMap!10761)

(assert (=> b!900161 (= lt!406593 (getCurrentListMapNoExtraKeys!3319 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!406596 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406601 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406601 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406592 () Unit!30524)

(declare-fun addStillContains!337 (ListLongMap!10761 (_ BitVec 64) V!29463 (_ BitVec 64)) Unit!30524)

(assert (=> b!900161 (= lt!406592 (addStillContains!337 lt!406593 lt!406596 (zeroValue!5274 thiss!1181) lt!406601))))

(assert (=> b!900161 (contains!4399 (+!2622 lt!406593 (tuple2!12075 lt!406596 (zeroValue!5274 thiss!1181))) lt!406601)))

(declare-fun lt!406600 () Unit!30524)

(assert (=> b!900161 (= lt!406600 lt!406592)))

(declare-fun lt!406599 () ListLongMap!10761)

(assert (=> b!900161 (= lt!406599 (getCurrentListMapNoExtraKeys!3319 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!406603 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406590 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406590 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406604 () Unit!30524)

(declare-fun addApplyDifferent!337 (ListLongMap!10761 (_ BitVec 64) V!29463 (_ BitVec 64)) Unit!30524)

(assert (=> b!900161 (= lt!406604 (addApplyDifferent!337 lt!406599 lt!406603 (minValue!5274 thiss!1181) lt!406590))))

(assert (=> b!900161 (= (apply!411 (+!2622 lt!406599 (tuple2!12075 lt!406603 (minValue!5274 thiss!1181))) lt!406590) (apply!411 lt!406599 lt!406590))))

(declare-fun lt!406605 () Unit!30524)

(assert (=> b!900161 (= lt!406605 lt!406604)))

(declare-fun lt!406591 () ListLongMap!10761)

(assert (=> b!900161 (= lt!406591 (getCurrentListMapNoExtraKeys!3319 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!406588 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406607 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406607 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406589 () Unit!30524)

(assert (=> b!900161 (= lt!406589 (addApplyDifferent!337 lt!406591 lt!406588 (zeroValue!5274 thiss!1181) lt!406607))))

(assert (=> b!900161 (= (apply!411 (+!2622 lt!406591 (tuple2!12075 lt!406588 (zeroValue!5274 thiss!1181))) lt!406607) (apply!411 lt!406591 lt!406607))))

(declare-fun lt!406608 () Unit!30524)

(assert (=> b!900161 (= lt!406608 lt!406589)))

(declare-fun lt!406602 () ListLongMap!10761)

(assert (=> b!900161 (= lt!406602 (getCurrentListMapNoExtraKeys!3319 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!406595 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406595 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406594 () (_ BitVec 64))

(assert (=> b!900161 (= lt!406594 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900161 (= lt!406609 (addApplyDifferent!337 lt!406602 lt!406595 (minValue!5274 thiss!1181) lt!406594))))

(assert (=> b!900161 (= (apply!411 (+!2622 lt!406602 (tuple2!12075 lt!406595 (minValue!5274 thiss!1181))) lt!406594) (apply!411 lt!406602 lt!406594))))

(declare-fun bm!40000 () Bool)

(assert (=> bm!40000 (= call!40000 (contains!4399 lt!406598 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900162 () Bool)

(assert (=> b!900162 (= e!503794 e!503797)))

(declare-fun res!607959 () Bool)

(assert (=> b!900162 (=> (not res!607959) (not e!503797))))

(assert (=> b!900162 (= res!607959 (contains!4399 lt!406598 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))))))

(declare-fun b!900163 () Bool)

(assert (=> b!900163 (= e!503790 (validKeyInArray!0 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900164 () Bool)

(declare-fun e!503793 () Bool)

(assert (=> b!900164 (= e!503793 (= (apply!411 lt!406598 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5274 thiss!1181)))))

(declare-fun bm!40001 () Bool)

(assert (=> bm!40001 (= call!39998 call!40002)))

(declare-fun b!900165 () Bool)

(assert (=> b!900165 (= e!503796 call!40001)))

(declare-fun b!900166 () Bool)

(assert (=> b!900166 (= e!503800 e!503793)))

(declare-fun res!607955 () Bool)

(assert (=> b!900166 (= res!607955 call!40003)))

(assert (=> b!900166 (=> (not res!607955) (not e!503793))))

(declare-fun b!900167 () Bool)

(assert (=> b!900167 (= e!503791 call!40001)))

(declare-fun b!900168 () Bool)

(assert (=> b!900168 (= e!503799 e!503796)))

(assert (=> b!900168 (= c!95267 (and (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!111519 c!95268) b!900148))

(assert (= (and d!111519 (not c!95268)) b!900168))

(assert (= (and b!900168 c!95267) b!900165))

(assert (= (and b!900168 (not c!95267)) b!900160))

(assert (= (and b!900160 c!95269) b!900167))

(assert (= (and b!900160 (not c!95269)) b!900152))

(assert (= (or b!900167 b!900152) bm!40001))

(assert (= (or b!900165 bm!40001) bm!39996))

(assert (= (or b!900165 b!900167) bm!39999))

(assert (= (or b!900148 bm!39996) bm!39995))

(assert (= (or b!900148 bm!39999) bm!39997))

(assert (= (and d!111519 res!607961) b!900151))

(assert (= (and d!111519 c!95264) b!900161))

(assert (= (and d!111519 (not c!95264)) b!900155))

(assert (= (and d!111519 res!607958) b!900159))

(assert (= (and b!900159 res!607953) b!900163))

(assert (= (and b!900159 (not res!607960)) b!900162))

(assert (= (and b!900162 res!607959) b!900149))

(assert (= (and b!900159 res!607954) b!900153))

(assert (= (and b!900153 c!95265) b!900166))

(assert (= (and b!900153 (not c!95265)) b!900156))

(assert (= (and b!900166 res!607955) b!900164))

(assert (= (or b!900166 b!900156) bm!39998))

(assert (= (and b!900153 res!607956) b!900154))

(assert (= (and b!900154 c!95266) b!900158))

(assert (= (and b!900154 (not c!95266)) b!900150))

(assert (= (and b!900158 res!607957) b!900157))

(assert (= (or b!900158 b!900150) bm!40000))

(declare-fun b_lambda!12997 () Bool)

(assert (=> (not b_lambda!12997) (not b!900149)))

(declare-fun t!25208 () Bool)

(declare-fun tb!5195 () Bool)

(assert (=> (and b!900016 (= (defaultEntry!5445 thiss!1181) (defaultEntry!5445 thiss!1181)) t!25208) tb!5195))

(declare-fun result!10173 () Bool)

(assert (=> tb!5195 (= result!10173 tp_is_empty!18373)))

(assert (=> b!900149 t!25208))

(declare-fun b_and!26345 () Bool)

(assert (= b_and!26339 (and (=> t!25208 result!10173) b_and!26345)))

(declare-fun m!836079 () Bool)

(assert (=> bm!39995 m!836079))

(declare-fun m!836081 () Bool)

(assert (=> bm!39997 m!836081))

(assert (=> d!111519 m!835993))

(assert (=> b!900162 m!836067))

(assert (=> b!900162 m!836067))

(declare-fun m!836083 () Bool)

(assert (=> b!900162 m!836083))

(declare-fun m!836085 () Bool)

(assert (=> b!900148 m!836085))

(assert (=> b!900151 m!836067))

(assert (=> b!900151 m!836067))

(declare-fun m!836087 () Bool)

(assert (=> b!900151 m!836087))

(declare-fun m!836089 () Bool)

(assert (=> b!900164 m!836089))

(declare-fun m!836091 () Bool)

(assert (=> b!900157 m!836091))

(declare-fun m!836093 () Bool)

(assert (=> b!900161 m!836093))

(declare-fun m!836095 () Bool)

(assert (=> b!900161 m!836095))

(declare-fun m!836097 () Bool)

(assert (=> b!900161 m!836097))

(declare-fun m!836099 () Bool)

(assert (=> b!900161 m!836099))

(declare-fun m!836101 () Bool)

(assert (=> b!900161 m!836101))

(declare-fun m!836103 () Bool)

(assert (=> b!900161 m!836103))

(declare-fun m!836105 () Bool)

(assert (=> b!900161 m!836105))

(declare-fun m!836107 () Bool)

(assert (=> b!900161 m!836107))

(declare-fun m!836109 () Bool)

(assert (=> b!900161 m!836109))

(assert (=> b!900161 m!836101))

(assert (=> b!900161 m!836105))

(declare-fun m!836111 () Bool)

(assert (=> b!900161 m!836111))

(declare-fun m!836113 () Bool)

(assert (=> b!900161 m!836113))

(declare-fun m!836115 () Bool)

(assert (=> b!900161 m!836115))

(assert (=> b!900161 m!836095))

(declare-fun m!836117 () Bool)

(assert (=> b!900161 m!836117))

(declare-fun m!836119 () Bool)

(assert (=> b!900161 m!836119))

(assert (=> b!900161 m!836067))

(assert (=> b!900161 m!836113))

(declare-fun m!836121 () Bool)

(assert (=> b!900161 m!836121))

(assert (=> b!900161 m!836079))

(declare-fun m!836123 () Bool)

(assert (=> bm!40000 m!836123))

(declare-fun m!836125 () Bool)

(assert (=> bm!39998 m!836125))

(assert (=> b!900163 m!836067))

(assert (=> b!900163 m!836067))

(assert (=> b!900163 m!836087))

(declare-fun m!836127 () Bool)

(assert (=> b!900149 m!836127))

(assert (=> b!900149 m!836127))

(declare-fun m!836129 () Bool)

(assert (=> b!900149 m!836129))

(declare-fun m!836131 () Bool)

(assert (=> b!900149 m!836131))

(assert (=> b!900149 m!836067))

(declare-fun m!836133 () Bool)

(assert (=> b!900149 m!836133))

(assert (=> b!900149 m!836067))

(assert (=> b!900149 m!836129))

(assert (=> b!900017 d!111519))

(declare-fun b!900179 () Bool)

(declare-fun e!503808 () Bool)

(declare-fun e!503809 () Bool)

(assert (=> b!900179 (= e!503808 e!503809)))

(declare-fun lt!406616 () (_ BitVec 64))

(assert (=> b!900179 (= lt!406616 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406617 () Unit!30524)

(assert (=> b!900179 (= lt!406617 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10241 thiss!1181) lt!406616 #b00000000000000000000000000000000))))

(assert (=> b!900179 (arrayContainsKey!0 (_keys!10241 thiss!1181) lt!406616 #b00000000000000000000000000000000)))

(declare-fun lt!406618 () Unit!30524)

(assert (=> b!900179 (= lt!406618 lt!406617)))

(declare-fun res!607967 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8938)

(assert (=> b!900179 (= res!607967 (= (seekEntryOrOpen!0 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000) (_keys!10241 thiss!1181) (mask!26218 thiss!1181)) (Found!8938 #b00000000000000000000000000000000)))))

(assert (=> b!900179 (=> (not res!607967) (not e!503809))))

(declare-fun b!900180 () Bool)

(declare-fun e!503810 () Bool)

(assert (=> b!900180 (= e!503810 e!503808)))

(declare-fun c!95272 () Bool)

(assert (=> b!900180 (= c!95272 (validKeyInArray!0 (select (arr!25361 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900181 () Bool)

(declare-fun call!40007 () Bool)

(assert (=> b!900181 (= e!503808 call!40007)))

(declare-fun b!900182 () Bool)

(assert (=> b!900182 (= e!503809 call!40007)))

(declare-fun bm!40004 () Bool)

(assert (=> bm!40004 (= call!40007 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(declare-fun d!111521 () Bool)

(declare-fun res!607966 () Bool)

(assert (=> d!111521 (=> res!607966 e!503810)))

(assert (=> d!111521 (= res!607966 (bvsge #b00000000000000000000000000000000 (size!25822 (_keys!10241 thiss!1181))))))

(assert (=> d!111521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)) e!503810)))

(assert (= (and d!111521 (not res!607966)) b!900180))

(assert (= (and b!900180 c!95272) b!900179))

(assert (= (and b!900180 (not c!95272)) b!900181))

(assert (= (and b!900179 res!607967) b!900182))

(assert (= (or b!900182 b!900181) bm!40004))

(assert (=> b!900179 m!836067))

(declare-fun m!836135 () Bool)

(assert (=> b!900179 m!836135))

(declare-fun m!836137 () Bool)

(assert (=> b!900179 m!836137))

(assert (=> b!900179 m!836067))

(declare-fun m!836139 () Bool)

(assert (=> b!900179 m!836139))

(assert (=> b!900180 m!836067))

(assert (=> b!900180 m!836067))

(assert (=> b!900180 m!836087))

(declare-fun m!836141 () Bool)

(assert (=> bm!40004 m!836141))

(assert (=> b!900013 d!111521))

(declare-fun d!111523 () Bool)

(declare-fun e!503813 () Bool)

(assert (=> d!111523 e!503813))

(declare-fun res!607970 () Bool)

(assert (=> d!111523 (=> res!607970 e!503813)))

(declare-fun lt!406624 () SeekEntryResult!8938)

(assert (=> d!111523 (= res!607970 (not ((_ is Found!8938) lt!406624)))))

(assert (=> d!111523 (= lt!406624 (seekEntry!0 key!785 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(declare-fun lt!406623 () Unit!30524)

(declare-fun choose!1522 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 64)) Unit!30524)

(assert (=> d!111523 (= lt!406623 (choose!1522 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785))))

(assert (=> d!111523 (validMask!0 (mask!26218 thiss!1181))))

(assert (=> d!111523 (= (lemmaSeekEntryGivesInRangeIndex!102 (_keys!10241 thiss!1181) (_values!5461 thiss!1181) (mask!26218 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785) lt!406623)))

(declare-fun b!900185 () Bool)

(assert (=> b!900185 (= e!503813 (inRange!0 (index!38124 lt!406624) (mask!26218 thiss!1181)))))

(assert (= (and d!111523 (not res!607970)) b!900185))

(assert (=> d!111523 m!835979))

(declare-fun m!836143 () Bool)

(assert (=> d!111523 m!836143))

(assert (=> d!111523 m!835993))

(declare-fun m!836145 () Bool)

(assert (=> b!900185 m!836145))

(assert (=> b!900009 d!111523))

(declare-fun b!900198 () Bool)

(declare-fun e!503820 () SeekEntryResult!8938)

(declare-fun lt!406635 () SeekEntryResult!8938)

(assert (=> b!900198 (= e!503820 (MissingZero!8938 (index!38125 lt!406635)))))

(declare-fun b!900199 () Bool)

(declare-fun e!503821 () SeekEntryResult!8938)

(declare-fun e!503822 () SeekEntryResult!8938)

(assert (=> b!900199 (= e!503821 e!503822)))

(declare-fun lt!406633 () (_ BitVec 64))

(assert (=> b!900199 (= lt!406633 (select (arr!25361 (_keys!10241 thiss!1181)) (index!38125 lt!406635)))))

(declare-fun c!95280 () Bool)

(assert (=> b!900199 (= c!95280 (= lt!406633 key!785))))

(declare-fun b!900200 () Bool)

(declare-fun c!95281 () Bool)

(assert (=> b!900200 (= c!95281 (= lt!406633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900200 (= e!503822 e!503820)))

(declare-fun b!900201 () Bool)

(declare-fun lt!406636 () SeekEntryResult!8938)

(assert (=> b!900201 (= e!503820 (ite ((_ is MissingVacant!8938) lt!406636) (MissingZero!8938 (index!38126 lt!406636)) lt!406636))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8938)

(assert (=> b!900201 (= lt!406636 (seekKeyOrZeroReturnVacant!0 (x!76702 lt!406635) (index!38125 lt!406635) (index!38125 lt!406635) key!785 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(declare-fun b!900202 () Bool)

(assert (=> b!900202 (= e!503822 (Found!8938 (index!38125 lt!406635)))))

(declare-fun d!111525 () Bool)

(declare-fun lt!406634 () SeekEntryResult!8938)

(assert (=> d!111525 (and (or ((_ is MissingVacant!8938) lt!406634) (not ((_ is Found!8938) lt!406634)) (and (bvsge (index!38124 lt!406634) #b00000000000000000000000000000000) (bvslt (index!38124 lt!406634) (size!25822 (_keys!10241 thiss!1181))))) (not ((_ is MissingVacant!8938) lt!406634)) (or (not ((_ is Found!8938) lt!406634)) (= (select (arr!25361 (_keys!10241 thiss!1181)) (index!38124 lt!406634)) key!785)))))

(assert (=> d!111525 (= lt!406634 e!503821)))

(declare-fun c!95279 () Bool)

(assert (=> d!111525 (= c!95279 (and ((_ is Intermediate!8938) lt!406635) (undefined!9750 lt!406635)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8938)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111525 (= lt!406635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26218 thiss!1181)) key!785 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)))))

(assert (=> d!111525 (validMask!0 (mask!26218 thiss!1181))))

(assert (=> d!111525 (= (seekEntry!0 key!785 (_keys!10241 thiss!1181) (mask!26218 thiss!1181)) lt!406634)))

(declare-fun b!900203 () Bool)

(assert (=> b!900203 (= e!503821 Undefined!8938)))

(assert (= (and d!111525 c!95279) b!900203))

(assert (= (and d!111525 (not c!95279)) b!900199))

(assert (= (and b!900199 c!95280) b!900202))

(assert (= (and b!900199 (not c!95280)) b!900200))

(assert (= (and b!900200 c!95281) b!900198))

(assert (= (and b!900200 (not c!95281)) b!900201))

(declare-fun m!836147 () Bool)

(assert (=> b!900199 m!836147))

(declare-fun m!836149 () Bool)

(assert (=> b!900201 m!836149))

(declare-fun m!836151 () Bool)

(assert (=> d!111525 m!836151))

(declare-fun m!836153 () Bool)

(assert (=> d!111525 m!836153))

(assert (=> d!111525 m!836153))

(declare-fun m!836155 () Bool)

(assert (=> d!111525 m!836155))

(assert (=> d!111525 m!835993))

(assert (=> b!900009 d!111525))

(declare-fun d!111527 () Bool)

(assert (=> d!111527 (= (inRange!0 (index!38124 lt!406501) (mask!26218 thiss!1181)) (and (bvsge (index!38124 lt!406501) #b00000000000000000000000000000000) (bvslt (index!38124 lt!406501) (bvadd (mask!26218 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900010 d!111527))

(declare-fun d!111529 () Bool)

(assert (=> d!111529 (= (array_inv!19950 (_keys!10241 thiss!1181)) (bvsge (size!25822 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900016 d!111529))

(declare-fun d!111531 () Bool)

(assert (=> d!111531 (= (array_inv!19951 (_values!5461 thiss!1181)) (bvsge (size!25823 (_values!5461 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900016 d!111531))

(declare-fun mapNonEmpty!29242 () Bool)

(declare-fun mapRes!29242 () Bool)

(declare-fun tp!56239 () Bool)

(declare-fun e!503828 () Bool)

(assert (=> mapNonEmpty!29242 (= mapRes!29242 (and tp!56239 e!503828))))

(declare-fun mapKey!29242 () (_ BitVec 32))

(declare-fun mapValue!29242 () ValueCell!8705)

(declare-fun mapRest!29242 () (Array (_ BitVec 32) ValueCell!8705))

(assert (=> mapNonEmpty!29242 (= mapRest!29233 (store mapRest!29242 mapKey!29242 mapValue!29242))))

(declare-fun b!900210 () Bool)

(assert (=> b!900210 (= e!503828 tp_is_empty!18373)))

(declare-fun mapIsEmpty!29242 () Bool)

(assert (=> mapIsEmpty!29242 mapRes!29242))

(declare-fun b!900211 () Bool)

(declare-fun e!503827 () Bool)

(assert (=> b!900211 (= e!503827 tp_is_empty!18373)))

(declare-fun condMapEmpty!29242 () Bool)

(declare-fun mapDefault!29242 () ValueCell!8705)

(assert (=> mapNonEmpty!29233 (= condMapEmpty!29242 (= mapRest!29233 ((as const (Array (_ BitVec 32) ValueCell!8705)) mapDefault!29242)))))

(assert (=> mapNonEmpty!29233 (= tp!56223 (and e!503827 mapRes!29242))))

(assert (= (and mapNonEmpty!29233 condMapEmpty!29242) mapIsEmpty!29242))

(assert (= (and mapNonEmpty!29233 (not condMapEmpty!29242)) mapNonEmpty!29242))

(assert (= (and mapNonEmpty!29242 ((_ is ValueCellFull!8705) mapValue!29242)) b!900210))

(assert (= (and mapNonEmpty!29233 ((_ is ValueCellFull!8705) mapDefault!29242)) b!900211))

(declare-fun m!836157 () Bool)

(assert (=> mapNonEmpty!29242 m!836157))

(declare-fun b_lambda!12999 () Bool)

(assert (= b_lambda!12997 (or (and b!900016 b_free!16045) b_lambda!12999)))

(check-sat (not b!900164) (not d!111509) tp_is_empty!18373 (not b!900105) (not b!900161) (not b!900087) (not bm!39997) (not b!900151) (not d!111517) (not b!900148) (not b_lambda!12999) (not d!111507) (not b!900086) (not b!900085) (not b!900179) (not bm!40004) (not b!900162) (not b!900103) b_and!26345 (not mapNonEmpty!29242) (not d!111525) (not d!111523) (not b!900090) (not d!111519) (not bm!40000) (not b!900163) (not b_next!16045) (not bm!39995) (not b!900157) (not d!111511) (not b!900149) (not b!900180) (not b!900201) (not b!900096) (not bm!39998) (not b!900185))
(check-sat b_and!26345 (not b_next!16045))
