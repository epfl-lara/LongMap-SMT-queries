; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3798 () Bool)

(assert start!3798)

(declare-fun b!26544 () Bool)

(declare-fun res!15746 () Bool)

(declare-fun e!17313 () Bool)

(assert (=> b!26544 (=> (not res!15746) (not e!17313))))

(declare-datatypes ((array!1465 0))(
  ( (array!1466 (arr!690 (Array (_ BitVec 32) (_ BitVec 64))) (size!791 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1465)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1465 (_ BitVec 32)) Bool)

(assert (=> b!26544 (= res!15746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1201 () Bool)

(declare-fun mapRes!1201 () Bool)

(declare-fun tp!3721 () Bool)

(declare-fun e!17314 () Bool)

(assert (=> mapNonEmpty!1201 (= mapRes!1201 (and tp!3721 e!17314))))

(declare-datatypes ((V!1323 0))(
  ( (V!1324 (val!588 Int)) )
))
(declare-datatypes ((ValueCell!362 0))(
  ( (ValueCellFull!362 (v!1674 V!1323)) (EmptyCell!362) )
))
(declare-datatypes ((array!1467 0))(
  ( (array!1468 (arr!691 (Array (_ BitVec 32) ValueCell!362)) (size!792 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1467)

(declare-fun mapValue!1201 () ValueCell!362)

(declare-fun mapKey!1201 () (_ BitVec 32))

(declare-fun mapRest!1201 () (Array (_ BitVec 32) ValueCell!362))

(assert (=> mapNonEmpty!1201 (= (arr!691 _values!1501) (store mapRest!1201 mapKey!1201 mapValue!1201))))

(declare-fun b!26545 () Bool)

(assert (=> b!26545 (= e!17313 (bvsgt #b00000000000000000000000000000000 (size!791 _keys!1833)))))

(declare-fun b!26546 () Bool)

(declare-fun res!15748 () Bool)

(assert (=> b!26546 (=> (not res!15748) (not e!17313))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26546 (= res!15748 (validKeyInArray!0 k0!1304))))

(declare-fun b!26547 () Bool)

(declare-fun res!15749 () Bool)

(assert (=> b!26547 (=> (not res!15749) (not e!17313))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26547 (= res!15749 (and (= (size!792 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!791 _keys!1833) (size!792 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26548 () Bool)

(declare-fun e!17317 () Bool)

(declare-fun tp_is_empty!1123 () Bool)

(assert (=> b!26548 (= e!17317 tp_is_empty!1123)))

(declare-fun b!26549 () Bool)

(declare-fun e!17315 () Bool)

(assert (=> b!26549 (= e!17315 (and e!17317 mapRes!1201))))

(declare-fun condMapEmpty!1201 () Bool)

(declare-fun mapDefault!1201 () ValueCell!362)

(assert (=> b!26549 (= condMapEmpty!1201 (= (arr!691 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!362)) mapDefault!1201)))))

(declare-fun res!15745 () Bool)

(assert (=> start!3798 (=> (not res!15745) (not e!17313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3798 (= res!15745 (validMask!0 mask!2294))))

(assert (=> start!3798 e!17313))

(assert (=> start!3798 true))

(declare-fun array_inv!481 (array!1467) Bool)

(assert (=> start!3798 (and (array_inv!481 _values!1501) e!17315)))

(declare-fun array_inv!482 (array!1465) Bool)

(assert (=> start!3798 (array_inv!482 _keys!1833)))

(declare-fun mapIsEmpty!1201 () Bool)

(assert (=> mapIsEmpty!1201 mapRes!1201))

(declare-fun b!26550 () Bool)

(declare-fun res!15747 () Bool)

(assert (=> b!26550 (=> (not res!15747) (not e!17313))))

(declare-datatypes ((List!590 0))(
  ( (Nil!587) (Cons!586 (h!1153 (_ BitVec 64)) (t!3271 List!590)) )
))
(declare-fun arrayNoDuplicates!0 (array!1465 (_ BitVec 32) List!590) Bool)

(assert (=> b!26550 (= res!15747 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!587))))

(declare-fun b!26551 () Bool)

(assert (=> b!26551 (= e!17314 tp_is_empty!1123)))

(assert (= (and start!3798 res!15745) b!26547))

(assert (= (and b!26547 res!15749) b!26544))

(assert (= (and b!26544 res!15746) b!26550))

(assert (= (and b!26550 res!15747) b!26546))

(assert (= (and b!26546 res!15748) b!26545))

(assert (= (and b!26549 condMapEmpty!1201) mapIsEmpty!1201))

(assert (= (and b!26549 (not condMapEmpty!1201)) mapNonEmpty!1201))

(get-info :version)

(assert (= (and mapNonEmpty!1201 ((_ is ValueCellFull!362) mapValue!1201)) b!26551))

(assert (= (and b!26549 ((_ is ValueCellFull!362) mapDefault!1201)) b!26548))

(assert (= start!3798 b!26549))

(declare-fun m!21177 () Bool)

(assert (=> b!26550 m!21177))

(declare-fun m!21179 () Bool)

(assert (=> b!26546 m!21179))

(declare-fun m!21181 () Bool)

(assert (=> start!3798 m!21181))

(declare-fun m!21183 () Bool)

(assert (=> start!3798 m!21183))

(declare-fun m!21185 () Bool)

(assert (=> start!3798 m!21185))

(declare-fun m!21187 () Bool)

(assert (=> b!26544 m!21187))

(declare-fun m!21189 () Bool)

(assert (=> mapNonEmpty!1201 m!21189))

(check-sat (not b!26550) (not mapNonEmpty!1201) (not b!26544) tp_is_empty!1123 (not start!3798) (not b!26546))
(check-sat)
(get-model)

(declare-fun b!26610 () Bool)

(declare-fun e!17359 () Bool)

(declare-fun call!2490 () Bool)

(assert (=> b!26610 (= e!17359 call!2490)))

(declare-fun b!26611 () Bool)

(declare-fun e!17357 () Bool)

(declare-fun contains!238 (List!590 (_ BitVec 64)) Bool)

(assert (=> b!26611 (= e!17357 (contains!238 Nil!587 (select (arr!690 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26612 () Bool)

(declare-fun e!17358 () Bool)

(assert (=> b!26612 (= e!17358 e!17359)))

(declare-fun c!3637 () Bool)

(assert (=> b!26612 (= c!3637 (validKeyInArray!0 (select (arr!690 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4859 () Bool)

(declare-fun res!15788 () Bool)

(declare-fun e!17356 () Bool)

(assert (=> d!4859 (=> res!15788 e!17356)))

(assert (=> d!4859 (= res!15788 (bvsge #b00000000000000000000000000000000 (size!791 _keys!1833)))))

(assert (=> d!4859 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!587) e!17356)))

(declare-fun b!26613 () Bool)

(assert (=> b!26613 (= e!17356 e!17358)))

(declare-fun res!15786 () Bool)

(assert (=> b!26613 (=> (not res!15786) (not e!17358))))

(assert (=> b!26613 (= res!15786 (not e!17357))))

(declare-fun res!15787 () Bool)

(assert (=> b!26613 (=> (not res!15787) (not e!17357))))

(assert (=> b!26613 (= res!15787 (validKeyInArray!0 (select (arr!690 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2487 () Bool)

(assert (=> bm!2487 (= call!2490 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3637 (Cons!586 (select (arr!690 _keys!1833) #b00000000000000000000000000000000) Nil!587) Nil!587)))))

(declare-fun b!26614 () Bool)

(assert (=> b!26614 (= e!17359 call!2490)))

(assert (= (and d!4859 (not res!15788)) b!26613))

(assert (= (and b!26613 res!15787) b!26611))

(assert (= (and b!26613 res!15786) b!26612))

(assert (= (and b!26612 c!3637) b!26614))

(assert (= (and b!26612 (not c!3637)) b!26610))

(assert (= (or b!26614 b!26610) bm!2487))

(declare-fun m!21219 () Bool)

(assert (=> b!26611 m!21219))

(assert (=> b!26611 m!21219))

(declare-fun m!21221 () Bool)

(assert (=> b!26611 m!21221))

(assert (=> b!26612 m!21219))

(assert (=> b!26612 m!21219))

(declare-fun m!21223 () Bool)

(assert (=> b!26612 m!21223))

(assert (=> b!26613 m!21219))

(assert (=> b!26613 m!21219))

(assert (=> b!26613 m!21223))

(assert (=> bm!2487 m!21219))

(declare-fun m!21225 () Bool)

(assert (=> bm!2487 m!21225))

(assert (=> b!26550 d!4859))

(declare-fun d!4861 () Bool)

(assert (=> d!4861 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26546 d!4861))

(declare-fun d!4863 () Bool)

(assert (=> d!4863 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3798 d!4863))

(declare-fun d!4865 () Bool)

(assert (=> d!4865 (= (array_inv!481 _values!1501) (bvsge (size!792 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3798 d!4865))

(declare-fun d!4867 () Bool)

(assert (=> d!4867 (= (array_inv!482 _keys!1833) (bvsge (size!791 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3798 d!4867))

(declare-fun b!26623 () Bool)

(declare-fun e!17367 () Bool)

(declare-fun e!17366 () Bool)

(assert (=> b!26623 (= e!17367 e!17366)))

(declare-fun lt!10354 () (_ BitVec 64))

(assert (=> b!26623 (= lt!10354 (select (arr!690 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!633 0))(
  ( (Unit!634) )
))
(declare-fun lt!10356 () Unit!633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1465 (_ BitVec 64) (_ BitVec 32)) Unit!633)

(assert (=> b!26623 (= lt!10356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10354 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26623 (arrayContainsKey!0 _keys!1833 lt!10354 #b00000000000000000000000000000000)))

(declare-fun lt!10355 () Unit!633)

(assert (=> b!26623 (= lt!10355 lt!10356)))

(declare-fun res!15793 () Bool)

(declare-datatypes ((SeekEntryResult!61 0))(
  ( (MissingZero!61 (index!2366 (_ BitVec 32))) (Found!61 (index!2367 (_ BitVec 32))) (Intermediate!61 (undefined!873 Bool) (index!2368 (_ BitVec 32)) (x!6149 (_ BitVec 32))) (Undefined!61) (MissingVacant!61 (index!2369 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1465 (_ BitVec 32)) SeekEntryResult!61)

(assert (=> b!26623 (= res!15793 (= (seekEntryOrOpen!0 (select (arr!690 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!61 #b00000000000000000000000000000000)))))

(assert (=> b!26623 (=> (not res!15793) (not e!17366))))

(declare-fun b!26624 () Bool)

(declare-fun call!2493 () Bool)

(assert (=> b!26624 (= e!17367 call!2493)))

(declare-fun d!4869 () Bool)

(declare-fun res!15794 () Bool)

(declare-fun e!17368 () Bool)

(assert (=> d!4869 (=> res!15794 e!17368)))

(assert (=> d!4869 (= res!15794 (bvsge #b00000000000000000000000000000000 (size!791 _keys!1833)))))

(assert (=> d!4869 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17368)))

(declare-fun bm!2490 () Bool)

(assert (=> bm!2490 (= call!2493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26625 () Bool)

(assert (=> b!26625 (= e!17368 e!17367)))

(declare-fun c!3640 () Bool)

(assert (=> b!26625 (= c!3640 (validKeyInArray!0 (select (arr!690 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26626 () Bool)

(assert (=> b!26626 (= e!17366 call!2493)))

(assert (= (and d!4869 (not res!15794)) b!26625))

(assert (= (and b!26625 c!3640) b!26623))

(assert (= (and b!26625 (not c!3640)) b!26624))

(assert (= (and b!26623 res!15793) b!26626))

(assert (= (or b!26626 b!26624) bm!2490))

(assert (=> b!26623 m!21219))

(declare-fun m!21227 () Bool)

(assert (=> b!26623 m!21227))

(declare-fun m!21229 () Bool)

(assert (=> b!26623 m!21229))

(assert (=> b!26623 m!21219))

(declare-fun m!21231 () Bool)

(assert (=> b!26623 m!21231))

(declare-fun m!21233 () Bool)

(assert (=> bm!2490 m!21233))

(assert (=> b!26625 m!21219))

(assert (=> b!26625 m!21219))

(assert (=> b!26625 m!21223))

(assert (=> b!26544 d!4869))

(declare-fun b!26633 () Bool)

(declare-fun e!17374 () Bool)

(assert (=> b!26633 (= e!17374 tp_is_empty!1123)))

(declare-fun condMapEmpty!1210 () Bool)

(declare-fun mapDefault!1210 () ValueCell!362)

(assert (=> mapNonEmpty!1201 (= condMapEmpty!1210 (= mapRest!1201 ((as const (Array (_ BitVec 32) ValueCell!362)) mapDefault!1210)))))

(declare-fun e!17373 () Bool)

(declare-fun mapRes!1210 () Bool)

(assert (=> mapNonEmpty!1201 (= tp!3721 (and e!17373 mapRes!1210))))

(declare-fun mapIsEmpty!1210 () Bool)

(assert (=> mapIsEmpty!1210 mapRes!1210))

(declare-fun b!26634 () Bool)

(assert (=> b!26634 (= e!17373 tp_is_empty!1123)))

(declare-fun mapNonEmpty!1210 () Bool)

(declare-fun tp!3730 () Bool)

(assert (=> mapNonEmpty!1210 (= mapRes!1210 (and tp!3730 e!17374))))

(declare-fun mapKey!1210 () (_ BitVec 32))

(declare-fun mapValue!1210 () ValueCell!362)

(declare-fun mapRest!1210 () (Array (_ BitVec 32) ValueCell!362))

(assert (=> mapNonEmpty!1210 (= mapRest!1201 (store mapRest!1210 mapKey!1210 mapValue!1210))))

(assert (= (and mapNonEmpty!1201 condMapEmpty!1210) mapIsEmpty!1210))

(assert (= (and mapNonEmpty!1201 (not condMapEmpty!1210)) mapNonEmpty!1210))

(assert (= (and mapNonEmpty!1210 ((_ is ValueCellFull!362) mapValue!1210)) b!26633))

(assert (= (and mapNonEmpty!1201 ((_ is ValueCellFull!362) mapDefault!1210)) b!26634))

(declare-fun m!21235 () Bool)

(assert (=> mapNonEmpty!1210 m!21235))

(check-sat (not mapNonEmpty!1210) (not b!26613) (not bm!2487) tp_is_empty!1123 (not b!26623) (not b!26611) (not bm!2490) (not b!26625) (not b!26612))
(check-sat)
