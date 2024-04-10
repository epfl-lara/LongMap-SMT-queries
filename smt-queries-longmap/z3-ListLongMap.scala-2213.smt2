; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36708 () Bool)

(assert start!36708)

(declare-fun b!366429 () Bool)

(declare-fun res!204973 () Bool)

(declare-fun e!224344 () Bool)

(assert (=> b!366429 (=> (not res!204973) (not e!224344))))

(declare-datatypes ((V!12461 0))(
  ( (V!12462 (val!4303 Int)) )
))
(declare-datatypes ((ValueCell!3915 0))(
  ( (ValueCellFull!3915 (v!6499 V!12461)) (EmptyCell!3915) )
))
(declare-datatypes ((array!20989 0))(
  ( (array!20990 (arr!9965 (Array (_ BitVec 32) ValueCell!3915)) (size!10317 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20989)

(declare-datatypes ((array!20991 0))(
  ( (array!20992 (arr!9966 (Array (_ BitVec 32) (_ BitVec 64))) (size!10318 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20991)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366429 (= res!204973 (and (= (size!10317 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10318 _keys!658) (size!10317 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366430 () Bool)

(declare-fun res!204975 () Bool)

(assert (=> b!366430 (=> (not res!204975) (not e!224344))))

(declare-datatypes ((List!5548 0))(
  ( (Nil!5545) (Cons!5544 (h!6400 (_ BitVec 64)) (t!10698 List!5548)) )
))
(declare-fun arrayNoDuplicates!0 (array!20991 (_ BitVec 32) List!5548) Bool)

(assert (=> b!366430 (= res!204975 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5545))))

(declare-fun b!366431 () Bool)

(declare-fun e!224343 () Bool)

(declare-fun tp_is_empty!8517 () Bool)

(assert (=> b!366431 (= e!224343 tp_is_empty!8517)))

(declare-fun b!366432 () Bool)

(declare-fun res!204976 () Bool)

(assert (=> b!366432 (=> (not res!204976) (not e!224344))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366432 (= res!204976 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366433 () Bool)

(declare-fun res!204970 () Bool)

(assert (=> b!366433 (=> (not res!204970) (not e!224344))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366433 (= res!204970 (or (= (select (arr!9966 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9966 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366434 () Bool)

(declare-fun res!204972 () Bool)

(assert (=> b!366434 (=> (not res!204972) (not e!224344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20991 (_ BitVec 32)) Bool)

(assert (=> b!366434 (= res!204972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366435 () Bool)

(declare-fun e!224346 () Bool)

(assert (=> b!366435 (= e!224346 tp_is_empty!8517)))

(declare-fun b!366436 () Bool)

(declare-fun res!204974 () Bool)

(assert (=> b!366436 (=> (not res!204974) (not e!224344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366436 (= res!204974 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14334 () Bool)

(declare-fun mapRes!14334 () Bool)

(declare-fun tp!28410 () Bool)

(assert (=> mapNonEmpty!14334 (= mapRes!14334 (and tp!28410 e!224343))))

(declare-fun mapKey!14334 () (_ BitVec 32))

(declare-fun mapRest!14334 () (Array (_ BitVec 32) ValueCell!3915))

(declare-fun mapValue!14334 () ValueCell!3915)

(assert (=> mapNonEmpty!14334 (= (arr!9965 _values!506) (store mapRest!14334 mapKey!14334 mapValue!14334))))

(declare-fun mapIsEmpty!14334 () Bool)

(assert (=> mapIsEmpty!14334 mapRes!14334))

(declare-fun b!366438 () Bool)

(declare-fun e!224345 () Bool)

(assert (=> b!366438 (= e!224345 (and e!224346 mapRes!14334))))

(declare-fun condMapEmpty!14334 () Bool)

(declare-fun mapDefault!14334 () ValueCell!3915)

(assert (=> b!366438 (= condMapEmpty!14334 (= (arr!9965 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3915)) mapDefault!14334)))))

(declare-fun b!366439 () Bool)

(declare-fun noDuplicate!188 (List!5548) Bool)

(assert (=> b!366439 (= e!224344 (not (noDuplicate!188 Nil!5545)))))

(declare-fun b!366440 () Bool)

(declare-fun res!204969 () Bool)

(assert (=> b!366440 (=> (not res!204969) (not e!224344))))

(assert (=> b!366440 (= res!204969 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10318 _keys!658))))))

(declare-fun b!366441 () Bool)

(declare-fun res!204977 () Bool)

(assert (=> b!366441 (=> (not res!204977) (not e!224344))))

(assert (=> b!366441 (= res!204977 (and (bvsle #b00000000000000000000000000000000 (size!10318 _keys!658)) (bvslt (size!10318 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun res!204971 () Bool)

(assert (=> start!36708 (=> (not res!204971) (not e!224344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36708 (= res!204971 (validMask!0 mask!970))))

(assert (=> start!36708 e!224344))

(assert (=> start!36708 true))

(declare-fun array_inv!7372 (array!20989) Bool)

(assert (=> start!36708 (and (array_inv!7372 _values!506) e!224345)))

(declare-fun array_inv!7373 (array!20991) Bool)

(assert (=> start!36708 (array_inv!7373 _keys!658)))

(declare-fun b!366437 () Bool)

(declare-fun res!204968 () Bool)

(assert (=> b!366437 (=> (not res!204968) (not e!224344))))

(assert (=> b!366437 (= res!204968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)) mask!970))))

(assert (= (and start!36708 res!204971) b!366429))

(assert (= (and b!366429 res!204973) b!366434))

(assert (= (and b!366434 res!204972) b!366430))

(assert (= (and b!366430 res!204975) b!366440))

(assert (= (and b!366440 res!204969) b!366436))

(assert (= (and b!366436 res!204974) b!366433))

(assert (= (and b!366433 res!204970) b!366432))

(assert (= (and b!366432 res!204976) b!366437))

(assert (= (and b!366437 res!204968) b!366441))

(assert (= (and b!366441 res!204977) b!366439))

(assert (= (and b!366438 condMapEmpty!14334) mapIsEmpty!14334))

(assert (= (and b!366438 (not condMapEmpty!14334)) mapNonEmpty!14334))

(get-info :version)

(assert (= (and mapNonEmpty!14334 ((_ is ValueCellFull!3915) mapValue!14334)) b!366431))

(assert (= (and b!366438 ((_ is ValueCellFull!3915) mapDefault!14334)) b!366435))

(assert (= start!36708 b!366438))

(declare-fun m!363749 () Bool)

(assert (=> b!366433 m!363749))

(declare-fun m!363751 () Bool)

(assert (=> b!366432 m!363751))

(declare-fun m!363753 () Bool)

(assert (=> b!366439 m!363753))

(declare-fun m!363755 () Bool)

(assert (=> mapNonEmpty!14334 m!363755))

(declare-fun m!363757 () Bool)

(assert (=> b!366437 m!363757))

(declare-fun m!363759 () Bool)

(assert (=> b!366437 m!363759))

(declare-fun m!363761 () Bool)

(assert (=> start!36708 m!363761))

(declare-fun m!363763 () Bool)

(assert (=> start!36708 m!363763))

(declare-fun m!363765 () Bool)

(assert (=> start!36708 m!363765))

(declare-fun m!363767 () Bool)

(assert (=> b!366434 m!363767))

(declare-fun m!363769 () Bool)

(assert (=> b!366436 m!363769))

(declare-fun m!363771 () Bool)

(assert (=> b!366430 m!363771))

(check-sat (not start!36708) (not b!366437) (not b!366430) (not b!366439) (not mapNonEmpty!14334) (not b!366434) (not b!366432) (not b!366436) tp_is_empty!8517)
(check-sat)
(get-model)

(declare-fun d!72405 () Bool)

(declare-fun res!205014 () Bool)

(declare-fun e!224373 () Bool)

(assert (=> d!72405 (=> res!205014 e!224373)))

(assert (=> d!72405 (= res!205014 (bvsge #b00000000000000000000000000000000 (size!10318 _keys!658)))))

(assert (=> d!72405 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5545) e!224373)))

(declare-fun b!366491 () Bool)

(declare-fun e!224372 () Bool)

(declare-fun call!27297 () Bool)

(assert (=> b!366491 (= e!224372 call!27297)))

(declare-fun b!366492 () Bool)

(declare-fun e!224371 () Bool)

(declare-fun contains!2436 (List!5548 (_ BitVec 64)) Bool)

(assert (=> b!366492 (= e!224371 (contains!2436 Nil!5545 (select (arr!9966 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366493 () Bool)

(assert (=> b!366493 (= e!224372 call!27297)))

(declare-fun bm!27294 () Bool)

(declare-fun c!53913 () Bool)

(assert (=> bm!27294 (= call!27297 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53913 (Cons!5544 (select (arr!9966 _keys!658) #b00000000000000000000000000000000) Nil!5545) Nil!5545)))))

(declare-fun b!366494 () Bool)

(declare-fun e!224370 () Bool)

(assert (=> b!366494 (= e!224373 e!224370)))

(declare-fun res!205016 () Bool)

(assert (=> b!366494 (=> (not res!205016) (not e!224370))))

(assert (=> b!366494 (= res!205016 (not e!224371))))

(declare-fun res!205015 () Bool)

(assert (=> b!366494 (=> (not res!205015) (not e!224371))))

(assert (=> b!366494 (= res!205015 (validKeyInArray!0 (select (arr!9966 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366495 () Bool)

(assert (=> b!366495 (= e!224370 e!224372)))

(assert (=> b!366495 (= c!53913 (validKeyInArray!0 (select (arr!9966 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72405 (not res!205014)) b!366494))

(assert (= (and b!366494 res!205015) b!366492))

(assert (= (and b!366494 res!205016) b!366495))

(assert (= (and b!366495 c!53913) b!366493))

(assert (= (and b!366495 (not c!53913)) b!366491))

(assert (= (or b!366493 b!366491) bm!27294))

(declare-fun m!363797 () Bool)

(assert (=> b!366492 m!363797))

(assert (=> b!366492 m!363797))

(declare-fun m!363799 () Bool)

(assert (=> b!366492 m!363799))

(assert (=> bm!27294 m!363797))

(declare-fun m!363801 () Bool)

(assert (=> bm!27294 m!363801))

(assert (=> b!366494 m!363797))

(assert (=> b!366494 m!363797))

(declare-fun m!363803 () Bool)

(assert (=> b!366494 m!363803))

(assert (=> b!366495 m!363797))

(assert (=> b!366495 m!363797))

(assert (=> b!366495 m!363803))

(assert (=> b!366430 d!72405))

(declare-fun d!72407 () Bool)

(declare-fun res!205021 () Bool)

(declare-fun e!224378 () Bool)

(assert (=> d!72407 (=> res!205021 e!224378)))

(assert (=> d!72407 (= res!205021 ((_ is Nil!5545) Nil!5545))))

(assert (=> d!72407 (= (noDuplicate!188 Nil!5545) e!224378)))

(declare-fun b!366500 () Bool)

(declare-fun e!224379 () Bool)

(assert (=> b!366500 (= e!224378 e!224379)))

(declare-fun res!205022 () Bool)

(assert (=> b!366500 (=> (not res!205022) (not e!224379))))

(assert (=> b!366500 (= res!205022 (not (contains!2436 (t!10698 Nil!5545) (h!6400 Nil!5545))))))

(declare-fun b!366501 () Bool)

(assert (=> b!366501 (= e!224379 (noDuplicate!188 (t!10698 Nil!5545)))))

(assert (= (and d!72407 (not res!205021)) b!366500))

(assert (= (and b!366500 res!205022) b!366501))

(declare-fun m!363805 () Bool)

(assert (=> b!366500 m!363805))

(declare-fun m!363807 () Bool)

(assert (=> b!366501 m!363807))

(assert (=> b!366439 d!72407))

(declare-fun d!72409 () Bool)

(assert (=> d!72409 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366436 d!72409))

(declare-fun d!72411 () Bool)

(assert (=> d!72411 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36708 d!72411))

(declare-fun d!72413 () Bool)

(assert (=> d!72413 (= (array_inv!7372 _values!506) (bvsge (size!10317 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36708 d!72413))

(declare-fun d!72415 () Bool)

(assert (=> d!72415 (= (array_inv!7373 _keys!658) (bvsge (size!10318 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36708 d!72415))

(declare-fun b!366510 () Bool)

(declare-fun e!224387 () Bool)

(declare-fun call!27300 () Bool)

(assert (=> b!366510 (= e!224387 call!27300)))

(declare-fun d!72417 () Bool)

(declare-fun res!205028 () Bool)

(declare-fun e!224386 () Bool)

(assert (=> d!72417 (=> res!205028 e!224386)))

(assert (=> d!72417 (= res!205028 (bvsge #b00000000000000000000000000000000 (size!10318 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)))))))

(assert (=> d!72417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)) mask!970) e!224386)))

(declare-fun b!366511 () Bool)

(declare-fun e!224388 () Bool)

(assert (=> b!366511 (= e!224388 e!224387)))

(declare-fun lt!169244 () (_ BitVec 64))

(assert (=> b!366511 (= lt!169244 (select (arr!9966 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11394 0))(
  ( (Unit!11395) )
))
(declare-fun lt!169242 () Unit!11394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20991 (_ BitVec 64) (_ BitVec 32)) Unit!11394)

(assert (=> b!366511 (= lt!169242 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)) lt!169244 #b00000000000000000000000000000000))))

(assert (=> b!366511 (arrayContainsKey!0 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)) lt!169244 #b00000000000000000000000000000000)))

(declare-fun lt!169243 () Unit!11394)

(assert (=> b!366511 (= lt!169243 lt!169242)))

(declare-fun res!205027 () Bool)

(declare-datatypes ((SeekEntryResult!3506 0))(
  ( (MissingZero!3506 (index!16203 (_ BitVec 32))) (Found!3506 (index!16204 (_ BitVec 32))) (Intermediate!3506 (undefined!4318 Bool) (index!16205 (_ BitVec 32)) (x!36750 (_ BitVec 32))) (Undefined!3506) (MissingVacant!3506 (index!16206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20991 (_ BitVec 32)) SeekEntryResult!3506)

(assert (=> b!366511 (= res!205027 (= (seekEntryOrOpen!0 (select (arr!9966 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658))) #b00000000000000000000000000000000) (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)) mask!970) (Found!3506 #b00000000000000000000000000000000)))))

(assert (=> b!366511 (=> (not res!205027) (not e!224387))))

(declare-fun b!366512 () Bool)

(assert (=> b!366512 (= e!224386 e!224388)))

(declare-fun c!53916 () Bool)

(assert (=> b!366512 (= c!53916 (validKeyInArray!0 (select (arr!9966 (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun b!366513 () Bool)

(assert (=> b!366513 (= e!224388 call!27300)))

(declare-fun bm!27297 () Bool)

(assert (=> bm!27297 (= call!27300 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20992 (store (arr!9966 _keys!658) i!548 k0!778) (size!10318 _keys!658)) mask!970))))

(assert (= (and d!72417 (not res!205028)) b!366512))

(assert (= (and b!366512 c!53916) b!366511))

(assert (= (and b!366512 (not c!53916)) b!366513))

(assert (= (and b!366511 res!205027) b!366510))

(assert (= (or b!366510 b!366513) bm!27297))

(declare-fun m!363809 () Bool)

(assert (=> b!366511 m!363809))

(declare-fun m!363811 () Bool)

(assert (=> b!366511 m!363811))

(declare-fun m!363813 () Bool)

(assert (=> b!366511 m!363813))

(assert (=> b!366511 m!363809))

(declare-fun m!363815 () Bool)

(assert (=> b!366511 m!363815))

(assert (=> b!366512 m!363809))

(assert (=> b!366512 m!363809))

(declare-fun m!363817 () Bool)

(assert (=> b!366512 m!363817))

(declare-fun m!363819 () Bool)

(assert (=> bm!27297 m!363819))

(assert (=> b!366437 d!72417))

(declare-fun d!72419 () Bool)

(declare-fun res!205033 () Bool)

(declare-fun e!224393 () Bool)

(assert (=> d!72419 (=> res!205033 e!224393)))

(assert (=> d!72419 (= res!205033 (= (select (arr!9966 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72419 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224393)))

(declare-fun b!366518 () Bool)

(declare-fun e!224394 () Bool)

(assert (=> b!366518 (= e!224393 e!224394)))

(declare-fun res!205034 () Bool)

(assert (=> b!366518 (=> (not res!205034) (not e!224394))))

(assert (=> b!366518 (= res!205034 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10318 _keys!658)))))

(declare-fun b!366519 () Bool)

(assert (=> b!366519 (= e!224394 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72419 (not res!205033)) b!366518))

(assert (= (and b!366518 res!205034) b!366519))

(assert (=> d!72419 m!363797))

(declare-fun m!363821 () Bool)

(assert (=> b!366519 m!363821))

(assert (=> b!366432 d!72419))

(declare-fun b!366520 () Bool)

(declare-fun e!224396 () Bool)

(declare-fun call!27301 () Bool)

(assert (=> b!366520 (= e!224396 call!27301)))

(declare-fun d!72421 () Bool)

(declare-fun res!205036 () Bool)

(declare-fun e!224395 () Bool)

(assert (=> d!72421 (=> res!205036 e!224395)))

(assert (=> d!72421 (= res!205036 (bvsge #b00000000000000000000000000000000 (size!10318 _keys!658)))))

(assert (=> d!72421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224395)))

(declare-fun b!366521 () Bool)

(declare-fun e!224397 () Bool)

(assert (=> b!366521 (= e!224397 e!224396)))

(declare-fun lt!169247 () (_ BitVec 64))

(assert (=> b!366521 (= lt!169247 (select (arr!9966 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!169245 () Unit!11394)

(assert (=> b!366521 (= lt!169245 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169247 #b00000000000000000000000000000000))))

(assert (=> b!366521 (arrayContainsKey!0 _keys!658 lt!169247 #b00000000000000000000000000000000)))

(declare-fun lt!169246 () Unit!11394)

(assert (=> b!366521 (= lt!169246 lt!169245)))

(declare-fun res!205035 () Bool)

(assert (=> b!366521 (= res!205035 (= (seekEntryOrOpen!0 (select (arr!9966 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3506 #b00000000000000000000000000000000)))))

(assert (=> b!366521 (=> (not res!205035) (not e!224396))))

(declare-fun b!366522 () Bool)

(assert (=> b!366522 (= e!224395 e!224397)))

(declare-fun c!53917 () Bool)

(assert (=> b!366522 (= c!53917 (validKeyInArray!0 (select (arr!9966 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366523 () Bool)

(assert (=> b!366523 (= e!224397 call!27301)))

(declare-fun bm!27298 () Bool)

(assert (=> bm!27298 (= call!27301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!72421 (not res!205036)) b!366522))

(assert (= (and b!366522 c!53917) b!366521))

(assert (= (and b!366522 (not c!53917)) b!366523))

(assert (= (and b!366521 res!205035) b!366520))

(assert (= (or b!366520 b!366523) bm!27298))

(assert (=> b!366521 m!363797))

(declare-fun m!363823 () Bool)

(assert (=> b!366521 m!363823))

(declare-fun m!363825 () Bool)

(assert (=> b!366521 m!363825))

(assert (=> b!366521 m!363797))

(declare-fun m!363827 () Bool)

(assert (=> b!366521 m!363827))

(assert (=> b!366522 m!363797))

(assert (=> b!366522 m!363797))

(assert (=> b!366522 m!363803))

(declare-fun m!363829 () Bool)

(assert (=> bm!27298 m!363829))

(assert (=> b!366434 d!72421))

(declare-fun b!366531 () Bool)

(declare-fun e!224403 () Bool)

(assert (=> b!366531 (= e!224403 tp_is_empty!8517)))

(declare-fun mapIsEmpty!14340 () Bool)

(declare-fun mapRes!14340 () Bool)

(assert (=> mapIsEmpty!14340 mapRes!14340))

(declare-fun b!366530 () Bool)

(declare-fun e!224402 () Bool)

(assert (=> b!366530 (= e!224402 tp_is_empty!8517)))

(declare-fun condMapEmpty!14340 () Bool)

(declare-fun mapDefault!14340 () ValueCell!3915)

(assert (=> mapNonEmpty!14334 (= condMapEmpty!14340 (= mapRest!14334 ((as const (Array (_ BitVec 32) ValueCell!3915)) mapDefault!14340)))))

(assert (=> mapNonEmpty!14334 (= tp!28410 (and e!224403 mapRes!14340))))

(declare-fun mapNonEmpty!14340 () Bool)

(declare-fun tp!28416 () Bool)

(assert (=> mapNonEmpty!14340 (= mapRes!14340 (and tp!28416 e!224402))))

(declare-fun mapRest!14340 () (Array (_ BitVec 32) ValueCell!3915))

(declare-fun mapValue!14340 () ValueCell!3915)

(declare-fun mapKey!14340 () (_ BitVec 32))

(assert (=> mapNonEmpty!14340 (= mapRest!14334 (store mapRest!14340 mapKey!14340 mapValue!14340))))

(assert (= (and mapNonEmpty!14334 condMapEmpty!14340) mapIsEmpty!14340))

(assert (= (and mapNonEmpty!14334 (not condMapEmpty!14340)) mapNonEmpty!14340))

(assert (= (and mapNonEmpty!14340 ((_ is ValueCellFull!3915) mapValue!14340)) b!366530))

(assert (= (and mapNonEmpty!14334 ((_ is ValueCellFull!3915) mapDefault!14340)) b!366531))

(declare-fun m!363831 () Bool)

(assert (=> mapNonEmpty!14340 m!363831))

(check-sat (not b!366522) (not b!366501) (not b!366495) (not bm!27298) (not b!366511) (not b!366500) (not b!366521) (not b!366492) (not bm!27294) (not bm!27297) (not b!366512) (not mapNonEmpty!14340) (not b!366519) (not b!366494) tp_is_empty!8517)
(check-sat)
