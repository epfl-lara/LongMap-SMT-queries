; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36564 () Bool)

(assert start!36564)

(declare-fun mapIsEmpty!14208 () Bool)

(declare-fun mapRes!14208 () Bool)

(assert (=> mapIsEmpty!14208 mapRes!14208))

(declare-fun b!365231 () Bool)

(declare-fun e!223620 () Bool)

(declare-fun tp_is_empty!8443 () Bool)

(assert (=> b!365231 (= e!223620 tp_is_empty!8443)))

(declare-fun b!365232 () Bool)

(declare-fun e!223618 () Bool)

(assert (=> b!365232 (= e!223618 tp_is_empty!8443)))

(declare-fun b!365233 () Bool)

(declare-fun res!204235 () Bool)

(declare-fun e!223619 () Bool)

(assert (=> b!365233 (=> (not res!204235) (not e!223619))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12363 0))(
  ( (V!12364 (val!4266 Int)) )
))
(declare-datatypes ((ValueCell!3878 0))(
  ( (ValueCellFull!3878 (v!6462 V!12363)) (EmptyCell!3878) )
))
(declare-datatypes ((array!20824 0))(
  ( (array!20825 (arr!9887 (Array (_ BitVec 32) ValueCell!3878)) (size!10239 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20824)

(declare-datatypes ((array!20826 0))(
  ( (array!20827 (arr!9888 (Array (_ BitVec 32) (_ BitVec 64))) (size!10240 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20826)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365233 (= res!204235 (and (= (size!10239 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10240 _keys!658) (size!10239 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365234 () Bool)

(declare-fun e!223622 () Bool)

(assert (=> b!365234 (= e!223622 (and e!223618 mapRes!14208))))

(declare-fun condMapEmpty!14208 () Bool)

(declare-fun mapDefault!14208 () ValueCell!3878)

(assert (=> b!365234 (= condMapEmpty!14208 (= (arr!9887 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3878)) mapDefault!14208)))))

(declare-fun res!204234 () Bool)

(assert (=> start!36564 (=> (not res!204234) (not e!223619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36564 (= res!204234 (validMask!0 mask!970))))

(assert (=> start!36564 e!223619))

(assert (=> start!36564 true))

(declare-fun array_inv!7356 (array!20824) Bool)

(assert (=> start!36564 (and (array_inv!7356 _values!506) e!223622)))

(declare-fun array_inv!7357 (array!20826) Bool)

(assert (=> start!36564 (array_inv!7357 _keys!658)))

(declare-fun b!365235 () Bool)

(assert (=> b!365235 (= e!223619 (and (bvsle #b00000000000000000000000000000000 (size!10240 _keys!658)) (bvsge (size!10240 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!14208 () Bool)

(declare-fun tp!28284 () Bool)

(assert (=> mapNonEmpty!14208 (= mapRes!14208 (and tp!28284 e!223620))))

(declare-fun mapRest!14208 () (Array (_ BitVec 32) ValueCell!3878))

(declare-fun mapValue!14208 () ValueCell!3878)

(declare-fun mapKey!14208 () (_ BitVec 32))

(assert (=> mapNonEmpty!14208 (= (arr!9887 _values!506) (store mapRest!14208 mapKey!14208 mapValue!14208))))

(declare-fun b!365236 () Bool)

(declare-fun res!204233 () Bool)

(assert (=> b!365236 (=> (not res!204233) (not e!223619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20826 (_ BitVec 32)) Bool)

(assert (=> b!365236 (= res!204233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36564 res!204234) b!365233))

(assert (= (and b!365233 res!204235) b!365236))

(assert (= (and b!365236 res!204233) b!365235))

(assert (= (and b!365234 condMapEmpty!14208) mapIsEmpty!14208))

(assert (= (and b!365234 (not condMapEmpty!14208)) mapNonEmpty!14208))

(get-info :version)

(assert (= (and mapNonEmpty!14208 ((_ is ValueCellFull!3878) mapValue!14208)) b!365231))

(assert (= (and b!365234 ((_ is ValueCellFull!3878) mapDefault!14208)) b!365232))

(assert (= start!36564 b!365234))

(declare-fun m!363287 () Bool)

(assert (=> start!36564 m!363287))

(declare-fun m!363289 () Bool)

(assert (=> start!36564 m!363289))

(declare-fun m!363291 () Bool)

(assert (=> start!36564 m!363291))

(declare-fun m!363293 () Bool)

(assert (=> mapNonEmpty!14208 m!363293))

(declare-fun m!363295 () Bool)

(assert (=> b!365236 m!363295))

(check-sat (not b!365236) (not start!36564) (not mapNonEmpty!14208) tp_is_empty!8443)
(check-sat)
(get-model)

(declare-fun b!365281 () Bool)

(declare-fun e!223661 () Bool)

(declare-fun call!27262 () Bool)

(assert (=> b!365281 (= e!223661 call!27262)))

(declare-fun bm!27259 () Bool)

(assert (=> bm!27259 (= call!27262 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72351 () Bool)

(declare-fun res!204259 () Bool)

(declare-fun e!223660 () Bool)

(assert (=> d!72351 (=> res!204259 e!223660)))

(assert (=> d!72351 (= res!204259 (bvsge #b00000000000000000000000000000000 (size!10240 _keys!658)))))

(assert (=> d!72351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223660)))

(declare-fun b!365282 () Bool)

(declare-fun e!223659 () Bool)

(assert (=> b!365282 (= e!223660 e!223659)))

(declare-fun c!53868 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365282 (= c!53868 (validKeyInArray!0 (select (arr!9888 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365283 () Bool)

(assert (=> b!365283 (= e!223659 e!223661)))

(declare-fun lt!169183 () (_ BitVec 64))

(assert (=> b!365283 (= lt!169183 (select (arr!9888 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11373 0))(
  ( (Unit!11374) )
))
(declare-fun lt!169182 () Unit!11373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20826 (_ BitVec 64) (_ BitVec 32)) Unit!11373)

(assert (=> b!365283 (= lt!169182 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169183 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365283 (arrayContainsKey!0 _keys!658 lt!169183 #b00000000000000000000000000000000)))

(declare-fun lt!169184 () Unit!11373)

(assert (=> b!365283 (= lt!169184 lt!169182)))

(declare-fun res!204258 () Bool)

(declare-datatypes ((SeekEntryResult!3450 0))(
  ( (MissingZero!3450 (index!15979 (_ BitVec 32))) (Found!3450 (index!15980 (_ BitVec 32))) (Intermediate!3450 (undefined!4262 Bool) (index!15981 (_ BitVec 32)) (x!36585 (_ BitVec 32))) (Undefined!3450) (MissingVacant!3450 (index!15982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20826 (_ BitVec 32)) SeekEntryResult!3450)

(assert (=> b!365283 (= res!204258 (= (seekEntryOrOpen!0 (select (arr!9888 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3450 #b00000000000000000000000000000000)))))

(assert (=> b!365283 (=> (not res!204258) (not e!223661))))

(declare-fun b!365284 () Bool)

(assert (=> b!365284 (= e!223659 call!27262)))

(assert (= (and d!72351 (not res!204259)) b!365282))

(assert (= (and b!365282 c!53868) b!365283))

(assert (= (and b!365282 (not c!53868)) b!365284))

(assert (= (and b!365283 res!204258) b!365281))

(assert (= (or b!365281 b!365284) bm!27259))

(declare-fun m!363317 () Bool)

(assert (=> bm!27259 m!363317))

(declare-fun m!363319 () Bool)

(assert (=> b!365282 m!363319))

(assert (=> b!365282 m!363319))

(declare-fun m!363321 () Bool)

(assert (=> b!365282 m!363321))

(assert (=> b!365283 m!363319))

(declare-fun m!363323 () Bool)

(assert (=> b!365283 m!363323))

(declare-fun m!363325 () Bool)

(assert (=> b!365283 m!363325))

(assert (=> b!365283 m!363319))

(declare-fun m!363327 () Bool)

(assert (=> b!365283 m!363327))

(assert (=> b!365236 d!72351))

(declare-fun d!72353 () Bool)

(assert (=> d!72353 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36564 d!72353))

(declare-fun d!72355 () Bool)

(assert (=> d!72355 (= (array_inv!7356 _values!506) (bvsge (size!10239 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36564 d!72355))

(declare-fun d!72357 () Bool)

(assert (=> d!72357 (= (array_inv!7357 _keys!658) (bvsge (size!10240 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36564 d!72357))

(declare-fun mapIsEmpty!14217 () Bool)

(declare-fun mapRes!14217 () Bool)

(assert (=> mapIsEmpty!14217 mapRes!14217))

(declare-fun condMapEmpty!14217 () Bool)

(declare-fun mapDefault!14217 () ValueCell!3878)

(assert (=> mapNonEmpty!14208 (= condMapEmpty!14217 (= mapRest!14208 ((as const (Array (_ BitVec 32) ValueCell!3878)) mapDefault!14217)))))

(declare-fun e!223666 () Bool)

(assert (=> mapNonEmpty!14208 (= tp!28284 (and e!223666 mapRes!14217))))

(declare-fun mapNonEmpty!14217 () Bool)

(declare-fun tp!28293 () Bool)

(declare-fun e!223667 () Bool)

(assert (=> mapNonEmpty!14217 (= mapRes!14217 (and tp!28293 e!223667))))

(declare-fun mapKey!14217 () (_ BitVec 32))

(declare-fun mapValue!14217 () ValueCell!3878)

(declare-fun mapRest!14217 () (Array (_ BitVec 32) ValueCell!3878))

(assert (=> mapNonEmpty!14217 (= mapRest!14208 (store mapRest!14217 mapKey!14217 mapValue!14217))))

(declare-fun b!365292 () Bool)

(assert (=> b!365292 (= e!223666 tp_is_empty!8443)))

(declare-fun b!365291 () Bool)

(assert (=> b!365291 (= e!223667 tp_is_empty!8443)))

(assert (= (and mapNonEmpty!14208 condMapEmpty!14217) mapIsEmpty!14217))

(assert (= (and mapNonEmpty!14208 (not condMapEmpty!14217)) mapNonEmpty!14217))

(assert (= (and mapNonEmpty!14217 ((_ is ValueCellFull!3878) mapValue!14217)) b!365291))

(assert (= (and mapNonEmpty!14208 ((_ is ValueCellFull!3878) mapDefault!14217)) b!365292))

(declare-fun m!363329 () Bool)

(assert (=> mapNonEmpty!14217 m!363329))

(check-sat (not bm!27259) (not b!365283) tp_is_empty!8443 (not mapNonEmpty!14217) (not b!365282))
(check-sat)
