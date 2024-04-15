; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131960 () Bool)

(assert start!131960)

(declare-fun b_free!31723 () Bool)

(declare-fun b_next!31723 () Bool)

(assert (=> start!131960 (= b_free!31723 (not b_next!31723))))

(declare-fun tp!111421 () Bool)

(declare-fun b_and!51115 () Bool)

(assert (=> start!131960 (= tp!111421 b_and!51115)))

(declare-fun b!1546480 () Bool)

(declare-fun e!860790 () Bool)

(declare-fun tp_is_empty!37999 () Bool)

(assert (=> b!1546480 (= e!860790 tp_is_empty!37999)))

(declare-fun b!1546481 () Bool)

(declare-fun res!1060274 () Bool)

(declare-fun e!860788 () Bool)

(assert (=> b!1546481 (=> (not res!1060274) (not e!860788))))

(declare-datatypes ((array!103130 0))(
  ( (array!103131 (arr!49768 (Array (_ BitVec 32) (_ BitVec 64))) (size!50320 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103130)

(declare-datatypes ((List!36083 0))(
  ( (Nil!36080) (Cons!36079 (h!37525 (_ BitVec 64)) (t!50769 List!36083)) )
))
(declare-fun arrayNoDuplicates!0 (array!103130 (_ BitVec 32) List!36083) Bool)

(assert (=> b!1546481 (= res!1060274 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36080))))

(declare-fun b!1546482 () Bool)

(declare-fun res!1060270 () Bool)

(assert (=> b!1546482 (=> (not res!1060270) (not e!860788))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546482 (= res!1060270 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50320 _keys!618))))))

(declare-fun b!1546483 () Bool)

(declare-fun e!860786 () Bool)

(declare-fun mapRes!58702 () Bool)

(assert (=> b!1546483 (= e!860786 (and e!860790 mapRes!58702))))

(declare-fun condMapEmpty!58702 () Bool)

