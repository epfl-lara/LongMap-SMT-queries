; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131964 () Bool)

(assert start!131964)

(declare-fun b_free!31677 () Bool)

(declare-fun b_next!31677 () Bool)

(assert (=> start!131964 (= b_free!31677 (not b_next!31677))))

(declare-fun tp!111282 () Bool)

(declare-fun b_and!51087 () Bool)

(assert (=> start!131964 (= tp!111282 b_and!51087)))

(declare-fun b!1545689 () Bool)

(declare-fun res!1059920 () Bool)

(declare-fun e!860366 () Bool)

(assert (=> b!1545689 (=> (not res!1059920) (not e!860366))))

(declare-datatypes ((array!103112 0))(
  ( (array!103113 (arr!49758 (Array (_ BitVec 32) (_ BitVec 64))) (size!50308 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103112)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59047 0))(
  ( (V!59048 (val!19054 Int)) )
))
(declare-datatypes ((ValueCell!18066 0))(
  ( (ValueCellFull!18066 (v!21855 V!59047)) (EmptyCell!18066) )
))
(declare-datatypes ((array!103114 0))(
  ( (array!103115 (arr!49759 (Array (_ BitVec 32) ValueCell!18066)) (size!50309 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103114)

(assert (=> b!1545689 (= res!1059920 (and (= (size!50309 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50308 _keys!618) (size!50309 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545690 () Bool)

(declare-fun res!1059916 () Bool)

(assert (=> b!1545690 (=> (not res!1059916) (not e!860366))))

(declare-datatypes ((List!35999 0))(
  ( (Nil!35996) (Cons!35995 (h!37440 (_ BitVec 64)) (t!50693 List!35999)) )
))
(declare-fun arrayNoDuplicates!0 (array!103112 (_ BitVec 32) List!35999) Bool)

(assert (=> b!1545690 (= res!1059916 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35996))))

(declare-fun b!1545691 () Bool)

(declare-datatypes ((tuple2!24490 0))(
  ( (tuple2!24491 (_1!12256 (_ BitVec 64)) (_2!12256 V!59047)) )
))
(declare-datatypes ((List!36000 0))(
  ( (Nil!35997) (Cons!35996 (h!37441 tuple2!24490) (t!50694 List!36000)) )
))
(declare-datatypes ((ListLongMap!22099 0))(
  ( (ListLongMap!22100 (toList!11065 List!36000)) )
))
(declare-fun e!860368 () ListLongMap!22099)

(declare-fun call!69307 () ListLongMap!22099)

(assert (=> b!1545691 (= e!860368 call!69307)))

(declare-fun bm!69302 () Bool)

(declare-fun call!69305 () ListLongMap!22099)

(declare-fun call!69308 () ListLongMap!22099)

(assert (=> bm!69302 (= call!69305 call!69308)))

(declare-fun b!1545692 () Bool)

(declare-fun e!860369 () ListLongMap!22099)

(assert (=> b!1545692 (= e!860369 call!69305)))

(declare-fun bm!69303 () Bool)

(declare-fun call!69309 () ListLongMap!22099)

(assert (=> bm!69303 (= call!69307 call!69309)))

(declare-fun b!1545694 () Bool)

(declare-fun res!1059915 () Bool)

(declare-fun e!860364 () Bool)

(assert (=> b!1545694 (=> (not res!1059915) (not e!860364))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545694 (= res!1059915 (validKeyInArray!0 (select (arr!49758 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58633 () Bool)

(declare-fun mapRes!58633 () Bool)

(declare-fun tp!111283 () Bool)

(declare-fun e!860362 () Bool)

(assert (=> mapNonEmpty!58633 (= mapRes!58633 (and tp!111283 e!860362))))

(declare-fun mapRest!58633 () (Array (_ BitVec 32) ValueCell!18066))

(declare-fun mapValue!58633 () ValueCell!18066)

(declare-fun mapKey!58633 () (_ BitVec 32))

(assert (=> mapNonEmpty!58633 (= (arr!49759 _values!470) (store mapRest!58633 mapKey!58633 mapValue!58633))))

(declare-fun b!1545695 () Bool)

(declare-fun res!1059919 () Bool)

(assert (=> b!1545695 (=> (not res!1059919) (not e!860366))))

(assert (=> b!1545695 (= res!1059919 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50308 _keys!618))))))

(declare-fun b!1545696 () Bool)

(assert (=> b!1545696 (= e!860368 call!69305)))

(declare-fun b!1545697 () Bool)

(declare-fun c!141677 () Bool)

(declare-fun lt!666377 () Bool)

(assert (=> b!1545697 (= c!141677 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666377))))

(assert (=> b!1545697 (= e!860369 e!860368)))

(declare-fun b!1545698 () Bool)

(declare-fun res!1059918 () Bool)

(assert (=> b!1545698 (=> (not res!1059918) (not e!860366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103112 (_ BitVec 32)) Bool)

(assert (=> b!1545698 (= res!1059918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545699 () Bool)

(assert (=> b!1545699 (= e!860366 e!860364)))

(declare-fun res!1059921 () Bool)

(assert (=> b!1545699 (=> (not res!1059921) (not e!860364))))

(assert (=> b!1545699 (= res!1059921 (bvslt from!762 (size!50308 _keys!618)))))

(declare-fun lt!666379 () ListLongMap!22099)

(declare-fun e!860363 () ListLongMap!22099)

(assert (=> b!1545699 (= lt!666379 e!860363)))

(declare-fun c!141675 () Bool)

(assert (=> b!1545699 (= c!141675 (and (not lt!666377) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545699 (= lt!666377 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545700 () Bool)

(declare-fun tp_is_empty!37953 () Bool)

(assert (=> b!1545700 (= e!860362 tp_is_empty!37953)))

(declare-fun b!1545701 () Bool)

(declare-fun e!860370 () Bool)

(declare-fun e!860367 () Bool)

(assert (=> b!1545701 (= e!860370 (and e!860367 mapRes!58633))))

(declare-fun condMapEmpty!58633 () Bool)

(declare-fun mapDefault!58633 () ValueCell!18066)

(assert (=> b!1545701 (= condMapEmpty!58633 (= (arr!49759 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18066)) mapDefault!58633)))))

(declare-fun b!1545702 () Bool)

(assert (=> b!1545702 (= e!860367 tp_is_empty!37953)))

(declare-fun b!1545703 () Bool)

(assert (=> b!1545703 (= e!860363 e!860369)))

(declare-fun c!141676 () Bool)

(assert (=> b!1545703 (= c!141676 (and (not lt!666377) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58633 () Bool)

(assert (=> mapIsEmpty!58633 mapRes!58633))

(declare-fun res!1059917 () Bool)

(assert (=> start!131964 (=> (not res!1059917) (not e!860366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131964 (= res!1059917 (validMask!0 mask!926))))

(assert (=> start!131964 e!860366))

(declare-fun array_inv!38701 (array!103112) Bool)

(assert (=> start!131964 (array_inv!38701 _keys!618)))

(assert (=> start!131964 tp_is_empty!37953))

(assert (=> start!131964 true))

(assert (=> start!131964 tp!111282))

(declare-fun array_inv!38702 (array!103114) Bool)

(assert (=> start!131964 (and (array_inv!38702 _values!470) e!860370)))

(declare-fun b!1545693 () Bool)

(declare-fun minValue!436 () V!59047)

(declare-fun +!4901 (ListLongMap!22099 tuple2!24490) ListLongMap!22099)

(assert (=> b!1545693 (= e!860363 (+!4901 call!69308 (tuple2!24491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun zeroValue!436 () V!59047)

(declare-fun call!69306 () ListLongMap!22099)

(declare-fun bm!69304 () Bool)

(assert (=> bm!69304 (= call!69308 (+!4901 (ite c!141675 call!69306 (ite c!141676 call!69309 call!69307)) (ite (or c!141675 c!141676) (tuple2!24491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69305 () Bool)

(assert (=> bm!69305 (= call!69309 call!69306)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69306 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6533 (array!103112 array!103114 (_ BitVec 32) (_ BitVec 32) V!59047 V!59047 (_ BitVec 32) Int) ListLongMap!22099)

(assert (=> bm!69306 (= call!69306 (getCurrentListMapNoExtraKeys!6533 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545704 () Bool)

(assert (=> b!1545704 (= e!860364 (not true))))

(declare-fun lt!666378 () ListLongMap!22099)

(declare-fun contains!10035 (ListLongMap!22099 (_ BitVec 64)) Bool)

(assert (=> b!1545704 (contains!10035 (+!4901 lt!666378 (tuple2!24491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49758 _keys!618) from!762))))

(declare-datatypes ((Unit!51506 0))(
  ( (Unit!51507) )
))
(declare-fun lt!666380 () Unit!51506)

(declare-fun addStillContains!1223 (ListLongMap!22099 (_ BitVec 64) V!59047 (_ BitVec 64)) Unit!51506)

(assert (=> b!1545704 (= lt!666380 (addStillContains!1223 lt!666378 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49758 _keys!618) from!762)))))

(assert (=> b!1545704 (= lt!666378 (getCurrentListMapNoExtraKeys!6533 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!131964 res!1059917) b!1545689))

(assert (= (and b!1545689 res!1059920) b!1545698))

(assert (= (and b!1545698 res!1059918) b!1545690))

(assert (= (and b!1545690 res!1059916) b!1545695))

(assert (= (and b!1545695 res!1059919) b!1545699))

(assert (= (and b!1545699 c!141675) b!1545693))

(assert (= (and b!1545699 (not c!141675)) b!1545703))

(assert (= (and b!1545703 c!141676) b!1545692))

(assert (= (and b!1545703 (not c!141676)) b!1545697))

(assert (= (and b!1545697 c!141677) b!1545696))

(assert (= (and b!1545697 (not c!141677)) b!1545691))

(assert (= (or b!1545696 b!1545691) bm!69303))

(assert (= (or b!1545692 bm!69303) bm!69305))

(assert (= (or b!1545692 b!1545696) bm!69302))

(assert (= (or b!1545693 bm!69305) bm!69306))

(assert (= (or b!1545693 bm!69302) bm!69304))

(assert (= (and b!1545699 res!1059921) b!1545694))

(assert (= (and b!1545694 res!1059915) b!1545704))

(assert (= (and b!1545701 condMapEmpty!58633) mapIsEmpty!58633))

(assert (= (and b!1545701 (not condMapEmpty!58633)) mapNonEmpty!58633))

(get-info :version)

(assert (= (and mapNonEmpty!58633 ((_ is ValueCellFull!18066) mapValue!58633)) b!1545700))

(assert (= (and b!1545701 ((_ is ValueCellFull!18066) mapDefault!58633)) b!1545702))

(assert (= start!131964 b!1545701))

(declare-fun m!1425899 () Bool)

(assert (=> b!1545704 m!1425899))

(declare-fun m!1425901 () Bool)

(assert (=> b!1545704 m!1425901))

(declare-fun m!1425903 () Bool)

(assert (=> b!1545704 m!1425903))

(assert (=> b!1545704 m!1425901))

(declare-fun m!1425905 () Bool)

(assert (=> b!1545704 m!1425905))

(assert (=> b!1545704 m!1425901))

(declare-fun m!1425907 () Bool)

(assert (=> b!1545704 m!1425907))

(assert (=> b!1545704 m!1425903))

(declare-fun m!1425909 () Bool)

(assert (=> mapNonEmpty!58633 m!1425909))

(declare-fun m!1425911 () Bool)

(assert (=> start!131964 m!1425911))

(declare-fun m!1425913 () Bool)

(assert (=> start!131964 m!1425913))

(declare-fun m!1425915 () Bool)

(assert (=> start!131964 m!1425915))

(declare-fun m!1425917 () Bool)

(assert (=> b!1545690 m!1425917))

(assert (=> b!1545694 m!1425901))

(assert (=> b!1545694 m!1425901))

(declare-fun m!1425919 () Bool)

(assert (=> b!1545694 m!1425919))

(declare-fun m!1425921 () Bool)

(assert (=> b!1545693 m!1425921))

(declare-fun m!1425923 () Bool)

(assert (=> b!1545698 m!1425923))

(declare-fun m!1425925 () Bool)

(assert (=> bm!69304 m!1425925))

(assert (=> bm!69306 m!1425899))

(check-sat (not bm!69306) (not start!131964) (not b!1545693) (not bm!69304) (not b_next!31677) tp_is_empty!37953 b_and!51087 (not mapNonEmpty!58633) (not b!1545704) (not b!1545694) (not b!1545698) (not b!1545690))
(check-sat b_and!51087 (not b_next!31677))
