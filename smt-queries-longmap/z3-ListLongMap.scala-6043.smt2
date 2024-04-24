; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78326 () Bool)

(assert start!78326)

(declare-fun b_free!16669 () Bool)

(declare-fun b_next!16669 () Bool)

(assert (=> start!78326 (= b_free!16669 (not b_next!16669))))

(declare-fun tp!58282 () Bool)

(declare-fun b_and!27253 () Bool)

(assert (=> start!78326 (= tp!58282 b_and!27253)))

(declare-fun b!913075 () Bool)

(declare-fun res!615691 () Bool)

(declare-fun e!512257 () Bool)

(assert (=> b!913075 (=> (not res!615691) (not e!512257))))

(declare-datatypes ((V!30415 0))(
  ( (V!30416 (val!9594 Int)) )
))
(declare-datatypes ((ValueCell!9062 0))(
  ( (ValueCellFull!9062 (v!12101 V!30415)) (EmptyCell!9062) )
))
(declare-datatypes ((array!54225 0))(
  ( (array!54226 (arr!26063 (Array (_ BitVec 32) ValueCell!9062)) (size!26523 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54225)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54227 0))(
  ( (array!54228 (arr!26064 (Array (_ BitVec 32) (_ BitVec 64))) (size!26524 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54227)

(assert (=> b!913075 (= res!615691 (and (= (size!26523 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26524 _keys!1386) (size!26523 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913076 () Bool)

(declare-fun res!615692 () Bool)

(assert (=> b!913076 (=> (not res!615692) (not e!512257))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913076 (= res!615692 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!30355 () Bool)

(declare-fun mapRes!30355 () Bool)

(declare-fun tp!58281 () Bool)

(declare-fun e!512259 () Bool)

(assert (=> mapNonEmpty!30355 (= mapRes!30355 (and tp!58281 e!512259))))

(declare-fun mapKey!30355 () (_ BitVec 32))

(declare-fun mapRest!30355 () (Array (_ BitVec 32) ValueCell!9062))

(declare-fun mapValue!30355 () ValueCell!9062)

(assert (=> mapNonEmpty!30355 (= (arr!26063 _values!1152) (store mapRest!30355 mapKey!30355 mapValue!30355))))

(declare-fun b!913077 () Bool)

(declare-fun res!615694 () Bool)

(assert (=> b!913077 (=> (not res!615694) (not e!512257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54227 (_ BitVec 32)) Bool)

(assert (=> b!913077 (= res!615694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913078 () Bool)

(assert (=> b!913078 (= e!512257 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26523 _values!1152)))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913078 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30860 0))(
  ( (Unit!30861) )
))
(declare-fun lt!410925 () Unit!30860)

(declare-fun zeroValue!1094 () V!30415)

(declare-fun minValue!1094 () V!30415)

(declare-fun lemmaKeyInListMapIsInArray!262 (array!54227 array!54225 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 64) Int) Unit!30860)

(assert (=> b!913078 (= lt!410925 (lemmaKeyInListMapIsInArray!262 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913079 () Bool)

(declare-fun tp_is_empty!19087 () Bool)

(assert (=> b!913079 (= e!512259 tp_is_empty!19087)))

(declare-fun res!615695 () Bool)

(assert (=> start!78326 (=> (not res!615695) (not e!512257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78326 (= res!615695 (validMask!0 mask!1756))))

(assert (=> start!78326 e!512257))

(declare-fun e!512258 () Bool)

(declare-fun array_inv!20452 (array!54225) Bool)

(assert (=> start!78326 (and (array_inv!20452 _values!1152) e!512258)))

(assert (=> start!78326 tp!58282))

(assert (=> start!78326 true))

(assert (=> start!78326 tp_is_empty!19087))

(declare-fun array_inv!20453 (array!54227) Bool)

(assert (=> start!78326 (array_inv!20453 _keys!1386)))

(declare-fun b!913080 () Bool)

(declare-fun res!615693 () Bool)

(assert (=> b!913080 (=> (not res!615693) (not e!512257))))

(declare-datatypes ((List!18280 0))(
  ( (Nil!18277) (Cons!18276 (h!19428 (_ BitVec 64)) (t!25859 List!18280)) )
))
(declare-fun arrayNoDuplicates!0 (array!54227 (_ BitVec 32) List!18280) Bool)

(assert (=> b!913080 (= res!615693 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18277))))

(declare-fun mapIsEmpty!30355 () Bool)

(assert (=> mapIsEmpty!30355 mapRes!30355))

(declare-fun b!913081 () Bool)

(declare-fun res!615689 () Bool)

(assert (=> b!913081 (=> (not res!615689) (not e!512257))))

(declare-datatypes ((tuple2!12460 0))(
  ( (tuple2!12461 (_1!6241 (_ BitVec 64)) (_2!6241 V!30415)) )
))
(declare-datatypes ((List!18281 0))(
  ( (Nil!18278) (Cons!18277 (h!19429 tuple2!12460) (t!25860 List!18281)) )
))
(declare-datatypes ((ListLongMap!11159 0))(
  ( (ListLongMap!11160 (toList!5595 List!18281)) )
))
(declare-fun contains!4649 (ListLongMap!11159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2856 (array!54227 array!54225 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 32) Int) ListLongMap!11159)

(assert (=> b!913081 (= res!615689 (contains!4649 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913082 () Bool)

(declare-fun res!615690 () Bool)

(assert (=> b!913082 (=> (not res!615690) (not e!512257))))

(assert (=> b!913082 (= res!615690 (and (= (select (arr!26064 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913083 () Bool)

(declare-fun e!512255 () Bool)

(assert (=> b!913083 (= e!512255 tp_is_empty!19087)))

(declare-fun b!913084 () Bool)

(assert (=> b!913084 (= e!512258 (and e!512255 mapRes!30355))))

(declare-fun condMapEmpty!30355 () Bool)

(declare-fun mapDefault!30355 () ValueCell!9062)

(assert (=> b!913084 (= condMapEmpty!30355 (= (arr!26063 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9062)) mapDefault!30355)))))

(assert (= (and start!78326 res!615695) b!913075))

(assert (= (and b!913075 res!615691) b!913077))

(assert (= (and b!913077 res!615694) b!913080))

(assert (= (and b!913080 res!615693) b!913081))

(assert (= (and b!913081 res!615689) b!913076))

(assert (= (and b!913076 res!615692) b!913082))

(assert (= (and b!913082 res!615690) b!913078))

(assert (= (and b!913084 condMapEmpty!30355) mapIsEmpty!30355))

(assert (= (and b!913084 (not condMapEmpty!30355)) mapNonEmpty!30355))

(get-info :version)

(assert (= (and mapNonEmpty!30355 ((_ is ValueCellFull!9062) mapValue!30355)) b!913079))

(assert (= (and b!913084 ((_ is ValueCellFull!9062) mapDefault!30355)) b!913083))

(assert (= start!78326 b!913084))

(declare-fun m!848037 () Bool)

(assert (=> b!913078 m!848037))

(declare-fun m!848039 () Bool)

(assert (=> b!913078 m!848039))

(declare-fun m!848041 () Bool)

(assert (=> b!913082 m!848041))

(declare-fun m!848043 () Bool)

(assert (=> b!913077 m!848043))

(declare-fun m!848045 () Bool)

(assert (=> mapNonEmpty!30355 m!848045))

(declare-fun m!848047 () Bool)

(assert (=> start!78326 m!848047))

(declare-fun m!848049 () Bool)

(assert (=> start!78326 m!848049))

(declare-fun m!848051 () Bool)

(assert (=> start!78326 m!848051))

(declare-fun m!848053 () Bool)

(assert (=> b!913081 m!848053))

(assert (=> b!913081 m!848053))

(declare-fun m!848055 () Bool)

(assert (=> b!913081 m!848055))

(declare-fun m!848057 () Bool)

(assert (=> b!913080 m!848057))

(declare-fun m!848059 () Bool)

(assert (=> b!913076 m!848059))

(check-sat (not b!913076) (not b!913077) (not start!78326) (not b!913081) (not b!913078) b_and!27253 (not b_next!16669) (not b!913080) (not mapNonEmpty!30355) tp_is_empty!19087)
(check-sat b_and!27253 (not b_next!16669))
(get-model)

(declare-fun bm!40412 () Bool)

(declare-fun call!40415 () Bool)

(assert (=> bm!40412 (= call!40415 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913153 () Bool)

(declare-fun e!512297 () Bool)

(declare-fun e!512296 () Bool)

(assert (=> b!913153 (= e!512297 e!512296)))

(declare-fun c!96054 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!913153 (= c!96054 (validKeyInArray!0 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112599 () Bool)

(declare-fun res!615742 () Bool)

(assert (=> d!112599 (=> res!615742 e!512297)))

(assert (=> d!112599 (= res!615742 (bvsge #b00000000000000000000000000000000 (size!26524 _keys!1386)))))

(assert (=> d!112599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512297)))

(declare-fun b!913154 () Bool)

(declare-fun e!512298 () Bool)

(assert (=> b!913154 (= e!512296 e!512298)))

(declare-fun lt!410938 () (_ BitVec 64))

(assert (=> b!913154 (= lt!410938 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410939 () Unit!30860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54227 (_ BitVec 64) (_ BitVec 32)) Unit!30860)

(assert (=> b!913154 (= lt!410939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410938 #b00000000000000000000000000000000))))

(assert (=> b!913154 (arrayContainsKey!0 _keys!1386 lt!410938 #b00000000000000000000000000000000)))

(declare-fun lt!410940 () Unit!30860)

(assert (=> b!913154 (= lt!410940 lt!410939)))

(declare-fun res!615743 () Bool)

(declare-datatypes ((SeekEntryResult!8921 0))(
  ( (MissingZero!8921 (index!38055 (_ BitVec 32))) (Found!8921 (index!38056 (_ BitVec 32))) (Intermediate!8921 (undefined!9733 Bool) (index!38057 (_ BitVec 32)) (x!78004 (_ BitVec 32))) (Undefined!8921) (MissingVacant!8921 (index!38058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54227 (_ BitVec 32)) SeekEntryResult!8921)

(assert (=> b!913154 (= res!615743 (= (seekEntryOrOpen!0 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8921 #b00000000000000000000000000000000)))))

(assert (=> b!913154 (=> (not res!615743) (not e!512298))))

(declare-fun b!913155 () Bool)

(assert (=> b!913155 (= e!512298 call!40415)))

(declare-fun b!913156 () Bool)

(assert (=> b!913156 (= e!512296 call!40415)))

(assert (= (and d!112599 (not res!615742)) b!913153))

(assert (= (and b!913153 c!96054) b!913154))

(assert (= (and b!913153 (not c!96054)) b!913156))

(assert (= (and b!913154 res!615743) b!913155))

(assert (= (or b!913155 b!913156) bm!40412))

(declare-fun m!848109 () Bool)

(assert (=> bm!40412 m!848109))

(declare-fun m!848111 () Bool)

(assert (=> b!913153 m!848111))

(assert (=> b!913153 m!848111))

(declare-fun m!848113 () Bool)

(assert (=> b!913153 m!848113))

(assert (=> b!913154 m!848111))

(declare-fun m!848115 () Bool)

(assert (=> b!913154 m!848115))

(declare-fun m!848117 () Bool)

(assert (=> b!913154 m!848117))

(assert (=> b!913154 m!848111))

(declare-fun m!848119 () Bool)

(assert (=> b!913154 m!848119))

(assert (=> b!913077 d!112599))

(declare-fun d!112601 () Bool)

(declare-fun e!512304 () Bool)

(assert (=> d!112601 e!512304))

(declare-fun res!615746 () Bool)

(assert (=> d!112601 (=> res!615746 e!512304)))

(declare-fun lt!410952 () Bool)

(assert (=> d!112601 (= res!615746 (not lt!410952))))

(declare-fun lt!410949 () Bool)

(assert (=> d!112601 (= lt!410952 lt!410949)))

(declare-fun lt!410950 () Unit!30860)

(declare-fun e!512303 () Unit!30860)

(assert (=> d!112601 (= lt!410950 e!512303)))

(declare-fun c!96057 () Bool)

(assert (=> d!112601 (= c!96057 lt!410949)))

(declare-fun containsKey!442 (List!18281 (_ BitVec 64)) Bool)

(assert (=> d!112601 (= lt!410949 (containsKey!442 (toList!5595 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112601 (= (contains!4649 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410952)))

(declare-fun b!913163 () Bool)

(declare-fun lt!410951 () Unit!30860)

(assert (=> b!913163 (= e!512303 lt!410951)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!336 (List!18281 (_ BitVec 64)) Unit!30860)

(assert (=> b!913163 (= lt!410951 (lemmaContainsKeyImpliesGetValueByKeyDefined!336 (toList!5595 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!477 0))(
  ( (Some!476 (v!12104 V!30415)) (None!475) )
))
(declare-fun isDefined!344 (Option!477) Bool)

(declare-fun getValueByKey!471 (List!18281 (_ BitVec 64)) Option!477)

(assert (=> b!913163 (isDefined!344 (getValueByKey!471 (toList!5595 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!913164 () Bool)

(declare-fun Unit!30862 () Unit!30860)

(assert (=> b!913164 (= e!512303 Unit!30862)))

(declare-fun b!913165 () Bool)

(assert (=> b!913165 (= e!512304 (isDefined!344 (getValueByKey!471 (toList!5595 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112601 c!96057) b!913163))

(assert (= (and d!112601 (not c!96057)) b!913164))

(assert (= (and d!112601 (not res!615746)) b!913165))

(declare-fun m!848121 () Bool)

(assert (=> d!112601 m!848121))

(declare-fun m!848123 () Bool)

(assert (=> b!913163 m!848123))

(declare-fun m!848125 () Bool)

(assert (=> b!913163 m!848125))

(assert (=> b!913163 m!848125))

(declare-fun m!848127 () Bool)

(assert (=> b!913163 m!848127))

(assert (=> b!913165 m!848125))

(assert (=> b!913165 m!848125))

(assert (=> b!913165 m!848127))

(assert (=> b!913081 d!112601))

(declare-fun b!913208 () Bool)

(declare-fun res!615767 () Bool)

(declare-fun e!512332 () Bool)

(assert (=> b!913208 (=> (not res!615767) (not e!512332))))

(declare-fun e!512336 () Bool)

(assert (=> b!913208 (= res!615767 e!512336)))

(declare-fun c!96072 () Bool)

(assert (=> b!913208 (= c!96072 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!913209 () Bool)

(declare-fun call!40433 () Bool)

(assert (=> b!913209 (= e!512336 (not call!40433))))

(declare-fun b!913210 () Bool)

(declare-fun e!512334 () Bool)

(assert (=> b!913210 (= e!512334 (validKeyInArray!0 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913211 () Bool)

(declare-fun e!512337 () Bool)

(assert (=> b!913211 (= e!512337 (validKeyInArray!0 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913212 () Bool)

(declare-fun e!512331 () ListLongMap!11159)

(declare-fun call!40434 () ListLongMap!11159)

(assert (=> b!913212 (= e!512331 call!40434)))

(declare-fun bm!40427 () Bool)

(declare-fun lt!411002 () ListLongMap!11159)

(assert (=> bm!40427 (= call!40433 (contains!4649 lt!411002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913213 () Bool)

(declare-fun e!512333 () Unit!30860)

(declare-fun lt!411006 () Unit!30860)

(assert (=> b!913213 (= e!512333 lt!411006)))

(declare-fun lt!411012 () ListLongMap!11159)

(declare-fun getCurrentListMapNoExtraKeys!3337 (array!54227 array!54225 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 32) Int) ListLongMap!11159)

(assert (=> b!913213 (= lt!411012 (getCurrentListMapNoExtraKeys!3337 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411009 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411018 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411018 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411011 () Unit!30860)

(declare-fun addStillContains!347 (ListLongMap!11159 (_ BitVec 64) V!30415 (_ BitVec 64)) Unit!30860)

(assert (=> b!913213 (= lt!411011 (addStillContains!347 lt!411012 lt!411009 zeroValue!1094 lt!411018))))

(declare-fun +!2616 (ListLongMap!11159 tuple2!12460) ListLongMap!11159)

(assert (=> b!913213 (contains!4649 (+!2616 lt!411012 (tuple2!12461 lt!411009 zeroValue!1094)) lt!411018)))

(declare-fun lt!411000 () Unit!30860)

(assert (=> b!913213 (= lt!411000 lt!411011)))

(declare-fun lt!411015 () ListLongMap!11159)

(assert (=> b!913213 (= lt!411015 (getCurrentListMapNoExtraKeys!3337 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411004 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411010 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411010 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411003 () Unit!30860)

(declare-fun addApplyDifferent!347 (ListLongMap!11159 (_ BitVec 64) V!30415 (_ BitVec 64)) Unit!30860)

(assert (=> b!913213 (= lt!411003 (addApplyDifferent!347 lt!411015 lt!411004 minValue!1094 lt!411010))))

(declare-fun apply!525 (ListLongMap!11159 (_ BitVec 64)) V!30415)

(assert (=> b!913213 (= (apply!525 (+!2616 lt!411015 (tuple2!12461 lt!411004 minValue!1094)) lt!411010) (apply!525 lt!411015 lt!411010))))

(declare-fun lt!411014 () Unit!30860)

(assert (=> b!913213 (= lt!411014 lt!411003)))

(declare-fun lt!410999 () ListLongMap!11159)

(assert (=> b!913213 (= lt!410999 (getCurrentListMapNoExtraKeys!3337 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411007 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411001 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411001 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411005 () Unit!30860)

(assert (=> b!913213 (= lt!411005 (addApplyDifferent!347 lt!410999 lt!411007 zeroValue!1094 lt!411001))))

(assert (=> b!913213 (= (apply!525 (+!2616 lt!410999 (tuple2!12461 lt!411007 zeroValue!1094)) lt!411001) (apply!525 lt!410999 lt!411001))))

(declare-fun lt!411017 () Unit!30860)

(assert (=> b!913213 (= lt!411017 lt!411005)))

(declare-fun lt!410997 () ListLongMap!11159)

(assert (=> b!913213 (= lt!410997 (getCurrentListMapNoExtraKeys!3337 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411016 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411016 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411013 () (_ BitVec 64))

(assert (=> b!913213 (= lt!411013 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913213 (= lt!411006 (addApplyDifferent!347 lt!410997 lt!411016 minValue!1094 lt!411013))))

(assert (=> b!913213 (= (apply!525 (+!2616 lt!410997 (tuple2!12461 lt!411016 minValue!1094)) lt!411013) (apply!525 lt!410997 lt!411013))))

(declare-fun bm!40428 () Bool)

(declare-fun call!40430 () ListLongMap!11159)

(assert (=> bm!40428 (= call!40434 call!40430)))

(declare-fun c!96074 () Bool)

(declare-fun call!40436 () ListLongMap!11159)

(declare-fun c!96071 () Bool)

(declare-fun call!40431 () ListLongMap!11159)

(declare-fun bm!40429 () Bool)

(assert (=> bm!40429 (= call!40436 (+!2616 (ite c!96071 call!40431 (ite c!96074 call!40430 call!40434)) (ite (or c!96071 c!96074) (tuple2!12461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913214 () Bool)

(declare-fun e!512339 () Bool)

(declare-fun e!512343 () Bool)

(assert (=> b!913214 (= e!512339 e!512343)))

(declare-fun res!615773 () Bool)

(assert (=> b!913214 (=> (not res!615773) (not e!512343))))

(assert (=> b!913214 (= res!615773 (contains!4649 lt!411002 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26524 _keys!1386)))))

(declare-fun bm!40430 () Bool)

(declare-fun call!40432 () Bool)

(assert (=> bm!40430 (= call!40432 (contains!4649 lt!411002 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40431 () Bool)

(assert (=> bm!40431 (= call!40430 call!40431)))

(declare-fun b!913216 () Bool)

(declare-fun e!512340 () Bool)

(assert (=> b!913216 (= e!512340 (not call!40432))))

(declare-fun bm!40432 () Bool)

(assert (=> bm!40432 (= call!40431 (getCurrentListMapNoExtraKeys!3337 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!913217 () Bool)

(declare-fun c!96075 () Bool)

(assert (=> b!913217 (= c!96075 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!512335 () ListLongMap!11159)

(assert (=> b!913217 (= e!512335 e!512331)))

(declare-fun b!913218 () Bool)

(declare-fun e!512341 () Bool)

(assert (=> b!913218 (= e!512336 e!512341)))

(declare-fun res!615768 () Bool)

(assert (=> b!913218 (= res!615768 call!40433)))

(assert (=> b!913218 (=> (not res!615768) (not e!512341))))

(declare-fun b!913219 () Bool)

(declare-fun res!615765 () Bool)

(assert (=> b!913219 (=> (not res!615765) (not e!512332))))

(assert (=> b!913219 (= res!615765 e!512339)))

(declare-fun res!615766 () Bool)

(assert (=> b!913219 (=> res!615766 e!512339)))

(assert (=> b!913219 (= res!615766 (not e!512334))))

(declare-fun res!615769 () Bool)

(assert (=> b!913219 (=> (not res!615769) (not e!512334))))

(assert (=> b!913219 (= res!615769 (bvslt #b00000000000000000000000000000000 (size!26524 _keys!1386)))))

(declare-fun b!913220 () Bool)

(assert (=> b!913220 (= e!512341 (= (apply!525 lt!411002 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!913221 () Bool)

(declare-fun Unit!30863 () Unit!30860)

(assert (=> b!913221 (= e!512333 Unit!30863)))

(declare-fun b!913222 () Bool)

(declare-fun e!512342 () ListLongMap!11159)

(assert (=> b!913222 (= e!512342 e!512335)))

(assert (=> b!913222 (= c!96074 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40433 () Bool)

(declare-fun call!40435 () ListLongMap!11159)

(assert (=> bm!40433 (= call!40435 call!40436)))

(declare-fun b!913223 () Bool)

(declare-fun e!512338 () Bool)

(assert (=> b!913223 (= e!512338 (= (apply!525 lt!411002 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913224 () Bool)

(assert (=> b!913224 (= e!512331 call!40435)))

(declare-fun b!913225 () Bool)

(assert (=> b!913225 (= e!512340 e!512338)))

(declare-fun res!615771 () Bool)

(assert (=> b!913225 (= res!615771 call!40432)))

(assert (=> b!913225 (=> (not res!615771) (not e!512338))))

(declare-fun b!913226 () Bool)

(declare-fun get!13697 (ValueCell!9062 V!30415) V!30415)

(declare-fun dynLambda!1406 (Int (_ BitVec 64)) V!30415)

(assert (=> b!913226 (= e!512343 (= (apply!525 lt!411002 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)) (get!13697 (select (arr!26063 _values!1152) #b00000000000000000000000000000000) (dynLambda!1406 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26523 _values!1152)))))

(assert (=> b!913226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26524 _keys!1386)))))

(declare-fun b!913215 () Bool)

(assert (=> b!913215 (= e!512335 call!40435)))

(declare-fun d!112603 () Bool)

(assert (=> d!112603 e!512332))

(declare-fun res!615770 () Bool)

(assert (=> d!112603 (=> (not res!615770) (not e!512332))))

(assert (=> d!112603 (= res!615770 (or (bvsge #b00000000000000000000000000000000 (size!26524 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26524 _keys!1386)))))))

(declare-fun lt!410998 () ListLongMap!11159)

(assert (=> d!112603 (= lt!411002 lt!410998)))

(declare-fun lt!411008 () Unit!30860)

(assert (=> d!112603 (= lt!411008 e!512333)))

(declare-fun c!96073 () Bool)

(assert (=> d!112603 (= c!96073 e!512337)))

(declare-fun res!615772 () Bool)

(assert (=> d!112603 (=> (not res!615772) (not e!512337))))

(assert (=> d!112603 (= res!615772 (bvslt #b00000000000000000000000000000000 (size!26524 _keys!1386)))))

(assert (=> d!112603 (= lt!410998 e!512342)))

(assert (=> d!112603 (= c!96071 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112603 (validMask!0 mask!1756)))

(assert (=> d!112603 (= (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411002)))

(declare-fun b!913227 () Bool)

(assert (=> b!913227 (= e!512342 (+!2616 call!40436 (tuple2!12461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913228 () Bool)

(assert (=> b!913228 (= e!512332 e!512340)))

(declare-fun c!96070 () Bool)

(assert (=> b!913228 (= c!96070 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112603 c!96071) b!913227))

(assert (= (and d!112603 (not c!96071)) b!913222))

(assert (= (and b!913222 c!96074) b!913215))

(assert (= (and b!913222 (not c!96074)) b!913217))

(assert (= (and b!913217 c!96075) b!913224))

(assert (= (and b!913217 (not c!96075)) b!913212))

(assert (= (or b!913224 b!913212) bm!40428))

(assert (= (or b!913215 bm!40428) bm!40431))

(assert (= (or b!913215 b!913224) bm!40433))

(assert (= (or b!913227 bm!40431) bm!40432))

(assert (= (or b!913227 bm!40433) bm!40429))

(assert (= (and d!112603 res!615772) b!913211))

(assert (= (and d!112603 c!96073) b!913213))

(assert (= (and d!112603 (not c!96073)) b!913221))

(assert (= (and d!112603 res!615770) b!913219))

(assert (= (and b!913219 res!615769) b!913210))

(assert (= (and b!913219 (not res!615766)) b!913214))

(assert (= (and b!913214 res!615773) b!913226))

(assert (= (and b!913219 res!615765) b!913208))

(assert (= (and b!913208 c!96072) b!913218))

(assert (= (and b!913208 (not c!96072)) b!913209))

(assert (= (and b!913218 res!615768) b!913220))

(assert (= (or b!913218 b!913209) bm!40427))

(assert (= (and b!913208 res!615767) b!913228))

(assert (= (and b!913228 c!96070) b!913225))

(assert (= (and b!913228 (not c!96070)) b!913216))

(assert (= (and b!913225 res!615771) b!913223))

(assert (= (or b!913225 b!913216) bm!40430))

(declare-fun b_lambda!13321 () Bool)

(assert (=> (not b_lambda!13321) (not b!913226)))

(declare-fun t!25862 () Bool)

(declare-fun tb!5431 () Bool)

(assert (=> (and start!78326 (= defaultEntry!1160 defaultEntry!1160) t!25862) tb!5431))

(declare-fun result!10673 () Bool)

(assert (=> tb!5431 (= result!10673 tp_is_empty!19087)))

(assert (=> b!913226 t!25862))

(declare-fun b_and!27259 () Bool)

(assert (= b_and!27253 (and (=> t!25862 result!10673) b_and!27259)))

(declare-fun m!848129 () Bool)

(assert (=> bm!40427 m!848129))

(declare-fun m!848131 () Bool)

(assert (=> b!913223 m!848131))

(declare-fun m!848133 () Bool)

(assert (=> bm!40429 m!848133))

(assert (=> b!913214 m!848111))

(assert (=> b!913214 m!848111))

(declare-fun m!848135 () Bool)

(assert (=> b!913214 m!848135))

(assert (=> b!913226 m!848111))

(declare-fun m!848137 () Bool)

(assert (=> b!913226 m!848137))

(assert (=> b!913226 m!848111))

(declare-fun m!848139 () Bool)

(assert (=> b!913226 m!848139))

(declare-fun m!848141 () Bool)

(assert (=> b!913226 m!848141))

(declare-fun m!848143 () Bool)

(assert (=> b!913226 m!848143))

(assert (=> b!913226 m!848139))

(assert (=> b!913226 m!848141))

(declare-fun m!848145 () Bool)

(assert (=> b!913213 m!848145))

(declare-fun m!848147 () Bool)

(assert (=> b!913213 m!848147))

(declare-fun m!848149 () Bool)

(assert (=> b!913213 m!848149))

(declare-fun m!848151 () Bool)

(assert (=> b!913213 m!848151))

(declare-fun m!848153 () Bool)

(assert (=> b!913213 m!848153))

(declare-fun m!848155 () Bool)

(assert (=> b!913213 m!848155))

(assert (=> b!913213 m!848111))

(declare-fun m!848157 () Bool)

(assert (=> b!913213 m!848157))

(declare-fun m!848159 () Bool)

(assert (=> b!913213 m!848159))

(declare-fun m!848161 () Bool)

(assert (=> b!913213 m!848161))

(declare-fun m!848163 () Bool)

(assert (=> b!913213 m!848163))

(assert (=> b!913213 m!848157))

(declare-fun m!848165 () Bool)

(assert (=> b!913213 m!848165))

(declare-fun m!848167 () Bool)

(assert (=> b!913213 m!848167))

(assert (=> b!913213 m!848163))

(declare-fun m!848169 () Bool)

(assert (=> b!913213 m!848169))

(assert (=> b!913213 m!848147))

(declare-fun m!848171 () Bool)

(assert (=> b!913213 m!848171))

(assert (=> b!913213 m!848165))

(declare-fun m!848173 () Bool)

(assert (=> b!913213 m!848173))

(declare-fun m!848175 () Bool)

(assert (=> b!913213 m!848175))

(assert (=> b!913211 m!848111))

(assert (=> b!913211 m!848111))

(assert (=> b!913211 m!848113))

(declare-fun m!848177 () Bool)

(assert (=> bm!40430 m!848177))

(assert (=> d!112603 m!848047))

(assert (=> b!913210 m!848111))

(assert (=> b!913210 m!848111))

(assert (=> b!913210 m!848113))

(assert (=> bm!40432 m!848151))

(declare-fun m!848179 () Bool)

(assert (=> b!913220 m!848179))

(declare-fun m!848181 () Bool)

(assert (=> b!913227 m!848181))

(assert (=> b!913081 d!112603))

(declare-fun d!112605 () Bool)

(declare-fun res!615778 () Bool)

(declare-fun e!512348 () Bool)

(assert (=> d!112605 (=> res!615778 e!512348)))

(assert (=> d!112605 (= res!615778 (= (select (arr!26064 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112605 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512348)))

(declare-fun b!913235 () Bool)

(declare-fun e!512349 () Bool)

(assert (=> b!913235 (= e!512348 e!512349)))

(declare-fun res!615779 () Bool)

(assert (=> b!913235 (=> (not res!615779) (not e!512349))))

(assert (=> b!913235 (= res!615779 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26524 _keys!1386)))))

(declare-fun b!913236 () Bool)

(assert (=> b!913236 (= e!512349 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112605 (not res!615778)) b!913235))

(assert (= (and b!913235 res!615779) b!913236))

(assert (=> d!112605 m!848111))

(declare-fun m!848183 () Bool)

(assert (=> b!913236 m!848183))

(assert (=> b!913078 d!112605))

(declare-fun d!112607 () Bool)

(declare-fun e!512352 () Bool)

(assert (=> d!112607 e!512352))

(declare-fun c!96078 () Bool)

(assert (=> d!112607 (= c!96078 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!411021 () Unit!30860)

(declare-fun choose!1535 (array!54227 array!54225 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 64) Int) Unit!30860)

(assert (=> d!112607 (= lt!411021 (choose!1535 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112607 (validMask!0 mask!1756)))

(assert (=> d!112607 (= (lemmaKeyInListMapIsInArray!262 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!411021)))

(declare-fun b!913241 () Bool)

(assert (=> b!913241 (= e!512352 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913242 () Bool)

(assert (=> b!913242 (= e!512352 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112607 c!96078) b!913241))

(assert (= (and d!112607 (not c!96078)) b!913242))

(declare-fun m!848185 () Bool)

(assert (=> d!112607 m!848185))

(assert (=> d!112607 m!848047))

(assert (=> b!913241 m!848037))

(assert (=> b!913078 d!112607))

(declare-fun d!112609 () Bool)

(assert (=> d!112609 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!913076 d!112609))

(declare-fun d!112611 () Bool)

(declare-fun res!615787 () Bool)

(declare-fun e!512364 () Bool)

(assert (=> d!112611 (=> res!615787 e!512364)))

(assert (=> d!112611 (= res!615787 (bvsge #b00000000000000000000000000000000 (size!26524 _keys!1386)))))

(assert (=> d!112611 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18277) e!512364)))

(declare-fun b!913253 () Bool)

(declare-fun e!512361 () Bool)

(assert (=> b!913253 (= e!512364 e!512361)))

(declare-fun res!615786 () Bool)

(assert (=> b!913253 (=> (not res!615786) (not e!512361))))

(declare-fun e!512363 () Bool)

(assert (=> b!913253 (= res!615786 (not e!512363))))

(declare-fun res!615788 () Bool)

(assert (=> b!913253 (=> (not res!615788) (not e!512363))))

(assert (=> b!913253 (= res!615788 (validKeyInArray!0 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913254 () Bool)

(declare-fun e!512362 () Bool)

(declare-fun call!40439 () Bool)

(assert (=> b!913254 (= e!512362 call!40439)))

(declare-fun bm!40436 () Bool)

(declare-fun c!96081 () Bool)

(assert (=> bm!40436 (= call!40439 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96081 (Cons!18276 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000) Nil!18277) Nil!18277)))))

(declare-fun b!913255 () Bool)

(declare-fun contains!4650 (List!18280 (_ BitVec 64)) Bool)

(assert (=> b!913255 (= e!512363 (contains!4650 Nil!18277 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913256 () Bool)

(assert (=> b!913256 (= e!512362 call!40439)))

(declare-fun b!913257 () Bool)

(assert (=> b!913257 (= e!512361 e!512362)))

(assert (=> b!913257 (= c!96081 (validKeyInArray!0 (select (arr!26064 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112611 (not res!615787)) b!913253))

(assert (= (and b!913253 res!615788) b!913255))

(assert (= (and b!913253 res!615786) b!913257))

(assert (= (and b!913257 c!96081) b!913254))

(assert (= (and b!913257 (not c!96081)) b!913256))

(assert (= (or b!913254 b!913256) bm!40436))

(assert (=> b!913253 m!848111))

(assert (=> b!913253 m!848111))

(assert (=> b!913253 m!848113))

(assert (=> bm!40436 m!848111))

(declare-fun m!848187 () Bool)

(assert (=> bm!40436 m!848187))

(assert (=> b!913255 m!848111))

(assert (=> b!913255 m!848111))

(declare-fun m!848189 () Bool)

(assert (=> b!913255 m!848189))

(assert (=> b!913257 m!848111))

(assert (=> b!913257 m!848111))

(assert (=> b!913257 m!848113))

(assert (=> b!913080 d!112611))

(declare-fun d!112613 () Bool)

(assert (=> d!112613 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78326 d!112613))

(declare-fun d!112615 () Bool)

(assert (=> d!112615 (= (array_inv!20452 _values!1152) (bvsge (size!26523 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78326 d!112615))

(declare-fun d!112617 () Bool)

(assert (=> d!112617 (= (array_inv!20453 _keys!1386) (bvsge (size!26524 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78326 d!112617))

(declare-fun b!913265 () Bool)

(declare-fun e!512370 () Bool)

(assert (=> b!913265 (= e!512370 tp_is_empty!19087)))

(declare-fun condMapEmpty!30364 () Bool)

(declare-fun mapDefault!30364 () ValueCell!9062)

(assert (=> mapNonEmpty!30355 (= condMapEmpty!30364 (= mapRest!30355 ((as const (Array (_ BitVec 32) ValueCell!9062)) mapDefault!30364)))))

(declare-fun mapRes!30364 () Bool)

(assert (=> mapNonEmpty!30355 (= tp!58281 (and e!512370 mapRes!30364))))

(declare-fun mapIsEmpty!30364 () Bool)

(assert (=> mapIsEmpty!30364 mapRes!30364))

(declare-fun b!913264 () Bool)

(declare-fun e!512369 () Bool)

(assert (=> b!913264 (= e!512369 tp_is_empty!19087)))

(declare-fun mapNonEmpty!30364 () Bool)

(declare-fun tp!58297 () Bool)

(assert (=> mapNonEmpty!30364 (= mapRes!30364 (and tp!58297 e!512369))))

(declare-fun mapKey!30364 () (_ BitVec 32))

(declare-fun mapRest!30364 () (Array (_ BitVec 32) ValueCell!9062))

(declare-fun mapValue!30364 () ValueCell!9062)

(assert (=> mapNonEmpty!30364 (= mapRest!30355 (store mapRest!30364 mapKey!30364 mapValue!30364))))

(assert (= (and mapNonEmpty!30355 condMapEmpty!30364) mapIsEmpty!30364))

(assert (= (and mapNonEmpty!30355 (not condMapEmpty!30364)) mapNonEmpty!30364))

(assert (= (and mapNonEmpty!30364 ((_ is ValueCellFull!9062) mapValue!30364)) b!913264))

(assert (= (and mapNonEmpty!30355 ((_ is ValueCellFull!9062) mapDefault!30364)) b!913265))

(declare-fun m!848191 () Bool)

(assert (=> mapNonEmpty!30364 m!848191))

(declare-fun b_lambda!13323 () Bool)

(assert (= b_lambda!13321 (or (and start!78326 b_free!16669) b_lambda!13323)))

(check-sat (not b!913255) (not bm!40429) (not b!913226) (not bm!40436) (not b!913257) (not b!913241) (not bm!40427) (not b!913163) (not bm!40432) (not b!913210) (not mapNonEmpty!30364) (not b!913214) (not b_next!16669) b_and!27259 (not b_lambda!13323) (not b!913213) (not b!913253) (not b!913154) (not b!913220) (not b!913227) (not b!913236) (not bm!40412) (not b!913223) (not d!112601) (not b!913165) (not b!913153) (not d!112603) tp_is_empty!19087 (not d!112607) (not b!913211) (not bm!40430))
(check-sat b_and!27259 (not b_next!16669))
