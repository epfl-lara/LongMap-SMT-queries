; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38182 () Bool)

(assert start!38182)

(declare-fun b_free!9055 () Bool)

(declare-fun b_next!9055 () Bool)

(assert (=> start!38182 (= b_free!9055 (not b_next!9055))))

(declare-fun tp!31950 () Bool)

(declare-fun b_and!16403 () Bool)

(assert (=> start!38182 (= tp!31950 b_and!16403)))

(declare-fun b!393639 () Bool)

(declare-fun res!225601 () Bool)

(declare-fun e!238292 () Bool)

(assert (=> b!393639 (=> (not res!225601) (not e!238292))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23345 0))(
  ( (array!23346 (arr!11130 (Array (_ BitVec 32) (_ BitVec 64))) (size!11483 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23345)

(assert (=> b!393639 (= res!225601 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11483 _keys!658))))))

(declare-fun b!393640 () Bool)

(declare-fun e!238291 () Bool)

(declare-fun e!238295 () Bool)

(assert (=> b!393640 (= e!238291 (not e!238295))))

(declare-fun res!225602 () Bool)

(assert (=> b!393640 (=> res!225602 e!238295)))

(declare-fun lt!186294 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393640 (= res!225602 (or (and (not lt!186294) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186294) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186294)))))

