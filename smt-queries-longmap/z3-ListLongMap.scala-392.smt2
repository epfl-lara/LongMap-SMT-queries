; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7382 () Bool)

(assert start!7382)

(declare-fun mapIsEmpty!2087 () Bool)

(declare-fun mapRes!2087 () Bool)

(assert (=> mapIsEmpty!2087 mapRes!2087))

(declare-fun b!47388 () Bool)

(declare-fun e!30337 () Bool)

(declare-fun tp_is_empty!2031 () Bool)

(assert (=> b!47388 (= e!30337 tp_is_empty!2031)))

(declare-fun b!47389 () Bool)

(declare-fun e!30336 () Bool)

(assert (=> b!47389 (= e!30336 (and e!30337 mapRes!2087))))

(declare-fun condMapEmpty!2087 () Bool)

(declare-datatypes ((V!2441 0))(
  ( (V!2442 (val!1054 Int)) )
))
(declare-datatypes ((ValueCell!726 0))(
  ( (ValueCellFull!726 (v!2114 V!2441)) (EmptyCell!726) )
))
(declare-datatypes ((array!3125 0))(
  ( (array!3126 (arr!1498 (Array (_ BitVec 32) ValueCell!726)) (size!1720 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3125)

(declare-fun mapDefault!2087 () ValueCell!726)

(assert (=> b!47389 (= condMapEmpty!2087 (= (arr!1498 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!726)) mapDefault!2087)))))

(declare-fun mapNonEmpty!2087 () Bool)

(declare-fun tp!6236 () Bool)

(declare-fun e!30340 () Bool)

(assert (=> mapNonEmpty!2087 (= mapRes!2087 (and tp!6236 e!30340))))

(declare-fun mapRest!2087 () (Array (_ BitVec 32) ValueCell!726))

(declare-fun mapValue!2087 () ValueCell!726)

(declare-fun mapKey!2087 () (_ BitVec 32))

(assert (=> mapNonEmpty!2087 (= (arr!1498 _values!1550) (store mapRest!2087 mapKey!2087 mapValue!2087))))

(declare-fun b!47390 () Bool)

(assert (=> b!47390 (= e!30340 tp_is_empty!2031)))

(declare-fun b!47391 () Bool)

(declare-fun res!27572 () Bool)

(declare-fun e!30339 () Bool)

(assert (=> b!47391 (=> (not res!27572) (not e!30339))))

(declare-datatypes ((array!3127 0))(
  ( (array!3128 (arr!1499 (Array (_ BitVec 32) (_ BitVec 64))) (size!1721 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3127)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3127 (_ BitVec 32)) Bool)

(assert (=> b!47391 (= res!27572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun res!27568 () Bool)

(assert (=> start!7382 (=> (not res!27568) (not e!30339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7382 (= res!27568 (validMask!0 mask!2458))))

(assert (=> start!7382 e!30339))

(assert (=> start!7382 true))

(declare-fun array_inv!902 (array!3125) Bool)

(assert (=> start!7382 (and (array_inv!902 _values!1550) e!30336)))

(declare-fun array_inv!903 (array!3127) Bool)

(assert (=> start!7382 (array_inv!903 _keys!1940)))

(declare-fun b!47392 () Bool)

(declare-fun res!27570 () Bool)

(assert (=> b!47392 (=> (not res!27570) (not e!30339))))

(assert (=> b!47392 (= res!27570 (and (bvsle #b00000000000000000000000000000000 (size!1721 _keys!1940)) (bvslt (size!1721 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47393 () Bool)

(declare-fun e!30341 () Bool)

(assert (=> b!47393 (= e!30339 e!30341)))

(declare-fun res!27569 () Bool)

(assert (=> b!47393 (=> res!27569 e!30341)))

(declare-datatypes ((List!1258 0))(
  ( (Nil!1255) (Cons!1254 (h!1834 (_ BitVec 64)) (t!4286 List!1258)) )
))
(declare-fun contains!585 (List!1258 (_ BitVec 64)) Bool)

(assert (=> b!47393 (= res!27569 (contains!585 Nil!1255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47394 () Bool)

(declare-fun res!27573 () Bool)

(assert (=> b!47394 (=> (not res!27573) (not e!30339))))

(declare-fun noDuplicate!39 (List!1258) Bool)

(assert (=> b!47394 (= res!27573 (noDuplicate!39 Nil!1255))))

(declare-fun b!47395 () Bool)

(declare-fun res!27571 () Bool)

(assert (=> b!47395 (=> (not res!27571) (not e!30339))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47395 (= res!27571 (and (= (size!1720 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1721 _keys!1940) (size!1720 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47396 () Bool)

(assert (=> b!47396 (= e!30341 (contains!585 Nil!1255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!7382 res!27568) b!47395))

(assert (= (and b!47395 res!27571) b!47391))

(assert (= (and b!47391 res!27572) b!47392))

(assert (= (and b!47392 res!27570) b!47394))

(assert (= (and b!47394 res!27573) b!47393))

(assert (= (and b!47393 (not res!27569)) b!47396))

(assert (= (and b!47389 condMapEmpty!2087) mapIsEmpty!2087))

(assert (= (and b!47389 (not condMapEmpty!2087)) mapNonEmpty!2087))

(get-info :version)

(assert (= (and mapNonEmpty!2087 ((_ is ValueCellFull!726) mapValue!2087)) b!47390))

(assert (= (and b!47389 ((_ is ValueCellFull!726) mapDefault!2087)) b!47388))

(assert (= start!7382 b!47389))

(declare-fun m!41617 () Bool)

(assert (=> b!47396 m!41617))

(declare-fun m!41619 () Bool)

(assert (=> b!47391 m!41619))

(declare-fun m!41621 () Bool)

(assert (=> start!7382 m!41621))

(declare-fun m!41623 () Bool)

(assert (=> start!7382 m!41623))

(declare-fun m!41625 () Bool)

(assert (=> start!7382 m!41625))

(declare-fun m!41627 () Bool)

(assert (=> mapNonEmpty!2087 m!41627))

(declare-fun m!41629 () Bool)

(assert (=> b!47393 m!41629))

(declare-fun m!41631 () Bool)

(assert (=> b!47394 m!41631))

(check-sat tp_is_empty!2031 (not mapNonEmpty!2087) (not b!47396) (not b!47394) (not start!7382) (not b!47391) (not b!47393))
(check-sat)
(get-model)

(declare-fun d!9447 () Bool)

(assert (=> d!9447 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7382 d!9447))

(declare-fun d!9449 () Bool)

(assert (=> d!9449 (= (array_inv!902 _values!1550) (bvsge (size!1720 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7382 d!9449))

(declare-fun d!9451 () Bool)

(assert (=> d!9451 (= (array_inv!903 _keys!1940) (bvsge (size!1721 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7382 d!9451))

(declare-fun d!9453 () Bool)

(declare-fun lt!20410 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!45 (List!1258) (InoxSet (_ BitVec 64)))

(assert (=> d!9453 (= lt!20410 (select (content!45 Nil!1255) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30364 () Bool)

(assert (=> d!9453 (= lt!20410 e!30364)))

(declare-fun res!27596 () Bool)

(assert (=> d!9453 (=> (not res!27596) (not e!30364))))

(assert (=> d!9453 (= res!27596 ((_ is Cons!1254) Nil!1255))))

(assert (=> d!9453 (= (contains!585 Nil!1255 #b0000000000000000000000000000000000000000000000000000000000000000) lt!20410)))

(declare-fun b!47428 () Bool)

(declare-fun e!30365 () Bool)

(assert (=> b!47428 (= e!30364 e!30365)))

(declare-fun res!27597 () Bool)

(assert (=> b!47428 (=> res!27597 e!30365)))

(assert (=> b!47428 (= res!27597 (= (h!1834 Nil!1255) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47429 () Bool)

(assert (=> b!47429 (= e!30365 (contains!585 (t!4286 Nil!1255) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!9453 res!27596) b!47428))

(assert (= (and b!47428 (not res!27597)) b!47429))

(declare-fun m!41649 () Bool)

(assert (=> d!9453 m!41649))

(declare-fun m!41651 () Bool)

(assert (=> d!9453 m!41651))

(declare-fun m!41653 () Bool)

(assert (=> b!47429 m!41653))

(assert (=> b!47393 d!9453))

(declare-fun d!9455 () Bool)

(declare-fun res!27602 () Bool)

(declare-fun e!30370 () Bool)

(assert (=> d!9455 (=> res!27602 e!30370)))

(assert (=> d!9455 (= res!27602 ((_ is Nil!1255) Nil!1255))))

(assert (=> d!9455 (= (noDuplicate!39 Nil!1255) e!30370)))

(declare-fun b!47434 () Bool)

(declare-fun e!30371 () Bool)

(assert (=> b!47434 (= e!30370 e!30371)))

(declare-fun res!27603 () Bool)

(assert (=> b!47434 (=> (not res!27603) (not e!30371))))

(assert (=> b!47434 (= res!27603 (not (contains!585 (t!4286 Nil!1255) (h!1834 Nil!1255))))))

(declare-fun b!47435 () Bool)

(assert (=> b!47435 (= e!30371 (noDuplicate!39 (t!4286 Nil!1255)))))

(assert (= (and d!9455 (not res!27602)) b!47434))

(assert (= (and b!47434 res!27603) b!47435))

(declare-fun m!41655 () Bool)

(assert (=> b!47434 m!41655))

(declare-fun m!41657 () Bool)

(assert (=> b!47435 m!41657))

(assert (=> b!47394 d!9455))

(declare-fun d!9457 () Bool)

(declare-fun lt!20411 () Bool)

(assert (=> d!9457 (= lt!20411 (select (content!45 Nil!1255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30372 () Bool)

(assert (=> d!9457 (= lt!20411 e!30372)))

(declare-fun res!27604 () Bool)

(assert (=> d!9457 (=> (not res!27604) (not e!30372))))

(assert (=> d!9457 (= res!27604 ((_ is Cons!1254) Nil!1255))))

(assert (=> d!9457 (= (contains!585 Nil!1255 #b1000000000000000000000000000000000000000000000000000000000000000) lt!20411)))

(declare-fun b!47436 () Bool)

(declare-fun e!30373 () Bool)

(assert (=> b!47436 (= e!30372 e!30373)))

(declare-fun res!27605 () Bool)

(assert (=> b!47436 (=> res!27605 e!30373)))

(assert (=> b!47436 (= res!27605 (= (h!1834 Nil!1255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47437 () Bool)

(assert (=> b!47437 (= e!30373 (contains!585 (t!4286 Nil!1255) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!9457 res!27604) b!47436))

(assert (= (and b!47436 (not res!27605)) b!47437))

(assert (=> d!9457 m!41649))

(declare-fun m!41659 () Bool)

(assert (=> d!9457 m!41659))

(declare-fun m!41661 () Bool)

(assert (=> b!47437 m!41661))

(assert (=> b!47396 d!9457))

(declare-fun b!47446 () Bool)

(declare-fun e!30380 () Bool)

(declare-fun call!3721 () Bool)

(assert (=> b!47446 (= e!30380 call!3721)))

(declare-fun b!47447 () Bool)

(declare-fun e!30381 () Bool)

(assert (=> b!47447 (= e!30381 call!3721)))

(declare-fun b!47448 () Bool)

(declare-fun e!30382 () Bool)

(assert (=> b!47448 (= e!30382 e!30381)))

(declare-fun c!6408 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47448 (= c!6408 (validKeyInArray!0 (select (arr!1499 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3718 () Bool)

(assert (=> bm!3718 (= call!3721 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun d!9459 () Bool)

(declare-fun res!27611 () Bool)

(assert (=> d!9459 (=> res!27611 e!30382)))

(assert (=> d!9459 (= res!27611 (bvsge #b00000000000000000000000000000000 (size!1721 _keys!1940)))))

(assert (=> d!9459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30382)))

(declare-fun b!47449 () Bool)

(assert (=> b!47449 (= e!30381 e!30380)))

(declare-fun lt!20420 () (_ BitVec 64))

(assert (=> b!47449 (= lt!20420 (select (arr!1499 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1333 0))(
  ( (Unit!1334) )
))
(declare-fun lt!20419 () Unit!1333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3127 (_ BitVec 64) (_ BitVec 32)) Unit!1333)

(assert (=> b!47449 (= lt!20419 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20420 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47449 (arrayContainsKey!0 _keys!1940 lt!20420 #b00000000000000000000000000000000)))

(declare-fun lt!20418 () Unit!1333)

(assert (=> b!47449 (= lt!20418 lt!20419)))

(declare-fun res!27610 () Bool)

(declare-datatypes ((SeekEntryResult!208 0))(
  ( (MissingZero!208 (index!2954 (_ BitVec 32))) (Found!208 (index!2955 (_ BitVec 32))) (Intermediate!208 (undefined!1020 Bool) (index!2956 (_ BitVec 32)) (x!8748 (_ BitVec 32))) (Undefined!208) (MissingVacant!208 (index!2957 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3127 (_ BitVec 32)) SeekEntryResult!208)

(assert (=> b!47449 (= res!27610 (= (seekEntryOrOpen!0 (select (arr!1499 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!208 #b00000000000000000000000000000000)))))

(assert (=> b!47449 (=> (not res!27610) (not e!30380))))

(assert (= (and d!9459 (not res!27611)) b!47448))

(assert (= (and b!47448 c!6408) b!47449))

(assert (= (and b!47448 (not c!6408)) b!47447))

(assert (= (and b!47449 res!27610) b!47446))

(assert (= (or b!47446 b!47447) bm!3718))

(declare-fun m!41663 () Bool)

(assert (=> b!47448 m!41663))

(assert (=> b!47448 m!41663))

(declare-fun m!41665 () Bool)

(assert (=> b!47448 m!41665))

(declare-fun m!41667 () Bool)

(assert (=> bm!3718 m!41667))

(assert (=> b!47449 m!41663))

(declare-fun m!41669 () Bool)

(assert (=> b!47449 m!41669))

(declare-fun m!41671 () Bool)

(assert (=> b!47449 m!41671))

(assert (=> b!47449 m!41663))

(declare-fun m!41673 () Bool)

(assert (=> b!47449 m!41673))

(assert (=> b!47391 d!9459))

(declare-fun condMapEmpty!2093 () Bool)

(declare-fun mapDefault!2093 () ValueCell!726)

(assert (=> mapNonEmpty!2087 (= condMapEmpty!2093 (= mapRest!2087 ((as const (Array (_ BitVec 32) ValueCell!726)) mapDefault!2093)))))

(declare-fun e!30387 () Bool)

(declare-fun mapRes!2093 () Bool)

(assert (=> mapNonEmpty!2087 (= tp!6236 (and e!30387 mapRes!2093))))

(declare-fun mapIsEmpty!2093 () Bool)

(assert (=> mapIsEmpty!2093 mapRes!2093))

(declare-fun mapNonEmpty!2093 () Bool)

(declare-fun tp!6242 () Bool)

(declare-fun e!30388 () Bool)

(assert (=> mapNonEmpty!2093 (= mapRes!2093 (and tp!6242 e!30388))))

(declare-fun mapKey!2093 () (_ BitVec 32))

(declare-fun mapRest!2093 () (Array (_ BitVec 32) ValueCell!726))

(declare-fun mapValue!2093 () ValueCell!726)

(assert (=> mapNonEmpty!2093 (= mapRest!2087 (store mapRest!2093 mapKey!2093 mapValue!2093))))

(declare-fun b!47457 () Bool)

(assert (=> b!47457 (= e!30387 tp_is_empty!2031)))

(declare-fun b!47456 () Bool)

(assert (=> b!47456 (= e!30388 tp_is_empty!2031)))

(assert (= (and mapNonEmpty!2087 condMapEmpty!2093) mapIsEmpty!2093))

(assert (= (and mapNonEmpty!2087 (not condMapEmpty!2093)) mapNonEmpty!2093))

(assert (= (and mapNonEmpty!2093 ((_ is ValueCellFull!726) mapValue!2093)) b!47456))

(assert (= (and mapNonEmpty!2087 ((_ is ValueCellFull!726) mapDefault!2093)) b!47457))

(declare-fun m!41675 () Bool)

(assert (=> mapNonEmpty!2093 m!41675))

(check-sat tp_is_empty!2031 (not b!47437) (not mapNonEmpty!2093) (not b!47448) (not b!47434) (not d!9457) (not b!47429) (not b!47435) (not d!9453) (not b!47449) (not bm!3718))
(check-sat)
