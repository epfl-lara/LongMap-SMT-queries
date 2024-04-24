; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43634 () Bool)

(assert start!43634)

(declare-fun b_free!12355 () Bool)

(declare-fun b_next!12355 () Bool)

(assert (=> start!43634 (= b_free!12355 (not b_next!12355))))

(declare-fun tp!43356 () Bool)

(declare-fun b_and!21131 () Bool)

(assert (=> start!43634 (= tp!43356 b_and!21131)))

(declare-fun mapIsEmpty!22519 () Bool)

(declare-fun mapRes!22519 () Bool)

(assert (=> mapIsEmpty!22519 mapRes!22519))

(declare-fun b!483371 () Bool)

(declare-fun res!288071 () Bool)

(declare-fun e!284462 () Bool)

(assert (=> b!483371 (=> (not res!288071) (not e!284462))))

(declare-datatypes ((SeekEntryResult!3526 0))(
  ( (MissingZero!3526 (index!16283 (_ BitVec 32))) (Found!3526 (index!16284 (_ BitVec 32))) (Intermediate!3526 (undefined!4338 Bool) (index!16285 (_ BitVec 32)) (x!45345 (_ BitVec 32))) (Undefined!3526) (MissingVacant!3526 (index!16286 (_ BitVec 32))) )
))
(declare-fun lt!219157 () SeekEntryResult!3526)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483371 (= res!288071 (inRange!0 (index!16284 lt!219157) mask!2352))))

(declare-fun b!483372 () Bool)

(declare-fun e!284463 () Bool)

