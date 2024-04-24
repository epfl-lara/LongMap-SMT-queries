; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38182 () Bool)

(assert start!38182)

(declare-fun b_free!9055 () Bool)

(declare-fun b_next!9055 () Bool)

(assert (=> start!38182 (= b_free!9055 (not b_next!9055))))

(declare-fun tp!31950 () Bool)

(declare-fun b_and!16443 () Bool)

(assert (=> start!38182 (= tp!31950 b_and!16443)))

(declare-fun b!393861 () Bool)

(declare-fun res!225727 () Bool)

(declare-fun e!238436 () Bool)

(assert (=> b!393861 (=> (not res!225727) (not e!238436))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23350 0))(
  ( (array!23351 (arr!11132 (Array (_ BitVec 32) (_ BitVec 64))) (size!11484 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23350)

(assert (=> b!393861 (= res!225727 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11484 _keys!658))))))

(declare-fun b!393862 () Bool)

(declare-fun e!238437 () Bool)

(declare-fun tp_is_empty!9727 () Bool)

(assert (=> b!393862 (= e!238437 tp_is_empty!9727)))

(declare-fun b!393863 () Bool)

(declare-fun res!225729 () Bool)

(assert (=> b!393863 (=> (not res!225729) (not e!238436))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393863 (= res!225729 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16188 () Bool)

(declare-fun mapRes!16188 () Bool)

(declare-fun tp!31949 () Bool)

(declare-fun e!238438 () Bool)

(assert (=> mapNonEmpty!16188 (= mapRes!16188 (and tp!31949 e!238438))))

(declare-fun mapKey!16188 () (_ BitVec 32))

(declare-datatypes ((V!14075 0))(
  ( (V!14076 (val!4908 Int)) )
))
(declare-datatypes ((ValueCell!4520 0))(
  ( (ValueCellFull!4520 (v!7150 V!14075)) (EmptyCell!4520) )
))
(declare-fun mapValue!16188 () ValueCell!4520)

(declare-fun mapRest!16188 () (Array (_ BitVec 32) ValueCell!4520))

(declare-datatypes ((array!23352 0))(
  ( (array!23353 (arr!11133 (Array (_ BitVec 32) ValueCell!4520)) (size!11485 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23352)

(assert (=> mapNonEmpty!16188 (= (arr!11133 _values!506) (store mapRest!16188 mapKey!16188 mapValue!16188))))

(declare-fun mapIsEmpty!16188 () Bool)

(assert (=> mapIsEmpty!16188 mapRes!16188))

(declare-fun b!393864 () Bool)

(declare-fun res!225726 () Bool)

(assert (=> b!393864 (=> (not res!225726) (not e!238436))))

(assert (=> b!393864 (= res!225726 (or (= (select (arr!11132 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11132 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393865 () Bool)

(declare-fun res!225730 () Bool)

(declare-fun e!238439 () Bool)

(assert (=> b!393865 (=> (not res!225730) (not e!238439))))

(declare-fun lt!186541 () array!23350)

(declare-datatypes ((List!6340 0))(
  ( (Nil!6337) (Cons!6336 (h!7192 (_ BitVec 64)) (t!11504 List!6340)) )
))
(declare-fun arrayNoDuplicates!0 (array!23350 (_ BitVec 32) List!6340) Bool)

(assert (=> b!393865 (= res!225730 (arrayNoDuplicates!0 lt!186541 #b00000000000000000000000000000000 Nil!6337))))

(declare-fun b!393866 () Bool)

(assert (=> b!393866 (= e!238438 tp_is_empty!9727)))

(declare-fun b!393867 () Bool)

(declare-fun res!225728 () Bool)

(assert (=> b!393867 (=> (not res!225728) (not e!238436))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23350 (_ BitVec 32)) Bool)

(assert (=> b!393867 (= res!225728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393868 () Bool)

(declare-fun e!238433 () Bool)

(assert (=> b!393868 (= e!238433 (and e!238437 mapRes!16188))))

(declare-fun condMapEmpty!16188 () Bool)

(declare-fun mapDefault!16188 () ValueCell!4520)

(assert (=> b!393868 (= condMapEmpty!16188 (= (arr!11133 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4520)) mapDefault!16188)))))

(declare-fun b!393869 () Bool)

(declare-fun res!225735 () Bool)

(assert (=> b!393869 (=> (not res!225735) (not e!238436))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393869 (= res!225735 (and (= (size!11485 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11484 _keys!658) (size!11485 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393870 () Bool)

(declare-fun res!225732 () Bool)

(assert (=> b!393870 (=> (not res!225732) (not e!238436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393870 (= res!225732 (validKeyInArray!0 k0!778))))

(declare-fun b!393871 () Bool)

(declare-fun res!225731 () Bool)

(assert (=> b!393871 (=> (not res!225731) (not e!238436))))

(assert (=> b!393871 (= res!225731 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6337))))

(declare-datatypes ((tuple2!6492 0))(
  ( (tuple2!6493 (_1!3257 (_ BitVec 64)) (_2!3257 V!14075)) )
))
(declare-datatypes ((List!6341 0))(
  ( (Nil!6338) (Cons!6337 (h!7193 tuple2!6492) (t!11505 List!6341)) )
))
(declare-datatypes ((ListLongMap!5407 0))(
  ( (ListLongMap!5408 (toList!2719 List!6341)) )
))
(declare-fun lt!186542 () ListLongMap!5407)

(declare-fun e!238435 () Bool)

(declare-fun lt!186545 () tuple2!6492)

(declare-fun b!393872 () Bool)

(declare-fun lt!186544 () ListLongMap!5407)

(declare-fun +!1073 (ListLongMap!5407 tuple2!6492) ListLongMap!5407)

(assert (=> b!393872 (= e!238435 (= (+!1073 lt!186544 lt!186545) lt!186542))))

(declare-fun lt!186546 () ListLongMap!5407)

(assert (=> b!393872 (= lt!186542 lt!186546)))

(declare-fun res!225725 () Bool)

(assert (=> start!38182 (=> (not res!225725) (not e!238436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38182 (= res!225725 (validMask!0 mask!970))))

(assert (=> start!38182 e!238436))

(declare-fun array_inv!8228 (array!23352) Bool)

(assert (=> start!38182 (and (array_inv!8228 _values!506) e!238433)))

(assert (=> start!38182 tp!31950))

(assert (=> start!38182 true))

(assert (=> start!38182 tp_is_empty!9727))

(declare-fun array_inv!8229 (array!23350) Bool)

(assert (=> start!38182 (array_inv!8229 _keys!658)))

(declare-fun b!393873 () Bool)

(assert (=> b!393873 (= e!238436 e!238439)))

(declare-fun res!225734 () Bool)

(assert (=> b!393873 (=> (not res!225734) (not e!238439))))

(assert (=> b!393873 (= res!225734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186541 mask!970))))

(assert (=> b!393873 (= lt!186541 (array!23351 (store (arr!11132 _keys!658) i!548 k0!778) (size!11484 _keys!658)))))

(declare-fun b!393874 () Bool)

(assert (=> b!393874 (= e!238439 (not e!238435))))

(declare-fun res!225733 () Bool)

(assert (=> b!393874 (=> res!225733 e!238435)))

(declare-fun lt!186547 () Bool)

(assert (=> b!393874 (= res!225733 (or (and (not lt!186547) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186547) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186547)))))

(assert (=> b!393874 (= lt!186547 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14075)

(declare-fun minValue!472 () V!14075)

(declare-fun getCurrentListMap!2092 (array!23350 array!23352 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) Int) ListLongMap!5407)

(assert (=> b!393874 (= lt!186544 (getCurrentListMap!2092 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186549 () array!23352)

(assert (=> b!393874 (= lt!186542 (getCurrentListMap!2092 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186550 () ListLongMap!5407)

(assert (=> b!393874 (and (= lt!186546 lt!186550) (= lt!186550 lt!186546))))

(declare-fun lt!186543 () ListLongMap!5407)

(assert (=> b!393874 (= lt!186550 (+!1073 lt!186543 lt!186545))))

(declare-fun v!373 () V!14075)

(assert (=> b!393874 (= lt!186545 (tuple2!6493 k0!778 v!373))))

(declare-datatypes ((Unit!12015 0))(
  ( (Unit!12016) )
))
(declare-fun lt!186548 () Unit!12015)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 (array!23350 array!23352 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) (_ BitVec 64) V!14075 (_ BitVec 32) Int) Unit!12015)

(assert (=> b!393874 (= lt!186548 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!981 (array!23350 array!23352 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) Int) ListLongMap!5407)

(assert (=> b!393874 (= lt!186546 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393874 (= lt!186549 (array!23353 (store (arr!11133 _values!506) i!548 (ValueCellFull!4520 v!373)) (size!11485 _values!506)))))

(assert (=> b!393874 (= lt!186543 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!38182 res!225725) b!393869))

(assert (= (and b!393869 res!225735) b!393867))

(assert (= (and b!393867 res!225728) b!393871))

(assert (= (and b!393871 res!225731) b!393861))

(assert (= (and b!393861 res!225727) b!393870))

(assert (= (and b!393870 res!225732) b!393864))

(assert (= (and b!393864 res!225726) b!393863))

(assert (= (and b!393863 res!225729) b!393873))

(assert (= (and b!393873 res!225734) b!393865))

(assert (= (and b!393865 res!225730) b!393874))

(assert (= (and b!393874 (not res!225733)) b!393872))

(assert (= (and b!393868 condMapEmpty!16188) mapIsEmpty!16188))

(assert (= (and b!393868 (not condMapEmpty!16188)) mapNonEmpty!16188))

(get-info :version)

(assert (= (and mapNonEmpty!16188 ((_ is ValueCellFull!4520) mapValue!16188)) b!393866))

(assert (= (and b!393868 ((_ is ValueCellFull!4520) mapDefault!16188)) b!393862))

(assert (= start!38182 b!393868))

(declare-fun m!390581 () Bool)

(assert (=> b!393865 m!390581))

(declare-fun m!390583 () Bool)

(assert (=> b!393867 m!390583))

(declare-fun m!390585 () Bool)

(assert (=> b!393871 m!390585))

(declare-fun m!390587 () Bool)

(assert (=> b!393874 m!390587))

(declare-fun m!390589 () Bool)

(assert (=> b!393874 m!390589))

(declare-fun m!390591 () Bool)

(assert (=> b!393874 m!390591))

(declare-fun m!390593 () Bool)

(assert (=> b!393874 m!390593))

(declare-fun m!390595 () Bool)

(assert (=> b!393874 m!390595))

(declare-fun m!390597 () Bool)

(assert (=> b!393874 m!390597))

(declare-fun m!390599 () Bool)

(assert (=> b!393874 m!390599))

(declare-fun m!390601 () Bool)

(assert (=> b!393863 m!390601))

(declare-fun m!390603 () Bool)

(assert (=> b!393873 m!390603))

(declare-fun m!390605 () Bool)

(assert (=> b!393873 m!390605))

(declare-fun m!390607 () Bool)

(assert (=> b!393864 m!390607))

(declare-fun m!390609 () Bool)

(assert (=> b!393872 m!390609))

(declare-fun m!390611 () Bool)

(assert (=> b!393870 m!390611))

(declare-fun m!390613 () Bool)

(assert (=> start!38182 m!390613))

(declare-fun m!390615 () Bool)

(assert (=> start!38182 m!390615))

(declare-fun m!390617 () Bool)

(assert (=> start!38182 m!390617))

(declare-fun m!390619 () Bool)

(assert (=> mapNonEmpty!16188 m!390619))

(check-sat (not b!393865) (not b!393870) (not b_next!9055) (not b!393863) (not b!393867) (not b!393871) (not mapNonEmpty!16188) (not b!393872) b_and!16443 (not start!38182) (not b!393873) (not b!393874) tp_is_empty!9727)
(check-sat b_and!16443 (not b_next!9055))
(get-model)

(declare-fun d!73275 () Bool)

(assert (=> d!73275 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38182 d!73275))

(declare-fun d!73277 () Bool)

(assert (=> d!73277 (= (array_inv!8228 _values!506) (bvsge (size!11485 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38182 d!73277))

(declare-fun d!73279 () Bool)

(assert (=> d!73279 (= (array_inv!8229 _keys!658) (bvsge (size!11484 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38182 d!73279))

(declare-fun d!73281 () Bool)

(declare-fun res!225810 () Bool)

(declare-fun e!238493 () Bool)

(assert (=> d!73281 (=> res!225810 e!238493)))

(assert (=> d!73281 (= res!225810 (bvsge #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(assert (=> d!73281 (= (arrayNoDuplicates!0 lt!186541 #b00000000000000000000000000000000 Nil!6337) e!238493)))

(declare-fun b!393969 () Bool)

(declare-fun e!238492 () Bool)

(assert (=> b!393969 (= e!238493 e!238492)))

(declare-fun res!225808 () Bool)

(assert (=> b!393969 (=> (not res!225808) (not e!238492))))

(declare-fun e!238491 () Bool)

(assert (=> b!393969 (= res!225808 (not e!238491))))

(declare-fun res!225809 () Bool)

(assert (=> b!393969 (=> (not res!225809) (not e!238491))))

(assert (=> b!393969 (= res!225809 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!393970 () Bool)

(declare-fun e!238490 () Bool)

(assert (=> b!393970 (= e!238492 e!238490)))

(declare-fun c!54465 () Bool)

(assert (=> b!393970 (= c!54465 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!393971 () Bool)

(declare-fun call!27804 () Bool)

(assert (=> b!393971 (= e!238490 call!27804)))

(declare-fun b!393972 () Bool)

(declare-fun contains!2452 (List!6340 (_ BitVec 64)) Bool)

(assert (=> b!393972 (= e!238491 (contains!2452 Nil!6337 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!393973 () Bool)

(assert (=> b!393973 (= e!238490 call!27804)))

(declare-fun bm!27801 () Bool)

(assert (=> bm!27801 (= call!27804 (arrayNoDuplicates!0 lt!186541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54465 (Cons!6336 (select (arr!11132 lt!186541) #b00000000000000000000000000000000) Nil!6337) Nil!6337)))))

(assert (= (and d!73281 (not res!225810)) b!393969))

(assert (= (and b!393969 res!225809) b!393972))

(assert (= (and b!393969 res!225808) b!393970))

(assert (= (and b!393970 c!54465) b!393971))

(assert (= (and b!393970 (not c!54465)) b!393973))

(assert (= (or b!393971 b!393973) bm!27801))

(declare-fun m!390701 () Bool)

(assert (=> b!393969 m!390701))

(assert (=> b!393969 m!390701))

(declare-fun m!390703 () Bool)

(assert (=> b!393969 m!390703))

(assert (=> b!393970 m!390701))

(assert (=> b!393970 m!390701))

(assert (=> b!393970 m!390703))

(assert (=> b!393972 m!390701))

(assert (=> b!393972 m!390701))

(declare-fun m!390705 () Bool)

(assert (=> b!393972 m!390705))

(assert (=> bm!27801 m!390701))

(declare-fun m!390707 () Bool)

(assert (=> bm!27801 m!390707))

(assert (=> b!393865 d!73281))

(declare-fun d!73283 () Bool)

(assert (=> d!73283 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393870 d!73283))

(declare-fun b!394016 () Bool)

(declare-fun e!238531 () Bool)

(declare-fun e!238529 () Bool)

(assert (=> b!394016 (= e!238531 e!238529)))

(declare-fun res!225836 () Bool)

(assert (=> b!394016 (=> (not res!225836) (not e!238529))))

(declare-fun lt!186659 () ListLongMap!5407)

(declare-fun contains!2453 (ListLongMap!5407 (_ BitVec 64)) Bool)

(assert (=> b!394016 (= res!225836 (contains!2453 lt!186659 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(assert (=> b!394016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun d!73285 () Bool)

(declare-fun e!238522 () Bool)

(assert (=> d!73285 e!238522))

(declare-fun res!225833 () Bool)

(assert (=> d!73285 (=> (not res!225833) (not e!238522))))

(assert (=> d!73285 (= res!225833 (or (bvsge #b00000000000000000000000000000000 (size!11484 lt!186541)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))))

(declare-fun lt!186676 () ListLongMap!5407)

(assert (=> d!73285 (= lt!186659 lt!186676)))

(declare-fun lt!186671 () Unit!12015)

(declare-fun e!238520 () Unit!12015)

(assert (=> d!73285 (= lt!186671 e!238520)))

(declare-fun c!54482 () Bool)

(declare-fun e!238523 () Bool)

(assert (=> d!73285 (= c!54482 e!238523)))

(declare-fun res!225832 () Bool)

(assert (=> d!73285 (=> (not res!225832) (not e!238523))))

(assert (=> d!73285 (= res!225832 (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun e!238521 () ListLongMap!5407)

(assert (=> d!73285 (= lt!186676 e!238521)))

(declare-fun c!54480 () Bool)

(assert (=> d!73285 (= c!54480 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73285 (validMask!0 mask!970)))

(assert (=> d!73285 (= (getCurrentListMap!2092 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186659)))

(declare-fun b!394017 () Bool)

(declare-fun e!238527 () Bool)

(declare-fun apply!308 (ListLongMap!5407 (_ BitVec 64)) V!14075)

(assert (=> b!394017 (= e!238527 (= (apply!308 lt!186659 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!394018 () Bool)

(declare-fun Unit!12019 () Unit!12015)

(assert (=> b!394018 (= e!238520 Unit!12019)))

(declare-fun b!394019 () Bool)

(declare-fun e!238528 () Bool)

(assert (=> b!394019 (= e!238528 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!394020 () Bool)

(declare-fun c!54481 () Bool)

(assert (=> b!394020 (= c!54481 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!238526 () ListLongMap!5407)

(declare-fun e!238530 () ListLongMap!5407)

(assert (=> b!394020 (= e!238526 e!238530)))

(declare-fun b!394021 () Bool)

(declare-fun call!27819 () ListLongMap!5407)

(assert (=> b!394021 (= e!238530 call!27819)))

(declare-fun bm!27816 () Bool)

(declare-fun call!27825 () ListLongMap!5407)

(declare-fun call!27823 () ListLongMap!5407)

(assert (=> bm!27816 (= call!27825 call!27823)))

(declare-fun b!394022 () Bool)

(declare-fun res!225831 () Bool)

(assert (=> b!394022 (=> (not res!225831) (not e!238522))))

(declare-fun e!238525 () Bool)

(assert (=> b!394022 (= res!225831 e!238525)))

(declare-fun c!54478 () Bool)

(assert (=> b!394022 (= c!54478 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27817 () Bool)

(declare-fun call!27820 () Bool)

(assert (=> bm!27817 (= call!27820 (contains!2453 lt!186659 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394023 () Bool)

(declare-fun get!5630 (ValueCell!4520 V!14075) V!14075)

(declare-fun dynLambda!651 (Int (_ BitVec 64)) V!14075)

(assert (=> b!394023 (= e!238529 (= (apply!308 lt!186659 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)) (get!5630 (select (arr!11133 lt!186549) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!394023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11485 lt!186549)))))

(assert (=> b!394023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun bm!27818 () Bool)

(declare-fun call!27822 () ListLongMap!5407)

(declare-fun call!27821 () ListLongMap!5407)

(assert (=> bm!27818 (= call!27822 call!27821)))

(declare-fun b!394024 () Bool)

(assert (=> b!394024 (= e!238530 call!27825)))

(declare-fun b!394025 () Bool)

(assert (=> b!394025 (= e!238521 e!238526)))

(declare-fun c!54479 () Bool)

(assert (=> b!394025 (= c!54479 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!394026 () Bool)

(declare-fun call!27824 () Bool)

(assert (=> b!394026 (= e!238525 (not call!27824))))

(declare-fun bm!27819 () Bool)

(assert (=> bm!27819 (= call!27824 (contains!2453 lt!186659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394027 () Bool)

(declare-fun e!238524 () Bool)

(assert (=> b!394027 (= e!238524 (= (apply!308 lt!186659 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27820 () Bool)

(assert (=> bm!27820 (= call!27819 call!27822)))

(declare-fun b!394028 () Bool)

(declare-fun e!238532 () Bool)

(assert (=> b!394028 (= e!238522 e!238532)))

(declare-fun c!54483 () Bool)

(assert (=> b!394028 (= c!54483 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27821 () Bool)

(assert (=> bm!27821 (= call!27821 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394029 () Bool)

(assert (=> b!394029 (= e!238525 e!238527)))

(declare-fun res!225837 () Bool)

(assert (=> b!394029 (= res!225837 call!27824)))

(assert (=> b!394029 (=> (not res!225837) (not e!238527))))

(declare-fun b!394030 () Bool)

(declare-fun res!225830 () Bool)

(assert (=> b!394030 (=> (not res!225830) (not e!238522))))

(assert (=> b!394030 (= res!225830 e!238531)))

(declare-fun res!225834 () Bool)

(assert (=> b!394030 (=> res!225834 e!238531)))

(assert (=> b!394030 (= res!225834 (not e!238528))))

(declare-fun res!225835 () Bool)

(assert (=> b!394030 (=> (not res!225835) (not e!238528))))

(assert (=> b!394030 (= res!225835 (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun b!394031 () Bool)

(assert (=> b!394031 (= e!238523 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!394032 () Bool)

(assert (=> b!394032 (= e!238532 (not call!27820))))

(declare-fun b!394033 () Bool)

(assert (=> b!394033 (= e!238532 e!238524)))

(declare-fun res!225829 () Bool)

(assert (=> b!394033 (= res!225829 call!27820)))

(assert (=> b!394033 (=> (not res!225829) (not e!238524))))

(declare-fun b!394034 () Bool)

(assert (=> b!394034 (= e!238526 call!27825)))

(declare-fun bm!27822 () Bool)

(assert (=> bm!27822 (= call!27823 (+!1073 (ite c!54480 call!27821 (ite c!54479 call!27822 call!27819)) (ite (or c!54480 c!54479) (tuple2!6493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!394035 () Bool)

(assert (=> b!394035 (= e!238521 (+!1073 call!27823 (tuple2!6493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!394036 () Bool)

(declare-fun lt!186674 () Unit!12015)

(assert (=> b!394036 (= e!238520 lt!186674)))

(declare-fun lt!186661 () ListLongMap!5407)

(assert (=> b!394036 (= lt!186661 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186667 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186672 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186672 (select (arr!11132 lt!186541) #b00000000000000000000000000000000))))

(declare-fun lt!186668 () Unit!12015)

(declare-fun addStillContains!284 (ListLongMap!5407 (_ BitVec 64) V!14075 (_ BitVec 64)) Unit!12015)

(assert (=> b!394036 (= lt!186668 (addStillContains!284 lt!186661 lt!186667 zeroValue!472 lt!186672))))

(assert (=> b!394036 (contains!2453 (+!1073 lt!186661 (tuple2!6493 lt!186667 zeroValue!472)) lt!186672)))

(declare-fun lt!186662 () Unit!12015)

(assert (=> b!394036 (= lt!186662 lt!186668)))

(declare-fun lt!186666 () ListLongMap!5407)

(assert (=> b!394036 (= lt!186666 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186670 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186670 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186660 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186660 (select (arr!11132 lt!186541) #b00000000000000000000000000000000))))

(declare-fun lt!186675 () Unit!12015)

(declare-fun addApplyDifferent!284 (ListLongMap!5407 (_ BitVec 64) V!14075 (_ BitVec 64)) Unit!12015)

(assert (=> b!394036 (= lt!186675 (addApplyDifferent!284 lt!186666 lt!186670 minValue!472 lt!186660))))

(assert (=> b!394036 (= (apply!308 (+!1073 lt!186666 (tuple2!6493 lt!186670 minValue!472)) lt!186660) (apply!308 lt!186666 lt!186660))))

(declare-fun lt!186673 () Unit!12015)

(assert (=> b!394036 (= lt!186673 lt!186675)))

(declare-fun lt!186656 () ListLongMap!5407)

(assert (=> b!394036 (= lt!186656 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186664 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186664 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186669 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186669 (select (arr!11132 lt!186541) #b00000000000000000000000000000000))))

(declare-fun lt!186665 () Unit!12015)

(assert (=> b!394036 (= lt!186665 (addApplyDifferent!284 lt!186656 lt!186664 zeroValue!472 lt!186669))))

(assert (=> b!394036 (= (apply!308 (+!1073 lt!186656 (tuple2!6493 lt!186664 zeroValue!472)) lt!186669) (apply!308 lt!186656 lt!186669))))

(declare-fun lt!186655 () Unit!12015)

(assert (=> b!394036 (= lt!186655 lt!186665)))

(declare-fun lt!186658 () ListLongMap!5407)

(assert (=> b!394036 (= lt!186658 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186657 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186657 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186663 () (_ BitVec 64))

(assert (=> b!394036 (= lt!186663 (select (arr!11132 lt!186541) #b00000000000000000000000000000000))))

(assert (=> b!394036 (= lt!186674 (addApplyDifferent!284 lt!186658 lt!186657 minValue!472 lt!186663))))

(assert (=> b!394036 (= (apply!308 (+!1073 lt!186658 (tuple2!6493 lt!186657 minValue!472)) lt!186663) (apply!308 lt!186658 lt!186663))))

(assert (= (and d!73285 c!54480) b!394035))

(assert (= (and d!73285 (not c!54480)) b!394025))

(assert (= (and b!394025 c!54479) b!394034))

(assert (= (and b!394025 (not c!54479)) b!394020))

(assert (= (and b!394020 c!54481) b!394024))

(assert (= (and b!394020 (not c!54481)) b!394021))

(assert (= (or b!394024 b!394021) bm!27820))

(assert (= (or b!394034 bm!27820) bm!27818))

(assert (= (or b!394034 b!394024) bm!27816))

(assert (= (or b!394035 bm!27818) bm!27821))

(assert (= (or b!394035 bm!27816) bm!27822))

(assert (= (and d!73285 res!225832) b!394031))

(assert (= (and d!73285 c!54482) b!394036))

(assert (= (and d!73285 (not c!54482)) b!394018))

(assert (= (and d!73285 res!225833) b!394030))

(assert (= (and b!394030 res!225835) b!394019))

(assert (= (and b!394030 (not res!225834)) b!394016))

(assert (= (and b!394016 res!225836) b!394023))

(assert (= (and b!394030 res!225830) b!394022))

(assert (= (and b!394022 c!54478) b!394029))

(assert (= (and b!394022 (not c!54478)) b!394026))

(assert (= (and b!394029 res!225837) b!394017))

(assert (= (or b!394029 b!394026) bm!27819))

(assert (= (and b!394022 res!225831) b!394028))

(assert (= (and b!394028 c!54483) b!394033))

(assert (= (and b!394028 (not c!54483)) b!394032))

(assert (= (and b!394033 res!225829) b!394027))

(assert (= (or b!394033 b!394032) bm!27817))

(declare-fun b_lambda!8813 () Bool)

(assert (=> (not b_lambda!8813) (not b!394023)))

(declare-fun t!11511 () Bool)

(declare-fun tb!3123 () Bool)

(assert (=> (and start!38182 (= defaultEntry!514 defaultEntry!514) t!11511) tb!3123))

(declare-fun result!5765 () Bool)

(assert (=> tb!3123 (= result!5765 tp_is_empty!9727)))

(assert (=> b!394023 t!11511))

(declare-fun b_and!16449 () Bool)

(assert (= b_and!16443 (and (=> t!11511 result!5765) b_and!16449)))

(declare-fun m!390709 () Bool)

(assert (=> b!394023 m!390709))

(declare-fun m!390711 () Bool)

(assert (=> b!394023 m!390711))

(assert (=> b!394023 m!390709))

(declare-fun m!390713 () Bool)

(assert (=> b!394023 m!390713))

(assert (=> b!394023 m!390711))

(assert (=> b!394023 m!390701))

(assert (=> b!394023 m!390701))

(declare-fun m!390715 () Bool)

(assert (=> b!394023 m!390715))

(declare-fun m!390717 () Bool)

(assert (=> bm!27822 m!390717))

(assert (=> b!394019 m!390701))

(assert (=> b!394019 m!390701))

(assert (=> b!394019 m!390703))

(declare-fun m!390719 () Bool)

(assert (=> b!394017 m!390719))

(assert (=> b!394031 m!390701))

(assert (=> b!394031 m!390701))

(assert (=> b!394031 m!390703))

(declare-fun m!390721 () Bool)

(assert (=> b!394036 m!390721))

(declare-fun m!390723 () Bool)

(assert (=> b!394036 m!390723))

(declare-fun m!390725 () Bool)

(assert (=> b!394036 m!390725))

(assert (=> b!394036 m!390723))

(declare-fun m!390727 () Bool)

(assert (=> b!394036 m!390727))

(declare-fun m!390729 () Bool)

(assert (=> b!394036 m!390729))

(assert (=> b!394036 m!390701))

(declare-fun m!390731 () Bool)

(assert (=> b!394036 m!390731))

(declare-fun m!390733 () Bool)

(assert (=> b!394036 m!390733))

(declare-fun m!390735 () Bool)

(assert (=> b!394036 m!390735))

(declare-fun m!390737 () Bool)

(assert (=> b!394036 m!390737))

(declare-fun m!390739 () Bool)

(assert (=> b!394036 m!390739))

(assert (=> b!394036 m!390721))

(declare-fun m!390741 () Bool)

(assert (=> b!394036 m!390741))

(declare-fun m!390743 () Bool)

(assert (=> b!394036 m!390743))

(assert (=> b!394036 m!390729))

(declare-fun m!390745 () Bool)

(assert (=> b!394036 m!390745))

(assert (=> b!394036 m!390739))

(declare-fun m!390747 () Bool)

(assert (=> b!394036 m!390747))

(declare-fun m!390749 () Bool)

(assert (=> b!394036 m!390749))

(assert (=> b!394036 m!390591))

(declare-fun m!390751 () Bool)

(assert (=> bm!27819 m!390751))

(declare-fun m!390753 () Bool)

(assert (=> bm!27817 m!390753))

(declare-fun m!390755 () Bool)

(assert (=> b!394035 m!390755))

(assert (=> bm!27821 m!390591))

(declare-fun m!390757 () Bool)

(assert (=> b!394027 m!390757))

(assert (=> d!73285 m!390613))

(assert (=> b!394016 m!390701))

(assert (=> b!394016 m!390701))

(declare-fun m!390759 () Bool)

(assert (=> b!394016 m!390759))

(assert (=> b!393874 d!73285))

(declare-fun b!394063 () Bool)

(declare-fun e!238548 () ListLongMap!5407)

(assert (=> b!394063 (= e!238548 (ListLongMap!5408 Nil!6338))))

(declare-fun d!73287 () Bool)

(declare-fun e!238550 () Bool)

(assert (=> d!73287 e!238550))

(declare-fun res!225847 () Bool)

(assert (=> d!73287 (=> (not res!225847) (not e!238550))))

(declare-fun lt!186697 () ListLongMap!5407)

(assert (=> d!73287 (= res!225847 (not (contains!2453 lt!186697 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73287 (= lt!186697 e!238548)))

(declare-fun c!54492 () Bool)

(assert (=> d!73287 (= c!54492 (bvsge #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(assert (=> d!73287 (validMask!0 mask!970)))

(assert (=> d!73287 (= (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186697)))

(declare-fun b!394064 () Bool)

(declare-fun e!238547 () ListLongMap!5407)

(declare-fun call!27828 () ListLongMap!5407)

(assert (=> b!394064 (= e!238547 call!27828)))

(declare-fun b!394065 () Bool)

(declare-fun e!238551 () Bool)

(declare-fun e!238553 () Bool)

(assert (=> b!394065 (= e!238551 e!238553)))

(declare-fun c!54494 () Bool)

(assert (=> b!394065 (= c!54494 (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun b!394066 () Bool)

(declare-fun lt!186692 () Unit!12015)

(declare-fun lt!186695 () Unit!12015)

(assert (=> b!394066 (= lt!186692 lt!186695)))

(declare-fun lt!186691 () ListLongMap!5407)

(declare-fun lt!186694 () (_ BitVec 64))

(declare-fun lt!186696 () (_ BitVec 64))

(declare-fun lt!186693 () V!14075)

(assert (=> b!394066 (not (contains!2453 (+!1073 lt!186691 (tuple2!6493 lt!186694 lt!186693)) lt!186696))))

(declare-fun addStillNotContains!143 (ListLongMap!5407 (_ BitVec 64) V!14075 (_ BitVec 64)) Unit!12015)

(assert (=> b!394066 (= lt!186695 (addStillNotContains!143 lt!186691 lt!186694 lt!186693 lt!186696))))

(assert (=> b!394066 (= lt!186696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!394066 (= lt!186693 (get!5630 (select (arr!11133 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!394066 (= lt!186694 (select (arr!11132 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!394066 (= lt!186691 call!27828)))

(assert (=> b!394066 (= e!238547 (+!1073 call!27828 (tuple2!6493 (select (arr!11132 _keys!658) #b00000000000000000000000000000000) (get!5630 (select (arr!11133 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!394067 () Bool)

(assert (=> b!394067 (= e!238548 e!238547)))

(declare-fun c!54495 () Bool)

(assert (=> b!394067 (= c!54495 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394068 () Bool)

(assert (=> b!394068 (= e!238550 e!238551)))

(declare-fun c!54493 () Bool)

(declare-fun e!238549 () Bool)

(assert (=> b!394068 (= c!54493 e!238549)))

(declare-fun res!225849 () Bool)

(assert (=> b!394068 (=> (not res!225849) (not e!238549))))

(assert (=> b!394068 (= res!225849 (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun b!394069 () Bool)

(assert (=> b!394069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(assert (=> b!394069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11485 _values!506)))))

(declare-fun e!238552 () Bool)

(assert (=> b!394069 (= e!238552 (= (apply!308 lt!186697 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)) (get!5630 (select (arr!11133 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!394070 () Bool)

(declare-fun isEmpty!560 (ListLongMap!5407) Bool)

(assert (=> b!394070 (= e!238553 (isEmpty!560 lt!186697))))

(declare-fun b!394071 () Bool)

(declare-fun res!225846 () Bool)

(assert (=> b!394071 (=> (not res!225846) (not e!238550))))

(assert (=> b!394071 (= res!225846 (not (contains!2453 lt!186697 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394072 () Bool)

(assert (=> b!394072 (= e!238553 (= lt!186697 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27825 () Bool)

(assert (=> bm!27825 (= call!27828 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!394073 () Bool)

(assert (=> b!394073 (= e!238549 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!394073 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!394074 () Bool)

(assert (=> b!394074 (= e!238551 e!238552)))

(assert (=> b!394074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun res!225848 () Bool)

(assert (=> b!394074 (= res!225848 (contains!2453 lt!186697 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!394074 (=> (not res!225848) (not e!238552))))

(assert (= (and d!73287 c!54492) b!394063))

(assert (= (and d!73287 (not c!54492)) b!394067))

(assert (= (and b!394067 c!54495) b!394066))

(assert (= (and b!394067 (not c!54495)) b!394064))

(assert (= (or b!394066 b!394064) bm!27825))

(assert (= (and d!73287 res!225847) b!394071))

(assert (= (and b!394071 res!225846) b!394068))

(assert (= (and b!394068 res!225849) b!394073))

(assert (= (and b!394068 c!54493) b!394074))

(assert (= (and b!394068 (not c!54493)) b!394065))

(assert (= (and b!394074 res!225848) b!394069))

(assert (= (and b!394065 c!54494) b!394072))

(assert (= (and b!394065 (not c!54494)) b!394070))

(declare-fun b_lambda!8815 () Bool)

(assert (=> (not b_lambda!8815) (not b!394066)))

(assert (=> b!394066 t!11511))

(declare-fun b_and!16451 () Bool)

(assert (= b_and!16449 (and (=> t!11511 result!5765) b_and!16451)))

(declare-fun b_lambda!8817 () Bool)

(assert (=> (not b_lambda!8817) (not b!394069)))

(assert (=> b!394069 t!11511))

(declare-fun b_and!16453 () Bool)

(assert (= b_and!16451 (and (=> t!11511 result!5765) b_and!16453)))

(declare-fun m!390761 () Bool)

(assert (=> b!394067 m!390761))

(assert (=> b!394067 m!390761))

(declare-fun m!390763 () Bool)

(assert (=> b!394067 m!390763))

(assert (=> b!394069 m!390709))

(declare-fun m!390765 () Bool)

(assert (=> b!394069 m!390765))

(assert (=> b!394069 m!390709))

(declare-fun m!390767 () Bool)

(assert (=> b!394069 m!390767))

(assert (=> b!394069 m!390761))

(assert (=> b!394069 m!390765))

(assert (=> b!394069 m!390761))

(declare-fun m!390769 () Bool)

(assert (=> b!394069 m!390769))

(declare-fun m!390771 () Bool)

(assert (=> bm!27825 m!390771))

(declare-fun m!390773 () Bool)

(assert (=> b!394071 m!390773))

(assert (=> b!394066 m!390709))

(assert (=> b!394066 m!390765))

(assert (=> b!394066 m!390709))

(assert (=> b!394066 m!390767))

(declare-fun m!390775 () Bool)

(assert (=> b!394066 m!390775))

(declare-fun m!390777 () Bool)

(assert (=> b!394066 m!390777))

(assert (=> b!394066 m!390761))

(assert (=> b!394066 m!390765))

(declare-fun m!390779 () Bool)

(assert (=> b!394066 m!390779))

(assert (=> b!394066 m!390775))

(declare-fun m!390781 () Bool)

(assert (=> b!394066 m!390781))

(assert (=> b!394073 m!390761))

(assert (=> b!394073 m!390761))

(assert (=> b!394073 m!390763))

(declare-fun m!390783 () Bool)

(assert (=> d!73287 m!390783))

(assert (=> d!73287 m!390613))

(assert (=> b!394072 m!390771))

(assert (=> b!394074 m!390761))

(assert (=> b!394074 m!390761))

(declare-fun m!390785 () Bool)

(assert (=> b!394074 m!390785))

(declare-fun m!390787 () Bool)

(assert (=> b!394070 m!390787))

(assert (=> b!393874 d!73287))

(declare-fun b!394075 () Bool)

(declare-fun e!238565 () Bool)

(declare-fun e!238563 () Bool)

(assert (=> b!394075 (= e!238565 e!238563)))

(declare-fun res!225857 () Bool)

(assert (=> b!394075 (=> (not res!225857) (not e!238563))))

(declare-fun lt!186702 () ListLongMap!5407)

(assert (=> b!394075 (= res!225857 (contains!2453 lt!186702 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!394075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun d!73289 () Bool)

(declare-fun e!238556 () Bool)

(assert (=> d!73289 e!238556))

(declare-fun res!225854 () Bool)

(assert (=> d!73289 (=> (not res!225854) (not e!238556))))

(assert (=> d!73289 (= res!225854 (or (bvsge #b00000000000000000000000000000000 (size!11484 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))))

(declare-fun lt!186719 () ListLongMap!5407)

(assert (=> d!73289 (= lt!186702 lt!186719)))

(declare-fun lt!186714 () Unit!12015)

(declare-fun e!238554 () Unit!12015)

(assert (=> d!73289 (= lt!186714 e!238554)))

(declare-fun c!54500 () Bool)

(declare-fun e!238557 () Bool)

(assert (=> d!73289 (= c!54500 e!238557)))

(declare-fun res!225853 () Bool)

(assert (=> d!73289 (=> (not res!225853) (not e!238557))))

(assert (=> d!73289 (= res!225853 (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun e!238555 () ListLongMap!5407)

(assert (=> d!73289 (= lt!186719 e!238555)))

(declare-fun c!54498 () Bool)

(assert (=> d!73289 (= c!54498 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73289 (validMask!0 mask!970)))

(assert (=> d!73289 (= (getCurrentListMap!2092 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186702)))

(declare-fun b!394076 () Bool)

(declare-fun e!238561 () Bool)

(assert (=> b!394076 (= e!238561 (= (apply!308 lt!186702 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!394077 () Bool)

(declare-fun Unit!12020 () Unit!12015)

(assert (=> b!394077 (= e!238554 Unit!12020)))

(declare-fun b!394078 () Bool)

(declare-fun e!238562 () Bool)

(assert (=> b!394078 (= e!238562 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394079 () Bool)

(declare-fun c!54499 () Bool)

(assert (=> b!394079 (= c!54499 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!238560 () ListLongMap!5407)

(declare-fun e!238564 () ListLongMap!5407)

(assert (=> b!394079 (= e!238560 e!238564)))

(declare-fun b!394080 () Bool)

(declare-fun call!27829 () ListLongMap!5407)

(assert (=> b!394080 (= e!238564 call!27829)))

(declare-fun bm!27826 () Bool)

(declare-fun call!27835 () ListLongMap!5407)

(declare-fun call!27833 () ListLongMap!5407)

(assert (=> bm!27826 (= call!27835 call!27833)))

(declare-fun b!394081 () Bool)

(declare-fun res!225852 () Bool)

(assert (=> b!394081 (=> (not res!225852) (not e!238556))))

(declare-fun e!238559 () Bool)

(assert (=> b!394081 (= res!225852 e!238559)))

(declare-fun c!54496 () Bool)

(assert (=> b!394081 (= c!54496 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27827 () Bool)

(declare-fun call!27830 () Bool)

(assert (=> bm!27827 (= call!27830 (contains!2453 lt!186702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394082 () Bool)

(assert (=> b!394082 (= e!238563 (= (apply!308 lt!186702 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)) (get!5630 (select (arr!11133 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!394082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11485 _values!506)))))

(assert (=> b!394082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun bm!27828 () Bool)

(declare-fun call!27832 () ListLongMap!5407)

(declare-fun call!27831 () ListLongMap!5407)

(assert (=> bm!27828 (= call!27832 call!27831)))

(declare-fun b!394083 () Bool)

(assert (=> b!394083 (= e!238564 call!27835)))

(declare-fun b!394084 () Bool)

(assert (=> b!394084 (= e!238555 e!238560)))

(declare-fun c!54497 () Bool)

(assert (=> b!394084 (= c!54497 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!394085 () Bool)

(declare-fun call!27834 () Bool)

(assert (=> b!394085 (= e!238559 (not call!27834))))

(declare-fun bm!27829 () Bool)

(assert (=> bm!27829 (= call!27834 (contains!2453 lt!186702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394086 () Bool)

(declare-fun e!238558 () Bool)

(assert (=> b!394086 (= e!238558 (= (apply!308 lt!186702 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27830 () Bool)

(assert (=> bm!27830 (= call!27829 call!27832)))

(declare-fun b!394087 () Bool)

(declare-fun e!238566 () Bool)

(assert (=> b!394087 (= e!238556 e!238566)))

(declare-fun c!54501 () Bool)

(assert (=> b!394087 (= c!54501 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27831 () Bool)

(assert (=> bm!27831 (= call!27831 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394088 () Bool)

(assert (=> b!394088 (= e!238559 e!238561)))

(declare-fun res!225858 () Bool)

(assert (=> b!394088 (= res!225858 call!27834)))

(assert (=> b!394088 (=> (not res!225858) (not e!238561))))

(declare-fun b!394089 () Bool)

(declare-fun res!225851 () Bool)

(assert (=> b!394089 (=> (not res!225851) (not e!238556))))

(assert (=> b!394089 (= res!225851 e!238565)))

(declare-fun res!225855 () Bool)

(assert (=> b!394089 (=> res!225855 e!238565)))

(assert (=> b!394089 (= res!225855 (not e!238562))))

(declare-fun res!225856 () Bool)

(assert (=> b!394089 (=> (not res!225856) (not e!238562))))

(assert (=> b!394089 (= res!225856 (bvslt #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(declare-fun b!394090 () Bool)

(assert (=> b!394090 (= e!238557 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394091 () Bool)

(assert (=> b!394091 (= e!238566 (not call!27830))))

(declare-fun b!394092 () Bool)

(assert (=> b!394092 (= e!238566 e!238558)))

(declare-fun res!225850 () Bool)

(assert (=> b!394092 (= res!225850 call!27830)))

(assert (=> b!394092 (=> (not res!225850) (not e!238558))))

(declare-fun b!394093 () Bool)

(assert (=> b!394093 (= e!238560 call!27835)))

(declare-fun bm!27832 () Bool)

(assert (=> bm!27832 (= call!27833 (+!1073 (ite c!54498 call!27831 (ite c!54497 call!27832 call!27829)) (ite (or c!54498 c!54497) (tuple2!6493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!394094 () Bool)

(assert (=> b!394094 (= e!238555 (+!1073 call!27833 (tuple2!6493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!394095 () Bool)

(declare-fun lt!186717 () Unit!12015)

(assert (=> b!394095 (= e!238554 lt!186717)))

(declare-fun lt!186704 () ListLongMap!5407)

(assert (=> b!394095 (= lt!186704 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186710 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186715 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186715 (select (arr!11132 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186711 () Unit!12015)

(assert (=> b!394095 (= lt!186711 (addStillContains!284 lt!186704 lt!186710 zeroValue!472 lt!186715))))

(assert (=> b!394095 (contains!2453 (+!1073 lt!186704 (tuple2!6493 lt!186710 zeroValue!472)) lt!186715)))

(declare-fun lt!186705 () Unit!12015)

(assert (=> b!394095 (= lt!186705 lt!186711)))

(declare-fun lt!186709 () ListLongMap!5407)

(assert (=> b!394095 (= lt!186709 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186713 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186703 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186703 (select (arr!11132 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186718 () Unit!12015)

(assert (=> b!394095 (= lt!186718 (addApplyDifferent!284 lt!186709 lt!186713 minValue!472 lt!186703))))

(assert (=> b!394095 (= (apply!308 (+!1073 lt!186709 (tuple2!6493 lt!186713 minValue!472)) lt!186703) (apply!308 lt!186709 lt!186703))))

(declare-fun lt!186716 () Unit!12015)

(assert (=> b!394095 (= lt!186716 lt!186718)))

(declare-fun lt!186699 () ListLongMap!5407)

(assert (=> b!394095 (= lt!186699 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186707 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186712 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186712 (select (arr!11132 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186708 () Unit!12015)

(assert (=> b!394095 (= lt!186708 (addApplyDifferent!284 lt!186699 lt!186707 zeroValue!472 lt!186712))))

(assert (=> b!394095 (= (apply!308 (+!1073 lt!186699 (tuple2!6493 lt!186707 zeroValue!472)) lt!186712) (apply!308 lt!186699 lt!186712))))

(declare-fun lt!186698 () Unit!12015)

(assert (=> b!394095 (= lt!186698 lt!186708)))

(declare-fun lt!186701 () ListLongMap!5407)

(assert (=> b!394095 (= lt!186701 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186700 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186700 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186706 () (_ BitVec 64))

(assert (=> b!394095 (= lt!186706 (select (arr!11132 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!394095 (= lt!186717 (addApplyDifferent!284 lt!186701 lt!186700 minValue!472 lt!186706))))

(assert (=> b!394095 (= (apply!308 (+!1073 lt!186701 (tuple2!6493 lt!186700 minValue!472)) lt!186706) (apply!308 lt!186701 lt!186706))))

(assert (= (and d!73289 c!54498) b!394094))

(assert (= (and d!73289 (not c!54498)) b!394084))

(assert (= (and b!394084 c!54497) b!394093))

(assert (= (and b!394084 (not c!54497)) b!394079))

(assert (= (and b!394079 c!54499) b!394083))

(assert (= (and b!394079 (not c!54499)) b!394080))

(assert (= (or b!394083 b!394080) bm!27830))

(assert (= (or b!394093 bm!27830) bm!27828))

(assert (= (or b!394093 b!394083) bm!27826))

(assert (= (or b!394094 bm!27828) bm!27831))

(assert (= (or b!394094 bm!27826) bm!27832))

(assert (= (and d!73289 res!225853) b!394090))

(assert (= (and d!73289 c!54500) b!394095))

(assert (= (and d!73289 (not c!54500)) b!394077))

(assert (= (and d!73289 res!225854) b!394089))

(assert (= (and b!394089 res!225856) b!394078))

(assert (= (and b!394089 (not res!225855)) b!394075))

(assert (= (and b!394075 res!225857) b!394082))

(assert (= (and b!394089 res!225851) b!394081))

(assert (= (and b!394081 c!54496) b!394088))

(assert (= (and b!394081 (not c!54496)) b!394085))

(assert (= (and b!394088 res!225858) b!394076))

(assert (= (or b!394088 b!394085) bm!27829))

(assert (= (and b!394081 res!225852) b!394087))

(assert (= (and b!394087 c!54501) b!394092))

(assert (= (and b!394087 (not c!54501)) b!394091))

(assert (= (and b!394092 res!225850) b!394086))

(assert (= (or b!394092 b!394091) bm!27827))

(declare-fun b_lambda!8819 () Bool)

(assert (=> (not b_lambda!8819) (not b!394082)))

(assert (=> b!394082 t!11511))

(declare-fun b_and!16455 () Bool)

(assert (= b_and!16453 (and (=> t!11511 result!5765) b_and!16455)))

(assert (=> b!394082 m!390709))

(assert (=> b!394082 m!390765))

(assert (=> b!394082 m!390709))

(assert (=> b!394082 m!390767))

(assert (=> b!394082 m!390765))

(assert (=> b!394082 m!390761))

(assert (=> b!394082 m!390761))

(declare-fun m!390789 () Bool)

(assert (=> b!394082 m!390789))

(declare-fun m!390791 () Bool)

(assert (=> bm!27832 m!390791))

(assert (=> b!394078 m!390761))

(assert (=> b!394078 m!390761))

(assert (=> b!394078 m!390763))

(declare-fun m!390793 () Bool)

(assert (=> b!394076 m!390793))

(assert (=> b!394090 m!390761))

(assert (=> b!394090 m!390761))

(assert (=> b!394090 m!390763))

(declare-fun m!390795 () Bool)

(assert (=> b!394095 m!390795))

(declare-fun m!390797 () Bool)

(assert (=> b!394095 m!390797))

(declare-fun m!390799 () Bool)

(assert (=> b!394095 m!390799))

(assert (=> b!394095 m!390797))

(declare-fun m!390801 () Bool)

(assert (=> b!394095 m!390801))

(declare-fun m!390803 () Bool)

(assert (=> b!394095 m!390803))

(assert (=> b!394095 m!390761))

(declare-fun m!390805 () Bool)

(assert (=> b!394095 m!390805))

(declare-fun m!390807 () Bool)

(assert (=> b!394095 m!390807))

(declare-fun m!390809 () Bool)

(assert (=> b!394095 m!390809))

(declare-fun m!390811 () Bool)

(assert (=> b!394095 m!390811))

(declare-fun m!390813 () Bool)

(assert (=> b!394095 m!390813))

(assert (=> b!394095 m!390795))

(declare-fun m!390815 () Bool)

(assert (=> b!394095 m!390815))

(declare-fun m!390817 () Bool)

(assert (=> b!394095 m!390817))

(assert (=> b!394095 m!390803))

(declare-fun m!390819 () Bool)

(assert (=> b!394095 m!390819))

(assert (=> b!394095 m!390813))

(declare-fun m!390821 () Bool)

(assert (=> b!394095 m!390821))

(declare-fun m!390823 () Bool)

(assert (=> b!394095 m!390823))

(assert (=> b!394095 m!390587))

(declare-fun m!390825 () Bool)

(assert (=> bm!27829 m!390825))

(declare-fun m!390827 () Bool)

(assert (=> bm!27827 m!390827))

(declare-fun m!390829 () Bool)

(assert (=> b!394094 m!390829))

(assert (=> bm!27831 m!390587))

(declare-fun m!390831 () Bool)

(assert (=> b!394086 m!390831))

(assert (=> d!73289 m!390613))

(assert (=> b!394075 m!390761))

(assert (=> b!394075 m!390761))

(declare-fun m!390833 () Bool)

(assert (=> b!394075 m!390833))

(assert (=> b!393874 d!73289))

(declare-fun d!73291 () Bool)

(declare-fun e!238569 () Bool)

(assert (=> d!73291 e!238569))

(declare-fun res!225864 () Bool)

(assert (=> d!73291 (=> (not res!225864) (not e!238569))))

(declare-fun lt!186731 () ListLongMap!5407)

(assert (=> d!73291 (= res!225864 (contains!2453 lt!186731 (_1!3257 lt!186545)))))

(declare-fun lt!186730 () List!6341)

(assert (=> d!73291 (= lt!186731 (ListLongMap!5408 lt!186730))))

(declare-fun lt!186728 () Unit!12015)

(declare-fun lt!186729 () Unit!12015)

(assert (=> d!73291 (= lt!186728 lt!186729)))

(declare-datatypes ((Option!373 0))(
  ( (Some!372 (v!7156 V!14075)) (None!371) )
))
(declare-fun getValueByKey!367 (List!6341 (_ BitVec 64)) Option!373)

(assert (=> d!73291 (= (getValueByKey!367 lt!186730 (_1!3257 lt!186545)) (Some!372 (_2!3257 lt!186545)))))

(declare-fun lemmaContainsTupThenGetReturnValue!189 (List!6341 (_ BitVec 64) V!14075) Unit!12015)

(assert (=> d!73291 (= lt!186729 (lemmaContainsTupThenGetReturnValue!189 lt!186730 (_1!3257 lt!186545) (_2!3257 lt!186545)))))

(declare-fun insertStrictlySorted!192 (List!6341 (_ BitVec 64) V!14075) List!6341)

(assert (=> d!73291 (= lt!186730 (insertStrictlySorted!192 (toList!2719 lt!186543) (_1!3257 lt!186545) (_2!3257 lt!186545)))))

(assert (=> d!73291 (= (+!1073 lt!186543 lt!186545) lt!186731)))

(declare-fun b!394100 () Bool)

(declare-fun res!225863 () Bool)

(assert (=> b!394100 (=> (not res!225863) (not e!238569))))

(assert (=> b!394100 (= res!225863 (= (getValueByKey!367 (toList!2719 lt!186731) (_1!3257 lt!186545)) (Some!372 (_2!3257 lt!186545))))))

(declare-fun b!394101 () Bool)

(declare-fun contains!2454 (List!6341 tuple2!6492) Bool)

(assert (=> b!394101 (= e!238569 (contains!2454 (toList!2719 lt!186731) lt!186545))))

(assert (= (and d!73291 res!225864) b!394100))

(assert (= (and b!394100 res!225863) b!394101))

(declare-fun m!390835 () Bool)

(assert (=> d!73291 m!390835))

(declare-fun m!390837 () Bool)

(assert (=> d!73291 m!390837))

(declare-fun m!390839 () Bool)

(assert (=> d!73291 m!390839))

(declare-fun m!390841 () Bool)

(assert (=> d!73291 m!390841))

(declare-fun m!390843 () Bool)

(assert (=> b!394100 m!390843))

(declare-fun m!390845 () Bool)

(assert (=> b!394101 m!390845))

(assert (=> b!393874 d!73291))

(declare-fun call!27840 () ListLongMap!5407)

(declare-fun bm!27837 () Bool)

(assert (=> bm!27837 (= call!27840 (getCurrentListMapNoExtraKeys!981 (array!23351 (store (arr!11132 _keys!658) i!548 k0!778) (size!11484 _keys!658)) (array!23353 (store (arr!11133 _values!506) i!548 (ValueCellFull!4520 v!373)) (size!11485 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394108 () Bool)

(declare-fun e!238575 () Bool)

(declare-fun call!27841 () ListLongMap!5407)

(assert (=> b!394108 (= e!238575 (= call!27840 call!27841))))

(declare-fun b!394109 () Bool)

(declare-fun e!238574 () Bool)

(assert (=> b!394109 (= e!238574 e!238575)))

(declare-fun c!54504 () Bool)

(assert (=> b!394109 (= c!54504 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun bm!27838 () Bool)

(assert (=> bm!27838 (= call!27841 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!73293 () Bool)

(assert (=> d!73293 e!238574))

(declare-fun res!225867 () Bool)

(assert (=> d!73293 (=> (not res!225867) (not e!238574))))

(assert (=> d!73293 (= res!225867 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11484 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11485 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11484 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11485 _values!506))))))))

(declare-fun lt!186734 () Unit!12015)

(declare-fun choose!1330 (array!23350 array!23352 (_ BitVec 32) (_ BitVec 32) V!14075 V!14075 (_ BitVec 32) (_ BitVec 64) V!14075 (_ BitVec 32) Int) Unit!12015)

(assert (=> d!73293 (= lt!186734 (choose!1330 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(assert (=> d!73293 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!186734)))

(declare-fun b!394110 () Bool)

(assert (=> b!394110 (= e!238575 (= call!27840 (+!1073 call!27841 (tuple2!6493 k0!778 v!373))))))

(assert (= (and d!73293 res!225867) b!394109))

(assert (= (and b!394109 c!54504) b!394110))

(assert (= (and b!394109 (not c!54504)) b!394108))

(assert (= (or b!394110 b!394108) bm!27838))

(assert (= (or b!394110 b!394108) bm!27837))

(assert (=> bm!27837 m!390605))

(assert (=> bm!27837 m!390593))

(declare-fun m!390847 () Bool)

(assert (=> bm!27837 m!390847))

(assert (=> bm!27838 m!390587))

(declare-fun m!390849 () Bool)

(assert (=> d!73293 m!390849))

(declare-fun m!390851 () Bool)

(assert (=> b!394110 m!390851))

(assert (=> b!393874 d!73293))

(declare-fun b!394111 () Bool)

(declare-fun e!238577 () ListLongMap!5407)

(assert (=> b!394111 (= e!238577 (ListLongMap!5408 Nil!6338))))

(declare-fun d!73295 () Bool)

(declare-fun e!238579 () Bool)

(assert (=> d!73295 e!238579))

(declare-fun res!225869 () Bool)

(assert (=> d!73295 (=> (not res!225869) (not e!238579))))

(declare-fun lt!186741 () ListLongMap!5407)

(assert (=> d!73295 (= res!225869 (not (contains!2453 lt!186741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73295 (= lt!186741 e!238577)))

(declare-fun c!54505 () Bool)

(assert (=> d!73295 (= c!54505 (bvsge #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(assert (=> d!73295 (validMask!0 mask!970)))

(assert (=> d!73295 (= (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186741)))

(declare-fun b!394112 () Bool)

(declare-fun e!238576 () ListLongMap!5407)

(declare-fun call!27842 () ListLongMap!5407)

(assert (=> b!394112 (= e!238576 call!27842)))

(declare-fun b!394113 () Bool)

(declare-fun e!238580 () Bool)

(declare-fun e!238582 () Bool)

(assert (=> b!394113 (= e!238580 e!238582)))

(declare-fun c!54507 () Bool)

(assert (=> b!394113 (= c!54507 (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun b!394114 () Bool)

(declare-fun lt!186736 () Unit!12015)

(declare-fun lt!186739 () Unit!12015)

(assert (=> b!394114 (= lt!186736 lt!186739)))

(declare-fun lt!186735 () ListLongMap!5407)

(declare-fun lt!186740 () (_ BitVec 64))

(declare-fun lt!186738 () (_ BitVec 64))

(declare-fun lt!186737 () V!14075)

(assert (=> b!394114 (not (contains!2453 (+!1073 lt!186735 (tuple2!6493 lt!186738 lt!186737)) lt!186740))))

(assert (=> b!394114 (= lt!186739 (addStillNotContains!143 lt!186735 lt!186738 lt!186737 lt!186740))))

(assert (=> b!394114 (= lt!186740 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!394114 (= lt!186737 (get!5630 (select (arr!11133 lt!186549) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!394114 (= lt!186738 (select (arr!11132 lt!186541) #b00000000000000000000000000000000))))

(assert (=> b!394114 (= lt!186735 call!27842)))

(assert (=> b!394114 (= e!238576 (+!1073 call!27842 (tuple2!6493 (select (arr!11132 lt!186541) #b00000000000000000000000000000000) (get!5630 (select (arr!11133 lt!186549) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!394115 () Bool)

(assert (=> b!394115 (= e!238577 e!238576)))

(declare-fun c!54508 () Bool)

(assert (=> b!394115 (= c!54508 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!394116 () Bool)

(assert (=> b!394116 (= e!238579 e!238580)))

(declare-fun c!54506 () Bool)

(declare-fun e!238578 () Bool)

(assert (=> b!394116 (= c!54506 e!238578)))

(declare-fun res!225871 () Bool)

(assert (=> b!394116 (=> (not res!225871) (not e!238578))))

(assert (=> b!394116 (= res!225871 (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun b!394117 () Bool)

(assert (=> b!394117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(assert (=> b!394117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11485 lt!186549)))))

(declare-fun e!238581 () Bool)

(assert (=> b!394117 (= e!238581 (= (apply!308 lt!186741 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)) (get!5630 (select (arr!11133 lt!186549) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!394118 () Bool)

(assert (=> b!394118 (= e!238582 (isEmpty!560 lt!186741))))

(declare-fun b!394119 () Bool)

(declare-fun res!225868 () Bool)

(assert (=> b!394119 (=> (not res!225868) (not e!238579))))

(assert (=> b!394119 (= res!225868 (not (contains!2453 lt!186741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394120 () Bool)

(assert (=> b!394120 (= e!238582 (= lt!186741 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27839 () Bool)

(assert (=> bm!27839 (= call!27842 (getCurrentListMapNoExtraKeys!981 lt!186541 lt!186549 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!394121 () Bool)

(assert (=> b!394121 (= e!238578 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(assert (=> b!394121 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!394122 () Bool)

(assert (=> b!394122 (= e!238580 e!238581)))

(assert (=> b!394122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(declare-fun res!225870 () Bool)

(assert (=> b!394122 (= res!225870 (contains!2453 lt!186741 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(assert (=> b!394122 (=> (not res!225870) (not e!238581))))

(assert (= (and d!73295 c!54505) b!394111))

(assert (= (and d!73295 (not c!54505)) b!394115))

(assert (= (and b!394115 c!54508) b!394114))

(assert (= (and b!394115 (not c!54508)) b!394112))

(assert (= (or b!394114 b!394112) bm!27839))

(assert (= (and d!73295 res!225869) b!394119))

(assert (= (and b!394119 res!225868) b!394116))

(assert (= (and b!394116 res!225871) b!394121))

(assert (= (and b!394116 c!54506) b!394122))

(assert (= (and b!394116 (not c!54506)) b!394113))

(assert (= (and b!394122 res!225870) b!394117))

(assert (= (and b!394113 c!54507) b!394120))

(assert (= (and b!394113 (not c!54507)) b!394118))

(declare-fun b_lambda!8821 () Bool)

(assert (=> (not b_lambda!8821) (not b!394114)))

(assert (=> b!394114 t!11511))

(declare-fun b_and!16457 () Bool)

(assert (= b_and!16455 (and (=> t!11511 result!5765) b_and!16457)))

(declare-fun b_lambda!8823 () Bool)

(assert (=> (not b_lambda!8823) (not b!394117)))

(assert (=> b!394117 t!11511))

(declare-fun b_and!16459 () Bool)

(assert (= b_and!16457 (and (=> t!11511 result!5765) b_and!16459)))

(assert (=> b!394115 m!390701))

(assert (=> b!394115 m!390701))

(assert (=> b!394115 m!390703))

(assert (=> b!394117 m!390709))

(assert (=> b!394117 m!390711))

(assert (=> b!394117 m!390709))

(assert (=> b!394117 m!390713))

(assert (=> b!394117 m!390701))

(assert (=> b!394117 m!390711))

(assert (=> b!394117 m!390701))

(declare-fun m!390853 () Bool)

(assert (=> b!394117 m!390853))

(declare-fun m!390855 () Bool)

(assert (=> bm!27839 m!390855))

(declare-fun m!390857 () Bool)

(assert (=> b!394119 m!390857))

(assert (=> b!394114 m!390709))

(assert (=> b!394114 m!390711))

(assert (=> b!394114 m!390709))

(assert (=> b!394114 m!390713))

(declare-fun m!390859 () Bool)

(assert (=> b!394114 m!390859))

(declare-fun m!390861 () Bool)

(assert (=> b!394114 m!390861))

(assert (=> b!394114 m!390701))

(assert (=> b!394114 m!390711))

(declare-fun m!390863 () Bool)

(assert (=> b!394114 m!390863))

(assert (=> b!394114 m!390859))

(declare-fun m!390865 () Bool)

(assert (=> b!394114 m!390865))

(assert (=> b!394121 m!390701))

(assert (=> b!394121 m!390701))

(assert (=> b!394121 m!390703))

(declare-fun m!390867 () Bool)

(assert (=> d!73295 m!390867))

(assert (=> d!73295 m!390613))

(assert (=> b!394120 m!390855))

(assert (=> b!394122 m!390701))

(assert (=> b!394122 m!390701))

(declare-fun m!390869 () Bool)

(assert (=> b!394122 m!390869))

(declare-fun m!390871 () Bool)

(assert (=> b!394118 m!390871))

(assert (=> b!393874 d!73295))

(declare-fun d!73297 () Bool)

(declare-fun res!225877 () Bool)

(declare-fun e!238589 () Bool)

(assert (=> d!73297 (=> res!225877 e!238589)))

(assert (=> d!73297 (= res!225877 (bvsge #b00000000000000000000000000000000 (size!11484 lt!186541)))))

(assert (=> d!73297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186541 mask!970) e!238589)))

(declare-fun b!394131 () Bool)

(declare-fun e!238591 () Bool)

(assert (=> b!394131 (= e!238589 e!238591)))

(declare-fun c!54511 () Bool)

(assert (=> b!394131 (= c!54511 (validKeyInArray!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000)))))

(declare-fun b!394132 () Bool)

(declare-fun e!238590 () Bool)

(declare-fun call!27845 () Bool)

(assert (=> b!394132 (= e!238590 call!27845)))

(declare-fun bm!27842 () Bool)

(assert (=> bm!27842 (= call!27845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!186541 mask!970))))

(declare-fun b!394133 () Bool)

(assert (=> b!394133 (= e!238591 e!238590)))

(declare-fun lt!186749 () (_ BitVec 64))

(assert (=> b!394133 (= lt!186749 (select (arr!11132 lt!186541) #b00000000000000000000000000000000))))

(declare-fun lt!186750 () Unit!12015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23350 (_ BitVec 64) (_ BitVec 32)) Unit!12015)

(assert (=> b!394133 (= lt!186750 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!186541 lt!186749 #b00000000000000000000000000000000))))

(assert (=> b!394133 (arrayContainsKey!0 lt!186541 lt!186749 #b00000000000000000000000000000000)))

(declare-fun lt!186748 () Unit!12015)

(assert (=> b!394133 (= lt!186748 lt!186750)))

(declare-fun res!225876 () Bool)

(declare-datatypes ((SeekEntryResult!3468 0))(
  ( (MissingZero!3468 (index!16051 (_ BitVec 32))) (Found!3468 (index!16052 (_ BitVec 32))) (Intermediate!3468 (undefined!4280 Bool) (index!16053 (_ BitVec 32)) (x!38459 (_ BitVec 32))) (Undefined!3468) (MissingVacant!3468 (index!16054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23350 (_ BitVec 32)) SeekEntryResult!3468)

(assert (=> b!394133 (= res!225876 (= (seekEntryOrOpen!0 (select (arr!11132 lt!186541) #b00000000000000000000000000000000) lt!186541 mask!970) (Found!3468 #b00000000000000000000000000000000)))))

(assert (=> b!394133 (=> (not res!225876) (not e!238590))))

(declare-fun b!394134 () Bool)

(assert (=> b!394134 (= e!238591 call!27845)))

(assert (= (and d!73297 (not res!225877)) b!394131))

(assert (= (and b!394131 c!54511) b!394133))

(assert (= (and b!394131 (not c!54511)) b!394134))

(assert (= (and b!394133 res!225876) b!394132))

(assert (= (or b!394132 b!394134) bm!27842))

(assert (=> b!394131 m!390701))

(assert (=> b!394131 m!390701))

(assert (=> b!394131 m!390703))

(declare-fun m!390873 () Bool)

(assert (=> bm!27842 m!390873))

(assert (=> b!394133 m!390701))

(declare-fun m!390875 () Bool)

(assert (=> b!394133 m!390875))

(declare-fun m!390877 () Bool)

(assert (=> b!394133 m!390877))

(assert (=> b!394133 m!390701))

(declare-fun m!390879 () Bool)

(assert (=> b!394133 m!390879))

(assert (=> b!393873 d!73297))

(declare-fun d!73299 () Bool)

(declare-fun res!225879 () Bool)

(declare-fun e!238592 () Bool)

(assert (=> d!73299 (=> res!225879 e!238592)))

(assert (=> d!73299 (= res!225879 (bvsge #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(assert (=> d!73299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!238592)))

(declare-fun b!394135 () Bool)

(declare-fun e!238594 () Bool)

(assert (=> b!394135 (= e!238592 e!238594)))

(declare-fun c!54512 () Bool)

(assert (=> b!394135 (= c!54512 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394136 () Bool)

(declare-fun e!238593 () Bool)

(declare-fun call!27846 () Bool)

(assert (=> b!394136 (= e!238593 call!27846)))

(declare-fun bm!27843 () Bool)

(assert (=> bm!27843 (= call!27846 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!394137 () Bool)

(assert (=> b!394137 (= e!238594 e!238593)))

(declare-fun lt!186752 () (_ BitVec 64))

(assert (=> b!394137 (= lt!186752 (select (arr!11132 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186753 () Unit!12015)

(assert (=> b!394137 (= lt!186753 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!186752 #b00000000000000000000000000000000))))

(assert (=> b!394137 (arrayContainsKey!0 _keys!658 lt!186752 #b00000000000000000000000000000000)))

(declare-fun lt!186751 () Unit!12015)

(assert (=> b!394137 (= lt!186751 lt!186753)))

(declare-fun res!225878 () Bool)

(assert (=> b!394137 (= res!225878 (= (seekEntryOrOpen!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3468 #b00000000000000000000000000000000)))))

(assert (=> b!394137 (=> (not res!225878) (not e!238593))))

(declare-fun b!394138 () Bool)

(assert (=> b!394138 (= e!238594 call!27846)))

(assert (= (and d!73299 (not res!225879)) b!394135))

(assert (= (and b!394135 c!54512) b!394137))

(assert (= (and b!394135 (not c!54512)) b!394138))

(assert (= (and b!394137 res!225878) b!394136))

(assert (= (or b!394136 b!394138) bm!27843))

(assert (=> b!394135 m!390761))

(assert (=> b!394135 m!390761))

(assert (=> b!394135 m!390763))

(declare-fun m!390881 () Bool)

(assert (=> bm!27843 m!390881))

(assert (=> b!394137 m!390761))

(declare-fun m!390883 () Bool)

(assert (=> b!394137 m!390883))

(declare-fun m!390885 () Bool)

(assert (=> b!394137 m!390885))

(assert (=> b!394137 m!390761))

(declare-fun m!390887 () Bool)

(assert (=> b!394137 m!390887))

(assert (=> b!393867 d!73299))

(declare-fun d!73301 () Bool)

(declare-fun e!238595 () Bool)

(assert (=> d!73301 e!238595))

(declare-fun res!225881 () Bool)

(assert (=> d!73301 (=> (not res!225881) (not e!238595))))

(declare-fun lt!186757 () ListLongMap!5407)

(assert (=> d!73301 (= res!225881 (contains!2453 lt!186757 (_1!3257 lt!186545)))))

(declare-fun lt!186756 () List!6341)

(assert (=> d!73301 (= lt!186757 (ListLongMap!5408 lt!186756))))

(declare-fun lt!186754 () Unit!12015)

(declare-fun lt!186755 () Unit!12015)

(assert (=> d!73301 (= lt!186754 lt!186755)))

(assert (=> d!73301 (= (getValueByKey!367 lt!186756 (_1!3257 lt!186545)) (Some!372 (_2!3257 lt!186545)))))

(assert (=> d!73301 (= lt!186755 (lemmaContainsTupThenGetReturnValue!189 lt!186756 (_1!3257 lt!186545) (_2!3257 lt!186545)))))

(assert (=> d!73301 (= lt!186756 (insertStrictlySorted!192 (toList!2719 lt!186544) (_1!3257 lt!186545) (_2!3257 lt!186545)))))

(assert (=> d!73301 (= (+!1073 lt!186544 lt!186545) lt!186757)))

(declare-fun b!394139 () Bool)

(declare-fun res!225880 () Bool)

(assert (=> b!394139 (=> (not res!225880) (not e!238595))))

(assert (=> b!394139 (= res!225880 (= (getValueByKey!367 (toList!2719 lt!186757) (_1!3257 lt!186545)) (Some!372 (_2!3257 lt!186545))))))

(declare-fun b!394140 () Bool)

(assert (=> b!394140 (= e!238595 (contains!2454 (toList!2719 lt!186757) lt!186545))))

(assert (= (and d!73301 res!225881) b!394139))

(assert (= (and b!394139 res!225880) b!394140))

(declare-fun m!390889 () Bool)

(assert (=> d!73301 m!390889))

(declare-fun m!390891 () Bool)

(assert (=> d!73301 m!390891))

(declare-fun m!390893 () Bool)

(assert (=> d!73301 m!390893))

(declare-fun m!390895 () Bool)

(assert (=> d!73301 m!390895))

(declare-fun m!390897 () Bool)

(assert (=> b!394139 m!390897))

(declare-fun m!390899 () Bool)

(assert (=> b!394140 m!390899))

(assert (=> b!393872 d!73301))

(declare-fun d!73303 () Bool)

(declare-fun res!225886 () Bool)

(declare-fun e!238600 () Bool)

(assert (=> d!73303 (=> res!225886 e!238600)))

(assert (=> d!73303 (= res!225886 (= (select (arr!11132 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73303 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!238600)))

(declare-fun b!394145 () Bool)

(declare-fun e!238601 () Bool)

(assert (=> b!394145 (= e!238600 e!238601)))

(declare-fun res!225887 () Bool)

(assert (=> b!394145 (=> (not res!225887) (not e!238601))))

(assert (=> b!394145 (= res!225887 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11484 _keys!658)))))

(declare-fun b!394146 () Bool)

(assert (=> b!394146 (= e!238601 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73303 (not res!225886)) b!394145))

(assert (= (and b!394145 res!225887) b!394146))

(assert (=> d!73303 m!390761))

(declare-fun m!390901 () Bool)

(assert (=> b!394146 m!390901))

(assert (=> b!393863 d!73303))

(declare-fun d!73305 () Bool)

(declare-fun res!225890 () Bool)

(declare-fun e!238605 () Bool)

(assert (=> d!73305 (=> res!225890 e!238605)))

(assert (=> d!73305 (= res!225890 (bvsge #b00000000000000000000000000000000 (size!11484 _keys!658)))))

(assert (=> d!73305 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6337) e!238605)))

(declare-fun b!394147 () Bool)

(declare-fun e!238604 () Bool)

(assert (=> b!394147 (= e!238605 e!238604)))

(declare-fun res!225888 () Bool)

(assert (=> b!394147 (=> (not res!225888) (not e!238604))))

(declare-fun e!238603 () Bool)

(assert (=> b!394147 (= res!225888 (not e!238603))))

(declare-fun res!225889 () Bool)

(assert (=> b!394147 (=> (not res!225889) (not e!238603))))

(assert (=> b!394147 (= res!225889 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394148 () Bool)

(declare-fun e!238602 () Bool)

(assert (=> b!394148 (= e!238604 e!238602)))

(declare-fun c!54513 () Bool)

(assert (=> b!394148 (= c!54513 (validKeyInArray!0 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394149 () Bool)

(declare-fun call!27847 () Bool)

(assert (=> b!394149 (= e!238602 call!27847)))

(declare-fun b!394150 () Bool)

(assert (=> b!394150 (= e!238603 (contains!2452 Nil!6337 (select (arr!11132 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394151 () Bool)

(assert (=> b!394151 (= e!238602 call!27847)))

(declare-fun bm!27844 () Bool)

(assert (=> bm!27844 (= call!27847 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54513 (Cons!6336 (select (arr!11132 _keys!658) #b00000000000000000000000000000000) Nil!6337) Nil!6337)))))

(assert (= (and d!73305 (not res!225890)) b!394147))

(assert (= (and b!394147 res!225889) b!394150))

(assert (= (and b!394147 res!225888) b!394148))

(assert (= (and b!394148 c!54513) b!394149))

(assert (= (and b!394148 (not c!54513)) b!394151))

(assert (= (or b!394149 b!394151) bm!27844))

(assert (=> b!394147 m!390761))

(assert (=> b!394147 m!390761))

(assert (=> b!394147 m!390763))

(assert (=> b!394148 m!390761))

(assert (=> b!394148 m!390761))

(assert (=> b!394148 m!390763))

(assert (=> b!394150 m!390761))

(assert (=> b!394150 m!390761))

(declare-fun m!390903 () Bool)

(assert (=> b!394150 m!390903))

(assert (=> bm!27844 m!390761))

(declare-fun m!390905 () Bool)

(assert (=> bm!27844 m!390905))

(assert (=> b!393871 d!73305))

(declare-fun mapNonEmpty!16197 () Bool)

(declare-fun mapRes!16197 () Bool)

(declare-fun tp!31965 () Bool)

(declare-fun e!238611 () Bool)

(assert (=> mapNonEmpty!16197 (= mapRes!16197 (and tp!31965 e!238611))))

(declare-fun mapValue!16197 () ValueCell!4520)

(declare-fun mapRest!16197 () (Array (_ BitVec 32) ValueCell!4520))

(declare-fun mapKey!16197 () (_ BitVec 32))

(assert (=> mapNonEmpty!16197 (= mapRest!16188 (store mapRest!16197 mapKey!16197 mapValue!16197))))

(declare-fun b!394159 () Bool)

(declare-fun e!238610 () Bool)

(assert (=> b!394159 (= e!238610 tp_is_empty!9727)))

(declare-fun condMapEmpty!16197 () Bool)

(declare-fun mapDefault!16197 () ValueCell!4520)

(assert (=> mapNonEmpty!16188 (= condMapEmpty!16197 (= mapRest!16188 ((as const (Array (_ BitVec 32) ValueCell!4520)) mapDefault!16197)))))

(assert (=> mapNonEmpty!16188 (= tp!31949 (and e!238610 mapRes!16197))))

(declare-fun mapIsEmpty!16197 () Bool)

(assert (=> mapIsEmpty!16197 mapRes!16197))

(declare-fun b!394158 () Bool)

(assert (=> b!394158 (= e!238611 tp_is_empty!9727)))

(assert (= (and mapNonEmpty!16188 condMapEmpty!16197) mapIsEmpty!16197))

(assert (= (and mapNonEmpty!16188 (not condMapEmpty!16197)) mapNonEmpty!16197))

(assert (= (and mapNonEmpty!16197 ((_ is ValueCellFull!4520) mapValue!16197)) b!394158))

(assert (= (and mapNonEmpty!16188 ((_ is ValueCellFull!4520) mapDefault!16197)) b!394159))

(declare-fun m!390907 () Bool)

(assert (=> mapNonEmpty!16197 m!390907))

(declare-fun b_lambda!8825 () Bool)

(assert (= b_lambda!8823 (or (and start!38182 b_free!9055) b_lambda!8825)))

(declare-fun b_lambda!8827 () Bool)

(assert (= b_lambda!8817 (or (and start!38182 b_free!9055) b_lambda!8827)))

(declare-fun b_lambda!8829 () Bool)

(assert (= b_lambda!8815 (or (and start!38182 b_free!9055) b_lambda!8829)))

(declare-fun b_lambda!8831 () Bool)

(assert (= b_lambda!8819 (or (and start!38182 b_free!9055) b_lambda!8831)))

(declare-fun b_lambda!8833 () Bool)

(assert (= b_lambda!8821 (or (and start!38182 b_free!9055) b_lambda!8833)))

(declare-fun b_lambda!8835 () Bool)

(assert (= b_lambda!8813 (or (and start!38182 b_free!9055) b_lambda!8835)))

(check-sat (not b!394131) (not b!394094) (not b!394035) (not b_lambda!8831) (not b!394090) (not b!394146) (not b_lambda!8833) (not bm!27844) (not bm!27827) (not b!394121) (not bm!27817) (not b!394076) (not d!73287) (not d!73293) (not b!394066) (not b!394114) (not b!394137) (not d!73295) (not b!394067) (not bm!27843) (not b!394095) (not bm!27819) (not b!394075) (not d!73301) (not b!394140) (not b!394135) (not b_lambda!8835) tp_is_empty!9727 (not b!394110) (not mapNonEmpty!16197) (not b!394147) (not bm!27825) (not d!73285) (not bm!27838) (not b_next!9055) (not d!73291) (not b!394086) (not bm!27829) (not b!394016) (not b!394120) (not b!394072) (not b!394139) (not b!393970) (not b!394118) (not b!394100) (not b!394036) b_and!16459 (not bm!27801) (not b!394133) (not b!393972) (not b!394070) (not b_lambda!8829) (not b!394150) (not b_lambda!8825) (not bm!27839) (not b!394073) (not b!394074) (not bm!27837) (not b!394101) (not b!394148) (not bm!27842) (not b!394071) (not bm!27822) (not b_lambda!8827) (not bm!27832) (not b!394023) (not b!394122) (not b!394117) (not b!394017) (not b!394078) (not bm!27821) (not b!394019) (not b!394115) (not b!394031) (not b!393969) (not b!394069) (not b!394119) (not bm!27831) (not b!394082) (not b!394027) (not d!73289))
(check-sat b_and!16459 (not b_next!9055))
