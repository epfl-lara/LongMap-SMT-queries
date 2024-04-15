; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43634 () Bool)

(assert start!43634)

(declare-fun b_free!12355 () Bool)

(declare-fun b_next!12355 () Bool)

(assert (=> start!43634 (= b_free!12355 (not b_next!12355))))

(declare-fun tp!43357 () Bool)

(declare-fun b_and!21095 () Bool)

(assert (=> start!43634 (= tp!43357 b_and!21095)))

(declare-fun b!483161 () Bool)

(declare-fun e!284322 () Bool)

(declare-fun e!284325 () Bool)

(declare-fun mapRes!22519 () Bool)

(assert (=> b!483161 (= e!284322 (and e!284325 mapRes!22519))))

(declare-fun condMapEmpty!22519 () Bool)

(declare-datatypes ((V!19561 0))(
  ( (V!19562 (val!6981 Int)) )
))
(declare-datatypes ((ValueCell!6572 0))(
  ( (ValueCellFull!6572 (v!9271 V!19561)) (EmptyCell!6572) )
))
(declare-datatypes ((array!31391 0))(
  ( (array!31392 (arr!15095 (Array (_ BitVec 32) ValueCell!6572)) (size!15454 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31391)

(declare-fun mapDefault!22519 () ValueCell!6572)

(assert (=> b!483161 (= condMapEmpty!22519 (= (arr!15095 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6572)) mapDefault!22519)))))

(declare-fun mapIsEmpty!22519 () Bool)

(assert (=> mapIsEmpty!22519 mapRes!22519))

(declare-fun b!483162 () Bool)

(declare-fun res!287943 () Bool)

(declare-fun e!284327 () Bool)

(assert (=> b!483162 (=> (not res!287943) (not e!284327))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31393 0))(
  ( (array!31394 (arr!15096 (Array (_ BitVec 32) (_ BitVec 64))) (size!15455 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31393)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!483162 (= res!287943 (and (= (size!15454 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15455 _keys!1874) (size!15454 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287948 () Bool)

(assert (=> start!43634 (=> (not res!287948) (not e!284327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43634 (= res!287948 (validMask!0 mask!2352))))

(assert (=> start!43634 e!284327))

(assert (=> start!43634 true))

(declare-fun tp_is_empty!13867 () Bool)

(assert (=> start!43634 tp_is_empty!13867))

(declare-fun array_inv!10980 (array!31391) Bool)

(assert (=> start!43634 (and (array_inv!10980 _values!1516) e!284322)))

(assert (=> start!43634 tp!43357))

(declare-fun array_inv!10981 (array!31393) Bool)

(assert (=> start!43634 (array_inv!10981 _keys!1874)))

(declare-fun b!483163 () Bool)

(declare-fun res!287949 () Bool)

(assert (=> b!483163 (=> (not res!287949) (not e!284327))))

(declare-datatypes ((List!9281 0))(
  ( (Nil!9278) (Cons!9277 (h!10133 (_ BitVec 64)) (t!15492 List!9281)) )
))
(declare-fun arrayNoDuplicates!0 (array!31393 (_ BitVec 32) List!9281) Bool)

(assert (=> b!483163 (= res!287949 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9278))))

(declare-fun b!483164 () Bool)

(declare-fun res!287945 () Bool)

(assert (=> b!483164 (=> (not res!287945) (not e!284327))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483164 (= res!287945 (validKeyInArray!0 k0!1332))))

(declare-fun mapNonEmpty!22519 () Bool)

(declare-fun tp!43356 () Bool)

(declare-fun e!284326 () Bool)

(assert (=> mapNonEmpty!22519 (= mapRes!22519 (and tp!43356 e!284326))))

(declare-fun mapKey!22519 () (_ BitVec 32))

(declare-fun mapRest!22519 () (Array (_ BitVec 32) ValueCell!6572))

(declare-fun mapValue!22519 () ValueCell!6572)

(assert (=> mapNonEmpty!22519 (= (arr!15095 _values!1516) (store mapRest!22519 mapKey!22519 mapValue!22519))))

(declare-fun b!483165 () Bool)

(declare-fun e!284328 () Bool)

(assert (=> b!483165 (= e!284328 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483166 () Bool)

(declare-fun res!287946 () Bool)

(assert (=> b!483166 (=> (not res!287946) (not e!284327))))

(declare-fun minValue!1458 () V!19561)

(declare-fun zeroValue!1458 () V!19561)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9216 0))(
  ( (tuple2!9217 (_1!4619 (_ BitVec 64)) (_2!4619 V!19561)) )
))
(declare-datatypes ((List!9282 0))(
  ( (Nil!9279) (Cons!9278 (h!10134 tuple2!9216) (t!15493 List!9282)) )
))
(declare-datatypes ((ListLongMap!8119 0))(
  ( (ListLongMap!8120 (toList!4075 List!9282)) )
))
(declare-fun contains!2657 (ListLongMap!8119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2328 (array!31393 array!31391 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 32) Int) ListLongMap!8119)

(assert (=> b!483166 (= res!287946 (contains!2657 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun e!284324 () Bool)

(declare-datatypes ((SeekEntryResult!3571 0))(
  ( (MissingZero!3571 (index!16463 (_ BitVec 32))) (Found!3571 (index!16464 (_ BitVec 32))) (Intermediate!3571 (undefined!4383 Bool) (index!16465 (_ BitVec 32)) (x!45388 (_ BitVec 32))) (Undefined!3571) (MissingVacant!3571 (index!16466 (_ BitVec 32))) )
))
(declare-fun lt!218908 () SeekEntryResult!3571)

(declare-fun b!483167 () Bool)

(assert (=> b!483167 (= e!284324 (= (select (arr!15096 _keys!1874) (index!16464 lt!218908)) k0!1332))))

(declare-fun b!483168 () Bool)

(declare-fun res!287944 () Bool)

(assert (=> b!483168 (=> (not res!287944) (not e!284327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31393 (_ BitVec 32)) Bool)

(assert (=> b!483168 (= res!287944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483169 () Bool)

(assert (=> b!483169 (= e!284325 tp_is_empty!13867)))

(declare-fun b!483170 () Bool)

(declare-fun arrayContainsKey!0 (array!31393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483170 (= e!284328 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483171 () Bool)

(assert (=> b!483171 (= e!284327 (not e!284324))))

(declare-fun res!287947 () Bool)

(assert (=> b!483171 (=> (not res!287947) (not e!284324))))

(get-info :version)

(assert (=> b!483171 (= res!287947 ((_ is Found!3571) lt!218908))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31393 (_ BitVec 32)) SeekEntryResult!3571)

(assert (=> b!483171 (= lt!218908 (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352))))

(declare-fun lt!218910 () (_ BitVec 32))

(assert (=> b!483171 (arrayForallSeekEntryOrOpenFound!0 lt!218910 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14152 0))(
  ( (Unit!14153) )
))
(declare-fun lt!218909 () Unit!14152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14152)

(assert (=> b!483171 (= lt!218909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218910))))

(declare-fun arrayScanForKey!0 (array!31393 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483171 (= lt!218910 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483171 e!284328))

(declare-fun c!58043 () Bool)

(assert (=> b!483171 (= c!58043 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218911 () Unit!14152)

(declare-fun lemmaKeyInListMapIsInArray!160 (array!31393 array!31391 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 64) Int) Unit!14152)

(assert (=> b!483171 (= lt!218911 (lemmaKeyInListMapIsInArray!160 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!483172 () Bool)

(declare-fun res!287942 () Bool)

(assert (=> b!483172 (=> (not res!287942) (not e!284324))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483172 (= res!287942 (inRange!0 (index!16464 lt!218908) mask!2352))))

(declare-fun b!483173 () Bool)

(assert (=> b!483173 (= e!284326 tp_is_empty!13867)))

(assert (= (and start!43634 res!287948) b!483162))

(assert (= (and b!483162 res!287943) b!483168))

(assert (= (and b!483168 res!287944) b!483163))

(assert (= (and b!483163 res!287949) b!483166))

(assert (= (and b!483166 res!287946) b!483164))

(assert (= (and b!483164 res!287945) b!483171))

(assert (= (and b!483171 c!58043) b!483170))

(assert (= (and b!483171 (not c!58043)) b!483165))

(assert (= (and b!483171 res!287947) b!483172))

(assert (= (and b!483172 res!287942) b!483167))

(assert (= (and b!483161 condMapEmpty!22519) mapIsEmpty!22519))

(assert (= (and b!483161 (not condMapEmpty!22519)) mapNonEmpty!22519))

(assert (= (and mapNonEmpty!22519 ((_ is ValueCellFull!6572) mapValue!22519)) b!483173))

(assert (= (and b!483161 ((_ is ValueCellFull!6572) mapDefault!22519)) b!483169))

(assert (= start!43634 b!483161))

(declare-fun m!463681 () Bool)

(assert (=> b!483171 m!463681))

(declare-fun m!463683 () Bool)

(assert (=> b!483171 m!463683))

(declare-fun m!463685 () Bool)

(assert (=> b!483171 m!463685))

(declare-fun m!463687 () Bool)

(assert (=> b!483171 m!463687))

(declare-fun m!463689 () Bool)

(assert (=> b!483171 m!463689))

(declare-fun m!463691 () Bool)

(assert (=> start!43634 m!463691))

(declare-fun m!463693 () Bool)

(assert (=> start!43634 m!463693))

(declare-fun m!463695 () Bool)

(assert (=> start!43634 m!463695))

(declare-fun m!463697 () Bool)

(assert (=> b!483168 m!463697))

(declare-fun m!463699 () Bool)

(assert (=> b!483166 m!463699))

(assert (=> b!483166 m!463699))

(declare-fun m!463701 () Bool)

(assert (=> b!483166 m!463701))

(declare-fun m!463703 () Bool)

(assert (=> b!483163 m!463703))

(declare-fun m!463705 () Bool)

(assert (=> b!483167 m!463705))

(declare-fun m!463707 () Bool)

(assert (=> b!483172 m!463707))

(declare-fun m!463709 () Bool)

(assert (=> b!483164 m!463709))

(declare-fun m!463711 () Bool)

(assert (=> mapNonEmpty!22519 m!463711))

(declare-fun m!463713 () Bool)

(assert (=> b!483170 m!463713))

(check-sat (not b!483166) (not b!483170) (not b_next!12355) tp_is_empty!13867 (not mapNonEmpty!22519) (not b!483168) (not b!483172) b_and!21095 (not start!43634) (not b!483171) (not b!483163) (not b!483164))
(check-sat b_and!21095 (not b_next!12355))
(get-model)

(declare-fun d!76707 () Bool)

(assert (=> d!76707 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483164 d!76707))

(declare-fun b!483260 () Bool)

(declare-fun e!284377 () Bool)

(declare-fun e!284379 () Bool)

(assert (=> b!483260 (= e!284377 e!284379)))

(declare-fun lt!218943 () (_ BitVec 64))

(assert (=> b!483260 (= lt!218943 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218944 () Unit!14152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31393 (_ BitVec 64) (_ BitVec 32)) Unit!14152)

(assert (=> b!483260 (= lt!218944 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218943 #b00000000000000000000000000000000))))

(assert (=> b!483260 (arrayContainsKey!0 _keys!1874 lt!218943 #b00000000000000000000000000000000)))

(declare-fun lt!218942 () Unit!14152)

(assert (=> b!483260 (= lt!218942 lt!218944)))

(declare-fun res!288003 () Bool)

(assert (=> b!483260 (= res!288003 (= (seekEntryOrOpen!0 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3571 #b00000000000000000000000000000000)))))

(assert (=> b!483260 (=> (not res!288003) (not e!284379))))

(declare-fun bm!31014 () Bool)

(declare-fun call!31017 () Bool)

(assert (=> bm!31014 (= call!31017 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!483261 () Bool)

(assert (=> b!483261 (= e!284379 call!31017)))

(declare-fun b!483262 () Bool)

(declare-fun e!284378 () Bool)

(assert (=> b!483262 (= e!284378 e!284377)))

(declare-fun c!58052 () Bool)

(assert (=> b!483262 (= c!58052 (validKeyInArray!0 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483263 () Bool)

(assert (=> b!483263 (= e!284377 call!31017)))

(declare-fun d!76709 () Bool)

(declare-fun res!288002 () Bool)

(assert (=> d!76709 (=> res!288002 e!284378)))

(assert (=> d!76709 (= res!288002 (bvsge #b00000000000000000000000000000000 (size!15455 _keys!1874)))))

(assert (=> d!76709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284378)))

(assert (= (and d!76709 (not res!288002)) b!483262))

(assert (= (and b!483262 c!58052) b!483260))

(assert (= (and b!483262 (not c!58052)) b!483263))

(assert (= (and b!483260 res!288003) b!483261))

(assert (= (or b!483261 b!483263) bm!31014))

(declare-fun m!463783 () Bool)

(assert (=> b!483260 m!463783))

(declare-fun m!463785 () Bool)

(assert (=> b!483260 m!463785))

(declare-fun m!463787 () Bool)

(assert (=> b!483260 m!463787))

(assert (=> b!483260 m!463783))

(declare-fun m!463789 () Bool)

(assert (=> b!483260 m!463789))

(declare-fun m!463791 () Bool)

(assert (=> bm!31014 m!463791))

(assert (=> b!483262 m!463783))

(assert (=> b!483262 m!463783))

(declare-fun m!463793 () Bool)

(assert (=> b!483262 m!463793))

(assert (=> b!483168 d!76709))

(declare-fun d!76711 () Bool)

(declare-fun res!288010 () Bool)

(declare-fun e!284389 () Bool)

(assert (=> d!76711 (=> res!288010 e!284389)))

(assert (=> d!76711 (= res!288010 (bvsge #b00000000000000000000000000000000 (size!15455 _keys!1874)))))

(assert (=> d!76711 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9278) e!284389)))

(declare-fun bm!31017 () Bool)

(declare-fun call!31020 () Bool)

(declare-fun c!58055 () Bool)

(assert (=> bm!31017 (= call!31020 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58055 (Cons!9277 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000) Nil!9278) Nil!9278)))))

(declare-fun b!483274 () Bool)

(declare-fun e!284390 () Bool)

(declare-fun contains!2659 (List!9281 (_ BitVec 64)) Bool)

(assert (=> b!483274 (= e!284390 (contains!2659 Nil!9278 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483275 () Bool)

(declare-fun e!284388 () Bool)

(assert (=> b!483275 (= e!284389 e!284388)))

(declare-fun res!288012 () Bool)

(assert (=> b!483275 (=> (not res!288012) (not e!284388))))

(assert (=> b!483275 (= res!288012 (not e!284390))))

(declare-fun res!288011 () Bool)

(assert (=> b!483275 (=> (not res!288011) (not e!284390))))

(assert (=> b!483275 (= res!288011 (validKeyInArray!0 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483276 () Bool)

(declare-fun e!284391 () Bool)

(assert (=> b!483276 (= e!284391 call!31020)))

(declare-fun b!483277 () Bool)

(assert (=> b!483277 (= e!284391 call!31020)))

(declare-fun b!483278 () Bool)

(assert (=> b!483278 (= e!284388 e!284391)))

(assert (=> b!483278 (= c!58055 (validKeyInArray!0 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76711 (not res!288010)) b!483275))

(assert (= (and b!483275 res!288011) b!483274))

(assert (= (and b!483275 res!288012) b!483278))

(assert (= (and b!483278 c!58055) b!483276))

(assert (= (and b!483278 (not c!58055)) b!483277))

(assert (= (or b!483276 b!483277) bm!31017))

(assert (=> bm!31017 m!463783))

(declare-fun m!463795 () Bool)

(assert (=> bm!31017 m!463795))

(assert (=> b!483274 m!463783))

(assert (=> b!483274 m!463783))

(declare-fun m!463797 () Bool)

(assert (=> b!483274 m!463797))

(assert (=> b!483275 m!463783))

(assert (=> b!483275 m!463783))

(assert (=> b!483275 m!463793))

(assert (=> b!483278 m!463783))

(assert (=> b!483278 m!463783))

(assert (=> b!483278 m!463793))

(assert (=> b!483163 d!76711))

(declare-fun b!483291 () Bool)

(declare-fun e!284399 () SeekEntryResult!3571)

(assert (=> b!483291 (= e!284399 Undefined!3571)))

(declare-fun b!483292 () Bool)

(declare-fun e!284400 () SeekEntryResult!3571)

(declare-fun lt!218953 () SeekEntryResult!3571)

(assert (=> b!483292 (= e!284400 (Found!3571 (index!16465 lt!218953)))))

(declare-fun b!483293 () Bool)

(assert (=> b!483293 (= e!284399 e!284400)))

(declare-fun lt!218952 () (_ BitVec 64))

(assert (=> b!483293 (= lt!218952 (select (arr!15096 _keys!1874) (index!16465 lt!218953)))))

(declare-fun c!58063 () Bool)

(assert (=> b!483293 (= c!58063 (= lt!218952 k0!1332))))

(declare-fun b!483294 () Bool)

(declare-fun c!58064 () Bool)

(assert (=> b!483294 (= c!58064 (= lt!218952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!284398 () SeekEntryResult!3571)

(assert (=> b!483294 (= e!284400 e!284398)))

(declare-fun d!76713 () Bool)

(declare-fun lt!218951 () SeekEntryResult!3571)

(assert (=> d!76713 (and (or ((_ is Undefined!3571) lt!218951) (not ((_ is Found!3571) lt!218951)) (and (bvsge (index!16464 lt!218951) #b00000000000000000000000000000000) (bvslt (index!16464 lt!218951) (size!15455 _keys!1874)))) (or ((_ is Undefined!3571) lt!218951) ((_ is Found!3571) lt!218951) (not ((_ is MissingZero!3571) lt!218951)) (and (bvsge (index!16463 lt!218951) #b00000000000000000000000000000000) (bvslt (index!16463 lt!218951) (size!15455 _keys!1874)))) (or ((_ is Undefined!3571) lt!218951) ((_ is Found!3571) lt!218951) ((_ is MissingZero!3571) lt!218951) (not ((_ is MissingVacant!3571) lt!218951)) (and (bvsge (index!16466 lt!218951) #b00000000000000000000000000000000) (bvslt (index!16466 lt!218951) (size!15455 _keys!1874)))) (or ((_ is Undefined!3571) lt!218951) (ite ((_ is Found!3571) lt!218951) (= (select (arr!15096 _keys!1874) (index!16464 lt!218951)) k0!1332) (ite ((_ is MissingZero!3571) lt!218951) (= (select (arr!15096 _keys!1874) (index!16463 lt!218951)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3571) lt!218951) (= (select (arr!15096 _keys!1874) (index!16466 lt!218951)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!76713 (= lt!218951 e!284399)))

(declare-fun c!58062 () Bool)

(assert (=> d!76713 (= c!58062 (and ((_ is Intermediate!3571) lt!218953) (undefined!4383 lt!218953)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31393 (_ BitVec 32)) SeekEntryResult!3571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!76713 (= lt!218953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1332 mask!2352) k0!1332 _keys!1874 mask!2352))))

(assert (=> d!76713 (validMask!0 mask!2352)))

(assert (=> d!76713 (= (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352) lt!218951)))

(declare-fun b!483295 () Bool)

(assert (=> b!483295 (= e!284398 (MissingZero!3571 (index!16465 lt!218953)))))

(declare-fun b!483296 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31393 (_ BitVec 32)) SeekEntryResult!3571)

(assert (=> b!483296 (= e!284398 (seekKeyOrZeroReturnVacant!0 (x!45388 lt!218953) (index!16465 lt!218953) (index!16465 lt!218953) k0!1332 _keys!1874 mask!2352))))

(assert (= (and d!76713 c!58062) b!483291))

(assert (= (and d!76713 (not c!58062)) b!483293))

(assert (= (and b!483293 c!58063) b!483292))

(assert (= (and b!483293 (not c!58063)) b!483294))

(assert (= (and b!483294 c!58064) b!483295))

(assert (= (and b!483294 (not c!58064)) b!483296))

(declare-fun m!463799 () Bool)

(assert (=> b!483293 m!463799))

(declare-fun m!463801 () Bool)

(assert (=> d!76713 m!463801))

(declare-fun m!463803 () Bool)

(assert (=> d!76713 m!463803))

(declare-fun m!463805 () Bool)

(assert (=> d!76713 m!463805))

(declare-fun m!463807 () Bool)

(assert (=> d!76713 m!463807))

(assert (=> d!76713 m!463691))

(declare-fun m!463809 () Bool)

(assert (=> d!76713 m!463809))

(assert (=> d!76713 m!463801))

(declare-fun m!463811 () Bool)

(assert (=> b!483296 m!463811))

(assert (=> b!483171 d!76713))

(declare-fun b!483297 () Bool)

(declare-fun e!284401 () Bool)

(declare-fun e!284403 () Bool)

(assert (=> b!483297 (= e!284401 e!284403)))

(declare-fun lt!218955 () (_ BitVec 64))

(assert (=> b!483297 (= lt!218955 (select (arr!15096 _keys!1874) lt!218910))))

(declare-fun lt!218956 () Unit!14152)

(assert (=> b!483297 (= lt!218956 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218955 lt!218910))))

(assert (=> b!483297 (arrayContainsKey!0 _keys!1874 lt!218955 #b00000000000000000000000000000000)))

(declare-fun lt!218954 () Unit!14152)

(assert (=> b!483297 (= lt!218954 lt!218956)))

(declare-fun res!288014 () Bool)

(assert (=> b!483297 (= res!288014 (= (seekEntryOrOpen!0 (select (arr!15096 _keys!1874) lt!218910) _keys!1874 mask!2352) (Found!3571 lt!218910)))))

(assert (=> b!483297 (=> (not res!288014) (not e!284403))))

(declare-fun bm!31018 () Bool)

(declare-fun call!31021 () Bool)

(assert (=> bm!31018 (= call!31021 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218910 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!483298 () Bool)

(assert (=> b!483298 (= e!284403 call!31021)))

(declare-fun b!483299 () Bool)

(declare-fun e!284402 () Bool)

(assert (=> b!483299 (= e!284402 e!284401)))

(declare-fun c!58065 () Bool)

(assert (=> b!483299 (= c!58065 (validKeyInArray!0 (select (arr!15096 _keys!1874) lt!218910)))))

(declare-fun b!483300 () Bool)

(assert (=> b!483300 (= e!284401 call!31021)))

(declare-fun d!76715 () Bool)

(declare-fun res!288013 () Bool)

(assert (=> d!76715 (=> res!288013 e!284402)))

(assert (=> d!76715 (= res!288013 (bvsge lt!218910 (size!15455 _keys!1874)))))

(assert (=> d!76715 (= (arrayForallSeekEntryOrOpenFound!0 lt!218910 _keys!1874 mask!2352) e!284402)))

(assert (= (and d!76715 (not res!288013)) b!483299))

(assert (= (and b!483299 c!58065) b!483297))

(assert (= (and b!483299 (not c!58065)) b!483300))

(assert (= (and b!483297 res!288014) b!483298))

(assert (= (or b!483298 b!483300) bm!31018))

(declare-fun m!463813 () Bool)

(assert (=> b!483297 m!463813))

(declare-fun m!463815 () Bool)

(assert (=> b!483297 m!463815))

(declare-fun m!463817 () Bool)

(assert (=> b!483297 m!463817))

(assert (=> b!483297 m!463813))

(declare-fun m!463819 () Bool)

(assert (=> b!483297 m!463819))

(declare-fun m!463821 () Bool)

(assert (=> bm!31018 m!463821))

(assert (=> b!483299 m!463813))

(assert (=> b!483299 m!463813))

(declare-fun m!463823 () Bool)

(assert (=> b!483299 m!463823))

(assert (=> b!483171 d!76715))

(declare-fun d!76717 () Bool)

(assert (=> d!76717 (arrayForallSeekEntryOrOpenFound!0 lt!218910 _keys!1874 mask!2352)))

(declare-fun lt!218959 () Unit!14152)

(declare-fun choose!38 (array!31393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14152)

(assert (=> d!76717 (= lt!218959 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218910))))

(assert (=> d!76717 (validMask!0 mask!2352)))

(assert (=> d!76717 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218910) lt!218959)))

(declare-fun bs!15339 () Bool)

(assert (= bs!15339 d!76717))

(assert (=> bs!15339 m!463685))

(declare-fun m!463825 () Bool)

(assert (=> bs!15339 m!463825))

(assert (=> bs!15339 m!463691))

(assert (=> b!483171 d!76717))

(declare-fun d!76719 () Bool)

(declare-fun e!284406 () Bool)

(assert (=> d!76719 e!284406))

(declare-fun c!58068 () Bool)

(assert (=> d!76719 (= c!58068 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218962 () Unit!14152)

(declare-fun choose!1389 (array!31393 array!31391 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 64) Int) Unit!14152)

(assert (=> d!76719 (= lt!218962 (choose!1389 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76719 (validMask!0 mask!2352)))

(assert (=> d!76719 (= (lemmaKeyInListMapIsInArray!160 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218962)))

(declare-fun b!483305 () Bool)

(assert (=> b!483305 (= e!284406 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483306 () Bool)

(assert (=> b!483306 (= e!284406 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76719 c!58068) b!483305))

(assert (= (and d!76719 (not c!58068)) b!483306))

(declare-fun m!463827 () Bool)

(assert (=> d!76719 m!463827))

(assert (=> d!76719 m!463691))

(assert (=> b!483305 m!463713))

(assert (=> b!483171 d!76719))

(declare-fun d!76721 () Bool)

(declare-fun lt!218965 () (_ BitVec 32))

(assert (=> d!76721 (and (or (bvslt lt!218965 #b00000000000000000000000000000000) (bvsge lt!218965 (size!15455 _keys!1874)) (and (bvsge lt!218965 #b00000000000000000000000000000000) (bvslt lt!218965 (size!15455 _keys!1874)))) (bvsge lt!218965 #b00000000000000000000000000000000) (bvslt lt!218965 (size!15455 _keys!1874)) (= (select (arr!15096 _keys!1874) lt!218965) k0!1332))))

(declare-fun e!284409 () (_ BitVec 32))

(assert (=> d!76721 (= lt!218965 e!284409)))

(declare-fun c!58071 () Bool)

(assert (=> d!76721 (= c!58071 (= (select (arr!15096 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15455 _keys!1874)) (bvslt (size!15455 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76721 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218965)))

(declare-fun b!483311 () Bool)

(assert (=> b!483311 (= e!284409 #b00000000000000000000000000000000)))

(declare-fun b!483312 () Bool)

(assert (=> b!483312 (= e!284409 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76721 c!58071) b!483311))

(assert (= (and d!76721 (not c!58071)) b!483312))

(declare-fun m!463829 () Bool)

(assert (=> d!76721 m!463829))

(assert (=> d!76721 m!463783))

(declare-fun m!463831 () Bool)

(assert (=> b!483312 m!463831))

(assert (=> b!483171 d!76721))

(declare-fun d!76723 () Bool)

(declare-fun res!288019 () Bool)

(declare-fun e!284414 () Bool)

(assert (=> d!76723 (=> res!288019 e!284414)))

(assert (=> d!76723 (= res!288019 (= (select (arr!15096 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76723 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284414)))

(declare-fun b!483317 () Bool)

(declare-fun e!284415 () Bool)

(assert (=> b!483317 (= e!284414 e!284415)))

(declare-fun res!288020 () Bool)

(assert (=> b!483317 (=> (not res!288020) (not e!284415))))

(assert (=> b!483317 (= res!288020 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15455 _keys!1874)))))

(declare-fun b!483318 () Bool)

(assert (=> b!483318 (= e!284415 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76723 (not res!288019)) b!483317))

(assert (= (and b!483317 res!288020) b!483318))

(assert (=> d!76723 m!463783))

(declare-fun m!463833 () Bool)

(assert (=> b!483318 m!463833))

(assert (=> b!483170 d!76723))

(declare-fun d!76725 () Bool)

(assert (=> d!76725 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43634 d!76725))

(declare-fun d!76727 () Bool)

(assert (=> d!76727 (= (array_inv!10980 _values!1516) (bvsge (size!15454 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43634 d!76727))

(declare-fun d!76729 () Bool)

(assert (=> d!76729 (= (array_inv!10981 _keys!1874) (bvsge (size!15455 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43634 d!76729))

(declare-fun d!76731 () Bool)

(assert (=> d!76731 (= (inRange!0 (index!16464 lt!218908) mask!2352) (and (bvsge (index!16464 lt!218908) #b00000000000000000000000000000000) (bvslt (index!16464 lt!218908) (bvadd mask!2352 #b00000000000000000000000000000001))))))

(assert (=> b!483172 d!76731))

(declare-fun d!76733 () Bool)

(declare-fun e!284421 () Bool)

(assert (=> d!76733 e!284421))

(declare-fun res!288023 () Bool)

(assert (=> d!76733 (=> res!288023 e!284421)))

(declare-fun lt!218975 () Bool)

(assert (=> d!76733 (= res!288023 (not lt!218975))))

(declare-fun lt!218976 () Bool)

(assert (=> d!76733 (= lt!218975 lt!218976)))

(declare-fun lt!218974 () Unit!14152)

(declare-fun e!284420 () Unit!14152)

(assert (=> d!76733 (= lt!218974 e!284420)))

(declare-fun c!58074 () Bool)

(assert (=> d!76733 (= c!58074 lt!218976)))

(declare-fun containsKey!359 (List!9282 (_ BitVec 64)) Bool)

(assert (=> d!76733 (= lt!218976 (containsKey!359 (toList!4075 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76733 (= (contains!2657 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218975)))

(declare-fun b!483325 () Bool)

(declare-fun lt!218977 () Unit!14152)

(assert (=> b!483325 (= e!284420 lt!218977)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!308 (List!9282 (_ BitVec 64)) Unit!14152)

(assert (=> b!483325 (= lt!218977 (lemmaContainsKeyImpliesGetValueByKeyDefined!308 (toList!4075 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!403 0))(
  ( (Some!402 (v!9274 V!19561)) (None!401) )
))
(declare-fun isDefined!309 (Option!403) Bool)

(declare-fun getValueByKey!397 (List!9282 (_ BitVec 64)) Option!403)

(assert (=> b!483325 (isDefined!309 (getValueByKey!397 (toList!4075 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!483326 () Bool)

(declare-fun Unit!14156 () Unit!14152)

(assert (=> b!483326 (= e!284420 Unit!14156)))

(declare-fun b!483327 () Bool)

(assert (=> b!483327 (= e!284421 (isDefined!309 (getValueByKey!397 (toList!4075 (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76733 c!58074) b!483325))

(assert (= (and d!76733 (not c!58074)) b!483326))

(assert (= (and d!76733 (not res!288023)) b!483327))

(declare-fun m!463835 () Bool)

(assert (=> d!76733 m!463835))

(declare-fun m!463837 () Bool)

(assert (=> b!483325 m!463837))

(declare-fun m!463839 () Bool)

(assert (=> b!483325 m!463839))

(assert (=> b!483325 m!463839))

(declare-fun m!463841 () Bool)

(assert (=> b!483325 m!463841))

(assert (=> b!483327 m!463839))

(assert (=> b!483327 m!463839))

(assert (=> b!483327 m!463841))

(assert (=> b!483166 d!76733))

(declare-fun b!483370 () Bool)

(declare-fun c!58092 () Bool)

(assert (=> b!483370 (= c!58092 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284450 () ListLongMap!8119)

(declare-fun e!284459 () ListLongMap!8119)

(assert (=> b!483370 (= e!284450 e!284459)))

(declare-fun call!31042 () ListLongMap!8119)

(declare-fun c!58088 () Bool)

(declare-fun bm!31033 () Bool)

(declare-fun call!31041 () ListLongMap!8119)

(declare-fun c!58087 () Bool)

(declare-fun call!31036 () ListLongMap!8119)

(declare-fun call!31040 () ListLongMap!8119)

(declare-fun +!1814 (ListLongMap!8119 tuple2!9216) ListLongMap!8119)

(assert (=> bm!31033 (= call!31040 (+!1814 (ite c!58087 call!31042 (ite c!58088 call!31036 call!31041)) (ite (or c!58087 c!58088) (tuple2!9217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun bm!31034 () Bool)

(declare-fun call!31038 () Bool)

(declare-fun lt!219025 () ListLongMap!8119)

(assert (=> bm!31034 (= call!31038 (contains!2657 lt!219025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483371 () Bool)

(declare-fun call!31037 () ListLongMap!8119)

(assert (=> b!483371 (= e!284450 call!31037)))

(declare-fun b!483372 () Bool)

(declare-fun e!284448 () Bool)

(assert (=> b!483372 (= e!284448 (validKeyInArray!0 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483373 () Bool)

(declare-fun e!284449 () Bool)

(declare-fun call!31039 () Bool)

(assert (=> b!483373 (= e!284449 (not call!31039))))

(declare-fun b!483374 () Bool)

(declare-fun e!284460 () Bool)

(assert (=> b!483374 (= e!284460 e!284449)))

(declare-fun c!58089 () Bool)

(assert (=> b!483374 (= c!58089 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483375 () Bool)

(declare-fun e!284454 () Bool)

(assert (=> b!483375 (= e!284449 e!284454)))

(declare-fun res!288046 () Bool)

(assert (=> b!483375 (= res!288046 call!31039)))

(assert (=> b!483375 (=> (not res!288046) (not e!284454))))

(declare-fun d!76735 () Bool)

(assert (=> d!76735 e!284460))

(declare-fun res!288049 () Bool)

(assert (=> d!76735 (=> (not res!288049) (not e!284460))))

(assert (=> d!76735 (= res!288049 (or (bvsge #b00000000000000000000000000000000 (size!15455 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15455 _keys!1874)))))))

(declare-fun lt!219027 () ListLongMap!8119)

(assert (=> d!76735 (= lt!219025 lt!219027)))

(declare-fun lt!219031 () Unit!14152)

(declare-fun e!284455 () Unit!14152)

(assert (=> d!76735 (= lt!219031 e!284455)))

(declare-fun c!58091 () Bool)

(declare-fun e!284451 () Bool)

(assert (=> d!76735 (= c!58091 e!284451)))

(declare-fun res!288043 () Bool)

(assert (=> d!76735 (=> (not res!288043) (not e!284451))))

(assert (=> d!76735 (= res!288043 (bvslt #b00000000000000000000000000000000 (size!15455 _keys!1874)))))

(declare-fun e!284456 () ListLongMap!8119)

(assert (=> d!76735 (= lt!219027 e!284456)))

(assert (=> d!76735 (= c!58087 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76735 (validMask!0 mask!2352)))

(assert (=> d!76735 (= (getCurrentListMap!2328 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!219025)))

(declare-fun b!483376 () Bool)

(assert (=> b!483376 (= e!284451 (validKeyInArray!0 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483377 () Bool)

(declare-fun e!284452 () Bool)

(assert (=> b!483377 (= e!284452 (not call!31038))))

(declare-fun b!483378 () Bool)

(assert (=> b!483378 (= e!284456 e!284450)))

(assert (=> b!483378 (= c!58088 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483379 () Bool)

(declare-fun e!284457 () Bool)

(declare-fun apply!346 (ListLongMap!8119 (_ BitVec 64)) V!19561)

(assert (=> b!483379 (= e!284457 (= (apply!346 lt!219025 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!483380 () Bool)

(declare-fun res!288042 () Bool)

(assert (=> b!483380 (=> (not res!288042) (not e!284460))))

(assert (=> b!483380 (= res!288042 e!284452)))

(declare-fun c!58090 () Bool)

(assert (=> b!483380 (= c!58090 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!483381 () Bool)

(declare-fun res!288044 () Bool)

(assert (=> b!483381 (=> (not res!288044) (not e!284460))))

(declare-fun e!284453 () Bool)

(assert (=> b!483381 (= res!288044 e!284453)))

(declare-fun res!288050 () Bool)

(assert (=> b!483381 (=> res!288050 e!284453)))

(assert (=> b!483381 (= res!288050 (not e!284448))))

(declare-fun res!288048 () Bool)

(assert (=> b!483381 (=> (not res!288048) (not e!284448))))

(assert (=> b!483381 (= res!288048 (bvslt #b00000000000000000000000000000000 (size!15455 _keys!1874)))))

(declare-fun e!284458 () Bool)

(declare-fun b!483382 () Bool)

(declare-fun get!7313 (ValueCell!6572 V!19561) V!19561)

(declare-fun dynLambda!960 (Int (_ BitVec 64)) V!19561)

(assert (=> b!483382 (= e!284458 (= (apply!346 lt!219025 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)) (get!7313 (select (arr!15095 _values!1516) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15454 _values!1516)))))

(assert (=> b!483382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15455 _keys!1874)))))

(declare-fun bm!31035 () Bool)

(assert (=> bm!31035 (= call!31036 call!31042)))

(declare-fun b!483383 () Bool)

(assert (=> b!483383 (= e!284453 e!284458)))

(declare-fun res!288047 () Bool)

(assert (=> b!483383 (=> (not res!288047) (not e!284458))))

(assert (=> b!483383 (= res!288047 (contains!2657 lt!219025 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!483383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15455 _keys!1874)))))

(declare-fun b!483384 () Bool)

(assert (=> b!483384 (= e!284452 e!284457)))

(declare-fun res!288045 () Bool)

(assert (=> b!483384 (= res!288045 call!31038)))

(assert (=> b!483384 (=> (not res!288045) (not e!284457))))

(declare-fun bm!31036 () Bool)

(assert (=> bm!31036 (= call!31037 call!31040)))

(declare-fun b!483385 () Bool)

(assert (=> b!483385 (= e!284459 call!31037)))

(declare-fun b!483386 () Bool)

(assert (=> b!483386 (= e!284454 (= (apply!346 lt!219025 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!483387 () Bool)

(declare-fun lt!219037 () Unit!14152)

(assert (=> b!483387 (= e!284455 lt!219037)))

(declare-fun lt!219033 () ListLongMap!8119)

(declare-fun getCurrentListMapNoExtraKeys!2150 (array!31393 array!31391 (_ BitVec 32) (_ BitVec 32) V!19561 V!19561 (_ BitVec 32) Int) ListLongMap!8119)

(assert (=> b!483387 (= lt!219033 (getCurrentListMapNoExtraKeys!2150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219042 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219029 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219029 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219038 () Unit!14152)

(declare-fun addStillContains!304 (ListLongMap!8119 (_ BitVec 64) V!19561 (_ BitVec 64)) Unit!14152)

(assert (=> b!483387 (= lt!219038 (addStillContains!304 lt!219033 lt!219042 zeroValue!1458 lt!219029))))

(assert (=> b!483387 (contains!2657 (+!1814 lt!219033 (tuple2!9217 lt!219042 zeroValue!1458)) lt!219029)))

(declare-fun lt!219023 () Unit!14152)

(assert (=> b!483387 (= lt!219023 lt!219038)))

(declare-fun lt!219028 () ListLongMap!8119)

(assert (=> b!483387 (= lt!219028 (getCurrentListMapNoExtraKeys!2150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219032 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219032 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219034 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219034 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219040 () Unit!14152)

(declare-fun addApplyDifferent!304 (ListLongMap!8119 (_ BitVec 64) V!19561 (_ BitVec 64)) Unit!14152)

(assert (=> b!483387 (= lt!219040 (addApplyDifferent!304 lt!219028 lt!219032 minValue!1458 lt!219034))))

(assert (=> b!483387 (= (apply!346 (+!1814 lt!219028 (tuple2!9217 lt!219032 minValue!1458)) lt!219034) (apply!346 lt!219028 lt!219034))))

(declare-fun lt!219036 () Unit!14152)

(assert (=> b!483387 (= lt!219036 lt!219040)))

(declare-fun lt!219022 () ListLongMap!8119)

(assert (=> b!483387 (= lt!219022 (getCurrentListMapNoExtraKeys!2150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219030 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219035 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219035 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219039 () Unit!14152)

(assert (=> b!483387 (= lt!219039 (addApplyDifferent!304 lt!219022 lt!219030 zeroValue!1458 lt!219035))))

(assert (=> b!483387 (= (apply!346 (+!1814 lt!219022 (tuple2!9217 lt!219030 zeroValue!1458)) lt!219035) (apply!346 lt!219022 lt!219035))))

(declare-fun lt!219026 () Unit!14152)

(assert (=> b!483387 (= lt!219026 lt!219039)))

(declare-fun lt!219024 () ListLongMap!8119)

(assert (=> b!483387 (= lt!219024 (getCurrentListMapNoExtraKeys!2150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219041 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219043 () (_ BitVec 64))

(assert (=> b!483387 (= lt!219043 (select (arr!15096 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!483387 (= lt!219037 (addApplyDifferent!304 lt!219024 lt!219041 minValue!1458 lt!219043))))

(assert (=> b!483387 (= (apply!346 (+!1814 lt!219024 (tuple2!9217 lt!219041 minValue!1458)) lt!219043) (apply!346 lt!219024 lt!219043))))

(declare-fun bm!31037 () Bool)

(assert (=> bm!31037 (= call!31039 (contains!2657 lt!219025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483388 () Bool)

(assert (=> b!483388 (= e!284456 (+!1814 call!31040 (tuple2!9217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun bm!31038 () Bool)

(assert (=> bm!31038 (= call!31042 (getCurrentListMapNoExtraKeys!2150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!483389 () Bool)

(assert (=> b!483389 (= e!284459 call!31041)))

(declare-fun b!483390 () Bool)

(declare-fun Unit!14157 () Unit!14152)

(assert (=> b!483390 (= e!284455 Unit!14157)))

(declare-fun bm!31039 () Bool)

(assert (=> bm!31039 (= call!31041 call!31036)))

(assert (= (and d!76735 c!58087) b!483388))

(assert (= (and d!76735 (not c!58087)) b!483378))

(assert (= (and b!483378 c!58088) b!483371))

(assert (= (and b!483378 (not c!58088)) b!483370))

(assert (= (and b!483370 c!58092) b!483385))

(assert (= (and b!483370 (not c!58092)) b!483389))

(assert (= (or b!483385 b!483389) bm!31039))

(assert (= (or b!483371 bm!31039) bm!31035))

(assert (= (or b!483371 b!483385) bm!31036))

(assert (= (or b!483388 bm!31035) bm!31038))

(assert (= (or b!483388 bm!31036) bm!31033))

(assert (= (and d!76735 res!288043) b!483376))

(assert (= (and d!76735 c!58091) b!483387))

(assert (= (and d!76735 (not c!58091)) b!483390))

(assert (= (and d!76735 res!288049) b!483381))

(assert (= (and b!483381 res!288048) b!483372))

(assert (= (and b!483381 (not res!288050)) b!483383))

(assert (= (and b!483383 res!288047) b!483382))

(assert (= (and b!483381 res!288044) b!483380))

(assert (= (and b!483380 c!58090) b!483384))

(assert (= (and b!483380 (not c!58090)) b!483377))

(assert (= (and b!483384 res!288045) b!483379))

(assert (= (or b!483384 b!483377) bm!31034))

(assert (= (and b!483380 res!288042) b!483374))

(assert (= (and b!483374 c!58089) b!483375))

(assert (= (and b!483374 (not c!58089)) b!483373))

(assert (= (and b!483375 res!288046) b!483386))

(assert (= (or b!483375 b!483373) bm!31037))

(declare-fun b_lambda!10801 () Bool)

(assert (=> (not b_lambda!10801) (not b!483382)))

(declare-fun t!15498 () Bool)

(declare-fun tb!4165 () Bool)

(assert (=> (and start!43634 (= defaultEntry!1519 defaultEntry!1519) t!15498) tb!4165))

(declare-fun result!7779 () Bool)

(assert (=> tb!4165 (= result!7779 tp_is_empty!13867)))

(assert (=> b!483382 t!15498))

(declare-fun b_and!21101 () Bool)

(assert (= b_and!21095 (and (=> t!15498 result!7779) b_and!21101)))

(declare-fun m!463843 () Bool)

(assert (=> bm!31038 m!463843))

(declare-fun m!463845 () Bool)

(assert (=> b!483379 m!463845))

(assert (=> b!483376 m!463783))

(assert (=> b!483376 m!463783))

(assert (=> b!483376 m!463793))

(declare-fun m!463847 () Bool)

(assert (=> b!483388 m!463847))

(declare-fun m!463849 () Bool)

(assert (=> bm!31033 m!463849))

(assert (=> b!483372 m!463783))

(assert (=> b!483372 m!463783))

(assert (=> b!483372 m!463793))

(declare-fun m!463851 () Bool)

(assert (=> b!483387 m!463851))

(declare-fun m!463853 () Bool)

(assert (=> b!483387 m!463853))

(declare-fun m!463855 () Bool)

(assert (=> b!483387 m!463855))

(declare-fun m!463857 () Bool)

(assert (=> b!483387 m!463857))

(declare-fun m!463859 () Bool)

(assert (=> b!483387 m!463859))

(declare-fun m!463861 () Bool)

(assert (=> b!483387 m!463861))

(declare-fun m!463863 () Bool)

(assert (=> b!483387 m!463863))

(declare-fun m!463865 () Bool)

(assert (=> b!483387 m!463865))

(assert (=> b!483387 m!463857))

(declare-fun m!463867 () Bool)

(assert (=> b!483387 m!463867))

(assert (=> b!483387 m!463783))

(assert (=> b!483387 m!463843))

(declare-fun m!463869 () Bool)

(assert (=> b!483387 m!463869))

(assert (=> b!483387 m!463863))

(declare-fun m!463871 () Bool)

(assert (=> b!483387 m!463871))

(assert (=> b!483387 m!463871))

(declare-fun m!463873 () Bool)

(assert (=> b!483387 m!463873))

(assert (=> b!483387 m!463855))

(declare-fun m!463875 () Bool)

(assert (=> b!483387 m!463875))

(declare-fun m!463877 () Bool)

(assert (=> b!483387 m!463877))

(declare-fun m!463879 () Bool)

(assert (=> b!483387 m!463879))

(declare-fun m!463881 () Bool)

(assert (=> bm!31037 m!463881))

(assert (=> d!76735 m!463691))

(assert (=> b!483383 m!463783))

(assert (=> b!483383 m!463783))

(declare-fun m!463883 () Bool)

(assert (=> b!483383 m!463883))

(assert (=> b!483382 m!463783))

(declare-fun m!463885 () Bool)

(assert (=> b!483382 m!463885))

(declare-fun m!463887 () Bool)

(assert (=> b!483382 m!463887))

(assert (=> b!483382 m!463887))

(declare-fun m!463889 () Bool)

(assert (=> b!483382 m!463889))

(declare-fun m!463891 () Bool)

(assert (=> b!483382 m!463891))

(assert (=> b!483382 m!463889))

(assert (=> b!483382 m!463783))

(declare-fun m!463893 () Bool)

(assert (=> b!483386 m!463893))

(declare-fun m!463895 () Bool)

(assert (=> bm!31034 m!463895))

(assert (=> b!483166 d!76735))

(declare-fun mapNonEmpty!22528 () Bool)

(declare-fun mapRes!22528 () Bool)

(declare-fun tp!43372 () Bool)

(declare-fun e!284466 () Bool)

(assert (=> mapNonEmpty!22528 (= mapRes!22528 (and tp!43372 e!284466))))

(declare-fun mapRest!22528 () (Array (_ BitVec 32) ValueCell!6572))

(declare-fun mapKey!22528 () (_ BitVec 32))

(declare-fun mapValue!22528 () ValueCell!6572)

(assert (=> mapNonEmpty!22528 (= mapRest!22519 (store mapRest!22528 mapKey!22528 mapValue!22528))))

(declare-fun b!483400 () Bool)

(declare-fun e!284465 () Bool)

(assert (=> b!483400 (= e!284465 tp_is_empty!13867)))

(declare-fun mapIsEmpty!22528 () Bool)

(assert (=> mapIsEmpty!22528 mapRes!22528))

(declare-fun condMapEmpty!22528 () Bool)

(declare-fun mapDefault!22528 () ValueCell!6572)

(assert (=> mapNonEmpty!22519 (= condMapEmpty!22528 (= mapRest!22519 ((as const (Array (_ BitVec 32) ValueCell!6572)) mapDefault!22528)))))

(assert (=> mapNonEmpty!22519 (= tp!43356 (and e!284465 mapRes!22528))))

(declare-fun b!483399 () Bool)

(assert (=> b!483399 (= e!284466 tp_is_empty!13867)))

(assert (= (and mapNonEmpty!22519 condMapEmpty!22528) mapIsEmpty!22528))

(assert (= (and mapNonEmpty!22519 (not condMapEmpty!22528)) mapNonEmpty!22528))

(assert (= (and mapNonEmpty!22528 ((_ is ValueCellFull!6572) mapValue!22528)) b!483399))

(assert (= (and mapNonEmpty!22519 ((_ is ValueCellFull!6572) mapDefault!22528)) b!483400))

(declare-fun m!463897 () Bool)

(assert (=> mapNonEmpty!22528 m!463897))

(declare-fun b_lambda!10803 () Bool)

(assert (= b_lambda!10801 (or (and start!43634 b_free!12355) b_lambda!10803)))

(check-sat (not b!483318) (not d!76719) tp_is_empty!13867 (not bm!31018) (not b!483296) (not b!483379) (not b!483386) (not mapNonEmpty!22528) (not bm!31017) (not bm!31034) (not bm!31033) (not b!483262) (not bm!31038) (not b!483327) (not b!483299) (not b!483388) (not b!483297) (not d!76735) (not b!483274) b_and!21101 (not b!483260) (not b!483372) (not b_next!12355) (not b!483382) (not b!483383) (not b!483275) (not b!483312) (not b!483376) (not d!76717) (not b!483305) (not b!483325) (not d!76733) (not b_lambda!10803) (not bm!31014) (not bm!31037) (not d!76713) (not b!483387) (not b!483278))
(check-sat b_and!21101 (not b_next!12355))