(declare-datatypes ((array!31384 0))(
  ( (array!31385 (arr!15091 (Array (_ BitVec 32) (_ BitVec 64))) (size!15449 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31384)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483372 (= e!284463 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483373 () Bool)

(declare-fun e!284460 () Bool)

(declare-fun tp_is_empty!13867 () Bool)

(assert (=> b!483373 (= e!284460 tp_is_empty!13867)))

(declare-fun b!483374 () Bool)

(declare-fun res!288066 () Bool)

(declare-fun e!284457 () Bool)

(assert (=> b!483374 (=> (not res!288066) (not e!284457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31384 (_ BitVec 32)) Bool)

(assert (=> b!483374 (= res!288066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483375 () Bool)

(assert (=> b!483375 (= e!284462 (= (select (arr!15091 _keys!1874) (index!16284 lt!219157)) k0!1332))))

(declare-fun b!483377 () Bool)

(declare-fun res!288067 () Bool)

(assert (=> b!483377 (=> (not res!288067) (not e!284457))))

(declare-datatypes ((V!19561 0))(
  ( (V!19562 (val!6981 Int)) )
))
(declare-fun minValue!1458 () V!19561)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19561)

(declare-datatypes ((ValueCell!6572 0))(
  ( (ValueCellFull!6572 (v!9278 V!19561)) (EmptyCell!6572) )
))
(declare-datatypes ((array!31386 0))(
  ( (array!31387 (arr!15092 (Array (_ BitVec 32) ValueCell!6572)) (size!15450 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31386)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9080 0))(
  ( (tuple2!9081 (_1!4551 (_ BitVec 64)) (_2!4551 V!19561)) )
))
(declare-datatypes ((List!9146 0))(
  ( (Nil!9143) (Cons!9142 (h!9998 tuple2!9080) (t!15358 List!9146)) )
))
(declare-datatypes ((ListLongMap!7995 0))(
  ( (ListLongMap!7996 (toList!4013 List!9146)) )
))
(declare-fun contains!2648 (ListLongMap!7995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2327 (array!31384 array!31386 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 32) Int) ListLongMap!7995)

(assert (=> b!483377 (= res!288067 (contains!2648 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!483378 () Bool)

(assert (=> b!483378 (= e!284463 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483379 () Bool)

(declare-fun res!288070 () Bool)

(assert (=> b!483379 (=> (not res!288070) (not e!284457))))

(assert (=> b!483379 (= res!288070 (and (= (size!15450 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15449 _keys!1874) (size!15450 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22519 () Bool)

(declare-fun tp!43357 () Bool)

(declare-fun e!284461 () Bool)

(assert (=> mapNonEmpty!22519 (= mapRes!22519 (and tp!43357 e!284461))))

(declare-fun mapValue!22519 () ValueCell!6572)

(declare-fun mapRest!22519 () (Array (_ BitVec 32) ValueCell!6572))

(declare-fun mapKey!22519 () (_ BitVec 32))

(assert (=> mapNonEmpty!22519 (= (arr!15092 _values!1516) (store mapRest!22519 mapKey!22519 mapValue!22519))))

(declare-fun b!483380 () Bool)

(assert (=> b!483380 (= e!284461 tp_is_empty!13867)))

(declare-fun b!483381 () Bool)

(declare-fun res!288065 () Bool)

(assert (=> b!483381 (=> (not res!288065) (not e!284457))))

(declare-datatypes ((List!9147 0))(
  ( (Nil!9144) (Cons!9143 (h!9999 (_ BitVec 64)) (t!15359 List!9147)) )
))
(declare-fun arrayNoDuplicates!0 (array!31384 (_ BitVec 32) List!9147) Bool)

(assert (=> b!483381 (= res!288065 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9144))))

(declare-fun b!483382 () Bool)

(declare-fun e!284458 () Bool)

(assert (=> b!483382 (= e!284458 (and e!284460 mapRes!22519))))

(declare-fun condMapEmpty!22519 () Bool)

(declare-fun mapDefault!22519 () ValueCell!6572)

(assert (=> b!483382 (= condMapEmpty!22519 (= (arr!15092 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6572)) mapDefault!22519)))))

(declare-fun b!483383 () Bool)

(declare-fun res!288069 () Bool)

(assert (=> b!483383 (=> (not res!288069) (not e!284457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483383 (= res!288069 (validKeyInArray!0 k0!1332))))

(declare-fun res!288064 () Bool)

(assert (=> start!43634 (=> (not res!288064) (not e!284457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43634 (= res!288064 (validMask!0 mask!2352))))

(assert (=> start!43634 e!284457))

(assert (=> start!43634 true))

(assert (=> start!43634 tp_is_empty!13867))

(declare-fun array_inv!10954 (array!31386) Bool)

(assert (=> start!43634 (and (array_inv!10954 _values!1516) e!284458)))

(assert (=> start!43634 tp!43356))

(declare-fun array_inv!10955 (array!31384) Bool)

(assert (=> start!43634 (array_inv!10955 _keys!1874)))

(declare-fun b!483376 () Bool)

(assert (=> b!483376 (= e!284457 (not e!284462))))

(declare-fun res!288068 () Bool)

(assert (=> b!483376 (=> (not res!288068) (not e!284462))))

(get-info :version)

(assert (=> b!483376 (= res!288068 ((_ is Found!3526) lt!219157))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31384 (_ BitVec 32)) SeekEntryResult!3526)

(assert (=> b!483376 (= lt!219157 (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352))))

(declare-fun lt!219156 () (_ BitVec 32))

(assert (=> b!483376 (arrayForallSeekEntryOrOpenFound!0 lt!219156 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14133 0))(
  ( (Unit!14134) )
))
(declare-fun lt!219155 () Unit!14133)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14133)

(assert (=> b!483376 (= lt!219155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219156))))

(declare-fun arrayScanForKey!0 (array!31384 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483376 (= lt!219156 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483376 e!284463))

(declare-fun c!58087 () Bool)

(assert (=> b!483376 (= c!58087 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219154 () Unit!14133)

(declare-fun lemmaKeyInListMapIsInArray!155 (array!31384 array!31386 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 64) Int) Unit!14133)

(assert (=> b!483376 (= lt!219154 (lemmaKeyInListMapIsInArray!155 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43634 res!288064) b!483379))

(assert (= (and b!483379 res!288070) b!483374))

(assert (= (and b!483374 res!288066) b!483381))

(assert (= (and b!483381 res!288065) b!483377))

(assert (= (and b!483377 res!288067) b!483383))

(assert (= (and b!483383 res!288069) b!483376))

(assert (= (and b!483376 c!58087) b!483372))

(assert (= (and b!483376 (not c!58087)) b!483378))

(assert (= (and b!483376 res!288068) b!483371))

(assert (= (and b!483371 res!288071) b!483375))

(assert (= (and b!483382 condMapEmpty!22519) mapIsEmpty!22519))

(assert (= (and b!483382 (not condMapEmpty!22519)) mapNonEmpty!22519))

(assert (= (and mapNonEmpty!22519 ((_ is ValueCellFull!6572) mapValue!22519)) b!483380))

(assert (= (and b!483382 ((_ is ValueCellFull!6572) mapDefault!22519)) b!483373))

(assert (= start!43634 b!483382))

(declare-fun m!464597 () Bool)

(assert (=> mapNonEmpty!22519 m!464597))

(declare-fun m!464599 () Bool)

(assert (=> b!483375 m!464599))

(declare-fun m!464601 () Bool)

(assert (=> start!43634 m!464601))

(declare-fun m!464603 () Bool)

(assert (=> start!43634 m!464603))

(declare-fun m!464605 () Bool)

(assert (=> start!43634 m!464605))

(declare-fun m!464607 () Bool)

(assert (=> b!483374 m!464607))

(declare-fun m!464609 () Bool)

(assert (=> b!483377 m!464609))

(assert (=> b!483377 m!464609))

(declare-fun m!464611 () Bool)

(assert (=> b!483377 m!464611))

(declare-fun m!464613 () Bool)

(assert (=> b!483383 m!464613))

(declare-fun m!464615 () Bool)

(assert (=> b!483376 m!464615))

(declare-fun m!464617 () Bool)

(assert (=> b!483376 m!464617))

(declare-fun m!464619 () Bool)

(assert (=> b!483376 m!464619))

(declare-fun m!464621 () Bool)

(assert (=> b!483376 m!464621))

(declare-fun m!464623 () Bool)

(assert (=> b!483376 m!464623))

(declare-fun m!464625 () Bool)

(assert (=> b!483381 m!464625))

(declare-fun m!464627 () Bool)

(assert (=> b!483372 m!464627))

(declare-fun m!464629 () Bool)

(assert (=> b!483371 m!464629))

(check-sat (not b!483374) (not mapNonEmpty!22519) tp_is_empty!13867 (not b!483381) (not start!43634) (not b!483377) (not b!483372) (not b_next!12355) b_and!21131 (not b!483383) (not b!483371) (not b!483376))
(check-sat b_and!21131 (not b_next!12355))
(get-model)

(declare-fun b!483470 () Bool)

(declare-fun e!284513 () Bool)

(declare-fun call!31028 () Bool)

(assert (=> b!483470 (= e!284513 call!31028)))

(declare-fun b!483471 () Bool)

(declare-fun e!284514 () Bool)

(assert (=> b!483471 (= e!284514 call!31028)))

(declare-fun d!76939 () Bool)

(declare-fun res!288125 () Bool)

(declare-fun e!284512 () Bool)

(assert (=> d!76939 (=> res!288125 e!284512)))

(assert (=> d!76939 (= res!288125 (bvsge #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (=> d!76939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284512)))

(declare-fun b!483472 () Bool)

(assert (=> b!483472 (= e!284512 e!284514)))

(declare-fun c!58096 () Bool)

(assert (=> b!483472 (= c!58096 (validKeyInArray!0 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483473 () Bool)

(assert (=> b!483473 (= e!284514 e!284513)))

(declare-fun lt!219188 () (_ BitVec 64))

(assert (=> b!483473 (= lt!219188 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219189 () Unit!14133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31384 (_ BitVec 64) (_ BitVec 32)) Unit!14133)

(assert (=> b!483473 (= lt!219189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219188 #b00000000000000000000000000000000))))

(assert (=> b!483473 (arrayContainsKey!0 _keys!1874 lt!219188 #b00000000000000000000000000000000)))

(declare-fun lt!219190 () Unit!14133)

(assert (=> b!483473 (= lt!219190 lt!219189)))

(declare-fun res!288124 () Bool)

(assert (=> b!483473 (= res!288124 (= (seekEntryOrOpen!0 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3526 #b00000000000000000000000000000000)))))

(assert (=> b!483473 (=> (not res!288124) (not e!284513))))

(declare-fun bm!31025 () Bool)

(assert (=> bm!31025 (= call!31028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76939 (not res!288125)) b!483472))

(assert (= (and b!483472 c!58096) b!483473))

(assert (= (and b!483472 (not c!58096)) b!483471))

(assert (= (and b!483473 res!288124) b!483470))

(assert (= (or b!483470 b!483471) bm!31025))

(declare-fun m!464699 () Bool)

(assert (=> b!483472 m!464699))

(assert (=> b!483472 m!464699))

(declare-fun m!464701 () Bool)

(assert (=> b!483472 m!464701))

(assert (=> b!483473 m!464699))

(declare-fun m!464703 () Bool)

(assert (=> b!483473 m!464703))

(declare-fun m!464705 () Bool)

(assert (=> b!483473 m!464705))

(assert (=> b!483473 m!464699))

(declare-fun m!464707 () Bool)

(assert (=> b!483473 m!464707))

(declare-fun m!464709 () Bool)

(assert (=> bm!31025 m!464709))

(assert (=> b!483374 d!76939))

(declare-fun d!76941 () Bool)

(assert (=> d!76941 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483383 d!76941))

(declare-fun b!483484 () Bool)

(declare-fun e!284524 () Bool)

(declare-fun e!284525 () Bool)

(assert (=> b!483484 (= e!284524 e!284525)))

(declare-fun c!58099 () Bool)

(assert (=> b!483484 (= c!58099 (validKeyInArray!0 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483485 () Bool)

(declare-fun e!284523 () Bool)

(assert (=> b!483485 (= e!284523 e!284524)))

(declare-fun res!288134 () Bool)

(assert (=> b!483485 (=> (not res!288134) (not e!284524))))

(declare-fun e!284526 () Bool)

(assert (=> b!483485 (= res!288134 (not e!284526))))

(declare-fun res!288133 () Bool)

(assert (=> b!483485 (=> (not res!288133) (not e!284526))))

(assert (=> b!483485 (= res!288133 (validKeyInArray!0 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483486 () Bool)

(declare-fun call!31031 () Bool)

(assert (=> b!483486 (= e!284525 call!31031)))

(declare-fun b!483487 () Bool)

(assert (=> b!483487 (= e!284525 call!31031)))

(declare-fun d!76943 () Bool)

(declare-fun res!288132 () Bool)

(assert (=> d!76943 (=> res!288132 e!284523)))

(assert (=> d!76943 (= res!288132 (bvsge #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (=> d!76943 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9144) e!284523)))

(declare-fun b!483488 () Bool)

(declare-fun contains!2650 (List!9147 (_ BitVec 64)) Bool)

(assert (=> b!483488 (= e!284526 (contains!2650 Nil!9144 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!31028 () Bool)

(assert (=> bm!31028 (= call!31031 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58099 (Cons!9143 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000) Nil!9144) Nil!9144)))))

(assert (= (and d!76943 (not res!288132)) b!483485))

(assert (= (and b!483485 res!288133) b!483488))

(assert (= (and b!483485 res!288134) b!483484))

(assert (= (and b!483484 c!58099) b!483486))

(assert (= (and b!483484 (not c!58099)) b!483487))

(assert (= (or b!483486 b!483487) bm!31028))

(assert (=> b!483484 m!464699))

(assert (=> b!483484 m!464699))

(assert (=> b!483484 m!464701))

(assert (=> b!483485 m!464699))

(assert (=> b!483485 m!464699))

(assert (=> b!483485 m!464701))

(assert (=> b!483488 m!464699))

(assert (=> b!483488 m!464699))

(declare-fun m!464711 () Bool)

(assert (=> b!483488 m!464711))

(assert (=> bm!31028 m!464699))

(declare-fun m!464713 () Bool)

(assert (=> bm!31028 m!464713))

(assert (=> b!483381 d!76943))

(declare-fun d!76945 () Bool)

(assert (=> d!76945 (= (inRange!0 (index!16284 lt!219157) mask!2352) (and (bvsge (index!16284 lt!219157) #b00000000000000000000000000000000) (bvslt (index!16284 lt!219157) (bvadd mask!2352 #b00000000000000000000000000000001))))))

(assert (=> b!483371 d!76945))

(declare-fun b!483501 () Bool)

(declare-fun c!58106 () Bool)

(declare-fun lt!219198 () (_ BitVec 64))

(assert (=> b!483501 (= c!58106 (= lt!219198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!284534 () SeekEntryResult!3526)

(declare-fun e!284535 () SeekEntryResult!3526)

(assert (=> b!483501 (= e!284534 e!284535)))

(declare-fun b!483502 () Bool)

(declare-fun lt!219199 () SeekEntryResult!3526)

(assert (=> b!483502 (= e!284535 (MissingZero!3526 (index!16285 lt!219199)))))

(declare-fun b!483503 () Bool)

(declare-fun e!284533 () SeekEntryResult!3526)

(assert (=> b!483503 (= e!284533 e!284534)))

(assert (=> b!483503 (= lt!219198 (select (arr!15091 _keys!1874) (index!16285 lt!219199)))))

(declare-fun c!58107 () Bool)

(assert (=> b!483503 (= c!58107 (= lt!219198 k0!1332))))

(declare-fun b!483504 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31384 (_ BitVec 32)) SeekEntryResult!3526)

(assert (=> b!483504 (= e!284535 (seekKeyOrZeroReturnVacant!0 (x!45345 lt!219199) (index!16285 lt!219199) (index!16285 lt!219199) k0!1332 _keys!1874 mask!2352))))

(declare-fun d!76947 () Bool)

(declare-fun lt!219197 () SeekEntryResult!3526)

(assert (=> d!76947 (and (or ((_ is Undefined!3526) lt!219197) (not ((_ is Found!3526) lt!219197)) (and (bvsge (index!16284 lt!219197) #b00000000000000000000000000000000) (bvslt (index!16284 lt!219197) (size!15449 _keys!1874)))) (or ((_ is Undefined!3526) lt!219197) ((_ is Found!3526) lt!219197) (not ((_ is MissingZero!3526) lt!219197)) (and (bvsge (index!16283 lt!219197) #b00000000000000000000000000000000) (bvslt (index!16283 lt!219197) (size!15449 _keys!1874)))) (or ((_ is Undefined!3526) lt!219197) ((_ is Found!3526) lt!219197) ((_ is MissingZero!3526) lt!219197) (not ((_ is MissingVacant!3526) lt!219197)) (and (bvsge (index!16286 lt!219197) #b00000000000000000000000000000000) (bvslt (index!16286 lt!219197) (size!15449 _keys!1874)))) (or ((_ is Undefined!3526) lt!219197) (ite ((_ is Found!3526) lt!219197) (= (select (arr!15091 _keys!1874) (index!16284 lt!219197)) k0!1332) (ite ((_ is MissingZero!3526) lt!219197) (= (select (arr!15091 _keys!1874) (index!16283 lt!219197)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3526) lt!219197) (= (select (arr!15091 _keys!1874) (index!16286 lt!219197)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!76947 (= lt!219197 e!284533)))

(declare-fun c!58108 () Bool)

(assert (=> d!76947 (= c!58108 (and ((_ is Intermediate!3526) lt!219199) (undefined!4338 lt!219199)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31384 (_ BitVec 32)) SeekEntryResult!3526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!76947 (= lt!219199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1332 mask!2352) k0!1332 _keys!1874 mask!2352))))

(assert (=> d!76947 (validMask!0 mask!2352)))

(assert (=> d!76947 (= (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352) lt!219197)))

(declare-fun b!483505 () Bool)

(assert (=> b!483505 (= e!284534 (Found!3526 (index!16285 lt!219199)))))

(declare-fun b!483506 () Bool)

(assert (=> b!483506 (= e!284533 Undefined!3526)))

(assert (= (and d!76947 c!58108) b!483506))

(assert (= (and d!76947 (not c!58108)) b!483503))

(assert (= (and b!483503 c!58107) b!483505))

(assert (= (and b!483503 (not c!58107)) b!483501))

(assert (= (and b!483501 c!58106) b!483502))

(assert (= (and b!483501 (not c!58106)) b!483504))

(declare-fun m!464715 () Bool)

(assert (=> b!483503 m!464715))

(declare-fun m!464717 () Bool)

(assert (=> b!483504 m!464717))

(declare-fun m!464719 () Bool)

(assert (=> d!76947 m!464719))

(assert (=> d!76947 m!464719))

(declare-fun m!464721 () Bool)

(assert (=> d!76947 m!464721))

(declare-fun m!464723 () Bool)

(assert (=> d!76947 m!464723))

(declare-fun m!464725 () Bool)

(assert (=> d!76947 m!464725))

(declare-fun m!464727 () Bool)

(assert (=> d!76947 m!464727))

(assert (=> d!76947 m!464601))

(assert (=> b!483376 d!76947))

(declare-fun b!483507 () Bool)

(declare-fun e!284537 () Bool)

(declare-fun call!31032 () Bool)

(assert (=> b!483507 (= e!284537 call!31032)))

(declare-fun b!483508 () Bool)

(declare-fun e!284538 () Bool)

(assert (=> b!483508 (= e!284538 call!31032)))

(declare-fun d!76949 () Bool)

(declare-fun res!288136 () Bool)

(declare-fun e!284536 () Bool)

(assert (=> d!76949 (=> res!288136 e!284536)))

(assert (=> d!76949 (= res!288136 (bvsge lt!219156 (size!15449 _keys!1874)))))

(assert (=> d!76949 (= (arrayForallSeekEntryOrOpenFound!0 lt!219156 _keys!1874 mask!2352) e!284536)))

(declare-fun b!483509 () Bool)

(assert (=> b!483509 (= e!284536 e!284538)))

(declare-fun c!58109 () Bool)

(assert (=> b!483509 (= c!58109 (validKeyInArray!0 (select (arr!15091 _keys!1874) lt!219156)))))

(declare-fun b!483510 () Bool)

(assert (=> b!483510 (= e!284538 e!284537)))

(declare-fun lt!219200 () (_ BitVec 64))

(assert (=> b!483510 (= lt!219200 (select (arr!15091 _keys!1874) lt!219156))))

(declare-fun lt!219201 () Unit!14133)

(assert (=> b!483510 (= lt!219201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219200 lt!219156))))

(assert (=> b!483510 (arrayContainsKey!0 _keys!1874 lt!219200 #b00000000000000000000000000000000)))

(declare-fun lt!219202 () Unit!14133)

(assert (=> b!483510 (= lt!219202 lt!219201)))

(declare-fun res!288135 () Bool)

(assert (=> b!483510 (= res!288135 (= (seekEntryOrOpen!0 (select (arr!15091 _keys!1874) lt!219156) _keys!1874 mask!2352) (Found!3526 lt!219156)))))

(assert (=> b!483510 (=> (not res!288135) (not e!284537))))

(declare-fun bm!31029 () Bool)

(assert (=> bm!31029 (= call!31032 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!219156 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76949 (not res!288136)) b!483509))

(assert (= (and b!483509 c!58109) b!483510))

(assert (= (and b!483509 (not c!58109)) b!483508))

(assert (= (and b!483510 res!288135) b!483507))

(assert (= (or b!483507 b!483508) bm!31029))

(declare-fun m!464729 () Bool)

(assert (=> b!483509 m!464729))

(assert (=> b!483509 m!464729))

(declare-fun m!464731 () Bool)

(assert (=> b!483509 m!464731))

(assert (=> b!483510 m!464729))

(declare-fun m!464733 () Bool)

(assert (=> b!483510 m!464733))

(declare-fun m!464735 () Bool)

(assert (=> b!483510 m!464735))

(assert (=> b!483510 m!464729))

(declare-fun m!464737 () Bool)

(assert (=> b!483510 m!464737))

(declare-fun m!464739 () Bool)

(assert (=> bm!31029 m!464739))

(assert (=> b!483376 d!76949))

(declare-fun d!76951 () Bool)

(assert (=> d!76951 (arrayForallSeekEntryOrOpenFound!0 lt!219156 _keys!1874 mask!2352)))

(declare-fun lt!219205 () Unit!14133)

(declare-fun choose!38 (array!31384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14133)

(assert (=> d!76951 (= lt!219205 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219156))))

(assert (=> d!76951 (validMask!0 mask!2352)))

(assert (=> d!76951 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219156) lt!219205)))

(declare-fun bs!15385 () Bool)

(assert (= bs!15385 d!76951))

(assert (=> bs!15385 m!464621))

(declare-fun m!464741 () Bool)

(assert (=> bs!15385 m!464741))

(assert (=> bs!15385 m!464601))

(assert (=> b!483376 d!76951))

(declare-fun d!76953 () Bool)

(declare-fun e!284541 () Bool)

(assert (=> d!76953 e!284541))

(declare-fun c!58112 () Bool)

(assert (=> d!76953 (= c!58112 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219208 () Unit!14133)

(declare-fun choose!1387 (array!31384 array!31386 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 64) Int) Unit!14133)

(assert (=> d!76953 (= lt!219208 (choose!1387 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76953 (validMask!0 mask!2352)))

(assert (=> d!76953 (= (lemmaKeyInListMapIsInArray!155 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!219208)))

(declare-fun b!483515 () Bool)

(assert (=> b!483515 (= e!284541 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483516 () Bool)

(assert (=> b!483516 (= e!284541 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76953 c!58112) b!483515))

(assert (= (and d!76953 (not c!58112)) b!483516))

(declare-fun m!464743 () Bool)

(assert (=> d!76953 m!464743))

(assert (=> d!76953 m!464601))

(assert (=> b!483515 m!464627))

(assert (=> b!483376 d!76953))

(declare-fun d!76955 () Bool)

(declare-fun lt!219211 () (_ BitVec 32))

(assert (=> d!76955 (and (or (bvslt lt!219211 #b00000000000000000000000000000000) (bvsge lt!219211 (size!15449 _keys!1874)) (and (bvsge lt!219211 #b00000000000000000000000000000000) (bvslt lt!219211 (size!15449 _keys!1874)))) (bvsge lt!219211 #b00000000000000000000000000000000) (bvslt lt!219211 (size!15449 _keys!1874)) (= (select (arr!15091 _keys!1874) lt!219211) k0!1332))))

(declare-fun e!284544 () (_ BitVec 32))

(assert (=> d!76955 (= lt!219211 e!284544)))

(declare-fun c!58115 () Bool)

(assert (=> d!76955 (= c!58115 (= (select (arr!15091 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)) (bvslt (size!15449 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76955 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!219211)))

(declare-fun b!483521 () Bool)

(assert (=> b!483521 (= e!284544 #b00000000000000000000000000000000)))

(declare-fun b!483522 () Bool)

(assert (=> b!483522 (= e!284544 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76955 c!58115) b!483521))

(assert (= (and d!76955 (not c!58115)) b!483522))

(declare-fun m!464745 () Bool)

(assert (=> d!76955 m!464745))

(assert (=> d!76955 m!464699))

(declare-fun m!464747 () Bool)

(assert (=> b!483522 m!464747))

(assert (=> b!483376 d!76955))

(declare-fun d!76957 () Bool)

(assert (=> d!76957 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43634 d!76957))

(declare-fun d!76959 () Bool)

(assert (=> d!76959 (= (array_inv!10954 _values!1516) (bvsge (size!15450 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43634 d!76959))

(declare-fun d!76961 () Bool)

(assert (=> d!76961 (= (array_inv!10955 _keys!1874) (bvsge (size!15449 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43634 d!76961))

(declare-fun d!76963 () Bool)

(declare-fun res!288141 () Bool)

(declare-fun e!284549 () Bool)

(assert (=> d!76963 (=> res!288141 e!284549)))

(assert (=> d!76963 (= res!288141 (= (select (arr!15091 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76963 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284549)))

(declare-fun b!483527 () Bool)

(declare-fun e!284550 () Bool)

(assert (=> b!483527 (= e!284549 e!284550)))

(declare-fun res!288142 () Bool)

(assert (=> b!483527 (=> (not res!288142) (not e!284550))))

(assert (=> b!483527 (= res!288142 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15449 _keys!1874)))))

(declare-fun b!483528 () Bool)

(assert (=> b!483528 (= e!284550 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76963 (not res!288141)) b!483527))

(assert (= (and b!483527 res!288142) b!483528))

(assert (=> d!76963 m!464699))

(declare-fun m!464749 () Bool)

(assert (=> b!483528 m!464749))

(assert (=> b!483372 d!76963))

(declare-fun d!76965 () Bool)

(declare-fun e!284556 () Bool)

(assert (=> d!76965 e!284556))

(declare-fun res!288145 () Bool)

(assert (=> d!76965 (=> res!288145 e!284556)))

(declare-fun lt!219220 () Bool)

(assert (=> d!76965 (= res!288145 (not lt!219220))))

(declare-fun lt!219221 () Bool)

(assert (=> d!76965 (= lt!219220 lt!219221)))

(declare-fun lt!219222 () Unit!14133)

(declare-fun e!284555 () Unit!14133)

(assert (=> d!76965 (= lt!219222 e!284555)))

(declare-fun c!58118 () Bool)

(assert (=> d!76965 (= c!58118 lt!219221)))

(declare-fun containsKey!361 (List!9146 (_ BitVec 64)) Bool)

(assert (=> d!76965 (= lt!219221 (containsKey!361 (toList!4013 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76965 (= (contains!2648 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!219220)))

(declare-fun b!483535 () Bool)

(declare-fun lt!219223 () Unit!14133)

(assert (=> b!483535 (= e!284555 lt!219223)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!309 (List!9146 (_ BitVec 64)) Unit!14133)

(assert (=> b!483535 (= lt!219223 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4013 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!406 0))(
  ( (Some!405 (v!9281 V!19561)) (None!404) )
))
(declare-fun isDefined!310 (Option!406) Bool)

(declare-fun getValueByKey!400 (List!9146 (_ BitVec 64)) Option!406)

(assert (=> b!483535 (isDefined!310 (getValueByKey!400 (toList!4013 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!483536 () Bool)

(declare-fun Unit!14139 () Unit!14133)

(assert (=> b!483536 (= e!284555 Unit!14139)))

(declare-fun b!483537 () Bool)

(assert (=> b!483537 (= e!284556 (isDefined!310 (getValueByKey!400 (toList!4013 (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76965 c!58118) b!483535))

(assert (= (and d!76965 (not c!58118)) b!483536))

(assert (= (and d!76965 (not res!288145)) b!483537))

(declare-fun m!464751 () Bool)

(assert (=> d!76965 m!464751))

(declare-fun m!464753 () Bool)

(assert (=> b!483535 m!464753))

(declare-fun m!464755 () Bool)

(assert (=> b!483535 m!464755))

(assert (=> b!483535 m!464755))

(declare-fun m!464757 () Bool)

(assert (=> b!483535 m!464757))

(assert (=> b!483537 m!464755))

(assert (=> b!483537 m!464755))

(assert (=> b!483537 m!464757))

(assert (=> b!483377 d!76965))

(declare-fun b!483580 () Bool)

(declare-fun e!284593 () Bool)

(declare-fun lt!219269 () ListLongMap!7995)

(declare-fun apply!346 (ListLongMap!7995 (_ BitVec 64)) V!19561)

(assert (=> b!483580 (= e!284593 (= (apply!346 lt!219269 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun call!31049 () ListLongMap!7995)

(declare-fun bm!31044 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2130 (array!31384 array!31386 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 32) Int) ListLongMap!7995)

(assert (=> bm!31044 (= call!31049 (getCurrentListMapNoExtraKeys!2130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!483581 () Bool)

(declare-fun e!284587 () ListLongMap!7995)

(declare-fun call!31047 () ListLongMap!7995)

(declare-fun +!1785 (ListLongMap!7995 tuple2!9080) ListLongMap!7995)

(assert (=> b!483581 (= e!284587 (+!1785 call!31047 (tuple2!9081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!483582 () Bool)

(declare-fun e!284585 () Bool)

(assert (=> b!483582 (= e!284585 (validKeyInArray!0 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483583 () Bool)

(declare-fun e!284595 () Bool)

(declare-fun e!284589 () Bool)

(assert (=> b!483583 (= e!284595 e!284589)))

(declare-fun c!58135 () Bool)

(assert (=> b!483583 (= c!58135 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483584 () Bool)

(declare-fun e!284583 () Bool)

(assert (=> b!483584 (= e!284589 e!284583)))

(declare-fun res!288169 () Bool)

(declare-fun call!31051 () Bool)

(assert (=> b!483584 (= res!288169 call!31051)))

(assert (=> b!483584 (=> (not res!288169) (not e!284583))))

(declare-fun b!483585 () Bool)

(declare-fun res!288165 () Bool)

(assert (=> b!483585 (=> (not res!288165) (not e!284595))))

(declare-fun e!284588 () Bool)

(assert (=> b!483585 (= res!288165 e!284588)))

(declare-fun res!288166 () Bool)

(assert (=> b!483585 (=> res!288166 e!284588)))

(assert (=> b!483585 (= res!288166 (not e!284585))))

(declare-fun res!288171 () Bool)

(assert (=> b!483585 (=> (not res!288171) (not e!284585))))

(assert (=> b!483585 (= res!288171 (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(declare-fun bm!31045 () Bool)

(declare-fun call!31048 () ListLongMap!7995)

(assert (=> bm!31045 (= call!31048 call!31049)))

(declare-fun b!483586 () Bool)

(declare-fun e!284590 () ListLongMap!7995)

(declare-fun call!31050 () ListLongMap!7995)

(assert (=> b!483586 (= e!284590 call!31050)))

(declare-fun b!483587 () Bool)

(declare-fun e!284584 () Unit!14133)

(declare-fun Unit!14140 () Unit!14133)

(assert (=> b!483587 (= e!284584 Unit!14140)))

(declare-fun b!483588 () Bool)

(assert (=> b!483588 (= e!284589 (not call!31051))))

(declare-fun b!483589 () Bool)

(declare-fun e!284592 () Bool)

(assert (=> b!483589 (= e!284588 e!284592)))

(declare-fun res!288170 () Bool)

(assert (=> b!483589 (=> (not res!288170) (not e!284592))))

(assert (=> b!483589 (= res!288170 (contains!2648 lt!219269 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!483589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(declare-fun b!483590 () Bool)

(assert (=> b!483590 (= e!284583 (= (apply!346 lt!219269 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!483591 () Bool)

(declare-fun c!58134 () Bool)

(assert (=> b!483591 (= c!58134 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284594 () ListLongMap!7995)

(assert (=> b!483591 (= e!284594 e!284590)))

(declare-fun c!58131 () Bool)

(declare-fun bm!31046 () Bool)

(declare-fun c!58136 () Bool)

(assert (=> bm!31046 (= call!31047 (+!1785 (ite c!58131 call!31049 (ite c!58136 call!31048 call!31050)) (ite (or c!58131 c!58136) (tuple2!9081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!483592 () Bool)

(declare-fun get!7310 (ValueCell!6572 V!19561) V!19561)

(declare-fun dynLambda!954 (Int (_ BitVec 64)) V!19561)

(assert (=> b!483592 (= e!284592 (= (apply!346 lt!219269 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)) (get!7310 (select (arr!15092 _values!1516) #b00000000000000000000000000000000) (dynLambda!954 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483592 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15450 _values!1516)))))

(assert (=> b!483592 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(declare-fun bm!31047 () Bool)

(assert (=> bm!31047 (= call!31051 (contains!2648 lt!219269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483593 () Bool)

(assert (=> b!483593 (= e!284587 e!284594)))

(assert (=> b!483593 (= c!58136 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483594 () Bool)

(declare-fun e!284586 () Bool)

(assert (=> b!483594 (= e!284586 e!284593)))

(declare-fun res!288164 () Bool)

(declare-fun call!31053 () Bool)

(assert (=> b!483594 (= res!288164 call!31053)))

(assert (=> b!483594 (=> (not res!288164) (not e!284593))))

(declare-fun bm!31048 () Bool)

(assert (=> bm!31048 (= call!31050 call!31048)))

(declare-fun d!76967 () Bool)

(assert (=> d!76967 e!284595))

(declare-fun res!288167 () Bool)

(assert (=> d!76967 (=> (not res!288167) (not e!284595))))

(assert (=> d!76967 (= res!288167 (or (bvsge #b00000000000000000000000000000000 (size!15449 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))))

(declare-fun lt!219268 () ListLongMap!7995)

(assert (=> d!76967 (= lt!219269 lt!219268)))

(declare-fun lt!219276 () Unit!14133)

(assert (=> d!76967 (= lt!219276 e!284584)))

(declare-fun c!58133 () Bool)

(declare-fun e!284591 () Bool)

(assert (=> d!76967 (= c!58133 e!284591)))

(declare-fun res!288168 () Bool)

(assert (=> d!76967 (=> (not res!288168) (not e!284591))))

(assert (=> d!76967 (= res!288168 (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (=> d!76967 (= lt!219268 e!284587)))

(assert (=> d!76967 (= c!58131 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76967 (validMask!0 mask!2352)))

(assert (=> d!76967 (= (getCurrentListMap!2327 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!219269)))

(declare-fun b!483595 () Bool)

(declare-fun lt!219277 () Unit!14133)

(assert (=> b!483595 (= e!284584 lt!219277)))

(declare-fun lt!219272 () ListLongMap!7995)

(assert (=> b!483595 (= lt!219272 (getCurrentListMapNoExtraKeys!2130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219279 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219278 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219278 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219274 () Unit!14133)

(declare-fun addStillContains!304 (ListLongMap!7995 (_ BitVec 64) V!19561 (_ BitVec 64)) Unit!14133)

(assert (=> b!483595 (= lt!219274 (addStillContains!304 lt!219272 lt!219279 zeroValue!1458 lt!219278))))

(assert (=> b!483595 (contains!2648 (+!1785 lt!219272 (tuple2!9081 lt!219279 zeroValue!1458)) lt!219278)))

(declare-fun lt!219281 () Unit!14133)

(assert (=> b!483595 (= lt!219281 lt!219274)))

(declare-fun lt!219270 () ListLongMap!7995)

(assert (=> b!483595 (= lt!219270 (getCurrentListMapNoExtraKeys!2130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219275 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219286 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219286 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219285 () Unit!14133)

(declare-fun addApplyDifferent!304 (ListLongMap!7995 (_ BitVec 64) V!19561 (_ BitVec 64)) Unit!14133)

(assert (=> b!483595 (= lt!219285 (addApplyDifferent!304 lt!219270 lt!219275 minValue!1458 lt!219286))))

(assert (=> b!483595 (= (apply!346 (+!1785 lt!219270 (tuple2!9081 lt!219275 minValue!1458)) lt!219286) (apply!346 lt!219270 lt!219286))))

(declare-fun lt!219273 () Unit!14133)

(assert (=> b!483595 (= lt!219273 lt!219285)))

(declare-fun lt!219283 () ListLongMap!7995)

(assert (=> b!483595 (= lt!219283 (getCurrentListMapNoExtraKeys!2130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219289 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219288 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219288 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219280 () Unit!14133)

(assert (=> b!483595 (= lt!219280 (addApplyDifferent!304 lt!219283 lt!219289 zeroValue!1458 lt!219288))))

(assert (=> b!483595 (= (apply!346 (+!1785 lt!219283 (tuple2!9081 lt!219289 zeroValue!1458)) lt!219288) (apply!346 lt!219283 lt!219288))))

(declare-fun lt!219271 () Unit!14133)

(assert (=> b!483595 (= lt!219271 lt!219280)))

(declare-fun lt!219287 () ListLongMap!7995)

(assert (=> b!483595 (= lt!219287 (getCurrentListMapNoExtraKeys!2130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219282 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219282 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219284 () (_ BitVec 64))

(assert (=> b!483595 (= lt!219284 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!483595 (= lt!219277 (addApplyDifferent!304 lt!219287 lt!219282 minValue!1458 lt!219284))))

(assert (=> b!483595 (= (apply!346 (+!1785 lt!219287 (tuple2!9081 lt!219282 minValue!1458)) lt!219284) (apply!346 lt!219287 lt!219284))))

(declare-fun b!483596 () Bool)

(assert (=> b!483596 (= e!284586 (not call!31053))))

(declare-fun bm!31049 () Bool)

(declare-fun call!31052 () ListLongMap!7995)

(assert (=> bm!31049 (= call!31052 call!31047)))

(declare-fun b!483597 () Bool)

(assert (=> b!483597 (= e!284591 (validKeyInArray!0 (select (arr!15091 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483598 () Bool)

(assert (=> b!483598 (= e!284594 call!31052)))

(declare-fun b!483599 () Bool)

(assert (=> b!483599 (= e!284590 call!31052)))

(declare-fun b!483600 () Bool)

(declare-fun res!288172 () Bool)

(assert (=> b!483600 (=> (not res!288172) (not e!284595))))

(assert (=> b!483600 (= res!288172 e!284586)))

(declare-fun c!58132 () Bool)

(assert (=> b!483600 (= c!58132 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!31050 () Bool)

(assert (=> bm!31050 (= call!31053 (contains!2648 lt!219269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76967 c!58131) b!483581))

(assert (= (and d!76967 (not c!58131)) b!483593))

(assert (= (and b!483593 c!58136) b!483598))

(assert (= (and b!483593 (not c!58136)) b!483591))

(assert (= (and b!483591 c!58134) b!483599))

(assert (= (and b!483591 (not c!58134)) b!483586))

(assert (= (or b!483599 b!483586) bm!31048))

(assert (= (or b!483598 bm!31048) bm!31045))

(assert (= (or b!483598 b!483599) bm!31049))

(assert (= (or b!483581 bm!31045) bm!31044))

(assert (= (or b!483581 bm!31049) bm!31046))

(assert (= (and d!76967 res!288168) b!483597))

(assert (= (and d!76967 c!58133) b!483595))

(assert (= (and d!76967 (not c!58133)) b!483587))

(assert (= (and d!76967 res!288167) b!483585))

(assert (= (and b!483585 res!288171) b!483582))

(assert (= (and b!483585 (not res!288166)) b!483589))

(assert (= (and b!483589 res!288170) b!483592))

(assert (= (and b!483585 res!288165) b!483600))

(assert (= (and b!483600 c!58132) b!483594))

(assert (= (and b!483600 (not c!58132)) b!483596))

(assert (= (and b!483594 res!288164) b!483580))

(assert (= (or b!483594 b!483596) bm!31050))

(assert (= (and b!483600 res!288172) b!483583))

(assert (= (and b!483583 c!58135) b!483584))

(assert (= (and b!483583 (not c!58135)) b!483588))

(assert (= (and b!483584 res!288169) b!483590))

(assert (= (or b!483584 b!483588) bm!31047))

(declare-fun b_lambda!10833 () Bool)

(assert (=> (not b_lambda!10833) (not b!483592)))

(declare-fun t!15363 () Bool)

(declare-fun tb!4165 () Bool)

(assert (=> (and start!43634 (= defaultEntry!1519 defaultEntry!1519) t!15363) tb!4165))

(declare-fun result!7779 () Bool)

(assert (=> tb!4165 (= result!7779 tp_is_empty!13867)))

(assert (=> b!483592 t!15363))

(declare-fun b_and!21137 () Bool)

(assert (= b_and!21131 (and (=> t!15363 result!7779) b_and!21137)))

(declare-fun m!464759 () Bool)

(assert (=> b!483592 m!464759))

(declare-fun m!464761 () Bool)

(assert (=> b!483592 m!464761))

(assert (=> b!483592 m!464759))

(declare-fun m!464763 () Bool)

(assert (=> b!483592 m!464763))

(assert (=> b!483592 m!464699))

(assert (=> b!483592 m!464699))

(declare-fun m!464765 () Bool)

(assert (=> b!483592 m!464765))

(assert (=> b!483592 m!464761))

(declare-fun m!464767 () Bool)

(assert (=> bm!31046 m!464767))

(assert (=> d!76967 m!464601))

(declare-fun m!464769 () Bool)

(assert (=> b!483580 m!464769))

(assert (=> b!483597 m!464699))

(assert (=> b!483597 m!464699))

(assert (=> b!483597 m!464701))

(declare-fun m!464771 () Bool)

(assert (=> bm!31047 m!464771))

(assert (=> b!483589 m!464699))

(assert (=> b!483589 m!464699))

(declare-fun m!464773 () Bool)

(assert (=> b!483589 m!464773))

(assert (=> b!483582 m!464699))

(assert (=> b!483582 m!464699))

(assert (=> b!483582 m!464701))

(declare-fun m!464775 () Bool)

(assert (=> bm!31050 m!464775))

(declare-fun m!464777 () Bool)

(assert (=> b!483581 m!464777))

(declare-fun m!464779 () Bool)

(assert (=> b!483595 m!464779))

(declare-fun m!464781 () Bool)

(assert (=> b!483595 m!464781))

(declare-fun m!464783 () Bool)

(assert (=> b!483595 m!464783))

(declare-fun m!464785 () Bool)

(assert (=> b!483595 m!464785))

(declare-fun m!464787 () Bool)

(assert (=> b!483595 m!464787))

(declare-fun m!464789 () Bool)

(assert (=> b!483595 m!464789))

(declare-fun m!464791 () Bool)

(assert (=> b!483595 m!464791))

(declare-fun m!464793 () Bool)

(assert (=> b!483595 m!464793))

(declare-fun m!464795 () Bool)

(assert (=> b!483595 m!464795))

(declare-fun m!464797 () Bool)

(assert (=> b!483595 m!464797))

(assert (=> b!483595 m!464699))

(declare-fun m!464799 () Bool)

(assert (=> b!483595 m!464799))

(declare-fun m!464801 () Bool)

(assert (=> b!483595 m!464801))

(declare-fun m!464803 () Bool)

(assert (=> b!483595 m!464803))

(assert (=> b!483595 m!464779))

(assert (=> b!483595 m!464795))

(declare-fun m!464805 () Bool)

(assert (=> b!483595 m!464805))

(assert (=> b!483595 m!464799))

(assert (=> b!483595 m!464785))

(declare-fun m!464807 () Bool)

(assert (=> b!483595 m!464807))

(declare-fun m!464809 () Bool)

(assert (=> b!483595 m!464809))

(declare-fun m!464811 () Bool)

(assert (=> b!483590 m!464811))

(assert (=> bm!31044 m!464787))

(assert (=> b!483377 d!76967))

(declare-fun mapNonEmpty!22528 () Bool)

(declare-fun mapRes!22528 () Bool)

(declare-fun tp!43372 () Bool)

(declare-fun e!284601 () Bool)

(assert (=> mapNonEmpty!22528 (= mapRes!22528 (and tp!43372 e!284601))))

(declare-fun mapValue!22528 () ValueCell!6572)

(declare-fun mapRest!22528 () (Array (_ BitVec 32) ValueCell!6572))

(declare-fun mapKey!22528 () (_ BitVec 32))

(assert (=> mapNonEmpty!22528 (= mapRest!22519 (store mapRest!22528 mapKey!22528 mapValue!22528))))

(declare-fun mapIsEmpty!22528 () Bool)

(assert (=> mapIsEmpty!22528 mapRes!22528))

(declare-fun b!483610 () Bool)

(declare-fun e!284600 () Bool)

(assert (=> b!483610 (= e!284600 tp_is_empty!13867)))

(declare-fun b!483609 () Bool)

(assert (=> b!483609 (= e!284601 tp_is_empty!13867)))

(declare-fun condMapEmpty!22528 () Bool)

(declare-fun mapDefault!22528 () ValueCell!6572)

(assert (=> mapNonEmpty!22519 (= condMapEmpty!22528 (= mapRest!22519 ((as const (Array (_ BitVec 32) ValueCell!6572)) mapDefault!22528)))))

(assert (=> mapNonEmpty!22519 (= tp!43357 (and e!284600 mapRes!22528))))

(assert (= (and mapNonEmpty!22519 condMapEmpty!22528) mapIsEmpty!22528))

(assert (= (and mapNonEmpty!22519 (not condMapEmpty!22528)) mapNonEmpty!22528))

(assert (= (and mapNonEmpty!22528 ((_ is ValueCellFull!6572) mapValue!22528)) b!483609))

(assert (= (and mapNonEmpty!22519 ((_ is ValueCellFull!6572) mapDefault!22528)) b!483610))

(declare-fun m!464813 () Bool)

(assert (=> mapNonEmpty!22528 m!464813))

(declare-fun b_lambda!10835 () Bool)

(assert (= b_lambda!10833 (or (and start!43634 b_free!12355) b_lambda!10835)))

(check-sat (not b!483589) (not b!483509) (not bm!31028) (not b!483537) (not b!483522) (not d!76965) (not b!483592) (not b!483597) (not b!483473) (not b!483528) (not bm!31029) (not b!483504) (not b!483485) (not b_next!12355) (not b!483595) b_and!21137 (not b!483580) (not b!483582) tp_is_empty!13867 (not bm!31050) (not b!483484) (not bm!31044) (not d!76953) (not d!76951) (not b!483472) (not d!76947) (not b!483535) (not bm!31046) (not d!76967) (not b!483590) (not b_lambda!10835) (not bm!31047) (not bm!31025) (not b!483488) (not b!483515) (not b!483510) (not b!483581) (not mapNonEmpty!22528))
(check-sat b_and!21137 (not b_next!12355))