(assert (=> b!393640 (= lt!186294 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!14075 0))(
  ( (V!14076 (val!4908 Int)) )
))
(declare-datatypes ((ValueCell!4520 0))(
  ( (ValueCellFull!4520 (v!7143 V!14075)) (EmptyCell!4520) )
))
(declare-datatypes ((array!23347 0))(
  ( (array!23348 (arr!11131 (Array (_ BitVec 32) ValueCell!4520)) (size!11484 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23347)

(declare-datatypes ((tuple2!6594 0))(
  ( (tuple2!6595 (_1!3308 (_ BitVec 64)) (_2!3308 V!14075)) )
))
(declare-datatypes ((List!6435 0))(
  ( (Nil!6432) (Cons!6431 (h!7287 tuple2!6594) (t!11598 List!6435)) )
))
(declare-datatypes ((ListLongMap!5497 0))(
  ( (ListLongMap!5498 (toList!2764 List!6435)) )
))
(declare-fun lt!186289 () ListLongMap!5497)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14075)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14075)

(declare-fun getCurrentListMap!2079 (array!23345 array!23347 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) Int) ListLongMap!5497)

(assert (=> b!393640 (= lt!186289 (getCurrentListMap!2079 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186295 () array!23347)

(declare-fun lt!186293 () array!23345)

(declare-fun lt!186297 () ListLongMap!5497)

(assert (=> b!393640 (= lt!186297 (getCurrentListMap!2079 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186291 () ListLongMap!5497)

(declare-fun lt!186288 () ListLongMap!5497)

(assert (=> b!393640 (and (= lt!186291 lt!186288) (= lt!186288 lt!186291))))

(declare-fun lt!186296 () ListLongMap!5497)

(declare-fun lt!186290 () tuple2!6594)

(declare-fun +!1084 (ListLongMap!5497 tuple2!6594) ListLongMap!5497)

(assert (=> b!393640 (= lt!186288 (+!1084 lt!186296 lt!186290))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!14075)

(assert (=> b!393640 (= lt!186290 (tuple2!6595 k0!778 v!373))))

(declare-datatypes ((Unit!12018 0))(
  ( (Unit!12019) )
))
(declare-fun lt!186292 () Unit!12018)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 (array!23345 array!23347 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) (_ BitVec 64) V!14075 (_ BitVec 32) Int) Unit!12018)

(assert (=> b!393640 (= lt!186292 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!989 (array!23345 array!23347 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) Int) ListLongMap!5497)

(assert (=> b!393640 (= lt!186291 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393640 (= lt!186295 (array!23348 (store (arr!11131 _values!506) i!548 (ValueCellFull!4520 v!373)) (size!11484 _values!506)))))

(assert (=> b!393640 (= lt!186296 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393641 () Bool)

(declare-fun res!225599 () Bool)

(assert (=> b!393641 (=> (not res!225599) (not e!238292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393641 (= res!225599 (validKeyInArray!0 k0!778))))

(declare-fun res!225603 () Bool)

(assert (=> start!38182 (=> (not res!225603) (not e!238292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38182 (= res!225603 (validMask!0 mask!970))))

(assert (=> start!38182 e!238292))

(declare-fun e!238297 () Bool)

(declare-fun array_inv!8172 (array!23347) Bool)

(assert (=> start!38182 (and (array_inv!8172 _values!506) e!238297)))

(assert (=> start!38182 tp!31950))

(assert (=> start!38182 true))

(declare-fun tp_is_empty!9727 () Bool)

(assert (=> start!38182 tp_is_empty!9727))

(declare-fun array_inv!8173 (array!23345) Bool)

(assert (=> start!38182 (array_inv!8173 _keys!658)))

(declare-fun b!393642 () Bool)

(assert (=> b!393642 (= e!238295 (= (+!1084 lt!186289 lt!186290) lt!186297))))

(assert (=> b!393642 (= lt!186297 lt!186291)))

(declare-fun b!393643 () Bool)

(declare-fun res!225609 () Bool)

(assert (=> b!393643 (=> (not res!225609) (not e!238292))))

(declare-fun arrayContainsKey!0 (array!23345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393643 (= res!225609 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16188 () Bool)

(declare-fun mapRes!16188 () Bool)

(declare-fun tp!31949 () Bool)

(declare-fun e!238296 () Bool)

(assert (=> mapNonEmpty!16188 (= mapRes!16188 (and tp!31949 e!238296))))

(declare-fun mapKey!16188 () (_ BitVec 32))

(declare-fun mapValue!16188 () ValueCell!4520)

(declare-fun mapRest!16188 () (Array (_ BitVec 32) ValueCell!4520))

(assert (=> mapNonEmpty!16188 (= (arr!11131 _values!506) (store mapRest!16188 mapKey!16188 mapValue!16188))))

(declare-fun b!393644 () Bool)

(declare-fun e!238293 () Bool)

(assert (=> b!393644 (= e!238293 tp_is_empty!9727)))

(declare-fun b!393645 () Bool)

(declare-fun res!225605 () Bool)

(assert (=> b!393645 (=> (not res!225605) (not e!238291))))

(declare-datatypes ((List!6436 0))(
  ( (Nil!6433) (Cons!6432 (h!7288 (_ BitVec 64)) (t!11599 List!6436)) )
))
(declare-fun arrayNoDuplicates!0 (array!23345 (_ BitVec 32) List!6436) Bool)

(assert (=> b!393645 (= res!225605 (arrayNoDuplicates!0 lt!186293 #b00000000000000000000000000000000 Nil!6433))))

(declare-fun b!393646 () Bool)

(assert (=> b!393646 (= e!238296 tp_is_empty!9727)))

(declare-fun b!393647 () Bool)

(assert (=> b!393647 (= e!238292 e!238291)))

(declare-fun res!225608 () Bool)

(assert (=> b!393647 (=> (not res!225608) (not e!238291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23345 (_ BitVec 32)) Bool)

(assert (=> b!393647 (= res!225608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186293 mask!970))))

(assert (=> b!393647 (= lt!186293 (array!23346 (store (arr!11130 _keys!658) i!548 k0!778) (size!11483 _keys!658)))))

(declare-fun b!393648 () Bool)

(declare-fun res!225606 () Bool)

(assert (=> b!393648 (=> (not res!225606) (not e!238292))))

(assert (=> b!393648 (= res!225606 (or (= (select (arr!11130 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11130 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393649 () Bool)

(declare-fun res!225607 () Bool)

(assert (=> b!393649 (=> (not res!225607) (not e!238292))))

(assert (=> b!393649 (= res!225607 (and (= (size!11484 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11483 _keys!658) (size!11484 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393650 () Bool)

(declare-fun res!225604 () Bool)

(assert (=> b!393650 (=> (not res!225604) (not e!238292))))

(assert (=> b!393650 (= res!225604 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6433))))

(declare-fun mapIsEmpty!16188 () Bool)

(assert (=> mapIsEmpty!16188 mapRes!16188))

(declare-fun b!393651 () Bool)

(declare-fun res!225600 () Bool)

(assert (=> b!393651 (=> (not res!225600) (not e!238292))))

(assert (=> b!393651 (= res!225600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393652 () Bool)

(assert (=> b!393652 (= e!238297 (and e!238293 mapRes!16188))))

(declare-fun condMapEmpty!16188 () Bool)

(declare-fun mapDefault!16188 () ValueCell!4520)

(assert (=> b!393652 (= condMapEmpty!16188 (= (arr!11131 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4520)) mapDefault!16188)))))

(assert (= (and start!38182 res!225603) b!393649))

(assert (= (and b!393649 res!225607) b!393651))

(assert (= (and b!393651 res!225600) b!393650))

(assert (= (and b!393650 res!225604) b!393639))

(assert (= (and b!393639 res!225601) b!393641))

(assert (= (and b!393641 res!225599) b!393648))

(assert (= (and b!393648 res!225606) b!393643))

(assert (= (and b!393643 res!225609) b!393647))

(assert (= (and b!393647 res!225608) b!393645))

(assert (= (and b!393645 res!225605) b!393640))

(assert (= (and b!393640 (not res!225602)) b!393642))

(assert (= (and b!393652 condMapEmpty!16188) mapIsEmpty!16188))

(assert (= (and b!393652 (not condMapEmpty!16188)) mapNonEmpty!16188))

(get-info :version)

(assert (= (and mapNonEmpty!16188 ((_ is ValueCellFull!4520) mapValue!16188)) b!393646))

(assert (= (and b!393652 ((_ is ValueCellFull!4520) mapDefault!16188)) b!393644))

(assert (= start!38182 b!393652))

(declare-fun m!389627 () Bool)

(assert (=> b!393647 m!389627))

(declare-fun m!389629 () Bool)

(assert (=> b!393647 m!389629))

(declare-fun m!389631 () Bool)

(assert (=> b!393650 m!389631))

(declare-fun m!389633 () Bool)

(assert (=> b!393641 m!389633))

(declare-fun m!389635 () Bool)

(assert (=> mapNonEmpty!16188 m!389635))

(declare-fun m!389637 () Bool)

(assert (=> start!38182 m!389637))

(declare-fun m!389639 () Bool)

(assert (=> start!38182 m!389639))

(declare-fun m!389641 () Bool)

(assert (=> start!38182 m!389641))

(declare-fun m!389643 () Bool)

(assert (=> b!393640 m!389643))

(declare-fun m!389645 () Bool)

(assert (=> b!393640 m!389645))

(declare-fun m!389647 () Bool)

(assert (=> b!393640 m!389647))

(declare-fun m!389649 () Bool)

(assert (=> b!393640 m!389649))

(declare-fun m!389651 () Bool)

(assert (=> b!393640 m!389651))

(declare-fun m!389653 () Bool)

(assert (=> b!393640 m!389653))

(declare-fun m!389655 () Bool)

(assert (=> b!393640 m!389655))

(declare-fun m!389657 () Bool)

(assert (=> b!393648 m!389657))

(declare-fun m!389659 () Bool)

(assert (=> b!393645 m!389659))

(declare-fun m!389661 () Bool)

(assert (=> b!393642 m!389661))

(declare-fun m!389663 () Bool)

(assert (=> b!393651 m!389663))

(declare-fun m!389665 () Bool)

(assert (=> b!393643 m!389665))

(check-sat (not mapNonEmpty!16188) (not start!38182) (not b!393650) tp_is_empty!9727 (not b_next!9055) (not b!393641) (not b!393642) b_and!16403 (not b!393647) (not b!393640) (not b!393645) (not b!393651) (not b!393643))
(check-sat b_and!16403 (not b_next!9055))
(get-model)

(declare-fun b!393748 () Bool)

(declare-fun e!238349 () Bool)

(declare-fun contains!2463 (List!6436 (_ BitVec 64)) Bool)

(assert (=> b!393748 (= e!238349 (contains!2463 Nil!6433 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393749 () Bool)

(declare-fun e!238351 () Bool)

(declare-fun call!27792 () Bool)

(assert (=> b!393749 (= e!238351 call!27792)))

(declare-fun b!393750 () Bool)

(declare-fun e!238350 () Bool)

(assert (=> b!393750 (= e!238350 e!238351)))

(declare-fun c!54417 () Bool)

(assert (=> b!393750 (= c!54417 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73041 () Bool)

(declare-fun res!225684 () Bool)

(declare-fun e!238348 () Bool)

(assert (=> d!73041 (=> res!225684 e!238348)))

(assert (=> d!73041 (= res!225684 (bvsge #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(assert (=> d!73041 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6433) e!238348)))

(declare-fun b!393747 () Bool)

(assert (=> b!393747 (= e!238348 e!238350)))

(declare-fun res!225683 () Bool)

(assert (=> b!393747 (=> (not res!225683) (not e!238350))))

(assert (=> b!393747 (= res!225683 (not e!238349))))

(declare-fun res!225682 () Bool)

(assert (=> b!393747 (=> (not res!225682) (not e!238349))))

(assert (=> b!393747 (= res!225682 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27789 () Bool)

(assert (=> bm!27789 (= call!27792 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54417 (Cons!6432 (select (arr!11130 _keys!658) #b00000000000000000000000000000000) Nil!6433) Nil!6433)))))

(declare-fun b!393751 () Bool)

(assert (=> b!393751 (= e!238351 call!27792)))

(assert (= (and d!73041 (not res!225684)) b!393747))

(assert (= (and b!393747 res!225682) b!393748))

(assert (= (and b!393747 res!225683) b!393750))

(assert (= (and b!393750 c!54417) b!393749))

(assert (= (and b!393750 (not c!54417)) b!393751))

(assert (= (or b!393749 b!393751) bm!27789))

(declare-fun m!389747 () Bool)

(assert (=> b!393748 m!389747))

(assert (=> b!393748 m!389747))

(declare-fun m!389749 () Bool)

(assert (=> b!393748 m!389749))

(assert (=> b!393750 m!389747))

(assert (=> b!393750 m!389747))

(declare-fun m!389751 () Bool)

(assert (=> b!393750 m!389751))

(assert (=> b!393747 m!389747))

(assert (=> b!393747 m!389747))

(assert (=> b!393747 m!389751))

(assert (=> bm!27789 m!389747))

(declare-fun m!389753 () Bool)

(assert (=> bm!27789 m!389753))

(assert (=> b!393650 d!73041))

(declare-fun b!393753 () Bool)

(declare-fun e!238353 () Bool)

(assert (=> b!393753 (= e!238353 (contains!2463 Nil!6433 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun b!393754 () Bool)

(declare-fun e!238355 () Bool)

(declare-fun call!27793 () Bool)

(assert (=> b!393754 (= e!238355 call!27793)))

(declare-fun b!393755 () Bool)

(declare-fun e!238354 () Bool)

(assert (=> b!393755 (= e!238354 e!238355)))

(declare-fun c!54418 () Bool)

(assert (=> b!393755 (= c!54418 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun d!73043 () Bool)

(declare-fun res!225687 () Bool)

(declare-fun e!238352 () Bool)

(assert (=> d!73043 (=> res!225687 e!238352)))

(assert (=> d!73043 (= res!225687 (bvsge #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(assert (=> d!73043 (= (arrayNoDuplicates!0 lt!186293 #b00000000000000000000000000000000 Nil!6433) e!238352)))

(declare-fun b!393752 () Bool)

(assert (=> b!393752 (= e!238352 e!238354)))

(declare-fun res!225686 () Bool)

(assert (=> b!393752 (=> (not res!225686) (not e!238354))))

(assert (=> b!393752 (= res!225686 (not e!238353))))

(declare-fun res!225685 () Bool)

(assert (=> b!393752 (=> (not res!225685) (not e!238353))))

(assert (=> b!393752 (= res!225685 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun bm!27790 () Bool)

(assert (=> bm!27790 (= call!27793 (arrayNoDuplicates!0 lt!186293 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54418 (Cons!6432 (select (arr!11130 lt!186293) #b00000000000000000000000000000000) Nil!6433) Nil!6433)))))

(declare-fun b!393756 () Bool)

(assert (=> b!393756 (= e!238355 call!27793)))

(assert (= (and d!73043 (not res!225687)) b!393752))

(assert (= (and b!393752 res!225685) b!393753))

(assert (= (and b!393752 res!225686) b!393755))

(assert (= (and b!393755 c!54418) b!393754))

(assert (= (and b!393755 (not c!54418)) b!393756))

(assert (= (or b!393754 b!393756) bm!27790))

(declare-fun m!389755 () Bool)

(assert (=> b!393753 m!389755))

(assert (=> b!393753 m!389755))

(declare-fun m!389757 () Bool)

(assert (=> b!393753 m!389757))

(assert (=> b!393755 m!389755))

(assert (=> b!393755 m!389755))

(declare-fun m!389759 () Bool)

(assert (=> b!393755 m!389759))

(assert (=> b!393752 m!389755))

(assert (=> b!393752 m!389755))

(assert (=> b!393752 m!389759))

(assert (=> bm!27790 m!389755))

(declare-fun m!389761 () Bool)

(assert (=> bm!27790 m!389761))

(assert (=> b!393645 d!73043))

(declare-fun d!73045 () Bool)

(assert (=> d!73045 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393641 d!73045))

(declare-fun d!73047 () Bool)

(declare-fun e!238358 () Bool)

(assert (=> d!73047 e!238358))

(declare-fun res!225693 () Bool)

(assert (=> d!73047 (=> (not res!225693) (not e!238358))))

(declare-fun lt!186367 () ListLongMap!5497)

(declare-fun contains!2464 (ListLongMap!5497 (_ BitVec 64)) Bool)

(assert (=> d!73047 (= res!225693 (contains!2464 lt!186367 (_1!3308 lt!186290)))))

(declare-fun lt!186369 () List!6435)

(assert (=> d!73047 (= lt!186367 (ListLongMap!5498 lt!186369))))

(declare-fun lt!186366 () Unit!12018)

(declare-fun lt!186368 () Unit!12018)

(assert (=> d!73047 (= lt!186366 lt!186368)))

(declare-datatypes ((Option!370 0))(
  ( (Some!369 (v!7149 V!14075)) (None!368) )
))
(declare-fun getValueByKey!364 (List!6435 (_ BitVec 64)) Option!370)

(assert (=> d!73047 (= (getValueByKey!364 lt!186369 (_1!3308 lt!186290)) (Some!369 (_2!3308 lt!186290)))))

(declare-fun lemmaContainsTupThenGetReturnValue!189 (List!6435 (_ BitVec 64) V!14075) Unit!12018)

(assert (=> d!73047 (= lt!186368 (lemmaContainsTupThenGetReturnValue!189 lt!186369 (_1!3308 lt!186290) (_2!3308 lt!186290)))))

(declare-fun insertStrictlySorted!192 (List!6435 (_ BitVec 64) V!14075) List!6435)

(assert (=> d!73047 (= lt!186369 (insertStrictlySorted!192 (toList!2764 lt!186289) (_1!3308 lt!186290) (_2!3308 lt!186290)))))

(assert (=> d!73047 (= (+!1084 lt!186289 lt!186290) lt!186367)))

(declare-fun b!393761 () Bool)

(declare-fun res!225692 () Bool)

(assert (=> b!393761 (=> (not res!225692) (not e!238358))))

(assert (=> b!393761 (= res!225692 (= (getValueByKey!364 (toList!2764 lt!186367) (_1!3308 lt!186290)) (Some!369 (_2!3308 lt!186290))))))

(declare-fun b!393762 () Bool)

(declare-fun contains!2465 (List!6435 tuple2!6594) Bool)

(assert (=> b!393762 (= e!238358 (contains!2465 (toList!2764 lt!186367) lt!186290))))

(assert (= (and d!73047 res!225693) b!393761))

(assert (= (and b!393761 res!225692) b!393762))

(declare-fun m!389763 () Bool)

(assert (=> d!73047 m!389763))

(declare-fun m!389765 () Bool)

(assert (=> d!73047 m!389765))

(declare-fun m!389767 () Bool)

(assert (=> d!73047 m!389767))

(declare-fun m!389769 () Bool)

(assert (=> d!73047 m!389769))

(declare-fun m!389771 () Bool)

(assert (=> b!393761 m!389771))

(declare-fun m!389773 () Bool)

(assert (=> b!393762 m!389773))

(assert (=> b!393642 d!73047))

(declare-fun b!393771 () Bool)

(declare-fun e!238366 () Bool)

(declare-fun call!27796 () Bool)

(assert (=> b!393771 (= e!238366 call!27796)))

(declare-fun b!393772 () Bool)

(declare-fun e!238367 () Bool)

(assert (=> b!393772 (= e!238367 call!27796)))

(declare-fun d!73049 () Bool)

(declare-fun res!225698 () Bool)

(declare-fun e!238365 () Bool)

(assert (=> d!73049 (=> res!225698 e!238365)))

(assert (=> d!73049 (= res!225698 (bvsge #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(assert (=> d!73049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!238365)))

(declare-fun b!393773 () Bool)

(assert (=> b!393773 (= e!238366 e!238367)))

(declare-fun lt!186377 () (_ BitVec 64))

(assert (=> b!393773 (= lt!186377 (select (arr!11130 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186376 () Unit!12018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23345 (_ BitVec 64) (_ BitVec 32)) Unit!12018)

(assert (=> b!393773 (= lt!186376 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!186377 #b00000000000000000000000000000000))))

(assert (=> b!393773 (arrayContainsKey!0 _keys!658 lt!186377 #b00000000000000000000000000000000)))

(declare-fun lt!186378 () Unit!12018)

(assert (=> b!393773 (= lt!186378 lt!186376)))

(declare-fun res!225699 () Bool)

(declare-datatypes ((SeekEntryResult!3514 0))(
  ( (MissingZero!3514 (index!16235 (_ BitVec 32))) (Found!3514 (index!16236 (_ BitVec 32))) (Intermediate!3514 (undefined!4326 Bool) (index!16237 (_ BitVec 32)) (x!38503 (_ BitVec 32))) (Undefined!3514) (MissingVacant!3514 (index!16238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23345 (_ BitVec 32)) SeekEntryResult!3514)

(assert (=> b!393773 (= res!225699 (= (seekEntryOrOpen!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3514 #b00000000000000000000000000000000)))))

(assert (=> b!393773 (=> (not res!225699) (not e!238367))))

(declare-fun b!393774 () Bool)

(assert (=> b!393774 (= e!238365 e!238366)))

(declare-fun c!54421 () Bool)

(assert (=> b!393774 (= c!54421 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27793 () Bool)

(assert (=> bm!27793 (= call!27796 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!73049 (not res!225698)) b!393774))

(assert (= (and b!393774 c!54421) b!393773))

(assert (= (and b!393774 (not c!54421)) b!393771))

(assert (= (and b!393773 res!225699) b!393772))

(assert (= (or b!393772 b!393771) bm!27793))

(assert (=> b!393773 m!389747))

(declare-fun m!389775 () Bool)

(assert (=> b!393773 m!389775))

(declare-fun m!389777 () Bool)

(assert (=> b!393773 m!389777))

(assert (=> b!393773 m!389747))

(declare-fun m!389779 () Bool)

(assert (=> b!393773 m!389779))

(assert (=> b!393774 m!389747))

(assert (=> b!393774 m!389747))

(assert (=> b!393774 m!389751))

(declare-fun m!389781 () Bool)

(assert (=> bm!27793 m!389781))

(assert (=> b!393651 d!73049))

(declare-fun b!393775 () Bool)

(declare-fun e!238369 () Bool)

(declare-fun call!27797 () Bool)

(assert (=> b!393775 (= e!238369 call!27797)))

(declare-fun b!393776 () Bool)

(declare-fun e!238370 () Bool)

(assert (=> b!393776 (= e!238370 call!27797)))

(declare-fun d!73051 () Bool)

(declare-fun res!225700 () Bool)

(declare-fun e!238368 () Bool)

(assert (=> d!73051 (=> res!225700 e!238368)))

(assert (=> d!73051 (= res!225700 (bvsge #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(assert (=> d!73051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186293 mask!970) e!238368)))

(declare-fun b!393777 () Bool)

(assert (=> b!393777 (= e!238369 e!238370)))

(declare-fun lt!186380 () (_ BitVec 64))

(assert (=> b!393777 (= lt!186380 (select (arr!11130 lt!186293) #b00000000000000000000000000000000))))

(declare-fun lt!186379 () Unit!12018)

(assert (=> b!393777 (= lt!186379 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!186293 lt!186380 #b00000000000000000000000000000000))))

(assert (=> b!393777 (arrayContainsKey!0 lt!186293 lt!186380 #b00000000000000000000000000000000)))

(declare-fun lt!186381 () Unit!12018)

(assert (=> b!393777 (= lt!186381 lt!186379)))

(declare-fun res!225701 () Bool)

(assert (=> b!393777 (= res!225701 (= (seekEntryOrOpen!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000) lt!186293 mask!970) (Found!3514 #b00000000000000000000000000000000)))))

(assert (=> b!393777 (=> (not res!225701) (not e!238370))))

(declare-fun b!393778 () Bool)

(assert (=> b!393778 (= e!238368 e!238369)))

(declare-fun c!54422 () Bool)

(assert (=> b!393778 (= c!54422 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun bm!27794 () Bool)

(assert (=> bm!27794 (= call!27797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!186293 mask!970))))

(assert (= (and d!73051 (not res!225700)) b!393778))

(assert (= (and b!393778 c!54422) b!393777))

(assert (= (and b!393778 (not c!54422)) b!393775))

(assert (= (and b!393777 res!225701) b!393776))

(assert (= (or b!393776 b!393775) bm!27794))

(assert (=> b!393777 m!389755))

(declare-fun m!389783 () Bool)

(assert (=> b!393777 m!389783))

(declare-fun m!389785 () Bool)

(assert (=> b!393777 m!389785))

(assert (=> b!393777 m!389755))

(declare-fun m!389787 () Bool)

(assert (=> b!393777 m!389787))

(assert (=> b!393778 m!389755))

(assert (=> b!393778 m!389755))

(assert (=> b!393778 m!389759))

(declare-fun m!389789 () Bool)

(assert (=> bm!27794 m!389789))

(assert (=> b!393647 d!73051))

(declare-fun d!73053 () Bool)

(declare-fun res!225706 () Bool)

(declare-fun e!238375 () Bool)

(assert (=> d!73053 (=> res!225706 e!238375)))

(assert (=> d!73053 (= res!225706 (= (select (arr!11130 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73053 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!238375)))

(declare-fun b!393783 () Bool)

(declare-fun e!238376 () Bool)

(assert (=> b!393783 (= e!238375 e!238376)))

(declare-fun res!225707 () Bool)

(assert (=> b!393783 (=> (not res!225707) (not e!238376))))

(assert (=> b!393783 (= res!225707 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11483 _keys!658)))))

(declare-fun b!393784 () Bool)

(assert (=> b!393784 (= e!238376 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73053 (not res!225706)) b!393783))

(assert (= (and b!393783 res!225707) b!393784))

(assert (=> d!73053 m!389747))

(declare-fun m!389791 () Bool)

(assert (=> b!393784 m!389791))

(assert (=> b!393643 d!73053))

(declare-fun b!393809 () Bool)

(assert (=> b!393809 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(assert (=> b!393809 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _values!506)))))

(declare-fun e!238394 () Bool)

(declare-fun lt!186402 () ListLongMap!5497)

(declare-fun apply!308 (ListLongMap!5497 (_ BitVec 64)) V!14075)

(declare-fun get!5618 (ValueCell!4520 V!14075) V!14075)

(declare-fun dynLambda!642 (Int (_ BitVec 64)) V!14075)

(assert (=> b!393809 (= e!238394 (= (apply!308 lt!186402 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)) (get!5618 (select (arr!11131 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393810 () Bool)

(declare-fun e!238396 () Bool)

(assert (=> b!393810 (= e!238396 (= lt!186402 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!393811 () Bool)

(declare-fun e!238395 () Bool)

(declare-fun e!238393 () Bool)

(assert (=> b!393811 (= e!238395 e!238393)))

(declare-fun c!54431 () Bool)

(declare-fun e!238392 () Bool)

(assert (=> b!393811 (= c!54431 e!238392)))

(declare-fun res!225717 () Bool)

(assert (=> b!393811 (=> (not res!225717) (not e!238392))))

(assert (=> b!393811 (= res!225717 (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun d!73055 () Bool)

(assert (=> d!73055 e!238395))

(declare-fun res!225716 () Bool)

(assert (=> d!73055 (=> (not res!225716) (not e!238395))))

(assert (=> d!73055 (= res!225716 (not (contains!2464 lt!186402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!238397 () ListLongMap!5497)

(assert (=> d!73055 (= lt!186402 e!238397)))

(declare-fun c!54433 () Bool)

(assert (=> d!73055 (= c!54433 (bvsge #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(assert (=> d!73055 (validMask!0 mask!970)))

(assert (=> d!73055 (= (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186402)))

(declare-fun b!393812 () Bool)

(declare-fun isEmpty!558 (ListLongMap!5497) Bool)

(assert (=> b!393812 (= e!238396 (isEmpty!558 lt!186402))))

(declare-fun b!393813 () Bool)

(assert (=> b!393813 (= e!238392 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393813 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!393814 () Bool)

(declare-fun e!238391 () ListLongMap!5497)

(declare-fun call!27800 () ListLongMap!5497)

(assert (=> b!393814 (= e!238391 call!27800)))

(declare-fun b!393815 () Bool)

(assert (=> b!393815 (= e!238393 e!238394)))

(assert (=> b!393815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun res!225719 () Bool)

(assert (=> b!393815 (= res!225719 (contains!2464 lt!186402 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393815 (=> (not res!225719) (not e!238394))))

(declare-fun b!393816 () Bool)

(declare-fun res!225718 () Bool)

(assert (=> b!393816 (=> (not res!225718) (not e!238395))))

(assert (=> b!393816 (= res!225718 (not (contains!2464 lt!186402 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393817 () Bool)

(assert (=> b!393817 (= e!238397 e!238391)))

(declare-fun c!54434 () Bool)

(assert (=> b!393817 (= c!54434 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27797 () Bool)

(assert (=> bm!27797 (= call!27800 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393818 () Bool)

(declare-fun lt!186401 () Unit!12018)

(declare-fun lt!186398 () Unit!12018)

(assert (=> b!393818 (= lt!186401 lt!186398)))

(declare-fun lt!186399 () (_ BitVec 64))

(declare-fun lt!186397 () V!14075)

(declare-fun lt!186396 () (_ BitVec 64))

(declare-fun lt!186400 () ListLongMap!5497)

(assert (=> b!393818 (not (contains!2464 (+!1084 lt!186400 (tuple2!6595 lt!186396 lt!186397)) lt!186399))))

(declare-fun addStillNotContains!142 (ListLongMap!5497 (_ BitVec 64) V!14075 (_ BitVec 64)) Unit!12018)

(assert (=> b!393818 (= lt!186398 (addStillNotContains!142 lt!186400 lt!186396 lt!186397 lt!186399))))

(assert (=> b!393818 (= lt!186399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393818 (= lt!186397 (get!5618 (select (arr!11131 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393818 (= lt!186396 (select (arr!11130 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393818 (= lt!186400 call!27800)))

(assert (=> b!393818 (= e!238391 (+!1084 call!27800 (tuple2!6595 (select (arr!11130 _keys!658) #b00000000000000000000000000000000) (get!5618 (select (arr!11131 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393819 () Bool)

(assert (=> b!393819 (= e!238393 e!238396)))

(declare-fun c!54432 () Bool)

(assert (=> b!393819 (= c!54432 (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun b!393820 () Bool)

(assert (=> b!393820 (= e!238397 (ListLongMap!5498 Nil!6432))))

(assert (= (and d!73055 c!54433) b!393820))

(assert (= (and d!73055 (not c!54433)) b!393817))

(assert (= (and b!393817 c!54434) b!393818))

(assert (= (and b!393817 (not c!54434)) b!393814))

(assert (= (or b!393818 b!393814) bm!27797))

(assert (= (and d!73055 res!225716) b!393816))

(assert (= (and b!393816 res!225718) b!393811))

(assert (= (and b!393811 res!225717) b!393813))

(assert (= (and b!393811 c!54431) b!393815))

(assert (= (and b!393811 (not c!54431)) b!393819))

(assert (= (and b!393815 res!225719) b!393809))

(assert (= (and b!393819 c!54432) b!393810))

(assert (= (and b!393819 (not c!54432)) b!393812))

(declare-fun b_lambda!8773 () Bool)

(assert (=> (not b_lambda!8773) (not b!393809)))

(declare-fun t!11604 () Bool)

(declare-fun tb!3123 () Bool)

(assert (=> (and start!38182 (= defaultEntry!514 defaultEntry!514) t!11604) tb!3123))

(declare-fun result!5765 () Bool)

(assert (=> tb!3123 (= result!5765 tp_is_empty!9727)))

(assert (=> b!393809 t!11604))

(declare-fun b_and!16409 () Bool)

(assert (= b_and!16403 (and (=> t!11604 result!5765) b_and!16409)))

(declare-fun b_lambda!8775 () Bool)

(assert (=> (not b_lambda!8775) (not b!393818)))

(assert (=> b!393818 t!11604))

(declare-fun b_and!16411 () Bool)

(assert (= b_and!16409 (and (=> t!11604 result!5765) b_and!16411)))

(declare-fun m!389793 () Bool)

(assert (=> d!73055 m!389793))

(assert (=> d!73055 m!389637))

(declare-fun m!389795 () Bool)

(assert (=> b!393810 m!389795))

(assert (=> bm!27797 m!389795))

(declare-fun m!389797 () Bool)

(assert (=> b!393816 m!389797))

(declare-fun m!389799 () Bool)

(assert (=> b!393812 m!389799))

(declare-fun m!389801 () Bool)

(assert (=> b!393818 m!389801))

(declare-fun m!389803 () Bool)

(assert (=> b!393818 m!389803))

(declare-fun m!389805 () Bool)

(assert (=> b!393818 m!389805))

(declare-fun m!389807 () Bool)

(assert (=> b!393818 m!389807))

(declare-fun m!389809 () Bool)

(assert (=> b!393818 m!389809))

(assert (=> b!393818 m!389747))

(assert (=> b!393818 m!389805))

(declare-fun m!389811 () Bool)

(assert (=> b!393818 m!389811))

(assert (=> b!393818 m!389811))

(assert (=> b!393818 m!389803))

(declare-fun m!389813 () Bool)

(assert (=> b!393818 m!389813))

(assert (=> b!393815 m!389747))

(assert (=> b!393815 m!389747))

(declare-fun m!389815 () Bool)

(assert (=> b!393815 m!389815))

(assert (=> b!393809 m!389747))

(assert (=> b!393809 m!389803))

(assert (=> b!393809 m!389747))

(declare-fun m!389817 () Bool)

(assert (=> b!393809 m!389817))

(assert (=> b!393809 m!389811))

(assert (=> b!393809 m!389811))

(assert (=> b!393809 m!389803))

(assert (=> b!393809 m!389813))

(assert (=> b!393813 m!389747))

(assert (=> b!393813 m!389747))

(assert (=> b!393813 m!389751))

(assert (=> b!393817 m!389747))

(assert (=> b!393817 m!389747))

(assert (=> b!393817 m!389751))

(assert (=> b!393640 d!73055))

(declare-fun b!393865 () Bool)

(declare-fun e!238429 () Bool)

(declare-fun e!238428 () Bool)

(assert (=> b!393865 (= e!238429 e!238428)))

(declare-fun c!54448 () Bool)

(assert (=> b!393865 (= c!54448 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27812 () Bool)

(declare-fun call!27821 () ListLongMap!5497)

(declare-fun call!27816 () ListLongMap!5497)

(assert (=> bm!27812 (= call!27821 call!27816)))

(declare-fun b!393866 () Bool)

(declare-fun e!238433 () Bool)

(declare-fun call!27820 () Bool)

(assert (=> b!393866 (= e!238433 (not call!27820))))

(declare-fun b!393867 () Bool)

(declare-fun call!27815 () Bool)

(assert (=> b!393867 (= e!238428 (not call!27815))))

(declare-fun b!393868 () Bool)

(declare-fun e!238431 () Bool)

(assert (=> b!393868 (= e!238431 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73057 () Bool)

(assert (=> d!73057 e!238429))

(declare-fun res!225744 () Bool)

(assert (=> d!73057 (=> (not res!225744) (not e!238429))))

(assert (=> d!73057 (= res!225744 (or (bvsge #b00000000000000000000000000000000 (size!11483 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))))

(declare-fun lt!186448 () ListLongMap!5497)

(declare-fun lt!186457 () ListLongMap!5497)

(assert (=> d!73057 (= lt!186448 lt!186457)))

(declare-fun lt!186460 () Unit!12018)

(declare-fun e!238435 () Unit!12018)

(assert (=> d!73057 (= lt!186460 e!238435)))

(declare-fun c!54450 () Bool)

(declare-fun e!238436 () Bool)

(assert (=> d!73057 (= c!54450 e!238436)))

(declare-fun res!225746 () Bool)

(assert (=> d!73057 (=> (not res!225746) (not e!238436))))

(assert (=> d!73057 (= res!225746 (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun e!238426 () ListLongMap!5497)

(assert (=> d!73057 (= lt!186457 e!238426)))

(declare-fun c!54452 () Bool)

(assert (=> d!73057 (= c!54452 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73057 (validMask!0 mask!970)))

(assert (=> d!73057 (= (getCurrentListMap!2079 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186448)))

(declare-fun b!393869 () Bool)

(declare-fun lt!186464 () Unit!12018)

(assert (=> b!393869 (= e!238435 lt!186464)))

(declare-fun lt!186462 () ListLongMap!5497)

(assert (=> b!393869 (= lt!186462 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186468 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186468 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186459 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186459 (select (arr!11130 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186458 () Unit!12018)

(declare-fun addStillContains!284 (ListLongMap!5497 (_ BitVec 64) V!14075 (_ BitVec 64)) Unit!12018)

(assert (=> b!393869 (= lt!186458 (addStillContains!284 lt!186462 lt!186468 zeroValue!472 lt!186459))))

(assert (=> b!393869 (contains!2464 (+!1084 lt!186462 (tuple2!6595 lt!186468 zeroValue!472)) lt!186459)))

(declare-fun lt!186461 () Unit!12018)

(assert (=> b!393869 (= lt!186461 lt!186458)))

(declare-fun lt!186453 () ListLongMap!5497)

(assert (=> b!393869 (= lt!186453 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186451 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186451 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186463 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186463 (select (arr!11130 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186455 () Unit!12018)

(declare-fun addApplyDifferent!284 (ListLongMap!5497 (_ BitVec 64) V!14075 (_ BitVec 64)) Unit!12018)

(assert (=> b!393869 (= lt!186455 (addApplyDifferent!284 lt!186453 lt!186451 minValue!472 lt!186463))))

(assert (=> b!393869 (= (apply!308 (+!1084 lt!186453 (tuple2!6595 lt!186451 minValue!472)) lt!186463) (apply!308 lt!186453 lt!186463))))

(declare-fun lt!186450 () Unit!12018)

(assert (=> b!393869 (= lt!186450 lt!186455)))

(declare-fun lt!186449 () ListLongMap!5497)

(assert (=> b!393869 (= lt!186449 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186456 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186466 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186466 (select (arr!11130 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186447 () Unit!12018)

(assert (=> b!393869 (= lt!186447 (addApplyDifferent!284 lt!186449 lt!186456 zeroValue!472 lt!186466))))

(assert (=> b!393869 (= (apply!308 (+!1084 lt!186449 (tuple2!6595 lt!186456 zeroValue!472)) lt!186466) (apply!308 lt!186449 lt!186466))))

(declare-fun lt!186452 () Unit!12018)

(assert (=> b!393869 (= lt!186452 lt!186447)))

(declare-fun lt!186467 () ListLongMap!5497)

(assert (=> b!393869 (= lt!186467 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186454 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186454 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186465 () (_ BitVec 64))

(assert (=> b!393869 (= lt!186465 (select (arr!11130 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393869 (= lt!186464 (addApplyDifferent!284 lt!186467 lt!186454 minValue!472 lt!186465))))

(assert (=> b!393869 (= (apply!308 (+!1084 lt!186467 (tuple2!6595 lt!186454 minValue!472)) lt!186465) (apply!308 lt!186467 lt!186465))))

(declare-fun b!393870 () Bool)

(assert (=> b!393870 (= e!238436 (validKeyInArray!0 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393871 () Bool)

(declare-fun e!238434 () Bool)

(declare-fun e!238430 () Bool)

(assert (=> b!393871 (= e!238434 e!238430)))

(declare-fun res!225738 () Bool)

(assert (=> b!393871 (=> (not res!225738) (not e!238430))))

(assert (=> b!393871 (= res!225738 (contains!2464 lt!186448 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun b!393872 () Bool)

(assert (=> b!393872 (= e!238430 (= (apply!308 lt!186448 (select (arr!11130 _keys!658) #b00000000000000000000000000000000)) (get!5618 (select (arr!11131 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _values!506)))))

(assert (=> b!393872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun bm!27813 () Bool)

(declare-fun call!27819 () ListLongMap!5497)

(assert (=> bm!27813 (= call!27819 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393873 () Bool)

(declare-fun e!238424 () Bool)

(assert (=> b!393873 (= e!238424 (= (apply!308 lt!186448 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393874 () Bool)

(declare-fun e!238432 () ListLongMap!5497)

(assert (=> b!393874 (= e!238432 call!27821)))

(declare-fun b!393875 () Bool)

(declare-fun res!225741 () Bool)

(assert (=> b!393875 (=> (not res!225741) (not e!238429))))

(assert (=> b!393875 (= res!225741 e!238433)))

(declare-fun c!54447 () Bool)

(assert (=> b!393875 (= c!54447 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27814 () Bool)

(assert (=> bm!27814 (= call!27816 call!27819)))

(declare-fun b!393876 () Bool)

(declare-fun e!238425 () ListLongMap!5497)

(assert (=> b!393876 (= e!238426 e!238425)))

(declare-fun c!54449 () Bool)

(assert (=> b!393876 (= c!54449 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393877 () Bool)

(declare-fun Unit!12022 () Unit!12018)

(assert (=> b!393877 (= e!238435 Unit!12022)))

(declare-fun b!393878 () Bool)

(declare-fun e!238427 () Bool)

(assert (=> b!393878 (= e!238427 (= (apply!308 lt!186448 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27815 () Bool)

(declare-fun call!27817 () ListLongMap!5497)

(declare-fun call!27818 () ListLongMap!5497)

(assert (=> bm!27815 (= call!27817 call!27818)))

(declare-fun b!393879 () Bool)

(assert (=> b!393879 (= e!238433 e!238427)))

(declare-fun res!225742 () Bool)

(assert (=> b!393879 (= res!225742 call!27820)))

(assert (=> b!393879 (=> (not res!225742) (not e!238427))))

(declare-fun b!393880 () Bool)

(declare-fun c!54451 () Bool)

(assert (=> b!393880 (= c!54451 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393880 (= e!238425 e!238432)))

(declare-fun bm!27816 () Bool)

(assert (=> bm!27816 (= call!27818 (+!1084 (ite c!54452 call!27819 (ite c!54449 call!27816 call!27821)) (ite (or c!54452 c!54449) (tuple2!6595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!393881 () Bool)

(assert (=> b!393881 (= e!238432 call!27817)))

(declare-fun bm!27817 () Bool)

(assert (=> bm!27817 (= call!27820 (contains!2464 lt!186448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27818 () Bool)

(assert (=> bm!27818 (= call!27815 (contains!2464 lt!186448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393882 () Bool)

(assert (=> b!393882 (= e!238426 (+!1084 call!27818 (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393883 () Bool)

(declare-fun res!225740 () Bool)

(assert (=> b!393883 (=> (not res!225740) (not e!238429))))

(assert (=> b!393883 (= res!225740 e!238434)))

(declare-fun res!225743 () Bool)

(assert (=> b!393883 (=> res!225743 e!238434)))

(assert (=> b!393883 (= res!225743 (not e!238431))))

(declare-fun res!225745 () Bool)

(assert (=> b!393883 (=> (not res!225745) (not e!238431))))

(assert (=> b!393883 (= res!225745 (bvslt #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(declare-fun b!393884 () Bool)

(assert (=> b!393884 (= e!238425 call!27817)))

(declare-fun b!393885 () Bool)

(assert (=> b!393885 (= e!238428 e!238424)))

(declare-fun res!225739 () Bool)

(assert (=> b!393885 (= res!225739 call!27815)))

(assert (=> b!393885 (=> (not res!225739) (not e!238424))))

(assert (= (and d!73057 c!54452) b!393882))

(assert (= (and d!73057 (not c!54452)) b!393876))

(assert (= (and b!393876 c!54449) b!393884))

(assert (= (and b!393876 (not c!54449)) b!393880))

(assert (= (and b!393880 c!54451) b!393881))

(assert (= (and b!393880 (not c!54451)) b!393874))

(assert (= (or b!393881 b!393874) bm!27812))

(assert (= (or b!393884 bm!27812) bm!27814))

(assert (= (or b!393884 b!393881) bm!27815))

(assert (= (or b!393882 bm!27814) bm!27813))

(assert (= (or b!393882 bm!27815) bm!27816))

(assert (= (and d!73057 res!225746) b!393870))

(assert (= (and d!73057 c!54450) b!393869))

(assert (= (and d!73057 (not c!54450)) b!393877))

(assert (= (and d!73057 res!225744) b!393883))

(assert (= (and b!393883 res!225745) b!393868))

(assert (= (and b!393883 (not res!225743)) b!393871))

(assert (= (and b!393871 res!225738) b!393872))

(assert (= (and b!393883 res!225740) b!393875))

(assert (= (and b!393875 c!54447) b!393879))

(assert (= (and b!393875 (not c!54447)) b!393866))

(assert (= (and b!393879 res!225742) b!393878))

(assert (= (or b!393879 b!393866) bm!27817))

(assert (= (and b!393875 res!225741) b!393865))

(assert (= (and b!393865 c!54448) b!393885))

(assert (= (and b!393865 (not c!54448)) b!393867))

(assert (= (and b!393885 res!225739) b!393873))

(assert (= (or b!393885 b!393867) bm!27818))

(declare-fun b_lambda!8777 () Bool)

(assert (=> (not b_lambda!8777) (not b!393872)))

(assert (=> b!393872 t!11604))

(declare-fun b_and!16413 () Bool)

(assert (= b_and!16411 (and (=> t!11604 result!5765) b_and!16413)))

(assert (=> bm!27813 m!389643))

(declare-fun m!389819 () Bool)

(assert (=> b!393869 m!389819))

(declare-fun m!389821 () Bool)

(assert (=> b!393869 m!389821))

(declare-fun m!389823 () Bool)

(assert (=> b!393869 m!389823))

(declare-fun m!389825 () Bool)

(assert (=> b!393869 m!389825))

(declare-fun m!389827 () Bool)

(assert (=> b!393869 m!389827))

(declare-fun m!389829 () Bool)

(assert (=> b!393869 m!389829))

(declare-fun m!389831 () Bool)

(assert (=> b!393869 m!389831))

(declare-fun m!389833 () Bool)

(assert (=> b!393869 m!389833))

(declare-fun m!389835 () Bool)

(assert (=> b!393869 m!389835))

(assert (=> b!393869 m!389835))

(declare-fun m!389837 () Bool)

(assert (=> b!393869 m!389837))

(declare-fun m!389839 () Bool)

(assert (=> b!393869 m!389839))

(declare-fun m!389841 () Bool)

(assert (=> b!393869 m!389841))

(declare-fun m!389843 () Bool)

(assert (=> b!393869 m!389843))

(assert (=> b!393869 m!389823))

(declare-fun m!389845 () Bool)

(assert (=> b!393869 m!389845))

(declare-fun m!389847 () Bool)

(assert (=> b!393869 m!389847))

(assert (=> b!393869 m!389747))

(assert (=> b!393869 m!389643))

(assert (=> b!393869 m!389845))

(assert (=> b!393869 m!389841))

(declare-fun m!389849 () Bool)

(assert (=> bm!27816 m!389849))

(declare-fun m!389851 () Bool)

(assert (=> b!393873 m!389851))

(assert (=> b!393868 m!389747))

(assert (=> b!393868 m!389747))

(assert (=> b!393868 m!389751))

(assert (=> b!393871 m!389747))

(assert (=> b!393871 m!389747))

(declare-fun m!389853 () Bool)

(assert (=> b!393871 m!389853))

(declare-fun m!389855 () Bool)

(assert (=> b!393882 m!389855))

(declare-fun m!389857 () Bool)

(assert (=> b!393878 m!389857))

(assert (=> b!393870 m!389747))

(assert (=> b!393870 m!389747))

(assert (=> b!393870 m!389751))

(assert (=> d!73057 m!389637))

(assert (=> b!393872 m!389811))

(assert (=> b!393872 m!389747))

(declare-fun m!389859 () Bool)

(assert (=> b!393872 m!389859))

(assert (=> b!393872 m!389811))

(assert (=> b!393872 m!389803))

(assert (=> b!393872 m!389813))

(assert (=> b!393872 m!389747))

(assert (=> b!393872 m!389803))

(declare-fun m!389861 () Bool)

(assert (=> bm!27817 m!389861))

(declare-fun m!389863 () Bool)

(assert (=> bm!27818 m!389863))

(assert (=> b!393640 d!73057))

(declare-fun d!73059 () Bool)

(declare-fun e!238437 () Bool)

(assert (=> d!73059 e!238437))

(declare-fun res!225748 () Bool)

(assert (=> d!73059 (=> (not res!225748) (not e!238437))))

(declare-fun lt!186470 () ListLongMap!5497)

(assert (=> d!73059 (= res!225748 (contains!2464 lt!186470 (_1!3308 lt!186290)))))

(declare-fun lt!186472 () List!6435)

(assert (=> d!73059 (= lt!186470 (ListLongMap!5498 lt!186472))))

(declare-fun lt!186469 () Unit!12018)

(declare-fun lt!186471 () Unit!12018)

(assert (=> d!73059 (= lt!186469 lt!186471)))

(assert (=> d!73059 (= (getValueByKey!364 lt!186472 (_1!3308 lt!186290)) (Some!369 (_2!3308 lt!186290)))))

(assert (=> d!73059 (= lt!186471 (lemmaContainsTupThenGetReturnValue!189 lt!186472 (_1!3308 lt!186290) (_2!3308 lt!186290)))))

(assert (=> d!73059 (= lt!186472 (insertStrictlySorted!192 (toList!2764 lt!186296) (_1!3308 lt!186290) (_2!3308 lt!186290)))))

(assert (=> d!73059 (= (+!1084 lt!186296 lt!186290) lt!186470)))

(declare-fun b!393886 () Bool)

(declare-fun res!225747 () Bool)

(assert (=> b!393886 (=> (not res!225747) (not e!238437))))

(assert (=> b!393886 (= res!225747 (= (getValueByKey!364 (toList!2764 lt!186470) (_1!3308 lt!186290)) (Some!369 (_2!3308 lt!186290))))))

(declare-fun b!393887 () Bool)

(assert (=> b!393887 (= e!238437 (contains!2465 (toList!2764 lt!186470) lt!186290))))

(assert (= (and d!73059 res!225748) b!393886))

(assert (= (and b!393886 res!225747) b!393887))

(declare-fun m!389865 () Bool)

(assert (=> d!73059 m!389865))

(declare-fun m!389867 () Bool)

(assert (=> d!73059 m!389867))

(declare-fun m!389869 () Bool)

(assert (=> d!73059 m!389869))

(declare-fun m!389871 () Bool)

(assert (=> d!73059 m!389871))

(declare-fun m!389873 () Bool)

(assert (=> b!393886 m!389873))

(declare-fun m!389875 () Bool)

(assert (=> b!393887 m!389875))

(assert (=> b!393640 d!73059))

(declare-fun b!393888 () Bool)

(declare-fun e!238443 () Bool)

(declare-fun e!238442 () Bool)

(assert (=> b!393888 (= e!238443 e!238442)))

(declare-fun c!54454 () Bool)

(assert (=> b!393888 (= c!54454 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27819 () Bool)

(declare-fun call!27828 () ListLongMap!5497)

(declare-fun call!27823 () ListLongMap!5497)

(assert (=> bm!27819 (= call!27828 call!27823)))

(declare-fun b!393889 () Bool)

(declare-fun e!238447 () Bool)

(declare-fun call!27827 () Bool)

(assert (=> b!393889 (= e!238447 (not call!27827))))

(declare-fun b!393890 () Bool)

(declare-fun call!27822 () Bool)

(assert (=> b!393890 (= e!238442 (not call!27822))))

(declare-fun b!393891 () Bool)

(declare-fun e!238445 () Bool)

(assert (=> b!393891 (= e!238445 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun d!73061 () Bool)

(assert (=> d!73061 e!238443))

(declare-fun res!225755 () Bool)

(assert (=> d!73061 (=> (not res!225755) (not e!238443))))

(assert (=> d!73061 (= res!225755 (or (bvsge #b00000000000000000000000000000000 (size!11483 lt!186293)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))))

(declare-fun lt!186474 () ListLongMap!5497)

(declare-fun lt!186483 () ListLongMap!5497)

(assert (=> d!73061 (= lt!186474 lt!186483)))

(declare-fun lt!186486 () Unit!12018)

(declare-fun e!238449 () Unit!12018)

(assert (=> d!73061 (= lt!186486 e!238449)))

(declare-fun c!54456 () Bool)

(declare-fun e!238450 () Bool)

(assert (=> d!73061 (= c!54456 e!238450)))

(declare-fun res!225757 () Bool)

(assert (=> d!73061 (=> (not res!225757) (not e!238450))))

(assert (=> d!73061 (= res!225757 (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun e!238440 () ListLongMap!5497)

(assert (=> d!73061 (= lt!186483 e!238440)))

(declare-fun c!54458 () Bool)

(assert (=> d!73061 (= c!54458 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73061 (validMask!0 mask!970)))

(assert (=> d!73061 (= (getCurrentListMap!2079 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186474)))

(declare-fun b!393892 () Bool)

(declare-fun lt!186490 () Unit!12018)

(assert (=> b!393892 (= e!238449 lt!186490)))

(declare-fun lt!186488 () ListLongMap!5497)

(assert (=> b!393892 (= lt!186488 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186494 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186485 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186485 (select (arr!11130 lt!186293) #b00000000000000000000000000000000))))

(declare-fun lt!186484 () Unit!12018)

(assert (=> b!393892 (= lt!186484 (addStillContains!284 lt!186488 lt!186494 zeroValue!472 lt!186485))))

(assert (=> b!393892 (contains!2464 (+!1084 lt!186488 (tuple2!6595 lt!186494 zeroValue!472)) lt!186485)))

(declare-fun lt!186487 () Unit!12018)

(assert (=> b!393892 (= lt!186487 lt!186484)))

(declare-fun lt!186479 () ListLongMap!5497)

(assert (=> b!393892 (= lt!186479 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186477 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186477 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186489 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186489 (select (arr!11130 lt!186293) #b00000000000000000000000000000000))))

(declare-fun lt!186481 () Unit!12018)

(assert (=> b!393892 (= lt!186481 (addApplyDifferent!284 lt!186479 lt!186477 minValue!472 lt!186489))))

(assert (=> b!393892 (= (apply!308 (+!1084 lt!186479 (tuple2!6595 lt!186477 minValue!472)) lt!186489) (apply!308 lt!186479 lt!186489))))

(declare-fun lt!186476 () Unit!12018)

(assert (=> b!393892 (= lt!186476 lt!186481)))

(declare-fun lt!186475 () ListLongMap!5497)

(assert (=> b!393892 (= lt!186475 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186482 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186492 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186492 (select (arr!11130 lt!186293) #b00000000000000000000000000000000))))

(declare-fun lt!186473 () Unit!12018)

(assert (=> b!393892 (= lt!186473 (addApplyDifferent!284 lt!186475 lt!186482 zeroValue!472 lt!186492))))

(assert (=> b!393892 (= (apply!308 (+!1084 lt!186475 (tuple2!6595 lt!186482 zeroValue!472)) lt!186492) (apply!308 lt!186475 lt!186492))))

(declare-fun lt!186478 () Unit!12018)

(assert (=> b!393892 (= lt!186478 lt!186473)))

(declare-fun lt!186493 () ListLongMap!5497)

(assert (=> b!393892 (= lt!186493 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186480 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186491 () (_ BitVec 64))

(assert (=> b!393892 (= lt!186491 (select (arr!11130 lt!186293) #b00000000000000000000000000000000))))

(assert (=> b!393892 (= lt!186490 (addApplyDifferent!284 lt!186493 lt!186480 minValue!472 lt!186491))))

(assert (=> b!393892 (= (apply!308 (+!1084 lt!186493 (tuple2!6595 lt!186480 minValue!472)) lt!186491) (apply!308 lt!186493 lt!186491))))

(declare-fun b!393893 () Bool)

(assert (=> b!393893 (= e!238450 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun b!393894 () Bool)

(declare-fun e!238448 () Bool)

(declare-fun e!238444 () Bool)

(assert (=> b!393894 (= e!238448 e!238444)))

(declare-fun res!225749 () Bool)

(assert (=> b!393894 (=> (not res!225749) (not e!238444))))

(assert (=> b!393894 (= res!225749 (contains!2464 lt!186474 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(assert (=> b!393894 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun b!393895 () Bool)

(assert (=> b!393895 (= e!238444 (= (apply!308 lt!186474 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)) (get!5618 (select (arr!11131 lt!186295) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186295)))))

(assert (=> b!393895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun call!27826 () ListLongMap!5497)

(declare-fun bm!27820 () Bool)

(assert (=> bm!27820 (= call!27826 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393896 () Bool)

(declare-fun e!238438 () Bool)

(assert (=> b!393896 (= e!238438 (= (apply!308 lt!186474 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393897 () Bool)

(declare-fun e!238446 () ListLongMap!5497)

(assert (=> b!393897 (= e!238446 call!27828)))

(declare-fun b!393898 () Bool)

(declare-fun res!225752 () Bool)

(assert (=> b!393898 (=> (not res!225752) (not e!238443))))

(assert (=> b!393898 (= res!225752 e!238447)))

(declare-fun c!54453 () Bool)

(assert (=> b!393898 (= c!54453 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27821 () Bool)

(assert (=> bm!27821 (= call!27823 call!27826)))

(declare-fun b!393899 () Bool)

(declare-fun e!238439 () ListLongMap!5497)

(assert (=> b!393899 (= e!238440 e!238439)))

(declare-fun c!54455 () Bool)

(assert (=> b!393899 (= c!54455 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393900 () Bool)

(declare-fun Unit!12023 () Unit!12018)

(assert (=> b!393900 (= e!238449 Unit!12023)))

(declare-fun b!393901 () Bool)

(declare-fun e!238441 () Bool)

(assert (=> b!393901 (= e!238441 (= (apply!308 lt!186474 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27822 () Bool)

(declare-fun call!27824 () ListLongMap!5497)

(declare-fun call!27825 () ListLongMap!5497)

(assert (=> bm!27822 (= call!27824 call!27825)))

(declare-fun b!393902 () Bool)

(assert (=> b!393902 (= e!238447 e!238441)))

(declare-fun res!225753 () Bool)

(assert (=> b!393902 (= res!225753 call!27827)))

(assert (=> b!393902 (=> (not res!225753) (not e!238441))))

(declare-fun b!393903 () Bool)

(declare-fun c!54457 () Bool)

(assert (=> b!393903 (= c!54457 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393903 (= e!238439 e!238446)))

(declare-fun bm!27823 () Bool)

(assert (=> bm!27823 (= call!27825 (+!1084 (ite c!54458 call!27826 (ite c!54455 call!27823 call!27828)) (ite (or c!54458 c!54455) (tuple2!6595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!393904 () Bool)

(assert (=> b!393904 (= e!238446 call!27824)))

(declare-fun bm!27824 () Bool)

(assert (=> bm!27824 (= call!27827 (contains!2464 lt!186474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27825 () Bool)

(assert (=> bm!27825 (= call!27822 (contains!2464 lt!186474 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393905 () Bool)

(assert (=> b!393905 (= e!238440 (+!1084 call!27825 (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393906 () Bool)

(declare-fun res!225751 () Bool)

(assert (=> b!393906 (=> (not res!225751) (not e!238443))))

(assert (=> b!393906 (= res!225751 e!238448)))

(declare-fun res!225754 () Bool)

(assert (=> b!393906 (=> res!225754 e!238448)))

(assert (=> b!393906 (= res!225754 (not e!238445))))

(declare-fun res!225756 () Bool)

(assert (=> b!393906 (=> (not res!225756) (not e!238445))))

(assert (=> b!393906 (= res!225756 (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun b!393907 () Bool)

(assert (=> b!393907 (= e!238439 call!27824)))

(declare-fun b!393908 () Bool)

(assert (=> b!393908 (= e!238442 e!238438)))

(declare-fun res!225750 () Bool)

(assert (=> b!393908 (= res!225750 call!27822)))

(assert (=> b!393908 (=> (not res!225750) (not e!238438))))

(assert (= (and d!73061 c!54458) b!393905))

(assert (= (and d!73061 (not c!54458)) b!393899))

(assert (= (and b!393899 c!54455) b!393907))

(assert (= (and b!393899 (not c!54455)) b!393903))

(assert (= (and b!393903 c!54457) b!393904))

(assert (= (and b!393903 (not c!54457)) b!393897))

(assert (= (or b!393904 b!393897) bm!27819))

(assert (= (or b!393907 bm!27819) bm!27821))

(assert (= (or b!393907 b!393904) bm!27822))

(assert (= (or b!393905 bm!27821) bm!27820))

(assert (= (or b!393905 bm!27822) bm!27823))

(assert (= (and d!73061 res!225757) b!393893))

(assert (= (and d!73061 c!54456) b!393892))

(assert (= (and d!73061 (not c!54456)) b!393900))

(assert (= (and d!73061 res!225755) b!393906))

(assert (= (and b!393906 res!225756) b!393891))

(assert (= (and b!393906 (not res!225754)) b!393894))

(assert (= (and b!393894 res!225749) b!393895))

(assert (= (and b!393906 res!225751) b!393898))

(assert (= (and b!393898 c!54453) b!393902))

(assert (= (and b!393898 (not c!54453)) b!393889))

(assert (= (and b!393902 res!225753) b!393901))

(assert (= (or b!393902 b!393889) bm!27824))

(assert (= (and b!393898 res!225752) b!393888))

(assert (= (and b!393888 c!54454) b!393908))

(assert (= (and b!393888 (not c!54454)) b!393890))

(assert (= (and b!393908 res!225750) b!393896))

(assert (= (or b!393908 b!393890) bm!27825))

(declare-fun b_lambda!8779 () Bool)

(assert (=> (not b_lambda!8779) (not b!393895)))

(assert (=> b!393895 t!11604))

(declare-fun b_and!16415 () Bool)

(assert (= b_and!16413 (and (=> t!11604 result!5765) b_and!16415)))

(assert (=> bm!27820 m!389649))

(declare-fun m!389877 () Bool)

(assert (=> b!393892 m!389877))

(declare-fun m!389879 () Bool)

(assert (=> b!393892 m!389879))

(declare-fun m!389881 () Bool)

(assert (=> b!393892 m!389881))

(declare-fun m!389883 () Bool)

(assert (=> b!393892 m!389883))

(declare-fun m!389885 () Bool)

(assert (=> b!393892 m!389885))

(declare-fun m!389887 () Bool)

(assert (=> b!393892 m!389887))

(declare-fun m!389889 () Bool)

(assert (=> b!393892 m!389889))

(declare-fun m!389891 () Bool)

(assert (=> b!393892 m!389891))

(declare-fun m!389893 () Bool)

(assert (=> b!393892 m!389893))

(assert (=> b!393892 m!389893))

(declare-fun m!389895 () Bool)

(assert (=> b!393892 m!389895))

(declare-fun m!389897 () Bool)

(assert (=> b!393892 m!389897))

(declare-fun m!389899 () Bool)

(assert (=> b!393892 m!389899))

(declare-fun m!389901 () Bool)

(assert (=> b!393892 m!389901))

(assert (=> b!393892 m!389881))

(declare-fun m!389903 () Bool)

(assert (=> b!393892 m!389903))

(declare-fun m!389905 () Bool)

(assert (=> b!393892 m!389905))

(assert (=> b!393892 m!389755))

(assert (=> b!393892 m!389649))

(assert (=> b!393892 m!389903))

(assert (=> b!393892 m!389899))

(declare-fun m!389907 () Bool)

(assert (=> bm!27823 m!389907))

(declare-fun m!389909 () Bool)

(assert (=> b!393896 m!389909))

(assert (=> b!393891 m!389755))

(assert (=> b!393891 m!389755))

(assert (=> b!393891 m!389759))

(assert (=> b!393894 m!389755))

(assert (=> b!393894 m!389755))

(declare-fun m!389911 () Bool)

(assert (=> b!393894 m!389911))

(declare-fun m!389913 () Bool)

(assert (=> b!393905 m!389913))

(declare-fun m!389915 () Bool)

(assert (=> b!393901 m!389915))

(assert (=> b!393893 m!389755))

(assert (=> b!393893 m!389755))

(assert (=> b!393893 m!389759))

(assert (=> d!73061 m!389637))

(declare-fun m!389917 () Bool)

(assert (=> b!393895 m!389917))

(assert (=> b!393895 m!389755))

(declare-fun m!389919 () Bool)

(assert (=> b!393895 m!389919))

(assert (=> b!393895 m!389917))

(assert (=> b!393895 m!389803))

(declare-fun m!389921 () Bool)

(assert (=> b!393895 m!389921))

(assert (=> b!393895 m!389755))

(assert (=> b!393895 m!389803))

(declare-fun m!389923 () Bool)

(assert (=> bm!27824 m!389923))

(declare-fun m!389925 () Bool)

(assert (=> bm!27825 m!389925))

(assert (=> b!393640 d!73061))

(declare-fun b!393909 () Bool)

(assert (=> b!393909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(assert (=> b!393909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186295)))))

(declare-fun e!238454 () Bool)

(declare-fun lt!186501 () ListLongMap!5497)

(assert (=> b!393909 (= e!238454 (= (apply!308 lt!186501 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)) (get!5618 (select (arr!11131 lt!186295) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!238456 () Bool)

(declare-fun b!393910 () Bool)

(assert (=> b!393910 (= e!238456 (= lt!186501 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!393911 () Bool)

(declare-fun e!238455 () Bool)

(declare-fun e!238453 () Bool)

(assert (=> b!393911 (= e!238455 e!238453)))

(declare-fun c!54459 () Bool)

(declare-fun e!238452 () Bool)

(assert (=> b!393911 (= c!54459 e!238452)))

(declare-fun res!225759 () Bool)

(assert (=> b!393911 (=> (not res!225759) (not e!238452))))

(assert (=> b!393911 (= res!225759 (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun d!73063 () Bool)

(assert (=> d!73063 e!238455))

(declare-fun res!225758 () Bool)

(assert (=> d!73063 (=> (not res!225758) (not e!238455))))

(assert (=> d!73063 (= res!225758 (not (contains!2464 lt!186501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!238457 () ListLongMap!5497)

(assert (=> d!73063 (= lt!186501 e!238457)))

(declare-fun c!54461 () Bool)

(assert (=> d!73063 (= c!54461 (bvsge #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(assert (=> d!73063 (validMask!0 mask!970)))

(assert (=> d!73063 (= (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186501)))

(declare-fun b!393912 () Bool)

(assert (=> b!393912 (= e!238456 (isEmpty!558 lt!186501))))

(declare-fun b!393913 () Bool)

(assert (=> b!393913 (= e!238452 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(assert (=> b!393913 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!393914 () Bool)

(declare-fun e!238451 () ListLongMap!5497)

(declare-fun call!27829 () ListLongMap!5497)

(assert (=> b!393914 (= e!238451 call!27829)))

(declare-fun b!393915 () Bool)

(assert (=> b!393915 (= e!238453 e!238454)))

(assert (=> b!393915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun res!225761 () Bool)

(assert (=> b!393915 (= res!225761 (contains!2464 lt!186501 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(assert (=> b!393915 (=> (not res!225761) (not e!238454))))

(declare-fun b!393916 () Bool)

(declare-fun res!225760 () Bool)

(assert (=> b!393916 (=> (not res!225760) (not e!238455))))

(assert (=> b!393916 (= res!225760 (not (contains!2464 lt!186501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393917 () Bool)

(assert (=> b!393917 (= e!238457 e!238451)))

(declare-fun c!54462 () Bool)

(assert (=> b!393917 (= c!54462 (validKeyInArray!0 (select (arr!11130 lt!186293) #b00000000000000000000000000000000)))))

(declare-fun bm!27826 () Bool)

(assert (=> bm!27826 (= call!27829 (getCurrentListMapNoExtraKeys!989 lt!186293 lt!186295 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393918 () Bool)

(declare-fun lt!186500 () Unit!12018)

(declare-fun lt!186497 () Unit!12018)

(assert (=> b!393918 (= lt!186500 lt!186497)))

(declare-fun lt!186495 () (_ BitVec 64))

(declare-fun lt!186498 () (_ BitVec 64))

(declare-fun lt!186496 () V!14075)

(declare-fun lt!186499 () ListLongMap!5497)

(assert (=> b!393918 (not (contains!2464 (+!1084 lt!186499 (tuple2!6595 lt!186495 lt!186496)) lt!186498))))

(assert (=> b!393918 (= lt!186497 (addStillNotContains!142 lt!186499 lt!186495 lt!186496 lt!186498))))

(assert (=> b!393918 (= lt!186498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393918 (= lt!186496 (get!5618 (select (arr!11131 lt!186295) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393918 (= lt!186495 (select (arr!11130 lt!186293) #b00000000000000000000000000000000))))

(assert (=> b!393918 (= lt!186499 call!27829)))

(assert (=> b!393918 (= e!238451 (+!1084 call!27829 (tuple2!6595 (select (arr!11130 lt!186293) #b00000000000000000000000000000000) (get!5618 (select (arr!11131 lt!186295) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393919 () Bool)

(assert (=> b!393919 (= e!238453 e!238456)))

(declare-fun c!54460 () Bool)

(assert (=> b!393919 (= c!54460 (bvslt #b00000000000000000000000000000000 (size!11483 lt!186293)))))

(declare-fun b!393920 () Bool)

(assert (=> b!393920 (= e!238457 (ListLongMap!5498 Nil!6432))))

(assert (= (and d!73063 c!54461) b!393920))

(assert (= (and d!73063 (not c!54461)) b!393917))

(assert (= (and b!393917 c!54462) b!393918))

(assert (= (and b!393917 (not c!54462)) b!393914))

(assert (= (or b!393918 b!393914) bm!27826))

(assert (= (and d!73063 res!225758) b!393916))

(assert (= (and b!393916 res!225760) b!393911))

(assert (= (and b!393911 res!225759) b!393913))

(assert (= (and b!393911 c!54459) b!393915))

(assert (= (and b!393911 (not c!54459)) b!393919))

(assert (= (and b!393915 res!225761) b!393909))

(assert (= (and b!393919 c!54460) b!393910))

(assert (= (and b!393919 (not c!54460)) b!393912))

(declare-fun b_lambda!8781 () Bool)

(assert (=> (not b_lambda!8781) (not b!393909)))

(assert (=> b!393909 t!11604))

(declare-fun b_and!16417 () Bool)

(assert (= b_and!16415 (and (=> t!11604 result!5765) b_and!16417)))

(declare-fun b_lambda!8783 () Bool)

(assert (=> (not b_lambda!8783) (not b!393918)))

(assert (=> b!393918 t!11604))

(declare-fun b_and!16419 () Bool)

(assert (= b_and!16417 (and (=> t!11604 result!5765) b_and!16419)))

(declare-fun m!389927 () Bool)

(assert (=> d!73063 m!389927))

(assert (=> d!73063 m!389637))

(declare-fun m!389929 () Bool)

(assert (=> b!393910 m!389929))

(assert (=> bm!27826 m!389929))

(declare-fun m!389931 () Bool)

(assert (=> b!393916 m!389931))

(declare-fun m!389933 () Bool)

(assert (=> b!393912 m!389933))

(declare-fun m!389935 () Bool)

(assert (=> b!393918 m!389935))

(assert (=> b!393918 m!389803))

(declare-fun m!389937 () Bool)

(assert (=> b!393918 m!389937))

(declare-fun m!389939 () Bool)

(assert (=> b!393918 m!389939))

(declare-fun m!389941 () Bool)

(assert (=> b!393918 m!389941))

(assert (=> b!393918 m!389755))

(assert (=> b!393918 m!389937))

(assert (=> b!393918 m!389917))

(assert (=> b!393918 m!389917))

(assert (=> b!393918 m!389803))

(assert (=> b!393918 m!389921))

(assert (=> b!393915 m!389755))

(assert (=> b!393915 m!389755))

(declare-fun m!389943 () Bool)

(assert (=> b!393915 m!389943))

(assert (=> b!393909 m!389755))

(assert (=> b!393909 m!389803))

(assert (=> b!393909 m!389755))

(declare-fun m!389945 () Bool)

(assert (=> b!393909 m!389945))

(assert (=> b!393909 m!389917))

(assert (=> b!393909 m!389917))

(assert (=> b!393909 m!389803))

(assert (=> b!393909 m!389921))

(assert (=> b!393913 m!389755))

(assert (=> b!393913 m!389755))

(assert (=> b!393913 m!389759))

(assert (=> b!393917 m!389755))

(assert (=> b!393917 m!389755))

(assert (=> b!393917 m!389759))

(assert (=> b!393640 d!73063))

(declare-fun bm!27831 () Bool)

(declare-fun call!27834 () ListLongMap!5497)

(assert (=> bm!27831 (= call!27834 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun call!27835 () ListLongMap!5497)

(declare-fun bm!27832 () Bool)

(assert (=> bm!27832 (= call!27835 (getCurrentListMapNoExtraKeys!989 (array!23346 (store (arr!11130 _keys!658) i!548 k0!778) (size!11483 _keys!658)) (array!23348 (store (arr!11131 _values!506) i!548 (ValueCellFull!4520 v!373)) (size!11484 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!73065 () Bool)

(declare-fun e!238462 () Bool)

(assert (=> d!73065 e!238462))

(declare-fun res!225764 () Bool)

(assert (=> d!73065 (=> (not res!225764) (not e!238462))))

(assert (=> d!73065 (= res!225764 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11483 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11484 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11483 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11484 _values!506))))))))

(declare-fun lt!186504 () Unit!12018)

(declare-fun choose!1330 (array!23345 array!23347 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) (_ BitVec 64) V!14075 (_ BitVec 32) Int) Unit!12018)

(assert (=> d!73065 (= lt!186504 (choose!1330 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11483 _keys!658)))))

(assert (=> d!73065 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!186504)))

(declare-fun b!393927 () Bool)

(declare-fun e!238463 () Bool)

(assert (=> b!393927 (= e!238463 (= call!27835 call!27834))))

(declare-fun b!393928 () Bool)

(assert (=> b!393928 (= e!238463 (= call!27835 (+!1084 call!27834 (tuple2!6595 k0!778 v!373))))))

(declare-fun b!393929 () Bool)

(assert (=> b!393929 (= e!238462 e!238463)))

(declare-fun c!54465 () Bool)

(assert (=> b!393929 (= c!54465 (bvsle #b00000000000000000000000000000000 i!548))))

(assert (= (and d!73065 res!225764) b!393929))

(assert (= (and b!393929 c!54465) b!393928))

(assert (= (and b!393929 (not c!54465)) b!393927))

(assert (= (or b!393928 b!393927) bm!27831))

(assert (= (or b!393928 b!393927) bm!27832))

(assert (=> bm!27831 m!389643))

(assert (=> bm!27832 m!389629))

(assert (=> bm!27832 m!389655))

(declare-fun m!389947 () Bool)

(assert (=> bm!27832 m!389947))

(declare-fun m!389949 () Bool)

(assert (=> d!73065 m!389949))

(declare-fun m!389951 () Bool)

(assert (=> b!393928 m!389951))

(assert (=> b!393640 d!73065))

(declare-fun d!73067 () Bool)

(assert (=> d!73067 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38182 d!73067))

(declare-fun d!73069 () Bool)

(assert (=> d!73069 (= (array_inv!8172 _values!506) (bvsge (size!11484 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38182 d!73069))

(declare-fun d!73071 () Bool)

(assert (=> d!73071 (= (array_inv!8173 _keys!658) (bvsge (size!11483 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38182 d!73071))

(declare-fun mapNonEmpty!16197 () Bool)

(declare-fun mapRes!16197 () Bool)

(declare-fun tp!31965 () Bool)

(declare-fun e!238468 () Bool)

(assert (=> mapNonEmpty!16197 (= mapRes!16197 (and tp!31965 e!238468))))

(declare-fun mapKey!16197 () (_ BitVec 32))

(declare-fun mapValue!16197 () ValueCell!4520)

(declare-fun mapRest!16197 () (Array (_ BitVec 32) ValueCell!4520))

(assert (=> mapNonEmpty!16197 (= mapRest!16188 (store mapRest!16197 mapKey!16197 mapValue!16197))))

(declare-fun condMapEmpty!16197 () Bool)

(declare-fun mapDefault!16197 () ValueCell!4520)

(assert (=> mapNonEmpty!16188 (= condMapEmpty!16197 (= mapRest!16188 ((as const (Array (_ BitVec 32) ValueCell!4520)) mapDefault!16197)))))

(declare-fun e!238469 () Bool)

(assert (=> mapNonEmpty!16188 (= tp!31949 (and e!238469 mapRes!16197))))

(declare-fun b!393937 () Bool)

(assert (=> b!393937 (= e!238469 tp_is_empty!9727)))

(declare-fun b!393936 () Bool)

(assert (=> b!393936 (= e!238468 tp_is_empty!9727)))

(declare-fun mapIsEmpty!16197 () Bool)

(assert (=> mapIsEmpty!16197 mapRes!16197))

(assert (= (and mapNonEmpty!16188 condMapEmpty!16197) mapIsEmpty!16197))

(assert (= (and mapNonEmpty!16188 (not condMapEmpty!16197)) mapNonEmpty!16197))

(assert (= (and mapNonEmpty!16197 ((_ is ValueCellFull!4520) mapValue!16197)) b!393936))

(assert (= (and mapNonEmpty!16188 ((_ is ValueCellFull!4520) mapDefault!16197)) b!393937))

(declare-fun m!389953 () Bool)

(assert (=> mapNonEmpty!16197 m!389953))

(declare-fun b_lambda!8785 () Bool)

(assert (= b_lambda!8773 (or (and start!38182 b_free!9055) b_lambda!8785)))

(declare-fun b_lambda!8787 () Bool)

(assert (= b_lambda!8777 (or (and start!38182 b_free!9055) b_lambda!8787)))

(declare-fun b_lambda!8789 () Bool)

(assert (= b_lambda!8783 (or (and start!38182 b_free!9055) b_lambda!8789)))

(declare-fun b_lambda!8791 () Bool)

(assert (= b_lambda!8779 (or (and start!38182 b_free!9055) b_lambda!8791)))

(declare-fun b_lambda!8793 () Bool)

(assert (= b_lambda!8775 (or (and start!38182 b_free!9055) b_lambda!8793)))

(declare-fun b_lambda!8795 () Bool)

(assert (= b_lambda!8781 (or (and start!38182 b_free!9055) b_lambda!8795)))

(check-sat (not b!393882) (not d!73061) (not b!393894) (not b_lambda!8787) (not b!393752) (not b!393915) (not b!393896) (not bm!27818) (not bm!27832) (not b!393778) (not b!393748) (not b!393812) (not b!393813) (not b!393928) (not b!393871) (not b_lambda!8785) (not b!393810) (not b!393762) (not b!393784) (not bm!27831) (not b!393895) (not b!393774) (not bm!27825) (not b!393887) (not b!393917) (not b!393909) (not d!73055) (not b!393816) (not mapNonEmpty!16197) (not b!393912) (not b!393916) (not b!393815) tp_is_empty!9727 (not b!393869) (not d!73063) (not b_lambda!8793) (not b!393878) (not b!393747) (not b!393761) (not b!393893) (not b!393868) (not bm!27793) (not bm!27824) (not bm!27790) (not d!73047) (not bm!27813) (not b!393773) (not bm!27826) (not b_lambda!8795) (not bm!27797) (not b!393809) (not bm!27820) (not b!393753) (not b_next!9055) (not bm!27817) (not bm!27823) (not b!393870) (not d!73065) (not b_lambda!8791) (not b!393777) (not b!393918) (not b!393872) (not b!393891) (not d!73059) (not b!393750) (not bm!27789) (not b!393817) (not b_lambda!8789) (not b!393905) (not b!393755) (not bm!27816) (not b!393886) (not b!393818) b_and!16419 (not b!393901) (not b!393910) (not b!393892) (not b!393873) (not d!73057) (not bm!27794) (not b!393913))
(check-sat b_and!16419 (not b_next!9055))
