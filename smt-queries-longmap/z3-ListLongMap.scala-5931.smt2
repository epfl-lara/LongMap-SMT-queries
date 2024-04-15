; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77320 () Bool)

(assert start!77320)

(declare-fun b!901746 () Bool)

(declare-fun b_free!16087 () Bool)

(declare-fun b_next!16087 () Bool)

(assert (=> b!901746 (= b_free!16087 (not b_next!16087))))

(declare-fun tp!56367 () Bool)

(declare-fun b_and!26421 () Bool)

(assert (=> b!901746 (= tp!56367 b_and!26421)))

(declare-fun e!504898 () Bool)

(declare-datatypes ((array!52873 0))(
  ( (array!52874 (arr!25403 (Array (_ BitVec 32) (_ BitVec 64))) (size!25864 (_ BitVec 32))) )
))
(declare-datatypes ((V!29519 0))(
  ( (V!29520 (val!9258 Int)) )
))
(declare-datatypes ((ValueCell!8726 0))(
  ( (ValueCellFull!8726 (v!11759 V!29519)) (EmptyCell!8726) )
))
(declare-datatypes ((array!52875 0))(
  ( (array!52876 (arr!25404 (Array (_ BitVec 32) ValueCell!8726)) (size!25865 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4468 0))(
  ( (LongMapFixedSize!4469 (defaultEntry!5480 Int) (mask!26293 (_ BitVec 32)) (extraKeys!5211 (_ BitVec 32)) (zeroValue!5315 V!29519) (minValue!5315 V!29519) (_size!2289 (_ BitVec 32)) (_keys!10292 array!52873) (_values!5502 array!52875) (_vacant!2289 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4468)

(declare-fun tp_is_empty!18415 () Bool)

(declare-fun e!504900 () Bool)

(declare-fun array_inv!19978 (array!52873) Bool)

(declare-fun array_inv!19979 (array!52875) Bool)

(assert (=> b!901746 (= e!504898 (and tp!56367 tp_is_empty!18415 (array_inv!19978 (_keys!10292 thiss!1181)) (array_inv!19979 (_values!5502 thiss!1181)) e!504900))))

(declare-fun b!901747 () Bool)

(declare-fun e!504893 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1314 (Int (_ BitVec 64)) V!29519)

(declare-datatypes ((Option!476 0))(
  ( (Some!475 (v!11760 V!29519)) (None!474) )
))
(declare-fun get!13379 (Option!476) V!29519)

(declare-datatypes ((tuple2!12106 0))(
  ( (tuple2!12107 (_1!6064 (_ BitVec 64)) (_2!6064 V!29519)) )
))
(declare-datatypes ((List!17892 0))(
  ( (Nil!17889) (Cons!17888 (h!19034 tuple2!12106) (t!25262 List!17892)) )
))
(declare-fun getValueByKey!470 (List!17892 (_ BitVec 64)) Option!476)

(declare-datatypes ((ListLongMap!10793 0))(
  ( (ListLongMap!10794 (toList!5412 List!17892)) )
))
(declare-fun map!12287 (LongMapFixedSize!4468) ListLongMap!10793)

(assert (=> b!901747 (= e!504893 (= (dynLambda!1314 (defaultEntry!5480 thiss!1181) key!785) (get!13379 (getValueByKey!470 (toList!5412 (map!12287 thiss!1181)) key!785))))))

(declare-fun b!901748 () Bool)

(declare-fun res!608715 () Bool)

(declare-fun e!504895 () Bool)

(assert (=> b!901748 (=> (not res!608715) (not e!504895))))

(assert (=> b!901748 (= res!608715 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901749 () Bool)

(declare-fun e!504896 () Bool)

(assert (=> b!901749 (= e!504896 tp_is_empty!18415)))

(declare-fun b!901750 () Bool)

(declare-fun e!504899 () Bool)

(declare-datatypes ((SeekEntryResult!8956 0))(
  ( (MissingZero!8956 (index!38195 (_ BitVec 32))) (Found!8956 (index!38196 (_ BitVec 32))) (Intermediate!8956 (undefined!9768 Bool) (index!38197 (_ BitVec 32)) (x!76850 (_ BitVec 32))) (Undefined!8956) (MissingVacant!8956 (index!38198 (_ BitVec 32))) )
))
(declare-fun lt!407525 () SeekEntryResult!8956)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901750 (= e!504899 (inRange!0 (index!38196 lt!407525) (mask!26293 thiss!1181)))))

(declare-fun res!608716 () Bool)

(assert (=> start!77320 (=> (not res!608716) (not e!504895))))

(declare-fun valid!1722 (LongMapFixedSize!4468) Bool)

(assert (=> start!77320 (= res!608716 (valid!1722 thiss!1181))))

(assert (=> start!77320 e!504895))

(assert (=> start!77320 e!504898))

(assert (=> start!77320 true))

(declare-fun b!901751 () Bool)

(declare-fun e!504894 () Bool)

(declare-fun mapRes!29314 () Bool)

(assert (=> b!901751 (= e!504900 (and e!504894 mapRes!29314))))

(declare-fun condMapEmpty!29314 () Bool)

(declare-fun mapDefault!29314 () ValueCell!8726)

(assert (=> b!901751 (= condMapEmpty!29314 (= (arr!25404 (_values!5502 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8726)) mapDefault!29314)))))

(declare-fun b!901752 () Bool)

(assert (=> b!901752 (= e!504894 tp_is_empty!18415)))

(declare-fun mapNonEmpty!29314 () Bool)

(declare-fun tp!56368 () Bool)

(assert (=> mapNonEmpty!29314 (= mapRes!29314 (and tp!56368 e!504896))))

(declare-fun mapKey!29314 () (_ BitVec 32))

(declare-fun mapRest!29314 () (Array (_ BitVec 32) ValueCell!8726))

(declare-fun mapValue!29314 () ValueCell!8726)

(assert (=> mapNonEmpty!29314 (= (arr!25404 (_values!5502 thiss!1181)) (store mapRest!29314 mapKey!29314 mapValue!29314))))

(declare-fun b!901753 () Bool)

(assert (=> b!901753 (= e!504895 (not e!504893))))

(declare-fun res!608717 () Bool)

(assert (=> b!901753 (=> res!608717 e!504893)))

(get-info :version)

(assert (=> b!901753 (= res!608717 ((_ is Found!8956) lt!407525))))

(assert (=> b!901753 e!504899))

(declare-fun res!608718 () Bool)

(assert (=> b!901753 (=> res!608718 e!504899)))

(assert (=> b!901753 (= res!608718 (not ((_ is Found!8956) lt!407525)))))

(declare-datatypes ((Unit!30568 0))(
  ( (Unit!30569) )
))
(declare-fun lt!407526 () Unit!30568)

(declare-fun lemmaSeekEntryGivesInRangeIndex!114 (array!52873 array!52875 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64)) Unit!30568)

(assert (=> b!901753 (= lt!407526 (lemmaSeekEntryGivesInRangeIndex!114 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52873 (_ BitVec 32)) SeekEntryResult!8956)

(assert (=> b!901753 (= lt!407525 (seekEntry!0 key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun b!901754 () Bool)

(declare-fun res!608719 () Bool)

(assert (=> b!901754 (=> res!608719 e!504893)))

(declare-fun contains!4417 (LongMapFixedSize!4468 (_ BitVec 64)) Bool)

(assert (=> b!901754 (= res!608719 (not (contains!4417 thiss!1181 key!785)))))

(declare-fun mapIsEmpty!29314 () Bool)

(assert (=> mapIsEmpty!29314 mapRes!29314))

(assert (= (and start!77320 res!608716) b!901748))

(assert (= (and b!901748 res!608715) b!901753))

(assert (= (and b!901753 (not res!608718)) b!901750))

(assert (= (and b!901753 (not res!608717)) b!901754))

(assert (= (and b!901754 (not res!608719)) b!901747))

(assert (= (and b!901751 condMapEmpty!29314) mapIsEmpty!29314))

(assert (= (and b!901751 (not condMapEmpty!29314)) mapNonEmpty!29314))

(assert (= (and mapNonEmpty!29314 ((_ is ValueCellFull!8726) mapValue!29314)) b!901749))

(assert (= (and b!901751 ((_ is ValueCellFull!8726) mapDefault!29314)) b!901752))

(assert (= b!901746 b!901751))

(assert (= start!77320 b!901746))

(declare-fun b_lambda!13061 () Bool)

(assert (=> (not b_lambda!13061) (not b!901747)))

(declare-fun t!25261 () Bool)

(declare-fun tb!5221 () Bool)

(assert (=> (and b!901746 (= (defaultEntry!5480 thiss!1181) (defaultEntry!5480 thiss!1181)) t!25261) tb!5221))

(declare-fun result!10231 () Bool)

(assert (=> tb!5221 (= result!10231 tp_is_empty!18415)))

(assert (=> b!901747 t!25261))

(declare-fun b_and!26423 () Bool)

(assert (= b_and!26421 (and (=> t!25261 result!10231) b_and!26423)))

(declare-fun m!837381 () Bool)

(assert (=> b!901746 m!837381))

(declare-fun m!837383 () Bool)

(assert (=> b!901746 m!837383))

(declare-fun m!837385 () Bool)

(assert (=> b!901754 m!837385))

(declare-fun m!837387 () Bool)

(assert (=> b!901753 m!837387))

(declare-fun m!837389 () Bool)

(assert (=> b!901753 m!837389))

(declare-fun m!837391 () Bool)

(assert (=> start!77320 m!837391))

(declare-fun m!837393 () Bool)

(assert (=> b!901750 m!837393))

(declare-fun m!837395 () Bool)

(assert (=> b!901747 m!837395))

(declare-fun m!837397 () Bool)

(assert (=> b!901747 m!837397))

(declare-fun m!837399 () Bool)

(assert (=> b!901747 m!837399))

(assert (=> b!901747 m!837399))

(declare-fun m!837401 () Bool)

(assert (=> b!901747 m!837401))

(declare-fun m!837403 () Bool)

(assert (=> mapNonEmpty!29314 m!837403))

(check-sat (not b!901750) tp_is_empty!18415 b_and!26423 (not b!901746) (not b!901747) (not b!901753) (not b!901754) (not b_next!16087) (not b_lambda!13061) (not start!77320) (not mapNonEmpty!29314))
(check-sat b_and!26423 (not b_next!16087))
(get-model)

(declare-fun b_lambda!13067 () Bool)

(assert (= b_lambda!13061 (or (and b!901746 b_free!16087) b_lambda!13067)))

(check-sat (not b!901750) b_and!26423 (not b!901746) (not b_next!16087) (not b!901747) (not b!901753) (not b!901754) (not b_lambda!13067) tp_is_empty!18415 (not start!77320) (not mapNonEmpty!29314))
(check-sat b_and!26423 (not b_next!16087))
(get-model)

(declare-fun d!111699 () Bool)

(declare-fun e!504951 () Bool)

(assert (=> d!111699 e!504951))

(declare-fun res!608752 () Bool)

(assert (=> d!111699 (=> res!608752 e!504951)))

(declare-fun lt!407544 () SeekEntryResult!8956)

(assert (=> d!111699 (= res!608752 (not ((_ is Found!8956) lt!407544)))))

(assert (=> d!111699 (= lt!407544 (seekEntry!0 key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun lt!407543 () Unit!30568)

(declare-fun choose!1535 (array!52873 array!52875 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64)) Unit!30568)

(assert (=> d!111699 (= lt!407543 (choose!1535 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111699 (validMask!0 (mask!26293 thiss!1181))))

(assert (=> d!111699 (= (lemmaSeekEntryGivesInRangeIndex!114 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785) lt!407543)))

(declare-fun b!901817 () Bool)

(assert (=> b!901817 (= e!504951 (inRange!0 (index!38196 lt!407544) (mask!26293 thiss!1181)))))

(assert (= (and d!111699 (not res!608752)) b!901817))

(assert (=> d!111699 m!837389))

(declare-fun m!837453 () Bool)

(assert (=> d!111699 m!837453))

(declare-fun m!837455 () Bool)

(assert (=> d!111699 m!837455))

(declare-fun m!837457 () Bool)

(assert (=> b!901817 m!837457))

(assert (=> b!901753 d!111699))

(declare-fun b!901830 () Bool)

(declare-fun e!504960 () SeekEntryResult!8956)

(declare-fun lt!407554 () SeekEntryResult!8956)

(assert (=> b!901830 (= e!504960 (Found!8956 (index!38197 lt!407554)))))

(declare-fun b!901831 () Bool)

(declare-fun e!504959 () SeekEntryResult!8956)

(assert (=> b!901831 (= e!504959 Undefined!8956)))

(declare-fun d!111701 () Bool)

(declare-fun lt!407555 () SeekEntryResult!8956)

(assert (=> d!111701 (and (or ((_ is MissingVacant!8956) lt!407555) (not ((_ is Found!8956) lt!407555)) (and (bvsge (index!38196 lt!407555) #b00000000000000000000000000000000) (bvslt (index!38196 lt!407555) (size!25864 (_keys!10292 thiss!1181))))) (not ((_ is MissingVacant!8956) lt!407555)) (or (not ((_ is Found!8956) lt!407555)) (= (select (arr!25403 (_keys!10292 thiss!1181)) (index!38196 lt!407555)) key!785)))))

(assert (=> d!111701 (= lt!407555 e!504959)))

(declare-fun c!95542 () Bool)

(assert (=> d!111701 (= c!95542 (and ((_ is Intermediate!8956) lt!407554) (undefined!9768 lt!407554)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52873 (_ BitVec 32)) SeekEntryResult!8956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111701 (= lt!407554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26293 thiss!1181)) key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(assert (=> d!111701 (validMask!0 (mask!26293 thiss!1181))))

(assert (=> d!111701 (= (seekEntry!0 key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)) lt!407555)))

(declare-fun b!901832 () Bool)

(declare-fun c!95543 () Bool)

(declare-fun lt!407556 () (_ BitVec 64))

(assert (=> b!901832 (= c!95543 (= lt!407556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504958 () SeekEntryResult!8956)

(assert (=> b!901832 (= e!504960 e!504958)))

(declare-fun b!901833 () Bool)

(assert (=> b!901833 (= e!504959 e!504960)))

(assert (=> b!901833 (= lt!407556 (select (arr!25403 (_keys!10292 thiss!1181)) (index!38197 lt!407554)))))

(declare-fun c!95544 () Bool)

(assert (=> b!901833 (= c!95544 (= lt!407556 key!785))))

(declare-fun b!901834 () Bool)

(declare-fun lt!407553 () SeekEntryResult!8956)

(assert (=> b!901834 (= e!504958 (ite ((_ is MissingVacant!8956) lt!407553) (MissingZero!8956 (index!38198 lt!407553)) lt!407553))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52873 (_ BitVec 32)) SeekEntryResult!8956)

(assert (=> b!901834 (= lt!407553 (seekKeyOrZeroReturnVacant!0 (x!76850 lt!407554) (index!38197 lt!407554) (index!38197 lt!407554) key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun b!901835 () Bool)

(assert (=> b!901835 (= e!504958 (MissingZero!8956 (index!38197 lt!407554)))))

(assert (= (and d!111701 c!95542) b!901831))

(assert (= (and d!111701 (not c!95542)) b!901833))

(assert (= (and b!901833 c!95544) b!901830))

(assert (= (and b!901833 (not c!95544)) b!901832))

(assert (= (and b!901832 c!95543) b!901835))

(assert (= (and b!901832 (not c!95543)) b!901834))

(declare-fun m!837459 () Bool)

(assert (=> d!111701 m!837459))

(declare-fun m!837461 () Bool)

(assert (=> d!111701 m!837461))

(assert (=> d!111701 m!837461))

(declare-fun m!837463 () Bool)

(assert (=> d!111701 m!837463))

(assert (=> d!111701 m!837455))

(declare-fun m!837465 () Bool)

(assert (=> b!901833 m!837465))

(declare-fun m!837467 () Bool)

(assert (=> b!901834 m!837467))

(assert (=> b!901753 d!111701))

(declare-fun d!111703 () Bool)

(declare-fun res!608759 () Bool)

(declare-fun e!504963 () Bool)

(assert (=> d!111703 (=> (not res!608759) (not e!504963))))

(declare-fun simpleValid!335 (LongMapFixedSize!4468) Bool)

(assert (=> d!111703 (= res!608759 (simpleValid!335 thiss!1181))))

(assert (=> d!111703 (= (valid!1722 thiss!1181) e!504963)))

(declare-fun b!901842 () Bool)

(declare-fun res!608760 () Bool)

(assert (=> b!901842 (=> (not res!608760) (not e!504963))))

(declare-fun arrayCountValidKeys!0 (array!52873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901842 (= res!608760 (= (arrayCountValidKeys!0 (_keys!10292 thiss!1181) #b00000000000000000000000000000000 (size!25864 (_keys!10292 thiss!1181))) (_size!2289 thiss!1181)))))

(declare-fun b!901843 () Bool)

(declare-fun res!608761 () Bool)

(assert (=> b!901843 (=> (not res!608761) (not e!504963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52873 (_ BitVec 32)) Bool)

(assert (=> b!901843 (= res!608761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun b!901844 () Bool)

(declare-datatypes ((List!17894 0))(
  ( (Nil!17891) (Cons!17890 (h!19036 (_ BitVec 64)) (t!25268 List!17894)) )
))
(declare-fun arrayNoDuplicates!0 (array!52873 (_ BitVec 32) List!17894) Bool)

(assert (=> b!901844 (= e!504963 (arrayNoDuplicates!0 (_keys!10292 thiss!1181) #b00000000000000000000000000000000 Nil!17891))))

(assert (= (and d!111703 res!608759) b!901842))

(assert (= (and b!901842 res!608760) b!901843))

(assert (= (and b!901843 res!608761) b!901844))

(declare-fun m!837469 () Bool)

(assert (=> d!111703 m!837469))

(declare-fun m!837471 () Bool)

(assert (=> b!901842 m!837471))

(declare-fun m!837473 () Bool)

(assert (=> b!901843 m!837473))

(declare-fun m!837475 () Bool)

(assert (=> b!901844 m!837475))

(assert (=> start!77320 d!111703))

(declare-fun d!111705 () Bool)

(assert (=> d!111705 (= (get!13379 (getValueByKey!470 (toList!5412 (map!12287 thiss!1181)) key!785)) (v!11760 (getValueByKey!470 (toList!5412 (map!12287 thiss!1181)) key!785)))))

(assert (=> b!901747 d!111705))

(declare-fun d!111707 () Bool)

(declare-fun c!95549 () Bool)

(assert (=> d!111707 (= c!95549 (and ((_ is Cons!17888) (toList!5412 (map!12287 thiss!1181))) (= (_1!6064 (h!19034 (toList!5412 (map!12287 thiss!1181)))) key!785)))))

(declare-fun e!504968 () Option!476)

(assert (=> d!111707 (= (getValueByKey!470 (toList!5412 (map!12287 thiss!1181)) key!785) e!504968)))

(declare-fun b!901853 () Bool)

(assert (=> b!901853 (= e!504968 (Some!475 (_2!6064 (h!19034 (toList!5412 (map!12287 thiss!1181))))))))

(declare-fun b!901855 () Bool)

(declare-fun e!504969 () Option!476)

(assert (=> b!901855 (= e!504969 (getValueByKey!470 (t!25262 (toList!5412 (map!12287 thiss!1181))) key!785))))

(declare-fun b!901856 () Bool)

(assert (=> b!901856 (= e!504969 None!474)))

(declare-fun b!901854 () Bool)

(assert (=> b!901854 (= e!504968 e!504969)))

(declare-fun c!95550 () Bool)

(assert (=> b!901854 (= c!95550 (and ((_ is Cons!17888) (toList!5412 (map!12287 thiss!1181))) (not (= (_1!6064 (h!19034 (toList!5412 (map!12287 thiss!1181)))) key!785))))))

(assert (= (and d!111707 c!95549) b!901853))

(assert (= (and d!111707 (not c!95549)) b!901854))

(assert (= (and b!901854 c!95550) b!901855))

(assert (= (and b!901854 (not c!95550)) b!901856))

(declare-fun m!837477 () Bool)

(assert (=> b!901855 m!837477))

(assert (=> b!901747 d!111707))

(declare-fun d!111709 () Bool)

(declare-fun getCurrentListMap!2628 (array!52873 array!52875 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 32) Int) ListLongMap!10793)

(assert (=> d!111709 (= (map!12287 thiss!1181) (getCurrentListMap!2628 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5480 thiss!1181)))))

(declare-fun bs!25283 () Bool)

(assert (= bs!25283 d!111709))

(declare-fun m!837479 () Bool)

(assert (=> bs!25283 m!837479))

(assert (=> b!901747 d!111709))

(declare-fun d!111711 () Bool)

(assert (=> d!111711 (= (array_inv!19978 (_keys!10292 thiss!1181)) (bvsge (size!25864 (_keys!10292 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901746 d!111711))

(declare-fun d!111713 () Bool)

(assert (=> d!111713 (= (array_inv!19979 (_values!5502 thiss!1181)) (bvsge (size!25865 (_values!5502 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901746 d!111713))

(declare-fun b!901877 () Bool)

(declare-fun e!504982 () Unit!30568)

(declare-fun Unit!30572 () Unit!30568)

(assert (=> b!901877 (= e!504982 Unit!30572)))

(declare-fun bm!40203 () Bool)

(declare-fun call!40208 () ListLongMap!10793)

(assert (=> bm!40203 (= call!40208 (getCurrentListMap!2628 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5480 thiss!1181)))))

(declare-fun bm!40204 () Bool)

(declare-fun lt!407601 () SeekEntryResult!8956)

(declare-fun call!40207 () Bool)

(declare-fun c!95563 () Bool)

(declare-fun contains!4420 (ListLongMap!10793 (_ BitVec 64)) Bool)

(assert (=> bm!40204 (= call!40207 (contains!4420 call!40208 (ite c!95563 (select (arr!25403 (_keys!10292 thiss!1181)) (index!38196 lt!407601)) key!785)))))

(declare-fun b!901878 () Bool)

(declare-fun e!504981 () Bool)

(declare-fun e!504980 () Bool)

(assert (=> b!901878 (= e!504981 e!504980)))

(declare-fun c!95564 () Bool)

(assert (=> b!901878 (= c!95564 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!111715 () Bool)

(declare-fun lt!407599 () Bool)

(assert (=> d!111715 (= lt!407599 (contains!4420 (map!12287 thiss!1181) key!785))))

(assert (=> d!111715 (= lt!407599 e!504981)))

(declare-fun c!95561 () Bool)

(assert (=> d!111715 (= c!95561 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111715 (valid!1722 thiss!1181)))

(assert (=> d!111715 (= (contains!4417 thiss!1181 key!785) lt!407599)))

(declare-fun b!901879 () Bool)

(assert (=> b!901879 (= e!504980 (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901880 () Bool)

(assert (=> b!901880 (= c!95563 ((_ is Found!8956) lt!407601))))

(assert (=> b!901880 (= lt!407601 (seekEntry!0 key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun e!504984 () Bool)

(assert (=> b!901880 (= e!504980 e!504984)))

(declare-fun b!901881 () Bool)

(assert (=> b!901881 (= e!504984 false)))

(declare-fun c!95565 () Bool)

(assert (=> b!901881 (= c!95565 call!40207)))

(declare-fun lt!407590 () Unit!30568)

(assert (=> b!901881 (= lt!407590 e!504982)))

(declare-fun b!901882 () Bool)

(declare-fun e!504983 () Bool)

(assert (=> b!901882 (= e!504983 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!901883 () Bool)

(declare-fun call!40206 () Bool)

(assert (=> b!901883 (= e!504983 call!40206)))

(declare-fun b!901884 () Bool)

(assert (=> b!901884 (= e!504981 (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40205 () Bool)

(declare-fun arrayContainsKey!0 (array!52873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!40205 (= call!40206 (arrayContainsKey!0 (_keys!10292 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!901885 () Bool)

(assert (=> b!901885 false))

(declare-fun lt!407594 () Unit!30568)

(declare-fun lt!407598 () Unit!30568)

(assert (=> b!901885 (= lt!407594 lt!407598)))

(declare-fun lt!407588 () SeekEntryResult!8956)

(declare-fun lt!407587 () (_ BitVec 32))

(assert (=> b!901885 (and ((_ is Found!8956) lt!407588) (= (index!38196 lt!407588) lt!407587))))

(assert (=> b!901885 (= lt!407588 (seekEntry!0 key!785 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52873 (_ BitVec 32)) Unit!30568)

(assert (=> b!901885 (= lt!407598 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!407587 (_keys!10292 thiss!1181) (mask!26293 thiss!1181)))))

(declare-fun lt!407597 () Unit!30568)

(declare-fun lt!407596 () Unit!30568)

(assert (=> b!901885 (= lt!407597 lt!407596)))

(assert (=> b!901885 (arrayForallSeekEntryOrOpenFound!0 lt!407587 (_keys!10292 thiss!1181) (mask!26293 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30568)

(assert (=> b!901885 (= lt!407596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10292 thiss!1181) (mask!26293 thiss!1181) #b00000000000000000000000000000000 lt!407587))))

(declare-fun arrayScanForKey!0 (array!52873 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901885 (= lt!407587 (arrayScanForKey!0 (_keys!10292 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!407591 () Unit!30568)

(declare-fun lt!407595 () Unit!30568)

(assert (=> b!901885 (= lt!407591 lt!407595)))

(assert (=> b!901885 e!504983))

(declare-fun c!95562 () Bool)

(assert (=> b!901885 (= c!95562 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!173 (array!52873 array!52875 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64) Int) Unit!30568)

(assert (=> b!901885 (= lt!407595 (lemmaKeyInListMapIsInArray!173 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785 (defaultEntry!5480 thiss!1181)))))

(declare-fun Unit!30573 () Unit!30568)

(assert (=> b!901885 (= e!504982 Unit!30573)))

(declare-fun b!901886 () Bool)

(assert (=> b!901886 (= e!504984 true)))

(declare-fun lt!407593 () Unit!30568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52873 (_ BitVec 64) (_ BitVec 32)) Unit!30568)

(assert (=> b!901886 (= lt!407593 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10292 thiss!1181) key!785 (index!38196 lt!407601)))))

(assert (=> b!901886 call!40206))

(declare-fun lt!407600 () Unit!30568)

(assert (=> b!901886 (= lt!407600 lt!407593)))

(declare-fun lt!407589 () Unit!30568)

(declare-fun lemmaValidKeyInArrayIsInListMap!264 (array!52873 array!52875 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 32) Int) Unit!30568)

(assert (=> b!901886 (= lt!407589 (lemmaValidKeyInArrayIsInListMap!264 (_keys!10292 thiss!1181) (_values!5502 thiss!1181) (mask!26293 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) (index!38196 lt!407601) (defaultEntry!5480 thiss!1181)))))

(assert (=> b!901886 call!40207))

(declare-fun lt!407592 () Unit!30568)

(assert (=> b!901886 (= lt!407592 lt!407589)))

(assert (= (and d!111715 c!95561) b!901884))

(assert (= (and d!111715 (not c!95561)) b!901878))

(assert (= (and b!901878 c!95564) b!901879))

(assert (= (and b!901878 (not c!95564)) b!901880))

(assert (= (and b!901880 c!95563) b!901886))

(assert (= (and b!901880 (not c!95563)) b!901881))

(assert (= (and b!901881 c!95565) b!901885))

(assert (= (and b!901881 (not c!95565)) b!901877))

(assert (= (and b!901885 c!95562) b!901883))

(assert (= (and b!901885 (not c!95562)) b!901882))

(assert (= (or b!901886 b!901883) bm!40205))

(assert (= (or b!901886 b!901881) bm!40203))

(assert (= (or b!901886 b!901881) bm!40204))

(declare-fun m!837481 () Bool)

(assert (=> b!901885 m!837481))

(declare-fun m!837483 () Bool)

(assert (=> b!901885 m!837483))

(declare-fun m!837485 () Bool)

(assert (=> b!901885 m!837485))

(assert (=> b!901885 m!837389))

(declare-fun m!837487 () Bool)

(assert (=> b!901885 m!837487))

(declare-fun m!837489 () Bool)

(assert (=> b!901885 m!837489))

(assert (=> bm!40203 m!837479))

(assert (=> d!111715 m!837397))

(assert (=> d!111715 m!837397))

(declare-fun m!837491 () Bool)

(assert (=> d!111715 m!837491))

(assert (=> d!111715 m!837391))

(declare-fun m!837493 () Bool)

(assert (=> bm!40205 m!837493))

(declare-fun m!837495 () Bool)

(assert (=> b!901886 m!837495))

(declare-fun m!837497 () Bool)

(assert (=> b!901886 m!837497))

(declare-fun m!837499 () Bool)

(assert (=> bm!40204 m!837499))

(declare-fun m!837501 () Bool)

(assert (=> bm!40204 m!837501))

(assert (=> b!901880 m!837389))

(assert (=> b!901754 d!111715))

(declare-fun d!111717 () Bool)

(assert (=> d!111717 (= (inRange!0 (index!38196 lt!407525) (mask!26293 thiss!1181)) (and (bvsge (index!38196 lt!407525) #b00000000000000000000000000000000) (bvslt (index!38196 lt!407525) (bvadd (mask!26293 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901750 d!111717))

(declare-fun mapNonEmpty!29323 () Bool)

(declare-fun mapRes!29323 () Bool)

(declare-fun tp!56383 () Bool)

(declare-fun e!504989 () Bool)

(assert (=> mapNonEmpty!29323 (= mapRes!29323 (and tp!56383 e!504989))))

(declare-fun mapValue!29323 () ValueCell!8726)

(declare-fun mapRest!29323 () (Array (_ BitVec 32) ValueCell!8726))

(declare-fun mapKey!29323 () (_ BitVec 32))

(assert (=> mapNonEmpty!29323 (= mapRest!29314 (store mapRest!29323 mapKey!29323 mapValue!29323))))

(declare-fun b!901893 () Bool)

(assert (=> b!901893 (= e!504989 tp_is_empty!18415)))

(declare-fun condMapEmpty!29323 () Bool)

(declare-fun mapDefault!29323 () ValueCell!8726)

(assert (=> mapNonEmpty!29314 (= condMapEmpty!29323 (= mapRest!29314 ((as const (Array (_ BitVec 32) ValueCell!8726)) mapDefault!29323)))))

(declare-fun e!504990 () Bool)

(assert (=> mapNonEmpty!29314 (= tp!56368 (and e!504990 mapRes!29323))))

(declare-fun mapIsEmpty!29323 () Bool)

(assert (=> mapIsEmpty!29323 mapRes!29323))

(declare-fun b!901894 () Bool)

(assert (=> b!901894 (= e!504990 tp_is_empty!18415)))

(assert (= (and mapNonEmpty!29314 condMapEmpty!29323) mapIsEmpty!29323))

(assert (= (and mapNonEmpty!29314 (not condMapEmpty!29323)) mapNonEmpty!29323))

(assert (= (and mapNonEmpty!29323 ((_ is ValueCellFull!8726) mapValue!29323)) b!901893))

(assert (= (and mapNonEmpty!29314 ((_ is ValueCellFull!8726) mapDefault!29323)) b!901894))

(declare-fun m!837503 () Bool)

(assert (=> mapNonEmpty!29323 m!837503))

(check-sat (not d!111699) (not d!111715) (not b!901843) (not b!901834) (not bm!40205) b_and!26423 (not b!901880) (not d!111701) (not b!901886) (not b!901844) (not d!111709) (not b!901842) (not b!901885) (not d!111703) (not bm!40204) (not b_lambda!13067) tp_is_empty!18415 (not bm!40203) (not b!901855) (not b_next!16087) (not b!901817) (not mapNonEmpty!29323))
(check-sat b_and!26423 (not b_next!16087))
