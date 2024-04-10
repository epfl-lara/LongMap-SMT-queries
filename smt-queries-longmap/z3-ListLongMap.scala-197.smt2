; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3804 () Bool)

(assert start!3804)

(declare-fun b!26640 () Bool)

(declare-fun e!17382 () Bool)

(declare-fun e!17381 () Bool)

(declare-fun mapRes!1204 () Bool)

(assert (=> b!26640 (= e!17382 (and e!17381 mapRes!1204))))

(declare-fun condMapEmpty!1204 () Bool)

(declare-datatypes ((V!1325 0))(
  ( (V!1326 (val!589 Int)) )
))
(declare-datatypes ((ValueCell!363 0))(
  ( (ValueCellFull!363 (v!1675 V!1325)) (EmptyCell!363) )
))
(declare-datatypes ((array!1489 0))(
  ( (array!1490 (arr!702 (Array (_ BitVec 32) ValueCell!363)) (size!803 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1489)

(declare-fun mapDefault!1204 () ValueCell!363)

(assert (=> b!26640 (= condMapEmpty!1204 (= (arr!702 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!363)) mapDefault!1204)))))

(declare-fun b!26641 () Bool)

(declare-fun res!15804 () Bool)

(declare-fun e!17384 () Bool)

(assert (=> b!26641 (=> (not res!15804) (not e!17384))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26641 (= res!15804 (validKeyInArray!0 k0!1304))))

(declare-fun b!26642 () Bool)

(declare-datatypes ((array!1491 0))(
  ( (array!1492 (arr!703 (Array (_ BitVec 32) (_ BitVec 64))) (size!804 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1491)

(assert (=> b!26642 (= e!17384 (bvsgt #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(declare-fun b!26643 () Bool)

(declare-fun res!15803 () Bool)

(assert (=> b!26643 (=> (not res!15803) (not e!17384))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26643 (= res!15803 (and (= (size!803 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!804 _keys!1833) (size!803 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!15800 () Bool)

(assert (=> start!3804 (=> (not res!15800) (not e!17384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3804 (= res!15800 (validMask!0 mask!2294))))

(assert (=> start!3804 e!17384))

(assert (=> start!3804 true))

(declare-fun array_inv!483 (array!1489) Bool)

(assert (=> start!3804 (and (array_inv!483 _values!1501) e!17382)))

(declare-fun array_inv!484 (array!1491) Bool)

(assert (=> start!3804 (array_inv!484 _keys!1833)))

(declare-fun b!26644 () Bool)

(declare-fun tp_is_empty!1125 () Bool)

(assert (=> b!26644 (= e!17381 tp_is_empty!1125)))

(declare-fun b!26645 () Bool)

(declare-fun e!17380 () Bool)

(assert (=> b!26645 (= e!17380 tp_is_empty!1125)))

(declare-fun mapNonEmpty!1204 () Bool)

(declare-fun tp!3724 () Bool)

(assert (=> mapNonEmpty!1204 (= mapRes!1204 (and tp!3724 e!17380))))

(declare-fun mapValue!1204 () ValueCell!363)

(declare-fun mapKey!1204 () (_ BitVec 32))

(declare-fun mapRest!1204 () (Array (_ BitVec 32) ValueCell!363))

(assert (=> mapNonEmpty!1204 (= (arr!702 _values!1501) (store mapRest!1204 mapKey!1204 mapValue!1204))))

(declare-fun b!26646 () Bool)

(declare-fun res!15802 () Bool)

(assert (=> b!26646 (=> (not res!15802) (not e!17384))))

(declare-datatypes ((List!597 0))(
  ( (Nil!594) (Cons!593 (h!1160 (_ BitVec 64)) (t!3284 List!597)) )
))
(declare-fun arrayNoDuplicates!0 (array!1491 (_ BitVec 32) List!597) Bool)

(assert (=> b!26646 (= res!15802 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!594))))

(declare-fun mapIsEmpty!1204 () Bool)

(assert (=> mapIsEmpty!1204 mapRes!1204))

(declare-fun b!26647 () Bool)

(declare-fun res!15801 () Bool)

(assert (=> b!26647 (=> (not res!15801) (not e!17384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1491 (_ BitVec 32)) Bool)

(assert (=> b!26647 (= res!15801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3804 res!15800) b!26643))

(assert (= (and b!26643 res!15803) b!26647))

(assert (= (and b!26647 res!15801) b!26646))

(assert (= (and b!26646 res!15802) b!26641))

(assert (= (and b!26641 res!15804) b!26642))

(assert (= (and b!26640 condMapEmpty!1204) mapIsEmpty!1204))

(assert (= (and b!26640 (not condMapEmpty!1204)) mapNonEmpty!1204))

(get-info :version)

(assert (= (and mapNonEmpty!1204 ((_ is ValueCellFull!363) mapValue!1204)) b!26645))

(assert (= (and b!26640 ((_ is ValueCellFull!363) mapDefault!1204)) b!26644))

(assert (= start!3804 b!26640))

(declare-fun m!21343 () Bool)

(assert (=> mapNonEmpty!1204 m!21343))

(declare-fun m!21345 () Bool)

(assert (=> b!26641 m!21345))

(declare-fun m!21347 () Bool)

(assert (=> b!26646 m!21347))

(declare-fun m!21349 () Bool)

(assert (=> b!26647 m!21349))

(declare-fun m!21351 () Bool)

(assert (=> start!3804 m!21351))

(declare-fun m!21353 () Bool)

(assert (=> start!3804 m!21353))

(declare-fun m!21355 () Bool)

(assert (=> start!3804 m!21355))

(check-sat (not b!26647) (not start!3804) (not b!26641) (not mapNonEmpty!1204) (not b!26646) tp_is_empty!1125)
(check-sat)
(get-model)

(declare-fun b!26680 () Bool)

(declare-fun e!17408 () Bool)

(declare-fun call!2504 () Bool)

(assert (=> b!26680 (= e!17408 call!2504)))

(declare-fun d!4895 () Bool)

(declare-fun res!15825 () Bool)

(declare-fun e!17407 () Bool)

(assert (=> d!4895 (=> res!15825 e!17407)))

(assert (=> d!4895 (= res!15825 (bvsge #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(assert (=> d!4895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17407)))

(declare-fun b!26681 () Bool)

(declare-fun e!17406 () Bool)

(assert (=> b!26681 (= e!17406 call!2504)))

(declare-fun b!26682 () Bool)

(assert (=> b!26682 (= e!17407 e!17408)))

(declare-fun c!3653 () Bool)

(assert (=> b!26682 (= c!3653 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2501 () Bool)

(assert (=> bm!2501 (= call!2504 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26683 () Bool)

(assert (=> b!26683 (= e!17408 e!17406)))

(declare-fun lt!10399 () (_ BitVec 64))

(assert (=> b!26683 (= lt!10399 (select (arr!703 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!625 0))(
  ( (Unit!626) )
))
(declare-fun lt!10398 () Unit!625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1491 (_ BitVec 64) (_ BitVec 32)) Unit!625)

(assert (=> b!26683 (= lt!10398 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10399 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26683 (arrayContainsKey!0 _keys!1833 lt!10399 #b00000000000000000000000000000000)))

(declare-fun lt!10400 () Unit!625)

(assert (=> b!26683 (= lt!10400 lt!10398)))

(declare-fun res!15824 () Bool)

(declare-datatypes ((SeekEntryResult!61 0))(
  ( (MissingZero!61 (index!2366 (_ BitVec 32))) (Found!61 (index!2367 (_ BitVec 32))) (Intermediate!61 (undefined!873 Bool) (index!2368 (_ BitVec 32)) (x!6149 (_ BitVec 32))) (Undefined!61) (MissingVacant!61 (index!2369 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1491 (_ BitVec 32)) SeekEntryResult!61)

(assert (=> b!26683 (= res!15824 (= (seekEntryOrOpen!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!61 #b00000000000000000000000000000000)))))

(assert (=> b!26683 (=> (not res!15824) (not e!17406))))

(assert (= (and d!4895 (not res!15825)) b!26682))

(assert (= (and b!26682 c!3653) b!26683))

(assert (= (and b!26682 (not c!3653)) b!26680))

(assert (= (and b!26683 res!15824) b!26681))

(assert (= (or b!26681 b!26680) bm!2501))

(declare-fun m!21371 () Bool)

(assert (=> b!26682 m!21371))

(assert (=> b!26682 m!21371))

(declare-fun m!21373 () Bool)

(assert (=> b!26682 m!21373))

(declare-fun m!21375 () Bool)

(assert (=> bm!2501 m!21375))

(assert (=> b!26683 m!21371))

(declare-fun m!21377 () Bool)

(assert (=> b!26683 m!21377))

(declare-fun m!21379 () Bool)

(assert (=> b!26683 m!21379))

(assert (=> b!26683 m!21371))

(declare-fun m!21381 () Bool)

(assert (=> b!26683 m!21381))

(assert (=> b!26647 d!4895))

(declare-fun bm!2504 () Bool)

(declare-fun call!2507 () Bool)

(declare-fun c!3656 () Bool)

(assert (=> bm!2504 (= call!2507 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3656 (Cons!593 (select (arr!703 _keys!1833) #b00000000000000000000000000000000) Nil!594) Nil!594)))))

(declare-fun b!26694 () Bool)

(declare-fun e!17418 () Bool)

(assert (=> b!26694 (= e!17418 call!2507)))

(declare-fun b!26695 () Bool)

(assert (=> b!26695 (= e!17418 call!2507)))

(declare-fun d!4897 () Bool)

(declare-fun res!15833 () Bool)

(declare-fun e!17420 () Bool)

(assert (=> d!4897 (=> res!15833 e!17420)))

(assert (=> d!4897 (= res!15833 (bvsge #b00000000000000000000000000000000 (size!804 _keys!1833)))))

(assert (=> d!4897 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!594) e!17420)))

(declare-fun b!26696 () Bool)

(declare-fun e!17419 () Bool)

(declare-fun contains!239 (List!597 (_ BitVec 64)) Bool)

(assert (=> b!26696 (= e!17419 (contains!239 Nil!594 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26697 () Bool)

(declare-fun e!17417 () Bool)

(assert (=> b!26697 (= e!17417 e!17418)))

(assert (=> b!26697 (= c!3656 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26698 () Bool)

(assert (=> b!26698 (= e!17420 e!17417)))

(declare-fun res!15832 () Bool)

(assert (=> b!26698 (=> (not res!15832) (not e!17417))))

(assert (=> b!26698 (= res!15832 (not e!17419))))

(declare-fun res!15834 () Bool)

(assert (=> b!26698 (=> (not res!15834) (not e!17419))))

(assert (=> b!26698 (= res!15834 (validKeyInArray!0 (select (arr!703 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4897 (not res!15833)) b!26698))

(assert (= (and b!26698 res!15834) b!26696))

(assert (= (and b!26698 res!15832) b!26697))

(assert (= (and b!26697 c!3656) b!26694))

(assert (= (and b!26697 (not c!3656)) b!26695))

(assert (= (or b!26694 b!26695) bm!2504))

(assert (=> bm!2504 m!21371))

(declare-fun m!21383 () Bool)

(assert (=> bm!2504 m!21383))

(assert (=> b!26696 m!21371))

(assert (=> b!26696 m!21371))

(declare-fun m!21385 () Bool)

(assert (=> b!26696 m!21385))

(assert (=> b!26697 m!21371))

(assert (=> b!26697 m!21371))

(assert (=> b!26697 m!21373))

(assert (=> b!26698 m!21371))

(assert (=> b!26698 m!21371))

(assert (=> b!26698 m!21373))

(assert (=> b!26646 d!4897))

(declare-fun d!4899 () Bool)

(assert (=> d!4899 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3804 d!4899))

(declare-fun d!4901 () Bool)

(assert (=> d!4901 (= (array_inv!483 _values!1501) (bvsge (size!803 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3804 d!4901))

(declare-fun d!4903 () Bool)

(assert (=> d!4903 (= (array_inv!484 _keys!1833) (bvsge (size!804 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3804 d!4903))

(declare-fun d!4905 () Bool)

(assert (=> d!4905 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26641 d!4905))

(declare-fun condMapEmpty!1210 () Bool)

(declare-fun mapDefault!1210 () ValueCell!363)

(assert (=> mapNonEmpty!1204 (= condMapEmpty!1210 (= mapRest!1204 ((as const (Array (_ BitVec 32) ValueCell!363)) mapDefault!1210)))))

(declare-fun e!17426 () Bool)

(declare-fun mapRes!1210 () Bool)

(assert (=> mapNonEmpty!1204 (= tp!3724 (and e!17426 mapRes!1210))))

(declare-fun b!26705 () Bool)

(declare-fun e!17425 () Bool)

(assert (=> b!26705 (= e!17425 tp_is_empty!1125)))

(declare-fun mapIsEmpty!1210 () Bool)

(assert (=> mapIsEmpty!1210 mapRes!1210))

(declare-fun mapNonEmpty!1210 () Bool)

(declare-fun tp!3730 () Bool)

(assert (=> mapNonEmpty!1210 (= mapRes!1210 (and tp!3730 e!17425))))

(declare-fun mapRest!1210 () (Array (_ BitVec 32) ValueCell!363))

(declare-fun mapKey!1210 () (_ BitVec 32))

(declare-fun mapValue!1210 () ValueCell!363)

(assert (=> mapNonEmpty!1210 (= mapRest!1204 (store mapRest!1210 mapKey!1210 mapValue!1210))))

(declare-fun b!26706 () Bool)

(assert (=> b!26706 (= e!17426 tp_is_empty!1125)))

(assert (= (and mapNonEmpty!1204 condMapEmpty!1210) mapIsEmpty!1210))

(assert (= (and mapNonEmpty!1204 (not condMapEmpty!1210)) mapNonEmpty!1210))

(assert (= (and mapNonEmpty!1210 ((_ is ValueCellFull!363) mapValue!1210)) b!26705))

(assert (= (and mapNonEmpty!1204 ((_ is ValueCellFull!363) mapDefault!1210)) b!26706))

(declare-fun m!21387 () Bool)

(assert (=> mapNonEmpty!1210 m!21387))

(check-sat (not b!26697) (not bm!2504) (not b!26682) (not b!26696) (not mapNonEmpty!1210) tp_is_empty!1125 (not bm!2501) (not b!26698) (not b!26683))
(check-sat)
