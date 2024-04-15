; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36564 () Bool)

(assert start!36564)

(declare-fun res!204109 () Bool)

(declare-fun e!223479 () Bool)

(assert (=> start!36564 (=> (not res!204109) (not e!223479))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36564 (= res!204109 (validMask!0 mask!970))))

(assert (=> start!36564 e!223479))

(assert (=> start!36564 true))

(declare-datatypes ((V!12363 0))(
  ( (V!12364 (val!4266 Int)) )
))
(declare-datatypes ((ValueCell!3878 0))(
  ( (ValueCellFull!3878 (v!6455 V!12363)) (EmptyCell!3878) )
))
(declare-datatypes ((array!20821 0))(
  ( (array!20822 (arr!9886 (Array (_ BitVec 32) ValueCell!3878)) (size!10239 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20821)

(declare-fun e!223480 () Bool)

(declare-fun array_inv!7332 (array!20821) Bool)

(assert (=> start!36564 (and (array_inv!7332 _values!506) e!223480)))

(declare-datatypes ((array!20823 0))(
  ( (array!20824 (arr!9887 (Array (_ BitVec 32) (_ BitVec 64))) (size!10240 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20823)

(declare-fun array_inv!7333 (array!20823) Bool)

(assert (=> start!36564 (array_inv!7333 _keys!658)))

(declare-fun mapIsEmpty!14208 () Bool)

(declare-fun mapRes!14208 () Bool)

(assert (=> mapIsEmpty!14208 mapRes!14208))

(declare-fun b!365009 () Bool)

(assert (=> b!365009 (= e!223479 (and (bvsle #b00000000000000000000000000000000 (size!10240 _keys!658)) (bvsge (size!10240 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365010 () Bool)

(declare-fun res!204107 () Bool)

(assert (=> b!365010 (=> (not res!204107) (not e!223479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20823 (_ BitVec 32)) Bool)

(assert (=> b!365010 (= res!204107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365011 () Bool)

(declare-fun e!223476 () Bool)

(declare-fun tp_is_empty!8443 () Bool)

(assert (=> b!365011 (= e!223476 tp_is_empty!8443)))

(declare-fun b!365012 () Bool)

(declare-fun res!204108 () Bool)

(assert (=> b!365012 (=> (not res!204108) (not e!223479))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365012 (= res!204108 (and (= (size!10239 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10240 _keys!658) (size!10239 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14208 () Bool)

(declare-fun tp!28284 () Bool)

(assert (=> mapNonEmpty!14208 (= mapRes!14208 (and tp!28284 e!223476))))

(declare-fun mapValue!14208 () ValueCell!3878)

(declare-fun mapRest!14208 () (Array (_ BitVec 32) ValueCell!3878))

(declare-fun mapKey!14208 () (_ BitVec 32))

(assert (=> mapNonEmpty!14208 (= (arr!9886 _values!506) (store mapRest!14208 mapKey!14208 mapValue!14208))))

(declare-fun b!365013 () Bool)

(declare-fun e!223477 () Bool)

(assert (=> b!365013 (= e!223477 tp_is_empty!8443)))

(declare-fun b!365014 () Bool)

(assert (=> b!365014 (= e!223480 (and e!223477 mapRes!14208))))

(declare-fun condMapEmpty!14208 () Bool)

(declare-fun mapDefault!14208 () ValueCell!3878)

(assert (=> b!365014 (= condMapEmpty!14208 (= (arr!9886 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3878)) mapDefault!14208)))))

(assert (= (and start!36564 res!204109) b!365012))

(assert (= (and b!365012 res!204108) b!365010))

(assert (= (and b!365010 res!204107) b!365009))

(assert (= (and b!365014 condMapEmpty!14208) mapIsEmpty!14208))

(assert (= (and b!365014 (not condMapEmpty!14208)) mapNonEmpty!14208))

(get-info :version)

(assert (= (and mapNonEmpty!14208 ((_ is ValueCellFull!3878) mapValue!14208)) b!365011))

(assert (= (and b!365014 ((_ is ValueCellFull!3878) mapDefault!14208)) b!365013))

(assert (= start!36564 b!365014))

(declare-fun m!362333 () Bool)

(assert (=> start!36564 m!362333))

(declare-fun m!362335 () Bool)

(assert (=> start!36564 m!362335))

(declare-fun m!362337 () Bool)

(assert (=> start!36564 m!362337))

(declare-fun m!362339 () Bool)

(assert (=> b!365010 m!362339))

(declare-fun m!362341 () Bool)

(assert (=> mapNonEmpty!14208 m!362341))

(check-sat (not start!36564) (not b!365010) (not mapNonEmpty!14208) tp_is_empty!8443)
(check-sat)
(get-model)

(declare-fun d!72117 () Bool)

(assert (=> d!72117 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36564 d!72117))

(declare-fun d!72119 () Bool)

(assert (=> d!72119 (= (array_inv!7332 _values!506) (bvsge (size!10239 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36564 d!72119))

(declare-fun d!72121 () Bool)

(assert (=> d!72121 (= (array_inv!7333 _keys!658) (bvsge (size!10240 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36564 d!72121))

(declare-fun bm!27247 () Bool)

(declare-fun call!27250 () Bool)

(assert (=> bm!27247 (= call!27250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365059 () Bool)

(declare-fun e!223518 () Bool)

(assert (=> b!365059 (= e!223518 call!27250)))

(declare-fun b!365060 () Bool)

(declare-fun e!223517 () Bool)

(declare-fun e!223519 () Bool)

(assert (=> b!365060 (= e!223517 e!223519)))

(declare-fun c!53820 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365060 (= c!53820 (validKeyInArray!0 (select (arr!9887 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365061 () Bool)

(assert (=> b!365061 (= e!223519 call!27250)))

(declare-fun b!365062 () Bool)

(assert (=> b!365062 (= e!223519 e!223518)))

(declare-fun lt!168930 () (_ BitVec 64))

(assert (=> b!365062 (= lt!168930 (select (arr!9887 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11362 0))(
  ( (Unit!11363) )
))
(declare-fun lt!168929 () Unit!11362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20823 (_ BitVec 64) (_ BitVec 32)) Unit!11362)

(assert (=> b!365062 (= lt!168929 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!168930 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365062 (arrayContainsKey!0 _keys!658 lt!168930 #b00000000000000000000000000000000)))

(declare-fun lt!168931 () Unit!11362)

(assert (=> b!365062 (= lt!168931 lt!168929)))

(declare-fun res!204133 () Bool)

(declare-datatypes ((SeekEntryResult!3496 0))(
  ( (MissingZero!3496 (index!16163 (_ BitVec 32))) (Found!3496 (index!16164 (_ BitVec 32))) (Intermediate!3496 (undefined!4308 Bool) (index!16165 (_ BitVec 32)) (x!36629 (_ BitVec 32))) (Undefined!3496) (MissingVacant!3496 (index!16166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20823 (_ BitVec 32)) SeekEntryResult!3496)

(assert (=> b!365062 (= res!204133 (= (seekEntryOrOpen!0 (select (arr!9887 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3496 #b00000000000000000000000000000000)))))

(assert (=> b!365062 (=> (not res!204133) (not e!223518))))

(declare-fun d!72123 () Bool)

(declare-fun res!204132 () Bool)

(assert (=> d!72123 (=> res!204132 e!223517)))

(assert (=> d!72123 (= res!204132 (bvsge #b00000000000000000000000000000000 (size!10240 _keys!658)))))

(assert (=> d!72123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223517)))

(assert (= (and d!72123 (not res!204132)) b!365060))

(assert (= (and b!365060 c!53820) b!365062))

(assert (= (and b!365060 (not c!53820)) b!365061))

(assert (= (and b!365062 res!204133) b!365059))

(assert (= (or b!365059 b!365061) bm!27247))

(declare-fun m!362363 () Bool)

(assert (=> bm!27247 m!362363))

(declare-fun m!362365 () Bool)

(assert (=> b!365060 m!362365))

(assert (=> b!365060 m!362365))

(declare-fun m!362367 () Bool)

(assert (=> b!365060 m!362367))

(assert (=> b!365062 m!362365))

(declare-fun m!362369 () Bool)

(assert (=> b!365062 m!362369))

(declare-fun m!362371 () Bool)

(assert (=> b!365062 m!362371))

(assert (=> b!365062 m!362365))

(declare-fun m!362373 () Bool)

(assert (=> b!365062 m!362373))

(assert (=> b!365010 d!72123))

(declare-fun condMapEmpty!14217 () Bool)

(declare-fun mapDefault!14217 () ValueCell!3878)

(assert (=> mapNonEmpty!14208 (= condMapEmpty!14217 (= mapRest!14208 ((as const (Array (_ BitVec 32) ValueCell!3878)) mapDefault!14217)))))

(declare-fun e!223524 () Bool)

(declare-fun mapRes!14217 () Bool)

(assert (=> mapNonEmpty!14208 (= tp!28284 (and e!223524 mapRes!14217))))

(declare-fun mapIsEmpty!14217 () Bool)

(assert (=> mapIsEmpty!14217 mapRes!14217))

(declare-fun b!365070 () Bool)

(assert (=> b!365070 (= e!223524 tp_is_empty!8443)))

(declare-fun b!365069 () Bool)

(declare-fun e!223525 () Bool)

(assert (=> b!365069 (= e!223525 tp_is_empty!8443)))

(declare-fun mapNonEmpty!14217 () Bool)

(declare-fun tp!28293 () Bool)

(assert (=> mapNonEmpty!14217 (= mapRes!14217 (and tp!28293 e!223525))))

(declare-fun mapKey!14217 () (_ BitVec 32))

(declare-fun mapRest!14217 () (Array (_ BitVec 32) ValueCell!3878))

(declare-fun mapValue!14217 () ValueCell!3878)

(assert (=> mapNonEmpty!14217 (= mapRest!14208 (store mapRest!14217 mapKey!14217 mapValue!14217))))

(assert (= (and mapNonEmpty!14208 condMapEmpty!14217) mapIsEmpty!14217))

(assert (= (and mapNonEmpty!14208 (not condMapEmpty!14217)) mapNonEmpty!14217))

(assert (= (and mapNonEmpty!14217 ((_ is ValueCellFull!3878) mapValue!14217)) b!365069))

(assert (= (and mapNonEmpty!14208 ((_ is ValueCellFull!3878) mapDefault!14217)) b!365070))

(declare-fun m!362375 () Bool)

(assert (=> mapNonEmpty!14217 m!362375))

(check-sat (not b!365062) tp_is_empty!8443 (not bm!27247) (not mapNonEmpty!14217) (not b!365060))
(check-sat)
