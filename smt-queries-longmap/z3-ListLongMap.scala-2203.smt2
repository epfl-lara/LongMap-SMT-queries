; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36610 () Bool)

(assert start!36610)

(declare-fun mapIsEmpty!14235 () Bool)

(declare-fun mapRes!14235 () Bool)

(assert (=> mapIsEmpty!14235 mapRes!14235))

(declare-fun b!365476 () Bool)

(declare-fun res!204342 () Bool)

(declare-fun e!223800 () Bool)

(assert (=> b!365476 (=> (not res!204342) (not e!223800))))

(declare-datatypes ((array!20871 0))(
  ( (array!20872 (arr!9909 (Array (_ BitVec 32) (_ BitVec 64))) (size!10261 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20871)

(assert (=> b!365476 (= res!204342 (and (bvsle #b00000000000000000000000000000000 (size!10261 _keys!658)) (bvslt (size!10261 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365477 () Bool)

(declare-fun res!204341 () Bool)

(assert (=> b!365477 (=> (not res!204341) (not e!223800))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20871 (_ BitVec 32)) Bool)

(assert (=> b!365477 (= res!204341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365478 () Bool)

(declare-fun e!223798 () Bool)

(assert (=> b!365478 (= e!223800 e!223798)))

(declare-fun res!204346 () Bool)

(assert (=> b!365478 (=> res!204346 e!223798)))

(declare-datatypes ((List!5526 0))(
  ( (Nil!5523) (Cons!5522 (h!6378 (_ BitVec 64)) (t!10676 List!5526)) )
))
(declare-fun contains!2432 (List!5526 (_ BitVec 64)) Bool)

(assert (=> b!365478 (= res!204346 (contains!2432 Nil!5523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365479 () Bool)

(declare-fun res!204345 () Bool)

(assert (=> b!365479 (=> (not res!204345) (not e!223800))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12381 0))(
  ( (V!12382 (val!4273 Int)) )
))
(declare-datatypes ((ValueCell!3885 0))(
  ( (ValueCellFull!3885 (v!6468 V!12381)) (EmptyCell!3885) )
))
(declare-datatypes ((array!20873 0))(
  ( (array!20874 (arr!9910 (Array (_ BitVec 32) ValueCell!3885)) (size!10262 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20873)

(assert (=> b!365479 (= res!204345 (and (= (size!10262 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10261 _keys!658) (size!10262 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365480 () Bool)

(declare-fun e!223796 () Bool)

(declare-fun e!223801 () Bool)

(assert (=> b!365480 (= e!223796 (and e!223801 mapRes!14235))))

(declare-fun condMapEmpty!14235 () Bool)

(declare-fun mapDefault!14235 () ValueCell!3885)

(assert (=> b!365480 (= condMapEmpty!14235 (= (arr!9910 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3885)) mapDefault!14235)))))

(declare-fun res!204343 () Bool)

(assert (=> start!36610 (=> (not res!204343) (not e!223800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36610 (= res!204343 (validMask!0 mask!970))))

(assert (=> start!36610 e!223800))

(assert (=> start!36610 true))

(declare-fun array_inv!7338 (array!20873) Bool)

(assert (=> start!36610 (and (array_inv!7338 _values!506) e!223796)))

(declare-fun array_inv!7339 (array!20871) Bool)

(assert (=> start!36610 (array_inv!7339 _keys!658)))

(declare-fun b!365481 () Bool)

(declare-fun tp_is_empty!8457 () Bool)

(assert (=> b!365481 (= e!223801 tp_is_empty!8457)))

(declare-fun b!365482 () Bool)

(declare-fun e!223799 () Bool)

(assert (=> b!365482 (= e!223799 tp_is_empty!8457)))

(declare-fun b!365483 () Bool)

(assert (=> b!365483 (= e!223798 (contains!2432 Nil!5523 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365484 () Bool)

(declare-fun res!204344 () Bool)

(assert (=> b!365484 (=> (not res!204344) (not e!223800))))

(declare-fun noDuplicate!186 (List!5526) Bool)

(assert (=> b!365484 (= res!204344 (noDuplicate!186 Nil!5523))))

(declare-fun mapNonEmpty!14235 () Bool)

(declare-fun tp!28311 () Bool)

(assert (=> mapNonEmpty!14235 (= mapRes!14235 (and tp!28311 e!223799))))

(declare-fun mapKey!14235 () (_ BitVec 32))

(declare-fun mapRest!14235 () (Array (_ BitVec 32) ValueCell!3885))

(declare-fun mapValue!14235 () ValueCell!3885)

(assert (=> mapNonEmpty!14235 (= (arr!9910 _values!506) (store mapRest!14235 mapKey!14235 mapValue!14235))))

(assert (= (and start!36610 res!204343) b!365479))

(assert (= (and b!365479 res!204345) b!365477))

(assert (= (and b!365477 res!204341) b!365476))

(assert (= (and b!365476 res!204342) b!365484))

(assert (= (and b!365484 res!204344) b!365478))

(assert (= (and b!365478 (not res!204346)) b!365483))

(assert (= (and b!365480 condMapEmpty!14235) mapIsEmpty!14235))

(assert (= (and b!365480 (not condMapEmpty!14235)) mapNonEmpty!14235))

(get-info :version)

(assert (= (and mapNonEmpty!14235 ((_ is ValueCellFull!3885) mapValue!14235)) b!365482))

(assert (= (and b!365480 ((_ is ValueCellFull!3885) mapDefault!14235)) b!365481))

(assert (= start!36610 b!365480))

(declare-fun m!363171 () Bool)

(assert (=> b!365477 m!363171))

(declare-fun m!363173 () Bool)

(assert (=> b!365483 m!363173))

(declare-fun m!363175 () Bool)

(assert (=> mapNonEmpty!14235 m!363175))

(declare-fun m!363177 () Bool)

(assert (=> start!36610 m!363177))

(declare-fun m!363179 () Bool)

(assert (=> start!36610 m!363179))

(declare-fun m!363181 () Bool)

(assert (=> start!36610 m!363181))

(declare-fun m!363183 () Bool)

(assert (=> b!365484 m!363183))

(declare-fun m!363185 () Bool)

(assert (=> b!365478 m!363185))

(check-sat tp_is_empty!8457 (not b!365477) (not start!36610) (not mapNonEmpty!14235) (not b!365484) (not b!365478) (not b!365483))
(check-sat)
(get-model)

(declare-fun d!72343 () Bool)

(assert (=> d!72343 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36610 d!72343))

(declare-fun d!72345 () Bool)

(assert (=> d!72345 (= (array_inv!7338 _values!506) (bvsge (size!10262 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36610 d!72345))

(declare-fun d!72347 () Bool)

(assert (=> d!72347 (= (array_inv!7339 _keys!658) (bvsge (size!10261 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36610 d!72347))

(declare-fun d!72349 () Bool)

(declare-fun res!204369 () Bool)

(declare-fun e!223824 () Bool)

(assert (=> d!72349 (=> res!204369 e!223824)))

(assert (=> d!72349 (= res!204369 ((_ is Nil!5523) Nil!5523))))

(assert (=> d!72349 (= (noDuplicate!186 Nil!5523) e!223824)))

(declare-fun b!365516 () Bool)

(declare-fun e!223825 () Bool)

(assert (=> b!365516 (= e!223824 e!223825)))

(declare-fun res!204370 () Bool)

(assert (=> b!365516 (=> (not res!204370) (not e!223825))))

(assert (=> b!365516 (= res!204370 (not (contains!2432 (t!10676 Nil!5523) (h!6378 Nil!5523))))))

(declare-fun b!365517 () Bool)

(assert (=> b!365517 (= e!223825 (noDuplicate!186 (t!10676 Nil!5523)))))

(assert (= (and d!72349 (not res!204369)) b!365516))

(assert (= (and b!365516 res!204370) b!365517))

(declare-fun m!363203 () Bool)

(assert (=> b!365516 m!363203))

(declare-fun m!363205 () Bool)

(assert (=> b!365517 m!363205))

(assert (=> b!365484 d!72349))

(declare-fun d!72351 () Bool)

(declare-fun lt!169177 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!199 (List!5526) (InoxSet (_ BitVec 64)))

(assert (=> d!72351 (= lt!169177 (select (content!199 Nil!5523) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!223830 () Bool)

(assert (=> d!72351 (= lt!169177 e!223830)))

(declare-fun res!204376 () Bool)

(assert (=> d!72351 (=> (not res!204376) (not e!223830))))

(assert (=> d!72351 (= res!204376 ((_ is Cons!5522) Nil!5523))))

(assert (=> d!72351 (= (contains!2432 Nil!5523 #b1000000000000000000000000000000000000000000000000000000000000000) lt!169177)))

(declare-fun b!365522 () Bool)

(declare-fun e!223831 () Bool)

(assert (=> b!365522 (= e!223830 e!223831)))

(declare-fun res!204375 () Bool)

(assert (=> b!365522 (=> res!204375 e!223831)))

(assert (=> b!365522 (= res!204375 (= (h!6378 Nil!5523) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365523 () Bool)

(assert (=> b!365523 (= e!223831 (contains!2432 (t!10676 Nil!5523) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72351 res!204376) b!365522))

(assert (= (and b!365522 (not res!204375)) b!365523))

(declare-fun m!363207 () Bool)

(assert (=> d!72351 m!363207))

(declare-fun m!363209 () Bool)

(assert (=> d!72351 m!363209))

(declare-fun m!363211 () Bool)

(assert (=> b!365523 m!363211))

(assert (=> b!365483 d!72351))

(declare-fun d!72353 () Bool)

(declare-fun lt!169178 () Bool)

(assert (=> d!72353 (= lt!169178 (select (content!199 Nil!5523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!223832 () Bool)

(assert (=> d!72353 (= lt!169178 e!223832)))

(declare-fun res!204378 () Bool)

(assert (=> d!72353 (=> (not res!204378) (not e!223832))))

(assert (=> d!72353 (= res!204378 ((_ is Cons!5522) Nil!5523))))

(assert (=> d!72353 (= (contains!2432 Nil!5523 #b0000000000000000000000000000000000000000000000000000000000000000) lt!169178)))

(declare-fun b!365524 () Bool)

(declare-fun e!223833 () Bool)

(assert (=> b!365524 (= e!223832 e!223833)))

(declare-fun res!204377 () Bool)

(assert (=> b!365524 (=> res!204377 e!223833)))

(assert (=> b!365524 (= res!204377 (= (h!6378 Nil!5523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365525 () Bool)

(assert (=> b!365525 (= e!223833 (contains!2432 (t!10676 Nil!5523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72353 res!204378) b!365524))

(assert (= (and b!365524 (not res!204377)) b!365525))

(assert (=> d!72353 m!363207))

(declare-fun m!363213 () Bool)

(assert (=> d!72353 m!363213))

(declare-fun m!363215 () Bool)

(assert (=> b!365525 m!363215))

(assert (=> b!365478 d!72353))

(declare-fun b!365534 () Bool)

(declare-fun e!223842 () Bool)

(declare-fun call!27281 () Bool)

(assert (=> b!365534 (= e!223842 call!27281)))

(declare-fun b!365535 () Bool)

(declare-fun e!223841 () Bool)

(assert (=> b!365535 (= e!223841 e!223842)))

(declare-fun c!53897 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365535 (= c!53897 (validKeyInArray!0 (select (arr!9909 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72355 () Bool)

(declare-fun res!204383 () Bool)

(assert (=> d!72355 (=> res!204383 e!223841)))

(assert (=> d!72355 (= res!204383 (bvsge #b00000000000000000000000000000000 (size!10261 _keys!658)))))

(assert (=> d!72355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223841)))

(declare-fun b!365536 () Bool)

(declare-fun e!223840 () Bool)

(assert (=> b!365536 (= e!223840 call!27281)))

(declare-fun bm!27278 () Bool)

(assert (=> bm!27278 (= call!27281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365537 () Bool)

(assert (=> b!365537 (= e!223842 e!223840)))

(declare-fun lt!169187 () (_ BitVec 64))

(assert (=> b!365537 (= lt!169187 (select (arr!9909 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11388 0))(
  ( (Unit!11389) )
))
(declare-fun lt!169186 () Unit!11388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20871 (_ BitVec 64) (_ BitVec 32)) Unit!11388)

(assert (=> b!365537 (= lt!169186 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169187 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365537 (arrayContainsKey!0 _keys!658 lt!169187 #b00000000000000000000000000000000)))

(declare-fun lt!169185 () Unit!11388)

(assert (=> b!365537 (= lt!169185 lt!169186)))

(declare-fun res!204384 () Bool)

(declare-datatypes ((SeekEntryResult!3503 0))(
  ( (MissingZero!3503 (index!16191 (_ BitVec 32))) (Found!3503 (index!16192 (_ BitVec 32))) (Intermediate!3503 (undefined!4315 Bool) (index!16193 (_ BitVec 32)) (x!36661 (_ BitVec 32))) (Undefined!3503) (MissingVacant!3503 (index!16194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20871 (_ BitVec 32)) SeekEntryResult!3503)

(assert (=> b!365537 (= res!204384 (= (seekEntryOrOpen!0 (select (arr!9909 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3503 #b00000000000000000000000000000000)))))

(assert (=> b!365537 (=> (not res!204384) (not e!223840))))

(assert (= (and d!72355 (not res!204383)) b!365535))

(assert (= (and b!365535 c!53897) b!365537))

(assert (= (and b!365535 (not c!53897)) b!365534))

(assert (= (and b!365537 res!204384) b!365536))

(assert (= (or b!365536 b!365534) bm!27278))

(declare-fun m!363217 () Bool)

(assert (=> b!365535 m!363217))

(assert (=> b!365535 m!363217))

(declare-fun m!363219 () Bool)

(assert (=> b!365535 m!363219))

(declare-fun m!363221 () Bool)

(assert (=> bm!27278 m!363221))

(assert (=> b!365537 m!363217))

(declare-fun m!363223 () Bool)

(assert (=> b!365537 m!363223))

(declare-fun m!363225 () Bool)

(assert (=> b!365537 m!363225))

(assert (=> b!365537 m!363217))

(declare-fun m!363227 () Bool)

(assert (=> b!365537 m!363227))

(assert (=> b!365477 d!72355))

(declare-fun b!365545 () Bool)

(declare-fun e!223847 () Bool)

(assert (=> b!365545 (= e!223847 tp_is_empty!8457)))

(declare-fun mapNonEmpty!14241 () Bool)

(declare-fun mapRes!14241 () Bool)

(declare-fun tp!28317 () Bool)

(declare-fun e!223848 () Bool)

(assert (=> mapNonEmpty!14241 (= mapRes!14241 (and tp!28317 e!223848))))

(declare-fun mapRest!14241 () (Array (_ BitVec 32) ValueCell!3885))

(declare-fun mapValue!14241 () ValueCell!3885)

(declare-fun mapKey!14241 () (_ BitVec 32))

(assert (=> mapNonEmpty!14241 (= mapRest!14235 (store mapRest!14241 mapKey!14241 mapValue!14241))))

(declare-fun condMapEmpty!14241 () Bool)

(declare-fun mapDefault!14241 () ValueCell!3885)

(assert (=> mapNonEmpty!14235 (= condMapEmpty!14241 (= mapRest!14235 ((as const (Array (_ BitVec 32) ValueCell!3885)) mapDefault!14241)))))

(assert (=> mapNonEmpty!14235 (= tp!28311 (and e!223847 mapRes!14241))))

(declare-fun mapIsEmpty!14241 () Bool)

(assert (=> mapIsEmpty!14241 mapRes!14241))

(declare-fun b!365544 () Bool)

(assert (=> b!365544 (= e!223848 tp_is_empty!8457)))

(assert (= (and mapNonEmpty!14235 condMapEmpty!14241) mapIsEmpty!14241))

(assert (= (and mapNonEmpty!14235 (not condMapEmpty!14241)) mapNonEmpty!14241))

(assert (= (and mapNonEmpty!14241 ((_ is ValueCellFull!3885) mapValue!14241)) b!365544))

(assert (= (and mapNonEmpty!14235 ((_ is ValueCellFull!3885) mapDefault!14241)) b!365545))

(declare-fun m!363229 () Bool)

(assert (=> mapNonEmpty!14241 m!363229))

(check-sat tp_is_empty!8457 (not mapNonEmpty!14241) (not b!365525) (not d!72351) (not b!365517) (not bm!27278) (not b!365535) (not b!365537) (not d!72353) (not b!365516) (not b!365523))
(check-sat)
