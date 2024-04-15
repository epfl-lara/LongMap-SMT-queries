; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36578 () Bool)

(assert start!36578)

(declare-fun b!365085 () Bool)

(declare-fun res!204145 () Bool)

(declare-fun e!223540 () Bool)

(assert (=> b!365085 (=> (not res!204145) (not e!223540))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12371 0))(
  ( (V!12372 (val!4269 Int)) )
))
(declare-datatypes ((ValueCell!3881 0))(
  ( (ValueCellFull!3881 (v!6458 V!12371)) (EmptyCell!3881) )
))
(declare-datatypes ((array!20835 0))(
  ( (array!20836 (arr!9892 (Array (_ BitVec 32) ValueCell!3881)) (size!10245 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20835)

(declare-datatypes ((array!20837 0))(
  ( (array!20838 (arr!9893 (Array (_ BitVec 32) (_ BitVec 64))) (size!10246 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20837)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365085 (= res!204145 (and (= (size!10245 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10246 _keys!658) (size!10245 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14220 () Bool)

(declare-fun mapRes!14220 () Bool)

(assert (=> mapIsEmpty!14220 mapRes!14220))

(declare-fun mapNonEmpty!14220 () Bool)

(declare-fun tp!28296 () Bool)

(declare-fun e!223539 () Bool)

(assert (=> mapNonEmpty!14220 (= mapRes!14220 (and tp!28296 e!223539))))

(declare-fun mapRest!14220 () (Array (_ BitVec 32) ValueCell!3881))

(declare-fun mapValue!14220 () ValueCell!3881)

(declare-fun mapKey!14220 () (_ BitVec 32))

(assert (=> mapNonEmpty!14220 (= (arr!9892 _values!506) (store mapRest!14220 mapKey!14220 mapValue!14220))))

(declare-fun b!365086 () Bool)

(declare-fun res!204143 () Bool)

(assert (=> b!365086 (=> (not res!204143) (not e!223540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20837 (_ BitVec 32)) Bool)

(assert (=> b!365086 (= res!204143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365087 () Bool)

(declare-fun e!223538 () Bool)

(declare-fun e!223536 () Bool)

(assert (=> b!365087 (= e!223538 (and e!223536 mapRes!14220))))

(declare-fun condMapEmpty!14220 () Bool)

(declare-fun mapDefault!14220 () ValueCell!3881)

(assert (=> b!365087 (= condMapEmpty!14220 (= (arr!9892 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3881)) mapDefault!14220)))))

(declare-fun b!365088 () Bool)

(declare-fun tp_is_empty!8449 () Bool)

(assert (=> b!365088 (= e!223536 tp_is_empty!8449)))

(declare-fun b!365089 () Bool)

(assert (=> b!365089 (= e!223539 tp_is_empty!8449)))

(declare-fun res!204142 () Bool)

(assert (=> start!36578 (=> (not res!204142) (not e!223540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36578 (= res!204142 (validMask!0 mask!970))))

(assert (=> start!36578 e!223540))

(assert (=> start!36578 true))

(declare-fun array_inv!7334 (array!20835) Bool)

(assert (=> start!36578 (and (array_inv!7334 _values!506) e!223538)))

(declare-fun array_inv!7335 (array!20837) Bool)

(assert (=> start!36578 (array_inv!7335 _keys!658)))

(declare-fun b!365090 () Bool)

(declare-fun res!204144 () Bool)

(assert (=> b!365090 (=> (not res!204144) (not e!223540))))

(assert (=> b!365090 (= res!204144 (and (bvsle #b00000000000000000000000000000000 (size!10246 _keys!658)) (bvslt (size!10246 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365091 () Bool)

(declare-datatypes ((List!5490 0))(
  ( (Nil!5487) (Cons!5486 (h!6342 (_ BitVec 64)) (t!10631 List!5490)) )
))
(declare-fun noDuplicate!186 (List!5490) Bool)

(assert (=> b!365091 (= e!223540 (not (noDuplicate!186 Nil!5487)))))

(assert (= (and start!36578 res!204142) b!365085))

(assert (= (and b!365085 res!204145) b!365086))

(assert (= (and b!365086 res!204143) b!365090))

(assert (= (and b!365090 res!204144) b!365091))

(assert (= (and b!365087 condMapEmpty!14220) mapIsEmpty!14220))

(assert (= (and b!365087 (not condMapEmpty!14220)) mapNonEmpty!14220))

(get-info :version)

(assert (= (and mapNonEmpty!14220 ((_ is ValueCellFull!3881) mapValue!14220)) b!365089))

(assert (= (and b!365087 ((_ is ValueCellFull!3881) mapDefault!14220)) b!365088))

(assert (= start!36578 b!365087))

(declare-fun m!362377 () Bool)

(assert (=> mapNonEmpty!14220 m!362377))

(declare-fun m!362379 () Bool)

(assert (=> b!365086 m!362379))

(declare-fun m!362381 () Bool)

(assert (=> start!36578 m!362381))

(declare-fun m!362383 () Bool)

(assert (=> start!36578 m!362383))

(declare-fun m!362385 () Bool)

(assert (=> start!36578 m!362385))

(declare-fun m!362387 () Bool)

(assert (=> b!365091 m!362387))

(check-sat (not b!365086) (not b!365091) tp_is_empty!8449 (not start!36578) (not mapNonEmpty!14220))
(check-sat)
(get-model)

(declare-fun b!365142 () Bool)

(declare-fun e!223578 () Bool)

(declare-fun call!27253 () Bool)

(assert (=> b!365142 (= e!223578 call!27253)))

(declare-fun b!365143 () Bool)

(declare-fun e!223577 () Bool)

(assert (=> b!365143 (= e!223577 call!27253)))

(declare-fun bm!27250 () Bool)

(assert (=> bm!27250 (= call!27253 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365144 () Bool)

(assert (=> b!365144 (= e!223577 e!223578)))

(declare-fun lt!168938 () (_ BitVec 64))

(assert (=> b!365144 (= lt!168938 (select (arr!9893 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11364 0))(
  ( (Unit!11365) )
))
(declare-fun lt!168940 () Unit!11364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20837 (_ BitVec 64) (_ BitVec 32)) Unit!11364)

(assert (=> b!365144 (= lt!168940 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!168938 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365144 (arrayContainsKey!0 _keys!658 lt!168938 #b00000000000000000000000000000000)))

(declare-fun lt!168939 () Unit!11364)

(assert (=> b!365144 (= lt!168939 lt!168940)))

(declare-fun res!204174 () Bool)

(declare-datatypes ((SeekEntryResult!3497 0))(
  ( (MissingZero!3497 (index!16167 (_ BitVec 32))) (Found!3497 (index!16168 (_ BitVec 32))) (Intermediate!3497 (undefined!4309 Bool) (index!16169 (_ BitVec 32)) (x!36640 (_ BitVec 32))) (Undefined!3497) (MissingVacant!3497 (index!16170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20837 (_ BitVec 32)) SeekEntryResult!3497)

(assert (=> b!365144 (= res!204174 (= (seekEntryOrOpen!0 (select (arr!9893 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3497 #b00000000000000000000000000000000)))))

(assert (=> b!365144 (=> (not res!204174) (not e!223578))))

(declare-fun b!365145 () Bool)

(declare-fun e!223579 () Bool)

(assert (=> b!365145 (= e!223579 e!223577)))

(declare-fun c!53823 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365145 (= c!53823 (validKeyInArray!0 (select (arr!9893 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72127 () Bool)

(declare-fun res!204175 () Bool)

(assert (=> d!72127 (=> res!204175 e!223579)))

(assert (=> d!72127 (= res!204175 (bvsge #b00000000000000000000000000000000 (size!10246 _keys!658)))))

(assert (=> d!72127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223579)))

(assert (= (and d!72127 (not res!204175)) b!365145))

(assert (= (and b!365145 c!53823) b!365144))

(assert (= (and b!365145 (not c!53823)) b!365143))

(assert (= (and b!365144 res!204174) b!365142))

(assert (= (or b!365142 b!365143) bm!27250))

(declare-fun m!362413 () Bool)

(assert (=> bm!27250 m!362413))

(declare-fun m!362415 () Bool)

(assert (=> b!365144 m!362415))

(declare-fun m!362417 () Bool)

(assert (=> b!365144 m!362417))

(declare-fun m!362419 () Bool)

(assert (=> b!365144 m!362419))

(assert (=> b!365144 m!362415))

(declare-fun m!362421 () Bool)

(assert (=> b!365144 m!362421))

(assert (=> b!365145 m!362415))

(assert (=> b!365145 m!362415))

(declare-fun m!362423 () Bool)

(assert (=> b!365145 m!362423))

(assert (=> b!365086 d!72127))

(declare-fun d!72129 () Bool)

(declare-fun res!204180 () Bool)

(declare-fun e!223584 () Bool)

(assert (=> d!72129 (=> res!204180 e!223584)))

(assert (=> d!72129 (= res!204180 ((_ is Nil!5487) Nil!5487))))

(assert (=> d!72129 (= (noDuplicate!186 Nil!5487) e!223584)))

(declare-fun b!365150 () Bool)

(declare-fun e!223585 () Bool)

(assert (=> b!365150 (= e!223584 e!223585)))

(declare-fun res!204181 () Bool)

(assert (=> b!365150 (=> (not res!204181) (not e!223585))))

(declare-fun contains!2420 (List!5490 (_ BitVec 64)) Bool)

(assert (=> b!365150 (= res!204181 (not (contains!2420 (t!10631 Nil!5487) (h!6342 Nil!5487))))))

(declare-fun b!365151 () Bool)

(assert (=> b!365151 (= e!223585 (noDuplicate!186 (t!10631 Nil!5487)))))

(assert (= (and d!72129 (not res!204180)) b!365150))

(assert (= (and b!365150 res!204181) b!365151))

(declare-fun m!362425 () Bool)

(assert (=> b!365150 m!362425))

(declare-fun m!362427 () Bool)

(assert (=> b!365151 m!362427))

(assert (=> b!365091 d!72129))

(declare-fun d!72131 () Bool)

(assert (=> d!72131 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36578 d!72131))

(declare-fun d!72133 () Bool)

(assert (=> d!72133 (= (array_inv!7334 _values!506) (bvsge (size!10245 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36578 d!72133))

(declare-fun d!72135 () Bool)

(assert (=> d!72135 (= (array_inv!7335 _keys!658) (bvsge (size!10246 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36578 d!72135))

(declare-fun b!365159 () Bool)

(declare-fun e!223590 () Bool)

(assert (=> b!365159 (= e!223590 tp_is_empty!8449)))

(declare-fun mapNonEmpty!14229 () Bool)

(declare-fun mapRes!14229 () Bool)

(declare-fun tp!28305 () Bool)

(declare-fun e!223591 () Bool)

(assert (=> mapNonEmpty!14229 (= mapRes!14229 (and tp!28305 e!223591))))

(declare-fun mapRest!14229 () (Array (_ BitVec 32) ValueCell!3881))

(declare-fun mapValue!14229 () ValueCell!3881)

(declare-fun mapKey!14229 () (_ BitVec 32))

(assert (=> mapNonEmpty!14229 (= mapRest!14220 (store mapRest!14229 mapKey!14229 mapValue!14229))))

(declare-fun b!365158 () Bool)

(assert (=> b!365158 (= e!223591 tp_is_empty!8449)))

(declare-fun condMapEmpty!14229 () Bool)

(declare-fun mapDefault!14229 () ValueCell!3881)

(assert (=> mapNonEmpty!14220 (= condMapEmpty!14229 (= mapRest!14220 ((as const (Array (_ BitVec 32) ValueCell!3881)) mapDefault!14229)))))

(assert (=> mapNonEmpty!14220 (= tp!28296 (and e!223590 mapRes!14229))))

(declare-fun mapIsEmpty!14229 () Bool)

(assert (=> mapIsEmpty!14229 mapRes!14229))

(assert (= (and mapNonEmpty!14220 condMapEmpty!14229) mapIsEmpty!14229))

(assert (= (and mapNonEmpty!14220 (not condMapEmpty!14229)) mapNonEmpty!14229))

(assert (= (and mapNonEmpty!14229 ((_ is ValueCellFull!3881) mapValue!14229)) b!365158))

(assert (= (and mapNonEmpty!14220 ((_ is ValueCellFull!3881) mapDefault!14229)) b!365159))

(declare-fun m!362429 () Bool)

(assert (=> mapNonEmpty!14229 m!362429))

(check-sat (not b!365151) (not bm!27250) (not b!365144) (not b!365150) (not b!365145) tp_is_empty!8449 (not mapNonEmpty!14229))
(check-sat)
