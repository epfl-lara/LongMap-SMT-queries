; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36594 () Bool)

(assert start!36594)

(declare-fun b!365400 () Bool)

(declare-fun res!204321 () Bool)

(declare-fun e!223746 () Bool)

(assert (=> b!365400 (=> (not res!204321) (not e!223746))))

(declare-datatypes ((array!20852 0))(
  ( (array!20853 (arr!9899 (Array (_ BitVec 32) (_ BitVec 64))) (size!10251 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20852)

(assert (=> b!365400 (= res!204321 (and (bvsle #b00000000000000000000000000000000 (size!10251 _keys!658)) (bvslt (size!10251 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365401 () Bool)

(declare-fun e!223747 () Bool)

(declare-fun e!223750 () Bool)

(declare-fun mapRes!14232 () Bool)

(assert (=> b!365401 (= e!223747 (and e!223750 mapRes!14232))))

(declare-fun condMapEmpty!14232 () Bool)

(declare-datatypes ((V!12379 0))(
  ( (V!12380 (val!4272 Int)) )
))
(declare-datatypes ((ValueCell!3884 0))(
  ( (ValueCellFull!3884 (v!6468 V!12379)) (EmptyCell!3884) )
))
(declare-datatypes ((array!20854 0))(
  ( (array!20855 (arr!9900 (Array (_ BitVec 32) ValueCell!3884)) (size!10252 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20854)

(declare-fun mapDefault!14232 () ValueCell!3884)

(assert (=> b!365401 (= condMapEmpty!14232 (= (arr!9900 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3884)) mapDefault!14232)))))

(declare-fun res!204325 () Bool)

(assert (=> start!36594 (=> (not res!204325) (not e!223746))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36594 (= res!204325 (validMask!0 mask!970))))

(assert (=> start!36594 e!223746))

(assert (=> start!36594 true))

(declare-fun array_inv!7366 (array!20854) Bool)

(assert (=> start!36594 (and (array_inv!7366 _values!506) e!223747)))

(declare-fun array_inv!7367 (array!20852) Bool)

(assert (=> start!36594 (array_inv!7367 _keys!658)))

(declare-fun b!365402 () Bool)

(declare-fun res!204322 () Bool)

(assert (=> b!365402 (=> (not res!204322) (not e!223746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20852 (_ BitVec 32)) Bool)

(assert (=> b!365402 (= res!204322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365403 () Bool)

(declare-fun tp_is_empty!8455 () Bool)

(assert (=> b!365403 (= e!223750 tp_is_empty!8455)))

(declare-fun b!365404 () Bool)

(declare-fun res!204320 () Bool)

(assert (=> b!365404 (=> (not res!204320) (not e!223746))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365404 (= res!204320 (and (= (size!10252 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10251 _keys!658) (size!10252 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14232 () Bool)

(assert (=> mapIsEmpty!14232 mapRes!14232))

(declare-fun b!365405 () Bool)

(declare-fun e!223748 () Bool)

(assert (=> b!365405 (= e!223746 e!223748)))

(declare-fun res!204324 () Bool)

(assert (=> b!365405 (=> res!204324 e!223748)))

(declare-datatypes ((List!5436 0))(
  ( (Nil!5433) (Cons!5432 (h!6288 (_ BitVec 64)) (t!10578 List!5436)) )
))
(declare-fun contains!2413 (List!5436 (_ BitVec 64)) Bool)

(assert (=> b!365405 (= res!204324 (contains!2413 Nil!5433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365406 () Bool)

(declare-fun res!204323 () Bool)

(assert (=> b!365406 (=> (not res!204323) (not e!223746))))

(declare-fun noDuplicate!189 (List!5436) Bool)

(assert (=> b!365406 (= res!204323 (noDuplicate!189 Nil!5433))))

(declare-fun b!365407 () Bool)

(declare-fun e!223749 () Bool)

(assert (=> b!365407 (= e!223749 tp_is_empty!8455)))

(declare-fun mapNonEmpty!14232 () Bool)

(declare-fun tp!28308 () Bool)

(assert (=> mapNonEmpty!14232 (= mapRes!14232 (and tp!28308 e!223749))))

(declare-fun mapRest!14232 () (Array (_ BitVec 32) ValueCell!3884))

(declare-fun mapValue!14232 () ValueCell!3884)

(declare-fun mapKey!14232 () (_ BitVec 32))

(assert (=> mapNonEmpty!14232 (= (arr!9900 _values!506) (store mapRest!14232 mapKey!14232 mapValue!14232))))

(declare-fun b!365408 () Bool)

(assert (=> b!365408 (= e!223748 (contains!2413 Nil!5433 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!36594 res!204325) b!365404))

(assert (= (and b!365404 res!204320) b!365402))

(assert (= (and b!365402 res!204322) b!365400))

(assert (= (and b!365400 res!204321) b!365406))

(assert (= (and b!365406 res!204323) b!365405))

(assert (= (and b!365405 (not res!204324)) b!365408))

(assert (= (and b!365401 condMapEmpty!14232) mapIsEmpty!14232))

(assert (= (and b!365401 (not condMapEmpty!14232)) mapNonEmpty!14232))

(get-info :version)

(assert (= (and mapNonEmpty!14232 ((_ is ValueCellFull!3884) mapValue!14232)) b!365407))

(assert (= (and b!365401 ((_ is ValueCellFull!3884) mapDefault!14232)) b!365403))

(assert (= start!36594 b!365401))

(declare-fun m!363385 () Bool)

(assert (=> mapNonEmpty!14232 m!363385))

(declare-fun m!363387 () Bool)

(assert (=> start!36594 m!363387))

(declare-fun m!363389 () Bool)

(assert (=> start!36594 m!363389))

(declare-fun m!363391 () Bool)

(assert (=> start!36594 m!363391))

(declare-fun m!363393 () Bool)

(assert (=> b!365405 m!363393))

(declare-fun m!363395 () Bool)

(assert (=> b!365408 m!363395))

(declare-fun m!363397 () Bool)

(assert (=> b!365406 m!363397))

(declare-fun m!363399 () Bool)

(assert (=> b!365402 m!363399))

(check-sat (not mapNonEmpty!14232) (not b!365402) (not start!36594) tp_is_empty!8455 (not b!365408) (not b!365406) (not b!365405))
(check-sat)
(get-model)

(declare-fun d!72373 () Bool)

(declare-fun res!204366 () Bool)

(declare-fun e!223795 () Bool)

(assert (=> d!72373 (=> res!204366 e!223795)))

(assert (=> d!72373 (= res!204366 (bvsge #b00000000000000000000000000000000 (size!10251 _keys!658)))))

(assert (=> d!72373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223795)))

(declare-fun b!365471 () Bool)

(declare-fun e!223796 () Bool)

(declare-fun e!223794 () Bool)

(assert (=> b!365471 (= e!223796 e!223794)))

(declare-fun lt!169200 () (_ BitVec 64))

(assert (=> b!365471 (= lt!169200 (select (arr!9899 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11377 0))(
  ( (Unit!11378) )
))
(declare-fun lt!169201 () Unit!11377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20852 (_ BitVec 64) (_ BitVec 32)) Unit!11377)

(assert (=> b!365471 (= lt!169201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169200 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365471 (arrayContainsKey!0 _keys!658 lt!169200 #b00000000000000000000000000000000)))

(declare-fun lt!169202 () Unit!11377)

(assert (=> b!365471 (= lt!169202 lt!169201)))

(declare-fun res!204367 () Bool)

(declare-datatypes ((SeekEntryResult!3452 0))(
  ( (MissingZero!3452 (index!15987 (_ BitVec 32))) (Found!3452 (index!15988 (_ BitVec 32))) (Intermediate!3452 (undefined!4264 Bool) (index!15989 (_ BitVec 32)) (x!36607 (_ BitVec 32))) (Undefined!3452) (MissingVacant!3452 (index!15990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20852 (_ BitVec 32)) SeekEntryResult!3452)

(assert (=> b!365471 (= res!204367 (= (seekEntryOrOpen!0 (select (arr!9899 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3452 #b00000000000000000000000000000000)))))

(assert (=> b!365471 (=> (not res!204367) (not e!223794))))

(declare-fun b!365472 () Bool)

(declare-fun call!27268 () Bool)

(assert (=> b!365472 (= e!223796 call!27268)))

(declare-fun b!365473 () Bool)

(assert (=> b!365473 (= e!223794 call!27268)))

(declare-fun bm!27265 () Bool)

(assert (=> bm!27265 (= call!27268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365474 () Bool)

(assert (=> b!365474 (= e!223795 e!223796)))

(declare-fun c!53874 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365474 (= c!53874 (validKeyInArray!0 (select (arr!9899 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72373 (not res!204366)) b!365474))

(assert (= (and b!365474 c!53874) b!365471))

(assert (= (and b!365474 (not c!53874)) b!365472))

(assert (= (and b!365471 res!204367) b!365473))

(assert (= (or b!365473 b!365472) bm!27265))

(declare-fun m!363433 () Bool)

(assert (=> b!365471 m!363433))

(declare-fun m!363435 () Bool)

(assert (=> b!365471 m!363435))

(declare-fun m!363437 () Bool)

(assert (=> b!365471 m!363437))

(assert (=> b!365471 m!363433))

(declare-fun m!363439 () Bool)

(assert (=> b!365471 m!363439))

(declare-fun m!363441 () Bool)

(assert (=> bm!27265 m!363441))

(assert (=> b!365474 m!363433))

(assert (=> b!365474 m!363433))

(declare-fun m!363443 () Bool)

(assert (=> b!365474 m!363443))

(assert (=> b!365402 d!72373))

(declare-fun d!72375 () Bool)

(declare-fun res!204372 () Bool)

(declare-fun e!223801 () Bool)

(assert (=> d!72375 (=> res!204372 e!223801)))

(assert (=> d!72375 (= res!204372 ((_ is Nil!5433) Nil!5433))))

(assert (=> d!72375 (= (noDuplicate!189 Nil!5433) e!223801)))

(declare-fun b!365479 () Bool)

(declare-fun e!223802 () Bool)

(assert (=> b!365479 (= e!223801 e!223802)))

(declare-fun res!204373 () Bool)

(assert (=> b!365479 (=> (not res!204373) (not e!223802))))

(assert (=> b!365479 (= res!204373 (not (contains!2413 (t!10578 Nil!5433) (h!6288 Nil!5433))))))

(declare-fun b!365480 () Bool)

(assert (=> b!365480 (= e!223802 (noDuplicate!189 (t!10578 Nil!5433)))))

(assert (= (and d!72375 (not res!204372)) b!365479))

(assert (= (and b!365479 res!204373) b!365480))

(declare-fun m!363445 () Bool)

(assert (=> b!365479 m!363445))

(declare-fun m!363447 () Bool)

(assert (=> b!365480 m!363447))

(assert (=> b!365406 d!72375))

(declare-fun d!72377 () Bool)

(declare-fun lt!169205 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!201 (List!5436) (InoxSet (_ BitVec 64)))

(assert (=> d!72377 (= lt!169205 (select (content!201 Nil!5433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!223808 () Bool)

(assert (=> d!72377 (= lt!169205 e!223808)))

(declare-fun res!204378 () Bool)

(assert (=> d!72377 (=> (not res!204378) (not e!223808))))

(assert (=> d!72377 (= res!204378 ((_ is Cons!5432) Nil!5433))))

(assert (=> d!72377 (= (contains!2413 Nil!5433 #b0000000000000000000000000000000000000000000000000000000000000000) lt!169205)))

(declare-fun b!365485 () Bool)

(declare-fun e!223807 () Bool)

(assert (=> b!365485 (= e!223808 e!223807)))

(declare-fun res!204379 () Bool)

(assert (=> b!365485 (=> res!204379 e!223807)))

(assert (=> b!365485 (= res!204379 (= (h!6288 Nil!5433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365486 () Bool)

(assert (=> b!365486 (= e!223807 (contains!2413 (t!10578 Nil!5433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72377 res!204378) b!365485))

(assert (= (and b!365485 (not res!204379)) b!365486))

(declare-fun m!363449 () Bool)

(assert (=> d!72377 m!363449))

(declare-fun m!363451 () Bool)

(assert (=> d!72377 m!363451))

(declare-fun m!363453 () Bool)

(assert (=> b!365486 m!363453))

(assert (=> b!365405 d!72377))

(declare-fun d!72379 () Bool)

(declare-fun lt!169206 () Bool)

(assert (=> d!72379 (= lt!169206 (select (content!201 Nil!5433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!223810 () Bool)

(assert (=> d!72379 (= lt!169206 e!223810)))

(declare-fun res!204380 () Bool)

(assert (=> d!72379 (=> (not res!204380) (not e!223810))))

(assert (=> d!72379 (= res!204380 ((_ is Cons!5432) Nil!5433))))

(assert (=> d!72379 (= (contains!2413 Nil!5433 #b1000000000000000000000000000000000000000000000000000000000000000) lt!169206)))

(declare-fun b!365487 () Bool)

(declare-fun e!223809 () Bool)

(assert (=> b!365487 (= e!223810 e!223809)))

(declare-fun res!204381 () Bool)

(assert (=> b!365487 (=> res!204381 e!223809)))

(assert (=> b!365487 (= res!204381 (= (h!6288 Nil!5433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365488 () Bool)

(assert (=> b!365488 (= e!223809 (contains!2413 (t!10578 Nil!5433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72379 res!204380) b!365487))

(assert (= (and b!365487 (not res!204381)) b!365488))

(assert (=> d!72379 m!363449))

(declare-fun m!363455 () Bool)

(assert (=> d!72379 m!363455))

(declare-fun m!363457 () Bool)

(assert (=> b!365488 m!363457))

(assert (=> b!365408 d!72379))

(declare-fun d!72381 () Bool)

(assert (=> d!72381 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36594 d!72381))

(declare-fun d!72383 () Bool)

(assert (=> d!72383 (= (array_inv!7366 _values!506) (bvsge (size!10252 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36594 d!72383))

(declare-fun d!72385 () Bool)

(assert (=> d!72385 (= (array_inv!7367 _keys!658) (bvsge (size!10251 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36594 d!72385))

(declare-fun b!365496 () Bool)

(declare-fun e!223816 () Bool)

(assert (=> b!365496 (= e!223816 tp_is_empty!8455)))

(declare-fun mapNonEmpty!14241 () Bool)

(declare-fun mapRes!14241 () Bool)

(declare-fun tp!28317 () Bool)

(declare-fun e!223815 () Bool)

(assert (=> mapNonEmpty!14241 (= mapRes!14241 (and tp!28317 e!223815))))

(declare-fun mapValue!14241 () ValueCell!3884)

(declare-fun mapRest!14241 () (Array (_ BitVec 32) ValueCell!3884))

(declare-fun mapKey!14241 () (_ BitVec 32))

(assert (=> mapNonEmpty!14241 (= mapRest!14232 (store mapRest!14241 mapKey!14241 mapValue!14241))))

(declare-fun b!365495 () Bool)

(assert (=> b!365495 (= e!223815 tp_is_empty!8455)))

(declare-fun condMapEmpty!14241 () Bool)

(declare-fun mapDefault!14241 () ValueCell!3884)

(assert (=> mapNonEmpty!14232 (= condMapEmpty!14241 (= mapRest!14232 ((as const (Array (_ BitVec 32) ValueCell!3884)) mapDefault!14241)))))

(assert (=> mapNonEmpty!14232 (= tp!28308 (and e!223816 mapRes!14241))))

(declare-fun mapIsEmpty!14241 () Bool)

(assert (=> mapIsEmpty!14241 mapRes!14241))

(assert (= (and mapNonEmpty!14232 condMapEmpty!14241) mapIsEmpty!14241))

(assert (= (and mapNonEmpty!14232 (not condMapEmpty!14241)) mapNonEmpty!14241))

(assert (= (and mapNonEmpty!14241 ((_ is ValueCellFull!3884) mapValue!14241)) b!365495))

(assert (= (and mapNonEmpty!14232 ((_ is ValueCellFull!3884) mapDefault!14241)) b!365496))

(declare-fun m!363459 () Bool)

(assert (=> mapNonEmpty!14241 m!363459))

(check-sat (not b!365474) (not mapNonEmpty!14241) (not b!365471) (not b!365488) (not b!365480) (not b!365486) tp_is_empty!8455 (not b!365479) (not d!72377) (not bm!27265) (not d!72379))
(check-sat)
