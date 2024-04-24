; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36672 () Bool)

(assert start!36672)

(declare-fun b!366186 () Bool)

(declare-fun e!224214 () Bool)

(declare-fun e!224217 () Bool)

(declare-fun mapRes!14319 () Bool)

(assert (=> b!366186 (= e!224214 (and e!224217 mapRes!14319))))

(declare-fun condMapEmpty!14319 () Bool)

(declare-datatypes ((V!12451 0))(
  ( (V!12452 (val!4299 Int)) )
))
(declare-datatypes ((ValueCell!3911 0))(
  ( (ValueCellFull!3911 (v!6496 V!12451)) (EmptyCell!3911) )
))
(declare-datatypes ((array!20964 0))(
  ( (array!20965 (arr!9953 (Array (_ BitVec 32) ValueCell!3911)) (size!10305 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20964)

(declare-fun mapDefault!14319 () ValueCell!3911)

(assert (=> b!366186 (= condMapEmpty!14319 (= (arr!9953 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3911)) mapDefault!14319)))))

(declare-fun mapIsEmpty!14319 () Bool)

(assert (=> mapIsEmpty!14319 mapRes!14319))

(declare-fun mapNonEmpty!14319 () Bool)

(declare-fun tp!28395 () Bool)

(declare-fun e!224216 () Bool)

(assert (=> mapNonEmpty!14319 (= mapRes!14319 (and tp!28395 e!224216))))

(declare-fun mapValue!14319 () ValueCell!3911)

(declare-fun mapKey!14319 () (_ BitVec 32))

(declare-fun mapRest!14319 () (Array (_ BitVec 32) ValueCell!3911))

(assert (=> mapNonEmpty!14319 (= (arr!9953 _values!506) (store mapRest!14319 mapKey!14319 mapValue!14319))))

(declare-fun b!366187 () Bool)

(declare-fun res!204833 () Bool)

(declare-fun e!224218 () Bool)

(assert (=> b!366187 (=> (not res!204833) (not e!224218))))

(declare-datatypes ((array!20966 0))(
  ( (array!20967 (arr!9954 (Array (_ BitVec 32) (_ BitVec 64))) (size!10306 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20966)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20966 (_ BitVec 32)) Bool)

(assert (=> b!366187 (= res!204833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366188 () Bool)

(declare-fun res!204831 () Bool)

(assert (=> b!366188 (=> (not res!204831) (not e!224218))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366188 (= res!204831 (and (= (size!10305 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10306 _keys!658) (size!10305 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366189 () Bool)

(declare-fun res!204835 () Bool)

(assert (=> b!366189 (=> (not res!204835) (not e!224218))))

(declare-datatypes ((List!5454 0))(
  ( (Nil!5451) (Cons!5450 (h!6306 (_ BitVec 64)) (t!10596 List!5454)) )
))
(declare-fun arrayNoDuplicates!0 (array!20966 (_ BitVec 32) List!5454) Bool)

(assert (=> b!366189 (= res!204835 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5451))))

(declare-fun b!366190 () Bool)

(declare-fun tp_is_empty!8509 () Bool)

(assert (=> b!366190 (= e!224217 tp_is_empty!8509)))

(declare-fun b!366191 () Bool)

(declare-fun res!204830 () Bool)

(assert (=> b!366191 (=> (not res!204830) (not e!224218))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366191 (= res!204830 (validKeyInArray!0 k0!778))))

(declare-fun b!366193 () Bool)

(declare-fun res!204829 () Bool)

(assert (=> b!366193 (=> (not res!204829) (not e!224218))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366193 (= res!204829 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10306 _keys!658))))))

(declare-fun b!366194 () Bool)

(assert (=> b!366194 (= e!224218 (and (bvsle #b00000000000000000000000000000000 (size!10306 _keys!658)) (bvsge (size!10306 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!366195 () Bool)

(assert (=> b!366195 (= e!224216 tp_is_empty!8509)))

(declare-fun b!366196 () Bool)

(declare-fun res!204837 () Bool)

(assert (=> b!366196 (=> (not res!204837) (not e!224218))))

(declare-fun arrayContainsKey!0 (array!20966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366196 (= res!204837 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366197 () Bool)

(declare-fun res!204836 () Bool)

(assert (=> b!366197 (=> (not res!204836) (not e!224218))))

(assert (=> b!366197 (= res!204836 (or (= (select (arr!9954 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9954 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!204832 () Bool)

(assert (=> start!36672 (=> (not res!204832) (not e!224218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36672 (= res!204832 (validMask!0 mask!970))))

(assert (=> start!36672 e!224218))

(assert (=> start!36672 true))

(declare-fun array_inv!7402 (array!20964) Bool)

(assert (=> start!36672 (and (array_inv!7402 _values!506) e!224214)))

(declare-fun array_inv!7403 (array!20966) Bool)

(assert (=> start!36672 (array_inv!7403 _keys!658)))

(declare-fun b!366192 () Bool)

(declare-fun res!204834 () Bool)

(assert (=> b!366192 (=> (not res!204834) (not e!224218))))

(assert (=> b!366192 (= res!204834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)) mask!970))))

(assert (= (and start!36672 res!204832) b!366188))

(assert (= (and b!366188 res!204831) b!366187))

(assert (= (and b!366187 res!204833) b!366189))

(assert (= (and b!366189 res!204835) b!366193))

(assert (= (and b!366193 res!204829) b!366191))

(assert (= (and b!366191 res!204830) b!366197))

(assert (= (and b!366197 res!204836) b!366196))

(assert (= (and b!366196 res!204837) b!366192))

(assert (= (and b!366192 res!204834) b!366194))

(assert (= (and b!366186 condMapEmpty!14319) mapIsEmpty!14319))

(assert (= (and b!366186 (not condMapEmpty!14319)) mapNonEmpty!14319))

(get-info :version)

(assert (= (and mapNonEmpty!14319 ((_ is ValueCellFull!3911) mapValue!14319)) b!366195))

(assert (= (and b!366186 ((_ is ValueCellFull!3911) mapDefault!14319)) b!366190))

(assert (= start!36672 b!366186))

(declare-fun m!363857 () Bool)

(assert (=> b!366187 m!363857))

(declare-fun m!363859 () Bool)

(assert (=> start!36672 m!363859))

(declare-fun m!363861 () Bool)

(assert (=> start!36672 m!363861))

(declare-fun m!363863 () Bool)

(assert (=> start!36672 m!363863))

(declare-fun m!363865 () Bool)

(assert (=> mapNonEmpty!14319 m!363865))

(declare-fun m!363867 () Bool)

(assert (=> b!366196 m!363867))

(declare-fun m!363869 () Bool)

(assert (=> b!366189 m!363869))

(declare-fun m!363871 () Bool)

(assert (=> b!366197 m!363871))

(declare-fun m!363873 () Bool)

(assert (=> b!366191 m!363873))

(declare-fun m!363875 () Bool)

(assert (=> b!366192 m!363875))

(declare-fun m!363877 () Bool)

(assert (=> b!366192 m!363877))

(check-sat (not mapNonEmpty!14319) (not b!366192) (not b!366191) (not b!366187) tp_is_empty!8509 (not b!366196) (not start!36672) (not b!366189))
(check-sat)
(get-model)

(declare-fun b!366278 () Bool)

(declare-fun e!224255 () Bool)

(declare-fun e!224257 () Bool)

(assert (=> b!366278 (= e!224255 e!224257)))

(declare-fun c!53883 () Bool)

(assert (=> b!366278 (= c!53883 (validKeyInArray!0 (select (arr!9954 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun b!366279 () Bool)

(declare-fun call!27277 () Bool)

(assert (=> b!366279 (= e!224257 call!27277)))

(declare-fun b!366280 () Bool)

(declare-fun e!224256 () Bool)

(assert (=> b!366280 (= e!224257 e!224256)))

(declare-fun lt!169250 () (_ BitVec 64))

(assert (=> b!366280 (= lt!169250 (select (arr!9954 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11381 0))(
  ( (Unit!11382) )
))
(declare-fun lt!169251 () Unit!11381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20966 (_ BitVec 64) (_ BitVec 32)) Unit!11381)

(assert (=> b!366280 (= lt!169251 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)) lt!169250 #b00000000000000000000000000000000))))

(assert (=> b!366280 (arrayContainsKey!0 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)) lt!169250 #b00000000000000000000000000000000)))

(declare-fun lt!169249 () Unit!11381)

(assert (=> b!366280 (= lt!169249 lt!169251)))

(declare-fun res!204896 () Bool)

(declare-datatypes ((SeekEntryResult!3454 0))(
  ( (MissingZero!3454 (index!15995 (_ BitVec 32))) (Found!3454 (index!15996 (_ BitVec 32))) (Intermediate!3454 (undefined!4266 Bool) (index!15997 (_ BitVec 32)) (x!36685 (_ BitVec 32))) (Undefined!3454) (MissingVacant!3454 (index!15998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20966 (_ BitVec 32)) SeekEntryResult!3454)

(assert (=> b!366280 (= res!204896 (= (seekEntryOrOpen!0 (select (arr!9954 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658))) #b00000000000000000000000000000000) (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)) mask!970) (Found!3454 #b00000000000000000000000000000000)))))

(assert (=> b!366280 (=> (not res!204896) (not e!224256))))

(declare-fun bm!27274 () Bool)

(assert (=> bm!27274 (= call!27277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)) mask!970))))

(declare-fun d!72417 () Bool)

(declare-fun res!204897 () Bool)

(assert (=> d!72417 (=> res!204897 e!224255)))

(assert (=> d!72417 (= res!204897 (bvsge #b00000000000000000000000000000000 (size!10306 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)))))))

(assert (=> d!72417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20967 (store (arr!9954 _keys!658) i!548 k0!778) (size!10306 _keys!658)) mask!970) e!224255)))

(declare-fun b!366281 () Bool)

(assert (=> b!366281 (= e!224256 call!27277)))

(assert (= (and d!72417 (not res!204897)) b!366278))

(assert (= (and b!366278 c!53883) b!366280))

(assert (= (and b!366278 (not c!53883)) b!366279))

(assert (= (and b!366280 res!204896) b!366281))

(assert (= (or b!366281 b!366279) bm!27274))

(declare-fun m!363923 () Bool)

(assert (=> b!366278 m!363923))

(assert (=> b!366278 m!363923))

(declare-fun m!363925 () Bool)

(assert (=> b!366278 m!363925))

(assert (=> b!366280 m!363923))

(declare-fun m!363927 () Bool)

(assert (=> b!366280 m!363927))

(declare-fun m!363929 () Bool)

(assert (=> b!366280 m!363929))

(assert (=> b!366280 m!363923))

(declare-fun m!363931 () Bool)

(assert (=> b!366280 m!363931))

(declare-fun m!363933 () Bool)

(assert (=> bm!27274 m!363933))

(assert (=> b!366192 d!72417))

(declare-fun b!366282 () Bool)

(declare-fun e!224258 () Bool)

(declare-fun e!224260 () Bool)

(assert (=> b!366282 (= e!224258 e!224260)))

(declare-fun c!53884 () Bool)

(assert (=> b!366282 (= c!53884 (validKeyInArray!0 (select (arr!9954 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366283 () Bool)

(declare-fun call!27278 () Bool)

(assert (=> b!366283 (= e!224260 call!27278)))

(declare-fun b!366284 () Bool)

(declare-fun e!224259 () Bool)

(assert (=> b!366284 (= e!224260 e!224259)))

(declare-fun lt!169253 () (_ BitVec 64))

(assert (=> b!366284 (= lt!169253 (select (arr!9954 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!169254 () Unit!11381)

(assert (=> b!366284 (= lt!169254 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169253 #b00000000000000000000000000000000))))

(assert (=> b!366284 (arrayContainsKey!0 _keys!658 lt!169253 #b00000000000000000000000000000000)))

(declare-fun lt!169252 () Unit!11381)

(assert (=> b!366284 (= lt!169252 lt!169254)))

(declare-fun res!204898 () Bool)

(assert (=> b!366284 (= res!204898 (= (seekEntryOrOpen!0 (select (arr!9954 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3454 #b00000000000000000000000000000000)))))

(assert (=> b!366284 (=> (not res!204898) (not e!224259))))

(declare-fun bm!27275 () Bool)

(assert (=> bm!27275 (= call!27278 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72419 () Bool)

(declare-fun res!204899 () Bool)

(assert (=> d!72419 (=> res!204899 e!224258)))

(assert (=> d!72419 (= res!204899 (bvsge #b00000000000000000000000000000000 (size!10306 _keys!658)))))

(assert (=> d!72419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224258)))

(declare-fun b!366285 () Bool)

(assert (=> b!366285 (= e!224259 call!27278)))

(assert (= (and d!72419 (not res!204899)) b!366282))

(assert (= (and b!366282 c!53884) b!366284))

(assert (= (and b!366282 (not c!53884)) b!366283))

(assert (= (and b!366284 res!204898) b!366285))

(assert (= (or b!366285 b!366283) bm!27275))

(declare-fun m!363935 () Bool)

(assert (=> b!366282 m!363935))

(assert (=> b!366282 m!363935))

(declare-fun m!363937 () Bool)

(assert (=> b!366282 m!363937))

(assert (=> b!366284 m!363935))

(declare-fun m!363939 () Bool)

(assert (=> b!366284 m!363939))

(declare-fun m!363941 () Bool)

(assert (=> b!366284 m!363941))

(assert (=> b!366284 m!363935))

(declare-fun m!363943 () Bool)

(assert (=> b!366284 m!363943))

(declare-fun m!363945 () Bool)

(assert (=> bm!27275 m!363945))

(assert (=> b!366187 d!72419))

(declare-fun bm!27278 () Bool)

(declare-fun call!27281 () Bool)

(declare-fun c!53887 () Bool)

(assert (=> bm!27278 (= call!27281 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53887 (Cons!5450 (select (arr!9954 _keys!658) #b00000000000000000000000000000000) Nil!5451) Nil!5451)))))

(declare-fun d!72421 () Bool)

(declare-fun res!204906 () Bool)

(declare-fun e!224270 () Bool)

(assert (=> d!72421 (=> res!204906 e!224270)))

(assert (=> d!72421 (= res!204906 (bvsge #b00000000000000000000000000000000 (size!10306 _keys!658)))))

(assert (=> d!72421 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5451) e!224270)))

(declare-fun b!366296 () Bool)

(declare-fun e!224272 () Bool)

(assert (=> b!366296 (= e!224272 call!27281)))

(declare-fun b!366297 () Bool)

(assert (=> b!366297 (= e!224272 call!27281)))

(declare-fun b!366298 () Bool)

(declare-fun e!224271 () Bool)

(declare-fun contains!2416 (List!5454 (_ BitVec 64)) Bool)

(assert (=> b!366298 (= e!224271 (contains!2416 Nil!5451 (select (arr!9954 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366299 () Bool)

(declare-fun e!224269 () Bool)

(assert (=> b!366299 (= e!224269 e!224272)))

(assert (=> b!366299 (= c!53887 (validKeyInArray!0 (select (arr!9954 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366300 () Bool)

(assert (=> b!366300 (= e!224270 e!224269)))

(declare-fun res!204907 () Bool)

(assert (=> b!366300 (=> (not res!204907) (not e!224269))))

(assert (=> b!366300 (= res!204907 (not e!224271))))

(declare-fun res!204908 () Bool)

(assert (=> b!366300 (=> (not res!204908) (not e!224271))))

(assert (=> b!366300 (= res!204908 (validKeyInArray!0 (select (arr!9954 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72421 (not res!204906)) b!366300))

(assert (= (and b!366300 res!204908) b!366298))

(assert (= (and b!366300 res!204907) b!366299))

(assert (= (and b!366299 c!53887) b!366297))

(assert (= (and b!366299 (not c!53887)) b!366296))

(assert (= (or b!366297 b!366296) bm!27278))

(assert (=> bm!27278 m!363935))

(declare-fun m!363947 () Bool)

(assert (=> bm!27278 m!363947))

(assert (=> b!366298 m!363935))

(assert (=> b!366298 m!363935))

(declare-fun m!363949 () Bool)

(assert (=> b!366298 m!363949))

(assert (=> b!366299 m!363935))

(assert (=> b!366299 m!363935))

(assert (=> b!366299 m!363937))

(assert (=> b!366300 m!363935))

(assert (=> b!366300 m!363935))

(assert (=> b!366300 m!363937))

(assert (=> b!366189 d!72421))

(declare-fun d!72423 () Bool)

(assert (=> d!72423 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36672 d!72423))

(declare-fun d!72425 () Bool)

(assert (=> d!72425 (= (array_inv!7402 _values!506) (bvsge (size!10305 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36672 d!72425))

(declare-fun d!72427 () Bool)

(assert (=> d!72427 (= (array_inv!7403 _keys!658) (bvsge (size!10306 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36672 d!72427))

(declare-fun d!72429 () Bool)

(declare-fun res!204913 () Bool)

(declare-fun e!224277 () Bool)

(assert (=> d!72429 (=> res!204913 e!224277)))

(assert (=> d!72429 (= res!204913 (= (select (arr!9954 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72429 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224277)))

(declare-fun b!366305 () Bool)

(declare-fun e!224278 () Bool)

(assert (=> b!366305 (= e!224277 e!224278)))

(declare-fun res!204914 () Bool)

(assert (=> b!366305 (=> (not res!204914) (not e!224278))))

(assert (=> b!366305 (= res!204914 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10306 _keys!658)))))

(declare-fun b!366306 () Bool)

(assert (=> b!366306 (= e!224278 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72429 (not res!204913)) b!366305))

(assert (= (and b!366305 res!204914) b!366306))

(assert (=> d!72429 m!363935))

(declare-fun m!363951 () Bool)

(assert (=> b!366306 m!363951))

(assert (=> b!366196 d!72429))

(declare-fun d!72431 () Bool)

(assert (=> d!72431 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366191 d!72431))

(declare-fun mapNonEmpty!14328 () Bool)

(declare-fun mapRes!14328 () Bool)

(declare-fun tp!28404 () Bool)

(declare-fun e!224284 () Bool)

(assert (=> mapNonEmpty!14328 (= mapRes!14328 (and tp!28404 e!224284))))

(declare-fun mapKey!14328 () (_ BitVec 32))

(declare-fun mapRest!14328 () (Array (_ BitVec 32) ValueCell!3911))

(declare-fun mapValue!14328 () ValueCell!3911)

(assert (=> mapNonEmpty!14328 (= mapRest!14319 (store mapRest!14328 mapKey!14328 mapValue!14328))))

(declare-fun condMapEmpty!14328 () Bool)

(declare-fun mapDefault!14328 () ValueCell!3911)

(assert (=> mapNonEmpty!14319 (= condMapEmpty!14328 (= mapRest!14319 ((as const (Array (_ BitVec 32) ValueCell!3911)) mapDefault!14328)))))

(declare-fun e!224283 () Bool)

(assert (=> mapNonEmpty!14319 (= tp!28395 (and e!224283 mapRes!14328))))

(declare-fun mapIsEmpty!14328 () Bool)

(assert (=> mapIsEmpty!14328 mapRes!14328))

(declare-fun b!366314 () Bool)

(assert (=> b!366314 (= e!224283 tp_is_empty!8509)))

(declare-fun b!366313 () Bool)

(assert (=> b!366313 (= e!224284 tp_is_empty!8509)))

(assert (= (and mapNonEmpty!14319 condMapEmpty!14328) mapIsEmpty!14328))

(assert (= (and mapNonEmpty!14319 (not condMapEmpty!14328)) mapNonEmpty!14328))

(assert (= (and mapNonEmpty!14328 ((_ is ValueCellFull!3911) mapValue!14328)) b!366313))

(assert (= (and mapNonEmpty!14319 ((_ is ValueCellFull!3911) mapDefault!14328)) b!366314))

(declare-fun m!363953 () Bool)

(assert (=> mapNonEmpty!14328 m!363953))

(check-sat (not b!366278) tp_is_empty!8509 (not b!366280) (not bm!27278) (not bm!27275) (not b!366300) (not b!366299) (not bm!27274) (not b!366282) (not b!366306) (not b!366284) (not mapNonEmpty!14328) (not b!366298))
(check-sat)
