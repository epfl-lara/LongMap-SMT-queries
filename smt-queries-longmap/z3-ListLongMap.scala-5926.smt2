; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77190 () Bool)

(assert start!77190)

(declare-fun b!900765 () Bool)

(declare-fun b_free!16059 () Bool)

(declare-fun b_next!16059 () Bool)

(assert (=> b!900765 (= b_free!16059 (not b_next!16059))))

(declare-fun tp!56271 () Bool)

(declare-fun b_and!26383 () Bool)

(assert (=> b!900765 (= tp!56271 b_and!26383)))

(declare-fun b!900758 () Bool)

(declare-fun e!504206 () Bool)

(declare-fun tp_is_empty!18387 () Bool)

(assert (=> b!900758 (= e!504206 tp_is_empty!18387)))

(declare-fun b!900759 () Bool)

(declare-fun res!608254 () Bool)

(declare-fun e!504204 () Bool)

(assert (=> b!900759 (=> res!608254 e!504204)))

(declare-datatypes ((array!52826 0))(
  ( (array!52827 (arr!25383 (Array (_ BitVec 32) (_ BitVec 64))) (size!25842 (_ BitVec 32))) )
))
(declare-datatypes ((V!29481 0))(
  ( (V!29482 (val!9244 Int)) )
))
(declare-datatypes ((ValueCell!8712 0))(
  ( (ValueCellFull!8712 (v!11742 V!29481)) (EmptyCell!8712) )
))
(declare-datatypes ((array!52828 0))(
  ( (array!52829 (arr!25384 (Array (_ BitVec 32) ValueCell!8712)) (size!25843 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4440 0))(
  ( (LongMapFixedSize!4441 (defaultEntry!5456 Int) (mask!26250 (_ BitVec 32)) (extraKeys!5183 (_ BitVec 32)) (zeroValue!5287 V!29481) (minValue!5287 V!29481) (_size!2275 (_ BitVec 32)) (_keys!10263 array!52826) (_values!5474 array!52828) (_vacant!2275 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4440)

(assert (=> b!900759 (= res!608254 (or (not (= (size!25843 (_values!5474 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26250 thiss!1181)))) (not (= (size!25842 (_keys!10263 thiss!1181)) (size!25843 (_values!5474 thiss!1181)))) (bvslt (mask!26250 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5183 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5183 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900760 () Bool)

(declare-datatypes ((tuple2!12056 0))(
  ( (tuple2!12057 (_1!6039 (_ BitVec 64)) (_2!6039 V!29481)) )
))
(declare-datatypes ((List!17860 0))(
  ( (Nil!17857) (Cons!17856 (h!19002 tuple2!12056) (t!25215 List!17860)) )
))
(declare-datatypes ((ListLongMap!10753 0))(
  ( (ListLongMap!10754 (toList!5392 List!17860)) )
))
(declare-fun lt!407045 () ListLongMap!10753)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4430 (ListLongMap!10753 (_ BitVec 64)) Bool)

(assert (=> b!900760 (= e!504204 (contains!4430 lt!407045 key!785))))

(declare-fun b!900761 () Bool)

(declare-fun res!608253 () Bool)

(assert (=> b!900761 (=> res!608253 e!504204)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52826 (_ BitVec 32)) Bool)

(assert (=> b!900761 (= res!608253 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10263 thiss!1181) (mask!26250 thiss!1181))))))

(declare-fun b!900762 () Bool)

(declare-fun e!504200 () Bool)

(declare-fun e!504205 () Bool)

(assert (=> b!900762 (= e!504200 (not e!504205))))

(declare-fun res!608255 () Bool)

(assert (=> b!900762 (=> res!608255 e!504205)))

(declare-datatypes ((SeekEntryResult!8943 0))(
  ( (MissingZero!8943 (index!38143 (_ BitVec 32))) (Found!8943 (index!38144 (_ BitVec 32))) (Intermediate!8943 (undefined!9755 Bool) (index!38145 (_ BitVec 32)) (x!76748 (_ BitVec 32))) (Undefined!8943) (MissingVacant!8943 (index!38146 (_ BitVec 32))) )
))
(declare-fun lt!407049 () SeekEntryResult!8943)

(get-info :version)

(assert (=> b!900762 (= res!608255 (not ((_ is Found!8943) lt!407049)))))

(declare-fun e!504199 () Bool)

(assert (=> b!900762 e!504199))

(declare-fun res!608252 () Bool)

(assert (=> b!900762 (=> res!608252 e!504199)))

(assert (=> b!900762 (= res!608252 (not ((_ is Found!8943) lt!407049)))))

(declare-datatypes ((Unit!30596 0))(
  ( (Unit!30597) )
))
(declare-fun lt!407048 () Unit!30596)

(declare-fun lemmaSeekEntryGivesInRangeIndex!104 (array!52826 array!52828 (_ BitVec 32) (_ BitVec 32) V!29481 V!29481 (_ BitVec 64)) Unit!30596)

(assert (=> b!900762 (= lt!407048 (lemmaSeekEntryGivesInRangeIndex!104 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52826 (_ BitVec 32)) SeekEntryResult!8943)

(assert (=> b!900762 (= lt!407049 (seekEntry!0 key!785 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900763 () Bool)

(declare-fun e!504203 () Bool)

(assert (=> b!900763 (= e!504203 tp_is_empty!18387)))

(declare-fun mapNonEmpty!29260 () Bool)

(declare-fun mapRes!29260 () Bool)

(declare-fun tp!56270 () Bool)

(assert (=> mapNonEmpty!29260 (= mapRes!29260 (and tp!56270 e!504206))))

(declare-fun mapValue!29260 () ValueCell!8712)

(declare-fun mapKey!29260 () (_ BitVec 32))

(declare-fun mapRest!29260 () (Array (_ BitVec 32) ValueCell!8712))

(assert (=> mapNonEmpty!29260 (= (arr!25384 (_values!5474 thiss!1181)) (store mapRest!29260 mapKey!29260 mapValue!29260))))

(declare-fun b!900764 () Bool)

(assert (=> b!900764 (= e!504205 e!504204)))

(declare-fun res!608251 () Bool)

(assert (=> b!900764 (=> res!608251 e!504204)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900764 (= res!608251 (not (validMask!0 (mask!26250 thiss!1181))))))

(assert (=> b!900764 (contains!4430 lt!407045 (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049)))))

(declare-fun getCurrentListMap!2665 (array!52826 array!52828 (_ BitVec 32) (_ BitVec 32) V!29481 V!29481 (_ BitVec 32) Int) ListLongMap!10753)

(assert (=> b!900764 (= lt!407045 (getCurrentListMap!2665 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)))))

(declare-fun lt!407047 () Unit!30596)

(declare-fun lemmaValidKeyInArrayIsInListMap!254 (array!52826 array!52828 (_ BitVec 32) (_ BitVec 32) V!29481 V!29481 (_ BitVec 32) Int) Unit!30596)

(assert (=> b!900764 (= lt!407047 (lemmaValidKeyInArrayIsInListMap!254 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) (index!38144 lt!407049) (defaultEntry!5456 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900764 (arrayContainsKey!0 (_keys!10263 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407046 () Unit!30596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52826 (_ BitVec 64) (_ BitVec 32)) Unit!30596)

(assert (=> b!900764 (= lt!407046 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10263 thiss!1181) key!785 (index!38144 lt!407049)))))

(declare-fun res!608250 () Bool)

(assert (=> start!77190 (=> (not res!608250) (not e!504200))))

(declare-fun valid!1703 (LongMapFixedSize!4440) Bool)

(assert (=> start!77190 (= res!608250 (valid!1703 thiss!1181))))

(assert (=> start!77190 e!504200))

(declare-fun e!504201 () Bool)

(assert (=> start!77190 e!504201))

(assert (=> start!77190 true))

(declare-fun e!504207 () Bool)

(declare-fun array_inv!19910 (array!52826) Bool)

(declare-fun array_inv!19911 (array!52828) Bool)

(assert (=> b!900765 (= e!504201 (and tp!56271 tp_is_empty!18387 (array_inv!19910 (_keys!10263 thiss!1181)) (array_inv!19911 (_values!5474 thiss!1181)) e!504207))))

(declare-fun b!900766 () Bool)

(declare-fun res!608257 () Bool)

(assert (=> b!900766 (=> (not res!608257) (not e!504200))))

(assert (=> b!900766 (= res!608257 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900767 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900767 (= e!504199 (inRange!0 (index!38144 lt!407049) (mask!26250 thiss!1181)))))

(declare-fun b!900768 () Bool)

(assert (=> b!900768 (= e!504207 (and e!504203 mapRes!29260))))

(declare-fun condMapEmpty!29260 () Bool)

(declare-fun mapDefault!29260 () ValueCell!8712)

(assert (=> b!900768 (= condMapEmpty!29260 (= (arr!25384 (_values!5474 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8712)) mapDefault!29260)))))

(declare-fun b!900769 () Bool)

(declare-fun res!608256 () Bool)

(assert (=> b!900769 (=> res!608256 e!504204)))

(declare-datatypes ((List!17861 0))(
  ( (Nil!17858) (Cons!17857 (h!19003 (_ BitVec 64)) (t!25216 List!17861)) )
))
(declare-fun arrayNoDuplicates!0 (array!52826 (_ BitVec 32) List!17861) Bool)

(assert (=> b!900769 (= res!608256 (not (arrayNoDuplicates!0 (_keys!10263 thiss!1181) #b00000000000000000000000000000000 Nil!17858)))))

(declare-fun mapIsEmpty!29260 () Bool)

(assert (=> mapIsEmpty!29260 mapRes!29260))

(assert (= (and start!77190 res!608250) b!900766))

(assert (= (and b!900766 res!608257) b!900762))

(assert (= (and b!900762 (not res!608252)) b!900767))

(assert (= (and b!900762 (not res!608255)) b!900764))

(assert (= (and b!900764 (not res!608251)) b!900759))

(assert (= (and b!900759 (not res!608254)) b!900761))

(assert (= (and b!900761 (not res!608253)) b!900769))

(assert (= (and b!900769 (not res!608256)) b!900760))

(assert (= (and b!900768 condMapEmpty!29260) mapIsEmpty!29260))

(assert (= (and b!900768 (not condMapEmpty!29260)) mapNonEmpty!29260))

(assert (= (and mapNonEmpty!29260 ((_ is ValueCellFull!8712) mapValue!29260)) b!900758))

(assert (= (and b!900768 ((_ is ValueCellFull!8712) mapDefault!29260)) b!900763))

(assert (= b!900765 b!900768))

(assert (= start!77190 b!900765))

(declare-fun m!837151 () Bool)

(assert (=> mapNonEmpty!29260 m!837151))

(declare-fun m!837153 () Bool)

(assert (=> b!900761 m!837153))

(declare-fun m!837155 () Bool)

(assert (=> b!900769 m!837155))

(declare-fun m!837157 () Bool)

(assert (=> start!77190 m!837157))

(declare-fun m!837159 () Bool)

(assert (=> b!900760 m!837159))

(declare-fun m!837161 () Bool)

(assert (=> b!900767 m!837161))

(declare-fun m!837163 () Bool)

(assert (=> b!900764 m!837163))

(declare-fun m!837165 () Bool)

(assert (=> b!900764 m!837165))

(declare-fun m!837167 () Bool)

(assert (=> b!900764 m!837167))

(assert (=> b!900764 m!837165))

(declare-fun m!837169 () Bool)

(assert (=> b!900764 m!837169))

(declare-fun m!837171 () Bool)

(assert (=> b!900764 m!837171))

(declare-fun m!837173 () Bool)

(assert (=> b!900764 m!837173))

(declare-fun m!837175 () Bool)

(assert (=> b!900764 m!837175))

(declare-fun m!837177 () Bool)

(assert (=> b!900765 m!837177))

(declare-fun m!837179 () Bool)

(assert (=> b!900765 m!837179))

(declare-fun m!837181 () Bool)

(assert (=> b!900762 m!837181))

(declare-fun m!837183 () Bool)

(assert (=> b!900762 m!837183))

(check-sat tp_is_empty!18387 b_and!26383 (not b!900765) (not b!900769) (not start!77190) (not b!900760) (not b_next!16059) (not b!900764) (not b!900761) (not b!900762) (not mapNonEmpty!29260) (not b!900767))
(check-sat b_and!26383 (not b_next!16059))
(get-model)

(declare-fun d!111763 () Bool)

(declare-fun e!504237 () Bool)

(assert (=> d!111763 e!504237))

(declare-fun res!608284 () Bool)

(assert (=> d!111763 (=> res!608284 e!504237)))

(declare-fun lt!407070 () SeekEntryResult!8943)

(assert (=> d!111763 (= res!608284 (not ((_ is Found!8943) lt!407070)))))

(assert (=> d!111763 (= lt!407070 (seekEntry!0 key!785 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun lt!407069 () Unit!30596)

(declare-fun choose!1516 (array!52826 array!52828 (_ BitVec 32) (_ BitVec 32) V!29481 V!29481 (_ BitVec 64)) Unit!30596)

(assert (=> d!111763 (= lt!407069 (choose!1516 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) key!785))))

(assert (=> d!111763 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111763 (= (lemmaSeekEntryGivesInRangeIndex!104 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) key!785) lt!407069)))

(declare-fun b!900808 () Bool)

(assert (=> b!900808 (= e!504237 (inRange!0 (index!38144 lt!407070) (mask!26250 thiss!1181)))))

(assert (= (and d!111763 (not res!608284)) b!900808))

(assert (=> d!111763 m!837183))

(declare-fun m!837219 () Bool)

(assert (=> d!111763 m!837219))

(assert (=> d!111763 m!837171))

(declare-fun m!837221 () Bool)

(assert (=> b!900808 m!837221))

(assert (=> b!900762 d!111763))

(declare-fun b!900821 () Bool)

(declare-fun e!504245 () SeekEntryResult!8943)

(declare-fun e!504246 () SeekEntryResult!8943)

(assert (=> b!900821 (= e!504245 e!504246)))

(declare-fun lt!407079 () (_ BitVec 64))

(declare-fun lt!407082 () SeekEntryResult!8943)

(assert (=> b!900821 (= lt!407079 (select (arr!25383 (_keys!10263 thiss!1181)) (index!38145 lt!407082)))))

(declare-fun c!95390 () Bool)

(assert (=> b!900821 (= c!95390 (= lt!407079 key!785))))

(declare-fun b!900822 () Bool)

(declare-fun e!504244 () SeekEntryResult!8943)

(assert (=> b!900822 (= e!504244 (MissingZero!8943 (index!38145 lt!407082)))))

(declare-fun d!111765 () Bool)

(declare-fun lt!407080 () SeekEntryResult!8943)

(assert (=> d!111765 (and (or ((_ is MissingVacant!8943) lt!407080) (not ((_ is Found!8943) lt!407080)) (and (bvsge (index!38144 lt!407080) #b00000000000000000000000000000000) (bvslt (index!38144 lt!407080) (size!25842 (_keys!10263 thiss!1181))))) (not ((_ is MissingVacant!8943) lt!407080)) (or (not ((_ is Found!8943) lt!407080)) (= (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407080)) key!785)))))

(assert (=> d!111765 (= lt!407080 e!504245)))

(declare-fun c!95391 () Bool)

(assert (=> d!111765 (= c!95391 (and ((_ is Intermediate!8943) lt!407082) (undefined!9755 lt!407082)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52826 (_ BitVec 32)) SeekEntryResult!8943)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111765 (= lt!407082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26250 thiss!1181)) key!785 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)))))

(assert (=> d!111765 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111765 (= (seekEntry!0 key!785 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)) lt!407080)))

(declare-fun b!900823 () Bool)

(assert (=> b!900823 (= e!504246 (Found!8943 (index!38145 lt!407082)))))

(declare-fun b!900824 () Bool)

(declare-fun c!95389 () Bool)

(assert (=> b!900824 (= c!95389 (= lt!407079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900824 (= e!504246 e!504244)))

(declare-fun b!900825 () Bool)

(declare-fun lt!407081 () SeekEntryResult!8943)

(assert (=> b!900825 (= e!504244 (ite ((_ is MissingVacant!8943) lt!407081) (MissingZero!8943 (index!38146 lt!407081)) lt!407081))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52826 (_ BitVec 32)) SeekEntryResult!8943)

(assert (=> b!900825 (= lt!407081 (seekKeyOrZeroReturnVacant!0 (x!76748 lt!407082) (index!38145 lt!407082) (index!38145 lt!407082) key!785 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900826 () Bool)

(assert (=> b!900826 (= e!504245 Undefined!8943)))

(assert (= (and d!111765 c!95391) b!900826))

(assert (= (and d!111765 (not c!95391)) b!900821))

(assert (= (and b!900821 c!95390) b!900823))

(assert (= (and b!900821 (not c!95390)) b!900824))

(assert (= (and b!900824 c!95389) b!900822))

(assert (= (and b!900824 (not c!95389)) b!900825))

(declare-fun m!837223 () Bool)

(assert (=> b!900821 m!837223))

(declare-fun m!837225 () Bool)

(assert (=> d!111765 m!837225))

(declare-fun m!837227 () Bool)

(assert (=> d!111765 m!837227))

(assert (=> d!111765 m!837227))

(declare-fun m!837229 () Bool)

(assert (=> d!111765 m!837229))

(assert (=> d!111765 m!837171))

(declare-fun m!837231 () Bool)

(assert (=> b!900825 m!837231))

(assert (=> b!900762 d!111765))

(declare-fun d!111767 () Bool)

(assert (=> d!111767 (= (inRange!0 (index!38144 lt!407049) (mask!26250 thiss!1181)) (and (bvsge (index!38144 lt!407049) #b00000000000000000000000000000000) (bvslt (index!38144 lt!407049) (bvadd (mask!26250 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900767 d!111767))

(declare-fun d!111769 () Bool)

(assert (=> d!111769 (= (array_inv!19910 (_keys!10263 thiss!1181)) (bvsge (size!25842 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900765 d!111769))

(declare-fun d!111771 () Bool)

(assert (=> d!111771 (= (array_inv!19911 (_values!5474 thiss!1181)) (bvsge (size!25843 (_values!5474 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900765 d!111771))

(declare-fun b!900835 () Bool)

(declare-fun e!504255 () Bool)

(declare-fun e!504254 () Bool)

(assert (=> b!900835 (= e!504255 e!504254)))

(declare-fun c!95394 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900835 (= c!95394 (validKeyInArray!0 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111773 () Bool)

(declare-fun res!608289 () Bool)

(assert (=> d!111773 (=> res!608289 e!504255)))

(assert (=> d!111773 (= res!608289 (bvsge #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))

(assert (=> d!111773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)) e!504255)))

(declare-fun b!900836 () Bool)

(declare-fun e!504253 () Bool)

(declare-fun call!40063 () Bool)

(assert (=> b!900836 (= e!504253 call!40063)))

(declare-fun b!900837 () Bool)

(assert (=> b!900837 (= e!504254 call!40063)))

(declare-fun bm!40060 () Bool)

(assert (=> bm!40060 (= call!40063 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10263 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900838 () Bool)

(assert (=> b!900838 (= e!504254 e!504253)))

(declare-fun lt!407089 () (_ BitVec 64))

(assert (=> b!900838 (= lt!407089 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407090 () Unit!30596)

(assert (=> b!900838 (= lt!407090 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10263 thiss!1181) lt!407089 #b00000000000000000000000000000000))))

(assert (=> b!900838 (arrayContainsKey!0 (_keys!10263 thiss!1181) lt!407089 #b00000000000000000000000000000000)))

(declare-fun lt!407091 () Unit!30596)

(assert (=> b!900838 (= lt!407091 lt!407090)))

(declare-fun res!608290 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52826 (_ BitVec 32)) SeekEntryResult!8943)

(assert (=> b!900838 (= res!608290 (= (seekEntryOrOpen!0 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000) (_keys!10263 thiss!1181) (mask!26250 thiss!1181)) (Found!8943 #b00000000000000000000000000000000)))))

(assert (=> b!900838 (=> (not res!608290) (not e!504253))))

(assert (= (and d!111773 (not res!608289)) b!900835))

(assert (= (and b!900835 c!95394) b!900838))

(assert (= (and b!900835 (not c!95394)) b!900837))

(assert (= (and b!900838 res!608290) b!900836))

(assert (= (or b!900836 b!900837) bm!40060))

(declare-fun m!837233 () Bool)

(assert (=> b!900835 m!837233))

(assert (=> b!900835 m!837233))

(declare-fun m!837235 () Bool)

(assert (=> b!900835 m!837235))

(declare-fun m!837237 () Bool)

(assert (=> bm!40060 m!837237))

(assert (=> b!900838 m!837233))

(declare-fun m!837239 () Bool)

(assert (=> b!900838 m!837239))

(declare-fun m!837241 () Bool)

(assert (=> b!900838 m!837241))

(assert (=> b!900838 m!837233))

(declare-fun m!837243 () Bool)

(assert (=> b!900838 m!837243))

(assert (=> b!900761 d!111773))

(declare-fun b!900849 () Bool)

(declare-fun e!504267 () Bool)

(declare-fun e!504266 () Bool)

(assert (=> b!900849 (= e!504267 e!504266)))

(declare-fun res!608298 () Bool)

(assert (=> b!900849 (=> (not res!608298) (not e!504266))))

(declare-fun e!504265 () Bool)

(assert (=> b!900849 (= res!608298 (not e!504265))))

(declare-fun res!608299 () Bool)

(assert (=> b!900849 (=> (not res!608299) (not e!504265))))

(assert (=> b!900849 (= res!608299 (validKeyInArray!0 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900850 () Bool)

(declare-fun e!504264 () Bool)

(declare-fun call!40066 () Bool)

(assert (=> b!900850 (= e!504264 call!40066)))

(declare-fun b!900851 () Bool)

(assert (=> b!900851 (= e!504266 e!504264)))

(declare-fun c!95397 () Bool)

(assert (=> b!900851 (= c!95397 (validKeyInArray!0 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900853 () Bool)

(assert (=> b!900853 (= e!504264 call!40066)))

(declare-fun bm!40063 () Bool)

(assert (=> bm!40063 (= call!40066 (arrayNoDuplicates!0 (_keys!10263 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95397 (Cons!17857 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000) Nil!17858) Nil!17858)))))

(declare-fun b!900852 () Bool)

(declare-fun contains!4431 (List!17861 (_ BitVec 64)) Bool)

(assert (=> b!900852 (= e!504265 (contains!4431 Nil!17858 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111775 () Bool)

(declare-fun res!608297 () Bool)

(assert (=> d!111775 (=> res!608297 e!504267)))

(assert (=> d!111775 (= res!608297 (bvsge #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))

(assert (=> d!111775 (= (arrayNoDuplicates!0 (_keys!10263 thiss!1181) #b00000000000000000000000000000000 Nil!17858) e!504267)))

(assert (= (and d!111775 (not res!608297)) b!900849))

(assert (= (and b!900849 res!608299) b!900852))

(assert (= (and b!900849 res!608298) b!900851))

(assert (= (and b!900851 c!95397) b!900853))

(assert (= (and b!900851 (not c!95397)) b!900850))

(assert (= (or b!900853 b!900850) bm!40063))

(assert (=> b!900849 m!837233))

(assert (=> b!900849 m!837233))

(assert (=> b!900849 m!837235))

(assert (=> b!900851 m!837233))

(assert (=> b!900851 m!837233))

(assert (=> b!900851 m!837235))

(assert (=> bm!40063 m!837233))

(declare-fun m!837245 () Bool)

(assert (=> bm!40063 m!837245))

(assert (=> b!900852 m!837233))

(assert (=> b!900852 m!837233))

(declare-fun m!837247 () Bool)

(assert (=> b!900852 m!837247))

(assert (=> b!900769 d!111775))

(declare-fun d!111777 () Bool)

(assert (=> d!111777 (= (validMask!0 (mask!26250 thiss!1181)) (and (or (= (mask!26250 thiss!1181) #b00000000000000000000000000000111) (= (mask!26250 thiss!1181) #b00000000000000000000000000001111) (= (mask!26250 thiss!1181) #b00000000000000000000000000011111) (= (mask!26250 thiss!1181) #b00000000000000000000000000111111) (= (mask!26250 thiss!1181) #b00000000000000000000000001111111) (= (mask!26250 thiss!1181) #b00000000000000000000000011111111) (= (mask!26250 thiss!1181) #b00000000000000000000000111111111) (= (mask!26250 thiss!1181) #b00000000000000000000001111111111) (= (mask!26250 thiss!1181) #b00000000000000000000011111111111) (= (mask!26250 thiss!1181) #b00000000000000000000111111111111) (= (mask!26250 thiss!1181) #b00000000000000000001111111111111) (= (mask!26250 thiss!1181) #b00000000000000000011111111111111) (= (mask!26250 thiss!1181) #b00000000000000000111111111111111) (= (mask!26250 thiss!1181) #b00000000000000001111111111111111) (= (mask!26250 thiss!1181) #b00000000000000011111111111111111) (= (mask!26250 thiss!1181) #b00000000000000111111111111111111) (= (mask!26250 thiss!1181) #b00000000000001111111111111111111) (= (mask!26250 thiss!1181) #b00000000000011111111111111111111) (= (mask!26250 thiss!1181) #b00000000000111111111111111111111) (= (mask!26250 thiss!1181) #b00000000001111111111111111111111) (= (mask!26250 thiss!1181) #b00000000011111111111111111111111) (= (mask!26250 thiss!1181) #b00000000111111111111111111111111) (= (mask!26250 thiss!1181) #b00000001111111111111111111111111) (= (mask!26250 thiss!1181) #b00000011111111111111111111111111) (= (mask!26250 thiss!1181) #b00000111111111111111111111111111) (= (mask!26250 thiss!1181) #b00001111111111111111111111111111) (= (mask!26250 thiss!1181) #b00011111111111111111111111111111) (= (mask!26250 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26250 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900764 d!111777))

(declare-fun d!111779 () Bool)

(declare-fun e!504270 () Bool)

(assert (=> d!111779 e!504270))

(declare-fun res!608302 () Bool)

(assert (=> d!111779 (=> (not res!608302) (not e!504270))))

(assert (=> d!111779 (= res!608302 (and (bvsge (index!38144 lt!407049) #b00000000000000000000000000000000) (bvslt (index!38144 lt!407049) (size!25842 (_keys!10263 thiss!1181)))))))

(declare-fun lt!407094 () Unit!30596)

(declare-fun choose!1517 (array!52826 array!52828 (_ BitVec 32) (_ BitVec 32) V!29481 V!29481 (_ BitVec 32) Int) Unit!30596)

(assert (=> d!111779 (= lt!407094 (choose!1517 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) (index!38144 lt!407049) (defaultEntry!5456 thiss!1181)))))

(assert (=> d!111779 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111779 (= (lemmaValidKeyInArrayIsInListMap!254 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) (index!38144 lt!407049) (defaultEntry!5456 thiss!1181)) lt!407094)))

(declare-fun b!900856 () Bool)

(assert (=> b!900856 (= e!504270 (contains!4430 (getCurrentListMap!2665 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)) (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049))))))

(assert (= (and d!111779 res!608302) b!900856))

(declare-fun m!837249 () Bool)

(assert (=> d!111779 m!837249))

(assert (=> d!111779 m!837171))

(assert (=> b!900856 m!837173))

(assert (=> b!900856 m!837165))

(assert (=> b!900856 m!837173))

(assert (=> b!900856 m!837165))

(declare-fun m!837251 () Bool)

(assert (=> b!900856 m!837251))

(assert (=> b!900764 d!111779))

(declare-fun d!111781 () Bool)

(declare-fun res!608307 () Bool)

(declare-fun e!504275 () Bool)

(assert (=> d!111781 (=> res!608307 e!504275)))

(assert (=> d!111781 (= res!608307 (= (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111781 (= (arrayContainsKey!0 (_keys!10263 thiss!1181) key!785 #b00000000000000000000000000000000) e!504275)))

(declare-fun b!900861 () Bool)

(declare-fun e!504276 () Bool)

(assert (=> b!900861 (= e!504275 e!504276)))

(declare-fun res!608308 () Bool)

(assert (=> b!900861 (=> (not res!608308) (not e!504276))))

(assert (=> b!900861 (= res!608308 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25842 (_keys!10263 thiss!1181))))))

(declare-fun b!900862 () Bool)

(assert (=> b!900862 (= e!504276 (arrayContainsKey!0 (_keys!10263 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111781 (not res!608307)) b!900861))

(assert (= (and b!900861 res!608308) b!900862))

(assert (=> d!111781 m!837233))

(declare-fun m!837253 () Bool)

(assert (=> b!900862 m!837253))

(assert (=> b!900764 d!111781))

(declare-fun d!111783 () Bool)

(declare-fun e!504281 () Bool)

(assert (=> d!111783 e!504281))

(declare-fun res!608311 () Bool)

(assert (=> d!111783 (=> res!608311 e!504281)))

(declare-fun lt!407103 () Bool)

(assert (=> d!111783 (= res!608311 (not lt!407103))))

(declare-fun lt!407105 () Bool)

(assert (=> d!111783 (= lt!407103 lt!407105)))

(declare-fun lt!407104 () Unit!30596)

(declare-fun e!504282 () Unit!30596)

(assert (=> d!111783 (= lt!407104 e!504282)))

(declare-fun c!95400 () Bool)

(assert (=> d!111783 (= c!95400 lt!407105)))

(declare-fun containsKey!432 (List!17860 (_ BitVec 64)) Bool)

(assert (=> d!111783 (= lt!407105 (containsKey!432 (toList!5392 lt!407045) (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049))))))

(assert (=> d!111783 (= (contains!4430 lt!407045 (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049))) lt!407103)))

(declare-fun b!900869 () Bool)

(declare-fun lt!407106 () Unit!30596)

(assert (=> b!900869 (= e!504282 lt!407106)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!328 (List!17860 (_ BitVec 64)) Unit!30596)

(assert (=> b!900869 (= lt!407106 (lemmaContainsKeyImpliesGetValueByKeyDefined!328 (toList!5392 lt!407045) (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049))))))

(declare-datatypes ((Option!469 0))(
  ( (Some!468 (v!11744 V!29481)) (None!467) )
))
(declare-fun isDefined!337 (Option!469) Bool)

(declare-fun getValueByKey!463 (List!17860 (_ BitVec 64)) Option!469)

(assert (=> b!900869 (isDefined!337 (getValueByKey!463 (toList!5392 lt!407045) (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049))))))

(declare-fun b!900870 () Bool)

(declare-fun Unit!30600 () Unit!30596)

(assert (=> b!900870 (= e!504282 Unit!30600)))

(declare-fun b!900871 () Bool)

(assert (=> b!900871 (= e!504281 (isDefined!337 (getValueByKey!463 (toList!5392 lt!407045) (select (arr!25383 (_keys!10263 thiss!1181)) (index!38144 lt!407049)))))))

(assert (= (and d!111783 c!95400) b!900869))

(assert (= (and d!111783 (not c!95400)) b!900870))

(assert (= (and d!111783 (not res!608311)) b!900871))

(assert (=> d!111783 m!837165))

(declare-fun m!837255 () Bool)

(assert (=> d!111783 m!837255))

(assert (=> b!900869 m!837165))

(declare-fun m!837257 () Bool)

(assert (=> b!900869 m!837257))

(assert (=> b!900869 m!837165))

(declare-fun m!837259 () Bool)

(assert (=> b!900869 m!837259))

(assert (=> b!900869 m!837259))

(declare-fun m!837261 () Bool)

(assert (=> b!900869 m!837261))

(assert (=> b!900871 m!837165))

(assert (=> b!900871 m!837259))

(assert (=> b!900871 m!837259))

(assert (=> b!900871 m!837261))

(assert (=> b!900764 d!111783))

(declare-fun b!900914 () Bool)

(declare-fun c!95413 () Bool)

(assert (=> b!900914 (= c!95413 (and (not (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!504320 () ListLongMap!10753)

(declare-fun e!504318 () ListLongMap!10753)

(assert (=> b!900914 (= e!504320 e!504318)))

(declare-fun b!900915 () Bool)

(declare-fun e!504319 () ListLongMap!10753)

(declare-fun call!40082 () ListLongMap!10753)

(declare-fun +!2598 (ListLongMap!10753 tuple2!12056) ListLongMap!10753)

(assert (=> b!900915 (= e!504319 (+!2598 call!40082 (tuple2!12057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5287 thiss!1181))))))

(declare-fun bm!40078 () Bool)

(declare-fun call!40087 () Bool)

(declare-fun lt!407155 () ListLongMap!10753)

(assert (=> bm!40078 (= call!40087 (contains!4430 lt!407155 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900916 () Bool)

(assert (=> b!900916 (= e!504319 e!504320)))

(declare-fun c!95414 () Bool)

(assert (=> b!900916 (= c!95414 (and (not (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!111785 () Bool)

(declare-fun e!504310 () Bool)

(assert (=> d!111785 e!504310))

(declare-fun res!608338 () Bool)

(assert (=> d!111785 (=> (not res!608338) (not e!504310))))

(assert (=> d!111785 (= res!608338 (or (bvsge #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))))

(declare-fun lt!407168 () ListLongMap!10753)

(assert (=> d!111785 (= lt!407155 lt!407168)))

(declare-fun lt!407158 () Unit!30596)

(declare-fun e!504321 () Unit!30596)

(assert (=> d!111785 (= lt!407158 e!504321)))

(declare-fun c!95417 () Bool)

(declare-fun e!504315 () Bool)

(assert (=> d!111785 (= c!95417 e!504315)))

(declare-fun res!608336 () Bool)

(assert (=> d!111785 (=> (not res!608336) (not e!504315))))

(assert (=> d!111785 (= res!608336 (bvslt #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))

(assert (=> d!111785 (= lt!407168 e!504319)))

(declare-fun c!95415 () Bool)

(assert (=> d!111785 (= c!95415 (and (not (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111785 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111785 (= (getCurrentListMap!2665 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)) lt!407155)))

(declare-fun b!900917 () Bool)

(declare-fun Unit!30601 () Unit!30596)

(assert (=> b!900917 (= e!504321 Unit!30601)))

(declare-fun b!900918 () Bool)

(declare-fun lt!407166 () Unit!30596)

(assert (=> b!900918 (= e!504321 lt!407166)))

(declare-fun lt!407153 () ListLongMap!10753)

(declare-fun getCurrentListMapNoExtraKeys!3285 (array!52826 array!52828 (_ BitVec 32) (_ BitVec 32) V!29481 V!29481 (_ BitVec 32) Int) ListLongMap!10753)

(assert (=> b!900918 (= lt!407153 (getCurrentListMapNoExtraKeys!3285 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)))))

(declare-fun lt!407162 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407164 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407164 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407170 () Unit!30596)

(declare-fun addStillContains!339 (ListLongMap!10753 (_ BitVec 64) V!29481 (_ BitVec 64)) Unit!30596)

(assert (=> b!900918 (= lt!407170 (addStillContains!339 lt!407153 lt!407162 (zeroValue!5287 thiss!1181) lt!407164))))

(assert (=> b!900918 (contains!4430 (+!2598 lt!407153 (tuple2!12057 lt!407162 (zeroValue!5287 thiss!1181))) lt!407164)))

(declare-fun lt!407151 () Unit!30596)

(assert (=> b!900918 (= lt!407151 lt!407170)))

(declare-fun lt!407157 () ListLongMap!10753)

(assert (=> b!900918 (= lt!407157 (getCurrentListMapNoExtraKeys!3285 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)))))

(declare-fun lt!407159 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407165 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407165 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407160 () Unit!30596)

(declare-fun addApplyDifferent!339 (ListLongMap!10753 (_ BitVec 64) V!29481 (_ BitVec 64)) Unit!30596)

(assert (=> b!900918 (= lt!407160 (addApplyDifferent!339 lt!407157 lt!407159 (minValue!5287 thiss!1181) lt!407165))))

(declare-fun apply!417 (ListLongMap!10753 (_ BitVec 64)) V!29481)

(assert (=> b!900918 (= (apply!417 (+!2598 lt!407157 (tuple2!12057 lt!407159 (minValue!5287 thiss!1181))) lt!407165) (apply!417 lt!407157 lt!407165))))

(declare-fun lt!407171 () Unit!30596)

(assert (=> b!900918 (= lt!407171 lt!407160)))

(declare-fun lt!407156 () ListLongMap!10753)

(assert (=> b!900918 (= lt!407156 (getCurrentListMapNoExtraKeys!3285 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)))))

(declare-fun lt!407152 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407154 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407154 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407169 () Unit!30596)

(assert (=> b!900918 (= lt!407169 (addApplyDifferent!339 lt!407156 lt!407152 (zeroValue!5287 thiss!1181) lt!407154))))

(assert (=> b!900918 (= (apply!417 (+!2598 lt!407156 (tuple2!12057 lt!407152 (zeroValue!5287 thiss!1181))) lt!407154) (apply!417 lt!407156 lt!407154))))

(declare-fun lt!407161 () Unit!30596)

(assert (=> b!900918 (= lt!407161 lt!407169)))

(declare-fun lt!407167 () ListLongMap!10753)

(assert (=> b!900918 (= lt!407167 (getCurrentListMapNoExtraKeys!3285 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)))))

(declare-fun lt!407172 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407172 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407163 () (_ BitVec 64))

(assert (=> b!900918 (= lt!407163 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900918 (= lt!407166 (addApplyDifferent!339 lt!407167 lt!407172 (minValue!5287 thiss!1181) lt!407163))))

(assert (=> b!900918 (= (apply!417 (+!2598 lt!407167 (tuple2!12057 lt!407172 (minValue!5287 thiss!1181))) lt!407163) (apply!417 lt!407167 lt!407163))))

(declare-fun b!900919 () Bool)

(declare-fun res!608330 () Bool)

(assert (=> b!900919 (=> (not res!608330) (not e!504310))))

(declare-fun e!504309 () Bool)

(assert (=> b!900919 (= res!608330 e!504309)))

(declare-fun res!608337 () Bool)

(assert (=> b!900919 (=> res!608337 e!504309)))

(declare-fun e!504316 () Bool)

(assert (=> b!900919 (= res!608337 (not e!504316))))

(declare-fun res!608335 () Bool)

(assert (=> b!900919 (=> (not res!608335) (not e!504316))))

(assert (=> b!900919 (= res!608335 (bvslt #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))

(declare-fun b!900920 () Bool)

(declare-fun e!504314 () Bool)

(assert (=> b!900920 (= e!504314 (= (apply!417 lt!407155 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5287 thiss!1181)))))

(declare-fun b!900921 () Bool)

(declare-fun e!504317 () Bool)

(declare-fun e!504313 () Bool)

(assert (=> b!900921 (= e!504317 e!504313)))

(declare-fun res!608333 () Bool)

(assert (=> b!900921 (= res!608333 call!40087)))

(assert (=> b!900921 (=> (not res!608333) (not e!504313))))

(declare-fun b!900922 () Bool)

(assert (=> b!900922 (= e!504310 e!504317)))

(declare-fun c!95416 () Bool)

(assert (=> b!900922 (= c!95416 (not (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40079 () Bool)

(declare-fun call!40086 () ListLongMap!10753)

(assert (=> bm!40079 (= call!40086 (getCurrentListMapNoExtraKeys!3285 (_keys!10263 thiss!1181) (_values!5474 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5183 thiss!1181) (zeroValue!5287 thiss!1181) (minValue!5287 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5456 thiss!1181)))))

(declare-fun b!900923 () Bool)

(assert (=> b!900923 (= e!504317 (not call!40087))))

(declare-fun b!900924 () Bool)

(declare-fun call!40083 () ListLongMap!10753)

(assert (=> b!900924 (= e!504318 call!40083)))

(declare-fun bm!40080 () Bool)

(declare-fun call!40081 () ListLongMap!10753)

(assert (=> bm!40080 (= call!40081 call!40086)))

(declare-fun b!900925 () Bool)

(declare-fun res!608332 () Bool)

(assert (=> b!900925 (=> (not res!608332) (not e!504310))))

(declare-fun e!504312 () Bool)

(assert (=> b!900925 (= res!608332 e!504312)))

(declare-fun c!95418 () Bool)

(assert (=> b!900925 (= c!95418 (not (= (bvand (extraKeys!5183 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40081 () Bool)

(declare-fun call!40084 () ListLongMap!10753)

(assert (=> bm!40081 (= call!40084 call!40082)))

(declare-fun bm!40082 () Bool)

(assert (=> bm!40082 (= call!40083 call!40081)))

(declare-fun b!900926 () Bool)

(declare-fun e!504311 () Bool)

(assert (=> b!900926 (= e!504309 e!504311)))

(declare-fun res!608331 () Bool)

(assert (=> b!900926 (=> (not res!608331) (not e!504311))))

(assert (=> b!900926 (= res!608331 (contains!4430 lt!407155 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))

(declare-fun b!900927 () Bool)

(declare-fun call!40085 () Bool)

(assert (=> b!900927 (= e!504312 (not call!40085))))

(declare-fun b!900928 () Bool)

(assert (=> b!900928 (= e!504316 (validKeyInArray!0 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900929 () Bool)

(assert (=> b!900929 (= e!504320 call!40084)))

(declare-fun b!900930 () Bool)

(assert (=> b!900930 (= e!504312 e!504314)))

(declare-fun res!608334 () Bool)

(assert (=> b!900930 (= res!608334 call!40085)))

(assert (=> b!900930 (=> (not res!608334) (not e!504314))))

(declare-fun bm!40083 () Bool)

(assert (=> bm!40083 (= call!40082 (+!2598 (ite c!95415 call!40086 (ite c!95414 call!40081 call!40083)) (ite (or c!95415 c!95414) (tuple2!12057 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5287 thiss!1181)) (tuple2!12057 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5287 thiss!1181)))))))

(declare-fun bm!40084 () Bool)

(assert (=> bm!40084 (= call!40085 (contains!4430 lt!407155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900931 () Bool)

(declare-fun get!13355 (ValueCell!8712 V!29481) V!29481)

(declare-fun dynLambda!1311 (Int (_ BitVec 64)) V!29481)

(assert (=> b!900931 (= e!504311 (= (apply!417 lt!407155 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)) (get!13355 (select (arr!25384 (_values!5474 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1311 (defaultEntry!5456 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25843 (_values!5474 thiss!1181))))))

(assert (=> b!900931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))))))

(declare-fun b!900932 () Bool)

(assert (=> b!900932 (= e!504318 call!40084)))

(declare-fun b!900933 () Bool)

(assert (=> b!900933 (= e!504315 (validKeyInArray!0 (select (arr!25383 (_keys!10263 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900934 () Bool)

(assert (=> b!900934 (= e!504313 (= (apply!417 lt!407155 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5287 thiss!1181)))))

(assert (= (and d!111785 c!95415) b!900915))

(assert (= (and d!111785 (not c!95415)) b!900916))

(assert (= (and b!900916 c!95414) b!900929))

(assert (= (and b!900916 (not c!95414)) b!900914))

(assert (= (and b!900914 c!95413) b!900932))

(assert (= (and b!900914 (not c!95413)) b!900924))

(assert (= (or b!900932 b!900924) bm!40082))

(assert (= (or b!900929 bm!40082) bm!40080))

(assert (= (or b!900929 b!900932) bm!40081))

(assert (= (or b!900915 bm!40080) bm!40079))

(assert (= (or b!900915 bm!40081) bm!40083))

(assert (= (and d!111785 res!608336) b!900933))

(assert (= (and d!111785 c!95417) b!900918))

(assert (= (and d!111785 (not c!95417)) b!900917))

(assert (= (and d!111785 res!608338) b!900919))

(assert (= (and b!900919 res!608335) b!900928))

(assert (= (and b!900919 (not res!608337)) b!900926))

(assert (= (and b!900926 res!608331) b!900931))

(assert (= (and b!900919 res!608330) b!900925))

(assert (= (and b!900925 c!95418) b!900930))

(assert (= (and b!900925 (not c!95418)) b!900927))

(assert (= (and b!900930 res!608334) b!900920))

(assert (= (or b!900930 b!900927) bm!40084))

(assert (= (and b!900925 res!608332) b!900922))

(assert (= (and b!900922 c!95416) b!900921))

(assert (= (and b!900922 (not c!95416)) b!900923))

(assert (= (and b!900921 res!608333) b!900934))

(assert (= (or b!900921 b!900923) bm!40078))

(declare-fun b_lambda!13023 () Bool)

(assert (=> (not b_lambda!13023) (not b!900931)))

(declare-fun t!25219 () Bool)

(declare-fun tb!5207 () Bool)

(assert (=> (and b!900765 (= (defaultEntry!5456 thiss!1181) (defaultEntry!5456 thiss!1181)) t!25219) tb!5207))

(declare-fun result!10193 () Bool)

(assert (=> tb!5207 (= result!10193 tp_is_empty!18387)))

(assert (=> b!900931 t!25219))

(declare-fun b_and!26387 () Bool)

(assert (= b_and!26383 (and (=> t!25219 result!10193) b_and!26387)))

(assert (=> d!111785 m!837171))

(declare-fun m!837263 () Bool)

(assert (=> b!900934 m!837263))

(assert (=> b!900933 m!837233))

(assert (=> b!900933 m!837233))

(assert (=> b!900933 m!837235))

(assert (=> b!900928 m!837233))

(assert (=> b!900928 m!837233))

(assert (=> b!900928 m!837235))

(declare-fun m!837265 () Bool)

(assert (=> b!900918 m!837265))

(declare-fun m!837267 () Bool)

(assert (=> b!900918 m!837267))

(declare-fun m!837269 () Bool)

(assert (=> b!900918 m!837269))

(assert (=> b!900918 m!837267))

(declare-fun m!837271 () Bool)

(assert (=> b!900918 m!837271))

(declare-fun m!837273 () Bool)

(assert (=> b!900918 m!837273))

(declare-fun m!837275 () Bool)

(assert (=> b!900918 m!837275))

(declare-fun m!837277 () Bool)

(assert (=> b!900918 m!837277))

(declare-fun m!837279 () Bool)

(assert (=> b!900918 m!837279))

(declare-fun m!837281 () Bool)

(assert (=> b!900918 m!837281))

(declare-fun m!837283 () Bool)

(assert (=> b!900918 m!837283))

(assert (=> b!900918 m!837281))

(declare-fun m!837285 () Bool)

(assert (=> b!900918 m!837285))

(declare-fun m!837287 () Bool)

(assert (=> b!900918 m!837287))

(declare-fun m!837289 () Bool)

(assert (=> b!900918 m!837289))

(assert (=> b!900918 m!837287))

(declare-fun m!837291 () Bool)

(assert (=> b!900918 m!837291))

(assert (=> b!900918 m!837233))

(assert (=> b!900918 m!837275))

(declare-fun m!837293 () Bool)

(assert (=> b!900918 m!837293))

(declare-fun m!837295 () Bool)

(assert (=> b!900918 m!837295))

(assert (=> b!900926 m!837233))

(assert (=> b!900926 m!837233))

(declare-fun m!837297 () Bool)

(assert (=> b!900926 m!837297))

(declare-fun m!837299 () Bool)

(assert (=> bm!40084 m!837299))

(assert (=> bm!40079 m!837293))

(declare-fun m!837301 () Bool)

(assert (=> b!900915 m!837301))

(declare-fun m!837303 () Bool)

(assert (=> bm!40083 m!837303))

(declare-fun m!837305 () Bool)

(assert (=> b!900920 m!837305))

(declare-fun m!837307 () Bool)

(assert (=> bm!40078 m!837307))

(assert (=> b!900931 m!837233))

(declare-fun m!837309 () Bool)

(assert (=> b!900931 m!837309))

(declare-fun m!837311 () Bool)

(assert (=> b!900931 m!837311))

(declare-fun m!837313 () Bool)

(assert (=> b!900931 m!837313))

(assert (=> b!900931 m!837311))

(declare-fun m!837315 () Bool)

(assert (=> b!900931 m!837315))

(assert (=> b!900931 m!837233))

(assert (=> b!900931 m!837313))

(assert (=> b!900764 d!111785))

(declare-fun d!111787 () Bool)

(assert (=> d!111787 (arrayContainsKey!0 (_keys!10263 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407175 () Unit!30596)

(declare-fun choose!13 (array!52826 (_ BitVec 64) (_ BitVec 32)) Unit!30596)

(assert (=> d!111787 (= lt!407175 (choose!13 (_keys!10263 thiss!1181) key!785 (index!38144 lt!407049)))))

(assert (=> d!111787 (bvsge (index!38144 lt!407049) #b00000000000000000000000000000000)))

(assert (=> d!111787 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10263 thiss!1181) key!785 (index!38144 lt!407049)) lt!407175)))

(declare-fun bs!25294 () Bool)

(assert (= bs!25294 d!111787))

(assert (=> bs!25294 m!837167))

(declare-fun m!837317 () Bool)

(assert (=> bs!25294 m!837317))

(assert (=> b!900764 d!111787))

(declare-fun d!111789 () Bool)

(declare-fun res!608345 () Bool)

(declare-fun e!504324 () Bool)

(assert (=> d!111789 (=> (not res!608345) (not e!504324))))

(declare-fun simpleValid!331 (LongMapFixedSize!4440) Bool)

(assert (=> d!111789 (= res!608345 (simpleValid!331 thiss!1181))))

(assert (=> d!111789 (= (valid!1703 thiss!1181) e!504324)))

(declare-fun b!900943 () Bool)

(declare-fun res!608346 () Bool)

(assert (=> b!900943 (=> (not res!608346) (not e!504324))))

(declare-fun arrayCountValidKeys!0 (array!52826 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900943 (= res!608346 (= (arrayCountValidKeys!0 (_keys!10263 thiss!1181) #b00000000000000000000000000000000 (size!25842 (_keys!10263 thiss!1181))) (_size!2275 thiss!1181)))))

(declare-fun b!900944 () Bool)

(declare-fun res!608347 () Bool)

(assert (=> b!900944 (=> (not res!608347) (not e!504324))))

(assert (=> b!900944 (= res!608347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10263 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900945 () Bool)

(assert (=> b!900945 (= e!504324 (arrayNoDuplicates!0 (_keys!10263 thiss!1181) #b00000000000000000000000000000000 Nil!17858))))

(assert (= (and d!111789 res!608345) b!900943))

(assert (= (and b!900943 res!608346) b!900944))

(assert (= (and b!900944 res!608347) b!900945))

(declare-fun m!837319 () Bool)

(assert (=> d!111789 m!837319))

(declare-fun m!837321 () Bool)

(assert (=> b!900943 m!837321))

(assert (=> b!900944 m!837153))

(assert (=> b!900945 m!837155))

(assert (=> start!77190 d!111789))

(declare-fun d!111791 () Bool)

(declare-fun e!504325 () Bool)

(assert (=> d!111791 e!504325))

(declare-fun res!608348 () Bool)

(assert (=> d!111791 (=> res!608348 e!504325)))

(declare-fun lt!407176 () Bool)

(assert (=> d!111791 (= res!608348 (not lt!407176))))

(declare-fun lt!407178 () Bool)

(assert (=> d!111791 (= lt!407176 lt!407178)))

(declare-fun lt!407177 () Unit!30596)

(declare-fun e!504326 () Unit!30596)

(assert (=> d!111791 (= lt!407177 e!504326)))

(declare-fun c!95419 () Bool)

(assert (=> d!111791 (= c!95419 lt!407178)))

(assert (=> d!111791 (= lt!407178 (containsKey!432 (toList!5392 lt!407045) key!785))))

(assert (=> d!111791 (= (contains!4430 lt!407045 key!785) lt!407176)))

(declare-fun b!900946 () Bool)

(declare-fun lt!407179 () Unit!30596)

(assert (=> b!900946 (= e!504326 lt!407179)))

(assert (=> b!900946 (= lt!407179 (lemmaContainsKeyImpliesGetValueByKeyDefined!328 (toList!5392 lt!407045) key!785))))

(assert (=> b!900946 (isDefined!337 (getValueByKey!463 (toList!5392 lt!407045) key!785))))

(declare-fun b!900947 () Bool)

(declare-fun Unit!30602 () Unit!30596)

(assert (=> b!900947 (= e!504326 Unit!30602)))

(declare-fun b!900948 () Bool)

(assert (=> b!900948 (= e!504325 (isDefined!337 (getValueByKey!463 (toList!5392 lt!407045) key!785)))))

(assert (= (and d!111791 c!95419) b!900946))

(assert (= (and d!111791 (not c!95419)) b!900947))

(assert (= (and d!111791 (not res!608348)) b!900948))

(declare-fun m!837323 () Bool)

(assert (=> d!111791 m!837323))

(declare-fun m!837325 () Bool)

(assert (=> b!900946 m!837325))

(declare-fun m!837327 () Bool)

(assert (=> b!900946 m!837327))

(assert (=> b!900946 m!837327))

(declare-fun m!837329 () Bool)

(assert (=> b!900946 m!837329))

(assert (=> b!900948 m!837327))

(assert (=> b!900948 m!837327))

(assert (=> b!900948 m!837329))

(assert (=> b!900760 d!111791))

(declare-fun mapNonEmpty!29266 () Bool)

(declare-fun mapRes!29266 () Bool)

(declare-fun tp!56280 () Bool)

(declare-fun e!504332 () Bool)

(assert (=> mapNonEmpty!29266 (= mapRes!29266 (and tp!56280 e!504332))))

(declare-fun mapKey!29266 () (_ BitVec 32))

(declare-fun mapValue!29266 () ValueCell!8712)

(declare-fun mapRest!29266 () (Array (_ BitVec 32) ValueCell!8712))

(assert (=> mapNonEmpty!29266 (= mapRest!29260 (store mapRest!29266 mapKey!29266 mapValue!29266))))

(declare-fun condMapEmpty!29266 () Bool)

(declare-fun mapDefault!29266 () ValueCell!8712)

(assert (=> mapNonEmpty!29260 (= condMapEmpty!29266 (= mapRest!29260 ((as const (Array (_ BitVec 32) ValueCell!8712)) mapDefault!29266)))))

(declare-fun e!504331 () Bool)

(assert (=> mapNonEmpty!29260 (= tp!56270 (and e!504331 mapRes!29266))))

(declare-fun b!900955 () Bool)

(assert (=> b!900955 (= e!504332 tp_is_empty!18387)))

(declare-fun mapIsEmpty!29266 () Bool)

(assert (=> mapIsEmpty!29266 mapRes!29266))

(declare-fun b!900956 () Bool)

(assert (=> b!900956 (= e!504331 tp_is_empty!18387)))

(assert (= (and mapNonEmpty!29260 condMapEmpty!29266) mapIsEmpty!29266))

(assert (= (and mapNonEmpty!29260 (not condMapEmpty!29266)) mapNonEmpty!29266))

(assert (= (and mapNonEmpty!29266 ((_ is ValueCellFull!8712) mapValue!29266)) b!900955))

(assert (= (and mapNonEmpty!29260 ((_ is ValueCellFull!8712) mapDefault!29266)) b!900956))

(declare-fun m!837331 () Bool)

(assert (=> mapNonEmpty!29266 m!837331))

(declare-fun b_lambda!13025 () Bool)

(assert (= b_lambda!13023 (or (and b!900765 b_free!16059) b_lambda!13025)))

(check-sat (not bm!40084) (not b!900934) (not b!900862) (not b!900808) tp_is_empty!18387 (not bm!40060) (not b!900869) (not d!111765) (not b!900948) (not d!111779) (not d!111785) (not d!111763) (not b!900851) (not b_next!16059) (not b!900943) (not mapNonEmpty!29266) b_and!26387 (not b!900918) (not b!900926) (not b!900931) (not bm!40083) (not d!111791) (not b!900849) (not b!900835) (not b!900933) (not d!111787) (not b!900871) (not d!111789) (not b!900856) (not b!900920) (not b_lambda!13025) (not b!900915) (not d!111783) (not b!900944) (not b!900825) (not b!900946) (not b!900852) (not bm!40078) (not bm!40063) (not bm!40079) (not b!900928) (not b!900838) (not b!900945))
(check-sat b_and!26387 (not b_next!16059))