(declare-datatypes ((V!59109 0))(
  ( (V!59110 (val!19077 Int)) )
))
(declare-datatypes ((ValueCell!18089 0))(
  ( (ValueCellFull!18089 (v!21874 V!59109)) (EmptyCell!18089) )
))
(declare-datatypes ((array!103132 0))(
  ( (array!103133 (arr!49769 (Array (_ BitVec 32) ValueCell!18089)) (size!50321 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103132)

(declare-fun mapDefault!58702 () ValueCell!18089)

(assert (=> b!1546483 (= condMapEmpty!58702 (= (arr!49769 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18089)) mapDefault!58702)))))

(declare-fun b!1546484 () Bool)

(declare-datatypes ((tuple2!24612 0))(
  ( (tuple2!24613 (_1!12317 (_ BitVec 64)) (_2!12317 V!59109)) )
))
(declare-datatypes ((List!36084 0))(
  ( (Nil!36081) (Cons!36080 (h!37526 tuple2!24612) (t!50770 List!36084)) )
))
(declare-datatypes ((ListLongMap!22221 0))(
  ( (ListLongMap!22222 (toList!11126 List!36084)) )
))
(declare-fun e!860791 () ListLongMap!22221)

(declare-fun e!860793 () ListLongMap!22221)

(assert (=> b!1546484 (= e!860791 e!860793)))

(declare-fun c!141794 () Bool)

(declare-fun lt!666390 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546484 (= c!141794 (and (not lt!666390) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546486 () Bool)

(declare-fun res!1060273 () Bool)

(declare-fun e!860789 () Bool)

(assert (=> b!1546486 (=> (not res!1060273) (not e!860789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546486 (= res!1060273 (validKeyInArray!0 (select (arr!49768 _keys!618) from!762)))))

(declare-fun bm!69612 () Bool)

(declare-fun call!69617 () ListLongMap!22221)

(declare-fun call!69619 () ListLongMap!22221)

(assert (=> bm!69612 (= call!69617 call!69619)))

(declare-fun bm!69613 () Bool)

(declare-fun call!69616 () ListLongMap!22221)

(declare-fun call!69615 () ListLongMap!22221)

(assert (=> bm!69613 (= call!69616 call!69615)))

(declare-fun b!1546487 () Bool)

(declare-fun minValue!436 () V!59109)

(declare-fun +!4952 (ListLongMap!22221 tuple2!24612) ListLongMap!22221)

(assert (=> b!1546487 (= e!860791 (+!4952 call!69619 (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546488 () Bool)

(declare-fun e!860785 () ListLongMap!22221)

(declare-fun call!69618 () ListLongMap!22221)

(assert (=> b!1546488 (= e!860785 call!69618)))

(declare-fun b!1546489 () Bool)

(assert (=> b!1546489 (= e!860785 call!69617)))

(declare-fun mapNonEmpty!58702 () Bool)

(declare-fun tp!111422 () Bool)

(declare-fun e!860792 () Bool)

(assert (=> mapNonEmpty!58702 (= mapRes!58702 (and tp!111422 e!860792))))

(declare-fun mapValue!58702 () ValueCell!18089)

(declare-fun mapKey!58702 () (_ BitVec 32))

(declare-fun mapRest!58702 () (Array (_ BitVec 32) ValueCell!18089))

(assert (=> mapNonEmpty!58702 (= (arr!49769 _values!470) (store mapRest!58702 mapKey!58702 mapValue!58702))))

(declare-fun bm!69614 () Bool)

(assert (=> bm!69614 (= call!69618 call!69616)))

(declare-fun b!1546490 () Bool)

(assert (=> b!1546490 (= e!860792 tp_is_empty!37999)))

(declare-fun b!1546485 () Bool)

(assert (=> b!1546485 (= e!860788 e!860789)))

(declare-fun res!1060269 () Bool)

(assert (=> b!1546485 (=> (not res!1060269) (not e!860789))))

(assert (=> b!1546485 (= res!1060269 (bvslt from!762 (size!50320 _keys!618)))))

(declare-fun lt!666387 () ListLongMap!22221)

(assert (=> b!1546485 (= lt!666387 e!860791)))

(declare-fun c!141795 () Bool)

(assert (=> b!1546485 (= c!141795 (and (not lt!666390) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546485 (= lt!666390 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1060271 () Bool)

(assert (=> start!131960 (=> (not res!1060271) (not e!860788))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131960 (= res!1060271 (validMask!0 mask!926))))

(assert (=> start!131960 e!860788))

(declare-fun array_inv!38903 (array!103130) Bool)

(assert (=> start!131960 (array_inv!38903 _keys!618)))

(assert (=> start!131960 tp_is_empty!37999))

(assert (=> start!131960 true))

(assert (=> start!131960 tp!111421))

(declare-fun array_inv!38904 (array!103132) Bool)

(assert (=> start!131960 (and (array_inv!38904 _values!470) e!860786)))

(declare-fun b!1546491 () Bool)

(assert (=> b!1546491 (= e!860793 call!69617)))

(declare-fun b!1546492 () Bool)

(declare-fun res!1060272 () Bool)

(assert (=> b!1546492 (=> (not res!1060272) (not e!860788))))

(assert (=> b!1546492 (= res!1060272 (and (= (size!50321 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50320 _keys!618) (size!50321 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546493 () Bool)

(declare-fun c!141793 () Bool)

(assert (=> b!1546493 (= c!141793 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666390))))

(assert (=> b!1546493 (= e!860793 e!860785)))

(declare-fun b!1546494 () Bool)

(declare-fun res!1060275 () Bool)

(assert (=> b!1546494 (=> (not res!1060275) (not e!860788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103130 (_ BitVec 32)) Bool)

(assert (=> b!1546494 (= res!1060275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546495 () Bool)

(assert (=> b!1546495 (= e!860789 (not true))))

(declare-fun lt!666389 () ListLongMap!22221)

(declare-fun apply!1037 (ListLongMap!22221 (_ BitVec 64)) V!59109)

(assert (=> b!1546495 (= (apply!1037 (+!4952 lt!666389 (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49768 _keys!618) from!762)) (apply!1037 lt!666389 (select (arr!49768 _keys!618) from!762)))))

(declare-datatypes ((Unit!51371 0))(
  ( (Unit!51372) )
))
(declare-fun lt!666391 () Unit!51371)

(declare-fun addApplyDifferent!575 (ListLongMap!22221 (_ BitVec 64) V!59109 (_ BitVec 64)) Unit!51371)

(assert (=> b!1546495 (= lt!666391 (addApplyDifferent!575 lt!666389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49768 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59109)

(declare-fun contains!10012 (ListLongMap!22221 (_ BitVec 64)) Bool)

(assert (=> b!1546495 (contains!10012 (+!4952 lt!666389 (tuple2!24613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49768 _keys!618) from!762))))

(declare-fun lt!666388 () Unit!51371)

(declare-fun addStillContains!1235 (ListLongMap!22221 (_ BitVec 64) V!59109 (_ BitVec 64)) Unit!51371)

(assert (=> b!1546495 (= lt!666388 (addStillContains!1235 lt!666389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49768 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6580 (array!103130 array!103132 (_ BitVec 32) (_ BitVec 32) V!59109 V!59109 (_ BitVec 32) Int) ListLongMap!22221)

(assert (=> b!1546495 (= lt!666389 (getCurrentListMapNoExtraKeys!6580 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69615 () Bool)

(assert (=> bm!69615 (= call!69619 (+!4952 (ite c!141795 call!69615 (ite c!141794 call!69616 call!69618)) (ite (or c!141795 c!141794) (tuple2!24613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58702 () Bool)

(assert (=> mapIsEmpty!58702 mapRes!58702))

(declare-fun bm!69616 () Bool)

(assert (=> bm!69616 (= call!69615 (getCurrentListMapNoExtraKeys!6580 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!131960 res!1060271) b!1546492))

(assert (= (and b!1546492 res!1060272) b!1546494))

(assert (= (and b!1546494 res!1060275) b!1546481))

(assert (= (and b!1546481 res!1060274) b!1546482))

(assert (= (and b!1546482 res!1060270) b!1546485))

(assert (= (and b!1546485 c!141795) b!1546487))

(assert (= (and b!1546485 (not c!141795)) b!1546484))

(assert (= (and b!1546484 c!141794) b!1546491))

(assert (= (and b!1546484 (not c!141794)) b!1546493))

(assert (= (and b!1546493 c!141793) b!1546489))

(assert (= (and b!1546493 (not c!141793)) b!1546488))

(assert (= (or b!1546489 b!1546488) bm!69614))

(assert (= (or b!1546491 bm!69614) bm!69613))

(assert (= (or b!1546491 b!1546489) bm!69612))

(assert (= (or b!1546487 bm!69613) bm!69616))

(assert (= (or b!1546487 bm!69612) bm!69615))

(assert (= (and b!1546485 res!1060269) b!1546486))

(assert (= (and b!1546486 res!1060273) b!1546495))

(assert (= (and b!1546483 condMapEmpty!58702) mapIsEmpty!58702))

(assert (= (and b!1546483 (not condMapEmpty!58702)) mapNonEmpty!58702))

(get-info :version)

(assert (= (and mapNonEmpty!58702 ((_ is ValueCellFull!18089) mapValue!58702)) b!1546490))

(assert (= (and b!1546483 ((_ is ValueCellFull!18089) mapDefault!58702)) b!1546480))

(assert (= start!131960 b!1546483))

(declare-fun m!1425681 () Bool)

(assert (=> b!1546494 m!1425681))

(declare-fun m!1425683 () Bool)

(assert (=> b!1546486 m!1425683))

(assert (=> b!1546486 m!1425683))

(declare-fun m!1425685 () Bool)

(assert (=> b!1546486 m!1425685))

(declare-fun m!1425687 () Bool)

(assert (=> bm!69615 m!1425687))

(declare-fun m!1425689 () Bool)

(assert (=> bm!69616 m!1425689))

(assert (=> b!1546495 m!1425689))

(assert (=> b!1546495 m!1425683))

(declare-fun m!1425691 () Bool)

(assert (=> b!1546495 m!1425691))

(assert (=> b!1546495 m!1425683))

(declare-fun m!1425693 () Bool)

(assert (=> b!1546495 m!1425693))

(declare-fun m!1425695 () Bool)

(assert (=> b!1546495 m!1425695))

(assert (=> b!1546495 m!1425683))

(declare-fun m!1425697 () Bool)

(assert (=> b!1546495 m!1425697))

(assert (=> b!1546495 m!1425695))

(assert (=> b!1546495 m!1425683))

(declare-fun m!1425699 () Bool)

(assert (=> b!1546495 m!1425699))

(assert (=> b!1546495 m!1425683))

(declare-fun m!1425701 () Bool)

(assert (=> b!1546495 m!1425701))

(assert (=> b!1546495 m!1425683))

(declare-fun m!1425703 () Bool)

(assert (=> b!1546495 m!1425703))

(assert (=> b!1546495 m!1425691))

(declare-fun m!1425705 () Bool)

(assert (=> mapNonEmpty!58702 m!1425705))

(declare-fun m!1425707 () Bool)

(assert (=> b!1546481 m!1425707))

(declare-fun m!1425709 () Bool)

(assert (=> b!1546487 m!1425709))

(declare-fun m!1425711 () Bool)

(assert (=> start!131960 m!1425711))

(declare-fun m!1425713 () Bool)

(assert (=> start!131960 m!1425713))

(declare-fun m!1425715 () Bool)

(assert (=> start!131960 m!1425715))

(check-sat (not b!1546481) b_and!51115 (not b!1546487) (not start!131960) (not bm!69616) (not mapNonEmpty!58702) (not bm!69615) (not b!1546495) tp_is_empty!37999 (not b_next!31723) (not b!1546494) (not b!1546486))
(check-sat b_and!51115 (not b_next!31723))
