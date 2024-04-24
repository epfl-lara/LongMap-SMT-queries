; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38306 () Bool)

(assert start!38306)

(declare-fun b!395178 () Bool)

(declare-fun e!239258 () Bool)

(declare-datatypes ((array!23498 0))(
  ( (array!23499 (arr!11202 (Array (_ BitVec 32) (_ BitVec 64))) (size!11554 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23498)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395178 (= e!239258 (and (or (= (select (arr!11202 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11202 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!11554 _keys!709)) (bvsge (size!11554 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395179 () Bool)

(declare-fun e!239254 () Bool)

(declare-fun tp_is_empty!9799 () Bool)

(assert (=> b!395179 (= e!239254 tp_is_empty!9799)))

(declare-fun res!226566 () Bool)

(assert (=> start!38306 (=> (not res!226566) (not e!239258))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38306 (= res!226566 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11554 _keys!709))))))

(assert (=> start!38306 e!239258))

(assert (=> start!38306 true))

(declare-datatypes ((V!14171 0))(
  ( (V!14172 (val!4944 Int)) )
))
(declare-datatypes ((ValueCell!4556 0))(
  ( (ValueCellFull!4556 (v!7191 V!14171)) (EmptyCell!4556) )
))
(declare-datatypes ((array!23500 0))(
  ( (array!23501 (arr!11203 (Array (_ BitVec 32) ValueCell!4556)) (size!11555 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23500)

(declare-fun e!239255 () Bool)

(declare-fun array_inv!8282 (array!23500) Bool)

(assert (=> start!38306 (and (array_inv!8282 _values!549) e!239255)))

(declare-fun array_inv!8283 (array!23498) Bool)

(assert (=> start!38306 (array_inv!8283 _keys!709)))

(declare-fun b!395180 () Bool)

(declare-fun res!226568 () Bool)

(assert (=> b!395180 (=> (not res!226568) (not e!239258))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395180 (= res!226568 (and (= (size!11555 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11554 _keys!709) (size!11555 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395181 () Bool)

(declare-fun res!226565 () Bool)

(assert (=> b!395181 (=> (not res!226565) (not e!239258))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395181 (= res!226565 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16308 () Bool)

(declare-fun mapRes!16308 () Bool)

(assert (=> mapIsEmpty!16308 mapRes!16308))

(declare-fun b!395182 () Bool)

(declare-fun e!239256 () Bool)

(assert (=> b!395182 (= e!239255 (and e!239256 mapRes!16308))))

(declare-fun condMapEmpty!16308 () Bool)

(declare-fun mapDefault!16308 () ValueCell!4556)

(assert (=> b!395182 (= condMapEmpty!16308 (= (arr!11203 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4556)) mapDefault!16308)))))

(declare-fun mapNonEmpty!16308 () Bool)

(declare-fun tp!32103 () Bool)

(assert (=> mapNonEmpty!16308 (= mapRes!16308 (and tp!32103 e!239254))))

(declare-fun mapRest!16308 () (Array (_ BitVec 32) ValueCell!4556))

(declare-fun mapKey!16308 () (_ BitVec 32))

(declare-fun mapValue!16308 () ValueCell!4556)

(assert (=> mapNonEmpty!16308 (= (arr!11203 _values!549) (store mapRest!16308 mapKey!16308 mapValue!16308))))

(declare-fun b!395183 () Bool)

(declare-fun res!226570 () Bool)

(assert (=> b!395183 (=> (not res!226570) (not e!239258))))

(declare-datatypes ((List!6371 0))(
  ( (Nil!6368) (Cons!6367 (h!7223 (_ BitVec 64)) (t!11537 List!6371)) )
))
(declare-fun arrayNoDuplicates!0 (array!23498 (_ BitVec 32) List!6371) Bool)

(assert (=> b!395183 (= res!226570 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6368))))

(declare-fun b!395184 () Bool)

(declare-fun res!226564 () Bool)

(assert (=> b!395184 (=> (not res!226564) (not e!239258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23498 (_ BitVec 32)) Bool)

(assert (=> b!395184 (= res!226564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395185 () Bool)

(declare-fun res!226569 () Bool)

(assert (=> b!395185 (=> (not res!226569) (not e!239258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395185 (= res!226569 (validMask!0 mask!1025))))

(declare-fun b!395186 () Bool)

(declare-fun res!226567 () Bool)

(assert (=> b!395186 (=> (not res!226567) (not e!239258))))

(assert (=> b!395186 (= res!226567 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11554 _keys!709))))))

(declare-fun b!395187 () Bool)

(assert (=> b!395187 (= e!239256 tp_is_empty!9799)))

(assert (= (and start!38306 res!226566) b!395185))

(assert (= (and b!395185 res!226569) b!395180))

(assert (= (and b!395180 res!226568) b!395184))

(assert (= (and b!395184 res!226564) b!395183))

(assert (= (and b!395183 res!226570) b!395186))

(assert (= (and b!395186 res!226567) b!395181))

(assert (= (and b!395181 res!226565) b!395178))

(assert (= (and b!395182 condMapEmpty!16308) mapIsEmpty!16308))

(assert (= (and b!395182 (not condMapEmpty!16308)) mapNonEmpty!16308))

(get-info :version)

(assert (= (and mapNonEmpty!16308 ((_ is ValueCellFull!4556) mapValue!16308)) b!395179))

(assert (= (and b!395182 ((_ is ValueCellFull!4556) mapDefault!16308)) b!395187))

(assert (= start!38306 b!395182))

(declare-fun m!391605 () Bool)

(assert (=> b!395183 m!391605))

(declare-fun m!391607 () Bool)

(assert (=> b!395184 m!391607))

(declare-fun m!391609 () Bool)

(assert (=> b!395181 m!391609))

(declare-fun m!391611 () Bool)

(assert (=> mapNonEmpty!16308 m!391611))

(declare-fun m!391613 () Bool)

(assert (=> b!395185 m!391613))

(declare-fun m!391615 () Bool)

(assert (=> start!38306 m!391615))

(declare-fun m!391617 () Bool)

(assert (=> start!38306 m!391617))

(declare-fun m!391619 () Bool)

(assert (=> b!395178 m!391619))

(check-sat tp_is_empty!9799 (not b!395185) (not b!395181) (not start!38306) (not b!395183) (not mapNonEmpty!16308) (not b!395184))
(check-sat)
(get-model)

(declare-fun d!73363 () Bool)

(assert (=> d!73363 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395185 d!73363))

(declare-fun d!73365 () Bool)

(assert (=> d!73365 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395181 d!73365))

(declare-fun b!395256 () Bool)

(declare-fun e!239295 () Bool)

(declare-fun e!239296 () Bool)

(assert (=> b!395256 (= e!239295 e!239296)))

(declare-fun c!54525 () Bool)

(assert (=> b!395256 (= c!54525 (validKeyInArray!0 (select (arr!11202 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395257 () Bool)

(declare-fun call!27859 () Bool)

(assert (=> b!395257 (= e!239296 call!27859)))

(declare-fun b!395258 () Bool)

(declare-fun e!239297 () Bool)

(assert (=> b!395258 (= e!239297 call!27859)))

(declare-fun bm!27856 () Bool)

(assert (=> bm!27856 (= call!27859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!395259 () Bool)

(assert (=> b!395259 (= e!239296 e!239297)))

(declare-fun lt!187092 () (_ BitVec 64))

(assert (=> b!395259 (= lt!187092 (select (arr!11202 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12039 0))(
  ( (Unit!12040) )
))
(declare-fun lt!187093 () Unit!12039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23498 (_ BitVec 64) (_ BitVec 32)) Unit!12039)

(assert (=> b!395259 (= lt!187093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395259 (arrayContainsKey!0 _keys!709 lt!187092 #b00000000000000000000000000000000)))

(declare-fun lt!187094 () Unit!12039)

(assert (=> b!395259 (= lt!187094 lt!187093)))

(declare-fun res!226618 () Bool)

(declare-datatypes ((SeekEntryResult!3472 0))(
  ( (MissingZero!3472 (index!16067 (_ BitVec 32))) (Found!3472 (index!16068 (_ BitVec 32))) (Intermediate!3472 (undefined!4284 Bool) (index!16069 (_ BitVec 32)) (x!38567 (_ BitVec 32))) (Undefined!3472) (MissingVacant!3472 (index!16070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23498 (_ BitVec 32)) SeekEntryResult!3472)

(assert (=> b!395259 (= res!226618 (= (seekEntryOrOpen!0 (select (arr!11202 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3472 #b00000000000000000000000000000000)))))

(assert (=> b!395259 (=> (not res!226618) (not e!239297))))

(declare-fun d!73367 () Bool)

(declare-fun res!226617 () Bool)

(assert (=> d!73367 (=> res!226617 e!239295)))

(assert (=> d!73367 (= res!226617 (bvsge #b00000000000000000000000000000000 (size!11554 _keys!709)))))

(assert (=> d!73367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239295)))

(assert (= (and d!73367 (not res!226617)) b!395256))

(assert (= (and b!395256 c!54525) b!395259))

(assert (= (and b!395256 (not c!54525)) b!395257))

(assert (= (and b!395259 res!226618) b!395258))

(assert (= (or b!395258 b!395257) bm!27856))

(declare-fun m!391653 () Bool)

(assert (=> b!395256 m!391653))

(assert (=> b!395256 m!391653))

(declare-fun m!391655 () Bool)

(assert (=> b!395256 m!391655))

(declare-fun m!391657 () Bool)

(assert (=> bm!27856 m!391657))

(assert (=> b!395259 m!391653))

(declare-fun m!391659 () Bool)

(assert (=> b!395259 m!391659))

(declare-fun m!391661 () Bool)

(assert (=> b!395259 m!391661))

(assert (=> b!395259 m!391653))

(declare-fun m!391663 () Bool)

(assert (=> b!395259 m!391663))

(assert (=> b!395184 d!73367))

(declare-fun b!395270 () Bool)

(declare-fun e!239309 () Bool)

(declare-fun e!239308 () Bool)

(assert (=> b!395270 (= e!239309 e!239308)))

(declare-fun c!54528 () Bool)

(assert (=> b!395270 (= c!54528 (validKeyInArray!0 (select (arr!11202 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73369 () Bool)

(declare-fun res!226627 () Bool)

(declare-fun e!239306 () Bool)

(assert (=> d!73369 (=> res!226627 e!239306)))

(assert (=> d!73369 (= res!226627 (bvsge #b00000000000000000000000000000000 (size!11554 _keys!709)))))

(assert (=> d!73369 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6368) e!239306)))

(declare-fun b!395271 () Bool)

(assert (=> b!395271 (= e!239306 e!239309)))

(declare-fun res!226626 () Bool)

(assert (=> b!395271 (=> (not res!226626) (not e!239309))))

(declare-fun e!239307 () Bool)

(assert (=> b!395271 (= res!226626 (not e!239307))))

(declare-fun res!226625 () Bool)

(assert (=> b!395271 (=> (not res!226625) (not e!239307))))

(assert (=> b!395271 (= res!226625 (validKeyInArray!0 (select (arr!11202 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395272 () Bool)

(declare-fun call!27862 () Bool)

(assert (=> b!395272 (= e!239308 call!27862)))

(declare-fun b!395273 () Bool)

(declare-fun contains!2459 (List!6371 (_ BitVec 64)) Bool)

(assert (=> b!395273 (= e!239307 (contains!2459 Nil!6368 (select (arr!11202 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395274 () Bool)

(assert (=> b!395274 (= e!239308 call!27862)))

(declare-fun bm!27859 () Bool)

(assert (=> bm!27859 (= call!27862 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54528 (Cons!6367 (select (arr!11202 _keys!709) #b00000000000000000000000000000000) Nil!6368) Nil!6368)))))

(assert (= (and d!73369 (not res!226627)) b!395271))

(assert (= (and b!395271 res!226625) b!395273))

(assert (= (and b!395271 res!226626) b!395270))

(assert (= (and b!395270 c!54528) b!395272))

(assert (= (and b!395270 (not c!54528)) b!395274))

(assert (= (or b!395272 b!395274) bm!27859))

(assert (=> b!395270 m!391653))

(assert (=> b!395270 m!391653))

(assert (=> b!395270 m!391655))

(assert (=> b!395271 m!391653))

(assert (=> b!395271 m!391653))

(assert (=> b!395271 m!391655))

(assert (=> b!395273 m!391653))

(assert (=> b!395273 m!391653))

(declare-fun m!391665 () Bool)

(assert (=> b!395273 m!391665))

(assert (=> bm!27859 m!391653))

(declare-fun m!391667 () Bool)

(assert (=> bm!27859 m!391667))

(assert (=> b!395183 d!73369))

(declare-fun d!73371 () Bool)

(assert (=> d!73371 (= (array_inv!8282 _values!549) (bvsge (size!11555 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38306 d!73371))

(declare-fun d!73373 () Bool)

(assert (=> d!73373 (= (array_inv!8283 _keys!709) (bvsge (size!11554 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38306 d!73373))

(declare-fun b!395282 () Bool)

(declare-fun e!239315 () Bool)

(assert (=> b!395282 (= e!239315 tp_is_empty!9799)))

(declare-fun condMapEmpty!16317 () Bool)

(declare-fun mapDefault!16317 () ValueCell!4556)

(assert (=> mapNonEmpty!16308 (= condMapEmpty!16317 (= mapRest!16308 ((as const (Array (_ BitVec 32) ValueCell!4556)) mapDefault!16317)))))

(declare-fun mapRes!16317 () Bool)

(assert (=> mapNonEmpty!16308 (= tp!32103 (and e!239315 mapRes!16317))))

(declare-fun mapNonEmpty!16317 () Bool)

(declare-fun tp!32112 () Bool)

(declare-fun e!239314 () Bool)

(assert (=> mapNonEmpty!16317 (= mapRes!16317 (and tp!32112 e!239314))))

(declare-fun mapRest!16317 () (Array (_ BitVec 32) ValueCell!4556))

(declare-fun mapKey!16317 () (_ BitVec 32))

(declare-fun mapValue!16317 () ValueCell!4556)

(assert (=> mapNonEmpty!16317 (= mapRest!16308 (store mapRest!16317 mapKey!16317 mapValue!16317))))

(declare-fun b!395281 () Bool)

(assert (=> b!395281 (= e!239314 tp_is_empty!9799)))

(declare-fun mapIsEmpty!16317 () Bool)

(assert (=> mapIsEmpty!16317 mapRes!16317))

(assert (= (and mapNonEmpty!16308 condMapEmpty!16317) mapIsEmpty!16317))

(assert (= (and mapNonEmpty!16308 (not condMapEmpty!16317)) mapNonEmpty!16317))

(assert (= (and mapNonEmpty!16317 ((_ is ValueCellFull!4556) mapValue!16317)) b!395281))

(assert (= (and mapNonEmpty!16308 ((_ is ValueCellFull!4556) mapDefault!16317)) b!395282))

(declare-fun m!391669 () Bool)

(assert (=> mapNonEmpty!16317 m!391669))

(check-sat (not bm!27856) (not mapNonEmpty!16317) (not bm!27859) tp_is_empty!9799 (not b!395256) (not b!395259) (not b!395273) (not b!395270) (not b!395271))
(check-sat)
