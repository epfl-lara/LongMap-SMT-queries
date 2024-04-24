; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36578 () Bool)

(assert start!36578)

(declare-fun mapIsEmpty!14220 () Bool)

(declare-fun mapRes!14220 () Bool)

(assert (=> mapIsEmpty!14220 mapRes!14220))

(declare-fun res!204269 () Bool)

(declare-fun e!223678 () Bool)

(assert (=> start!36578 (=> (not res!204269) (not e!223678))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36578 (= res!204269 (validMask!0 mask!970))))

(assert (=> start!36578 e!223678))

(assert (=> start!36578 true))

(declare-datatypes ((V!12371 0))(
  ( (V!12372 (val!4269 Int)) )
))
(declare-datatypes ((ValueCell!3881 0))(
  ( (ValueCellFull!3881 (v!6465 V!12371)) (EmptyCell!3881) )
))
(declare-datatypes ((array!20838 0))(
  ( (array!20839 (arr!9893 (Array (_ BitVec 32) ValueCell!3881)) (size!10245 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20838)

(declare-fun e!223680 () Bool)

(declare-fun array_inv!7362 (array!20838) Bool)

(assert (=> start!36578 (and (array_inv!7362 _values!506) e!223680)))

(declare-datatypes ((array!20840 0))(
  ( (array!20841 (arr!9894 (Array (_ BitVec 32) (_ BitVec 64))) (size!10246 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20840)

(declare-fun array_inv!7363 (array!20840) Bool)

(assert (=> start!36578 (array_inv!7363 _keys!658)))

(declare-fun b!365307 () Bool)

(declare-datatypes ((List!5434 0))(
  ( (Nil!5431) (Cons!5430 (h!6286 (_ BitVec 64)) (t!10576 List!5434)) )
))
(declare-fun noDuplicate!187 (List!5434) Bool)

(assert (=> b!365307 (= e!223678 (not (noDuplicate!187 Nil!5431)))))

(declare-fun mapNonEmpty!14220 () Bool)

(declare-fun tp!28296 () Bool)

(declare-fun e!223682 () Bool)

(assert (=> mapNonEmpty!14220 (= mapRes!14220 (and tp!28296 e!223682))))

(declare-fun mapKey!14220 () (_ BitVec 32))

(declare-fun mapValue!14220 () ValueCell!3881)

(declare-fun mapRest!14220 () (Array (_ BitVec 32) ValueCell!3881))

(assert (=> mapNonEmpty!14220 (= (arr!9893 _values!506) (store mapRest!14220 mapKey!14220 mapValue!14220))))

(declare-fun b!365308 () Bool)

(declare-fun res!204270 () Bool)

(assert (=> b!365308 (=> (not res!204270) (not e!223678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20840 (_ BitVec 32)) Bool)

(assert (=> b!365308 (= res!204270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365309 () Bool)

(declare-fun tp_is_empty!8449 () Bool)

(assert (=> b!365309 (= e!223682 tp_is_empty!8449)))

(declare-fun b!365310 () Bool)

(declare-fun e!223681 () Bool)

(assert (=> b!365310 (= e!223680 (and e!223681 mapRes!14220))))

(declare-fun condMapEmpty!14220 () Bool)

(declare-fun mapDefault!14220 () ValueCell!3881)

(assert (=> b!365310 (= condMapEmpty!14220 (= (arr!9893 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3881)) mapDefault!14220)))))

(declare-fun b!365311 () Bool)

(declare-fun res!204268 () Bool)

(assert (=> b!365311 (=> (not res!204268) (not e!223678))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365311 (= res!204268 (and (= (size!10245 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10246 _keys!658) (size!10245 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365312 () Bool)

(assert (=> b!365312 (= e!223681 tp_is_empty!8449)))

(declare-fun b!365313 () Bool)

(declare-fun res!204271 () Bool)

(assert (=> b!365313 (=> (not res!204271) (not e!223678))))

(assert (=> b!365313 (= res!204271 (and (bvsle #b00000000000000000000000000000000 (size!10246 _keys!658)) (bvslt (size!10246 _keys!658) #b01111111111111111111111111111111)))))

(assert (= (and start!36578 res!204269) b!365311))

(assert (= (and b!365311 res!204268) b!365308))

(assert (= (and b!365308 res!204270) b!365313))

(assert (= (and b!365313 res!204271) b!365307))

(assert (= (and b!365310 condMapEmpty!14220) mapIsEmpty!14220))

(assert (= (and b!365310 (not condMapEmpty!14220)) mapNonEmpty!14220))

(get-info :version)

(assert (= (and mapNonEmpty!14220 ((_ is ValueCellFull!3881) mapValue!14220)) b!365309))

(assert (= (and b!365310 ((_ is ValueCellFull!3881) mapDefault!14220)) b!365312))

(assert (= start!36578 b!365310))

(declare-fun m!363331 () Bool)

(assert (=> start!36578 m!363331))

(declare-fun m!363333 () Bool)

(assert (=> start!36578 m!363333))

(declare-fun m!363335 () Bool)

(assert (=> start!36578 m!363335))

(declare-fun m!363337 () Bool)

(assert (=> b!365307 m!363337))

(declare-fun m!363339 () Bool)

(assert (=> mapNonEmpty!14220 m!363339))

(declare-fun m!363341 () Bool)

(assert (=> b!365308 m!363341))

(check-sat (not b!365308) (not start!36578) tp_is_empty!8449 (not mapNonEmpty!14220) (not b!365307))
(check-sat)
(get-model)

(declare-fun d!72361 () Bool)

(assert (=> d!72361 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36578 d!72361))

(declare-fun d!72363 () Bool)

(assert (=> d!72363 (= (array_inv!7362 _values!506) (bvsge (size!10245 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36578 d!72363))

(declare-fun d!72365 () Bool)

(assert (=> d!72365 (= (array_inv!7363 _keys!658) (bvsge (size!10246 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36578 d!72365))

(declare-fun b!365364 () Bool)

(declare-fun e!223721 () Bool)

(declare-fun e!223720 () Bool)

(assert (=> b!365364 (= e!223721 e!223720)))

(declare-fun c!53871 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365364 (= c!53871 (validKeyInArray!0 (select (arr!9894 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27262 () Bool)

(declare-fun call!27265 () Bool)

(assert (=> bm!27262 (= call!27265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365365 () Bool)

(declare-fun e!223719 () Bool)

(assert (=> b!365365 (= e!223719 call!27265)))

(declare-fun d!72367 () Bool)

(declare-fun res!204300 () Bool)

(assert (=> d!72367 (=> res!204300 e!223721)))

(assert (=> d!72367 (= res!204300 (bvsge #b00000000000000000000000000000000 (size!10246 _keys!658)))))

(assert (=> d!72367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223721)))

(declare-fun b!365366 () Bool)

(assert (=> b!365366 (= e!223720 e!223719)))

(declare-fun lt!169191 () (_ BitVec 64))

(assert (=> b!365366 (= lt!169191 (select (arr!9894 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11375 0))(
  ( (Unit!11376) )
))
(declare-fun lt!169193 () Unit!11375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20840 (_ BitVec 64) (_ BitVec 32)) Unit!11375)

(assert (=> b!365366 (= lt!169193 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169191 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365366 (arrayContainsKey!0 _keys!658 lt!169191 #b00000000000000000000000000000000)))

(declare-fun lt!169192 () Unit!11375)

(assert (=> b!365366 (= lt!169192 lt!169193)))

(declare-fun res!204301 () Bool)

(declare-datatypes ((SeekEntryResult!3451 0))(
  ( (MissingZero!3451 (index!15983 (_ BitVec 32))) (Found!3451 (index!15984 (_ BitVec 32))) (Intermediate!3451 (undefined!4263 Bool) (index!15985 (_ BitVec 32)) (x!36596 (_ BitVec 32))) (Undefined!3451) (MissingVacant!3451 (index!15986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20840 (_ BitVec 32)) SeekEntryResult!3451)

(assert (=> b!365366 (= res!204301 (= (seekEntryOrOpen!0 (select (arr!9894 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3451 #b00000000000000000000000000000000)))))

(assert (=> b!365366 (=> (not res!204301) (not e!223719))))

(declare-fun b!365367 () Bool)

(assert (=> b!365367 (= e!223720 call!27265)))

(assert (= (and d!72367 (not res!204300)) b!365364))

(assert (= (and b!365364 c!53871) b!365366))

(assert (= (and b!365364 (not c!53871)) b!365367))

(assert (= (and b!365366 res!204301) b!365365))

(assert (= (or b!365365 b!365367) bm!27262))

(declare-fun m!363367 () Bool)

(assert (=> b!365364 m!363367))

(assert (=> b!365364 m!363367))

(declare-fun m!363369 () Bool)

(assert (=> b!365364 m!363369))

(declare-fun m!363371 () Bool)

(assert (=> bm!27262 m!363371))

(assert (=> b!365366 m!363367))

(declare-fun m!363373 () Bool)

(assert (=> b!365366 m!363373))

(declare-fun m!363375 () Bool)

(assert (=> b!365366 m!363375))

(assert (=> b!365366 m!363367))

(declare-fun m!363377 () Bool)

(assert (=> b!365366 m!363377))

(assert (=> b!365308 d!72367))

(declare-fun d!72369 () Bool)

(declare-fun res!204306 () Bool)

(declare-fun e!223726 () Bool)

(assert (=> d!72369 (=> res!204306 e!223726)))

(assert (=> d!72369 (= res!204306 ((_ is Nil!5431) Nil!5431))))

(assert (=> d!72369 (= (noDuplicate!187 Nil!5431) e!223726)))

(declare-fun b!365372 () Bool)

(declare-fun e!223727 () Bool)

(assert (=> b!365372 (= e!223726 e!223727)))

(declare-fun res!204307 () Bool)

(assert (=> b!365372 (=> (not res!204307) (not e!223727))))

(declare-fun contains!2412 (List!5434 (_ BitVec 64)) Bool)

(assert (=> b!365372 (= res!204307 (not (contains!2412 (t!10576 Nil!5431) (h!6286 Nil!5431))))))

(declare-fun b!365373 () Bool)

(assert (=> b!365373 (= e!223727 (noDuplicate!187 (t!10576 Nil!5431)))))

(assert (= (and d!72369 (not res!204306)) b!365372))

(assert (= (and b!365372 res!204307) b!365373))

(declare-fun m!363379 () Bool)

(assert (=> b!365372 m!363379))

(declare-fun m!363381 () Bool)

(assert (=> b!365373 m!363381))

(assert (=> b!365307 d!72369))

(declare-fun mapNonEmpty!14229 () Bool)

(declare-fun mapRes!14229 () Bool)

(declare-fun tp!28305 () Bool)

(declare-fun e!223732 () Bool)

(assert (=> mapNonEmpty!14229 (= mapRes!14229 (and tp!28305 e!223732))))

(declare-fun mapKey!14229 () (_ BitVec 32))

(declare-fun mapRest!14229 () (Array (_ BitVec 32) ValueCell!3881))

(declare-fun mapValue!14229 () ValueCell!3881)

(assert (=> mapNonEmpty!14229 (= mapRest!14220 (store mapRest!14229 mapKey!14229 mapValue!14229))))

(declare-fun b!365380 () Bool)

(assert (=> b!365380 (= e!223732 tp_is_empty!8449)))

(declare-fun b!365381 () Bool)

(declare-fun e!223733 () Bool)

(assert (=> b!365381 (= e!223733 tp_is_empty!8449)))

(declare-fun mapIsEmpty!14229 () Bool)

(assert (=> mapIsEmpty!14229 mapRes!14229))

(declare-fun condMapEmpty!14229 () Bool)

(declare-fun mapDefault!14229 () ValueCell!3881)

(assert (=> mapNonEmpty!14220 (= condMapEmpty!14229 (= mapRest!14220 ((as const (Array (_ BitVec 32) ValueCell!3881)) mapDefault!14229)))))

(assert (=> mapNonEmpty!14220 (= tp!28296 (and e!223733 mapRes!14229))))

(assert (= (and mapNonEmpty!14220 condMapEmpty!14229) mapIsEmpty!14229))

(assert (= (and mapNonEmpty!14220 (not condMapEmpty!14229)) mapNonEmpty!14229))

(assert (= (and mapNonEmpty!14229 ((_ is ValueCellFull!3881) mapValue!14229)) b!365380))

(assert (= (and mapNonEmpty!14220 ((_ is ValueCellFull!3881) mapDefault!14229)) b!365381))

(declare-fun m!363383 () Bool)

(assert (=> mapNonEmpty!14229 m!363383))

(check-sat (not b!365364) (not b!365372) (not b!365366) (not b!365373) (not bm!27262) (not mapNonEmpty!14229) tp_is_empty!8449)
(check-sat)
