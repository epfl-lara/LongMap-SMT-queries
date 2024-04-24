; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132368 () Bool)

(assert start!132368)

(declare-fun b_free!31669 () Bool)

(declare-fun b_next!31669 () Bool)

(assert (=> start!132368 (= b_free!31669 (not b_next!31669))))

(declare-fun tp!111258 () Bool)

(declare-fun b_and!51081 () Bool)

(assert (=> start!132368 (= tp!111258 b_and!51081)))

(declare-fun b!1547933 () Bool)

(declare-fun res!1060695 () Bool)

(declare-fun e!861768 () Bool)

(assert (=> b!1547933 (=> (not res!1060695) (not e!861768))))

(declare-datatypes ((array!103218 0))(
  ( (array!103219 (arr!49804 (Array (_ BitVec 32) (_ BitVec 64))) (size!50355 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103218)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547933 (= res!1060695 (validKeyInArray!0 (select (arr!49804 _keys!618) from!762)))))

(declare-fun b!1547934 () Bool)

(assert (=> b!1547934 (= e!861768 (not true))))

(declare-datatypes ((V!59037 0))(
  ( (V!59038 (val!19050 Int)) )
))
(declare-fun zeroValue!436 () V!59037)

(declare-datatypes ((tuple2!24542 0))(
  ( (tuple2!24543 (_1!12282 (_ BitVec 64)) (_2!12282 V!59037)) )
))
(declare-datatypes ((List!36034 0))(
  ( (Nil!36031) (Cons!36030 (h!37493 tuple2!24542) (t!50720 List!36034)) )
))
(declare-datatypes ((ListLongMap!22159 0))(
  ( (ListLongMap!22160 (toList!11095 List!36034)) )
))
(declare-fun lt!667237 () ListLongMap!22159)

(declare-fun contains!10082 (ListLongMap!22159 (_ BitVec 64)) Bool)

(declare-fun +!4942 (ListLongMap!22159 tuple2!24542) ListLongMap!22159)

(assert (=> b!1547934 (contains!10082 (+!4942 lt!667237 (tuple2!24543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49804 _keys!618) from!762))))

(declare-datatypes ((Unit!51433 0))(
  ( (Unit!51434) )
))
(declare-fun lt!667239 () Unit!51433)

(declare-fun addStillContains!1224 (ListLongMap!22159 (_ BitVec 64) V!59037 (_ BitVec 64)) Unit!51433)

(assert (=> b!1547934 (= lt!667239 (addStillContains!1224 lt!667237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49804 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18062 0))(
  ( (ValueCellFull!18062 (v!21843 V!59037)) (EmptyCell!18062) )
))
(declare-datatypes ((array!103220 0))(
  ( (array!103221 (arr!49805 (Array (_ BitVec 32) ValueCell!18062)) (size!50356 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103220)

(declare-fun minValue!436 () V!59037)

(declare-fun getCurrentListMapNoExtraKeys!6579 (array!103218 array!103220 (_ BitVec 32) (_ BitVec 32) V!59037 V!59037 (_ BitVec 32) Int) ListLongMap!22159)

(assert (=> b!1547934 (= lt!667237 (getCurrentListMapNoExtraKeys!6579 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547935 () Bool)

(declare-fun c!142441 () Bool)

(declare-fun lt!667238 () Bool)

(assert (=> b!1547935 (= c!142441 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667238))))

(declare-fun e!861767 () ListLongMap!22159)

(declare-fun e!861765 () ListLongMap!22159)

(assert (=> b!1547935 (= e!861767 e!861765)))

(declare-fun b!1547936 () Bool)

(declare-fun e!861764 () Bool)

(declare-fun tp_is_empty!37945 () Bool)

(assert (=> b!1547936 (= e!861764 tp_is_empty!37945)))

(declare-fun b!1547937 () Bool)

(declare-fun e!861771 () Bool)

(declare-fun e!861770 () Bool)

(declare-fun mapRes!58621 () Bool)

(assert (=> b!1547937 (= e!861771 (and e!861770 mapRes!58621))))

(declare-fun condMapEmpty!58621 () Bool)

(declare-fun mapDefault!58621 () ValueCell!18062)

(assert (=> b!1547937 (= condMapEmpty!58621 (= (arr!49805 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18062)) mapDefault!58621)))))

(declare-fun b!1547938 () Bool)

(declare-fun res!1060693 () Bool)

(declare-fun e!861769 () Bool)

(assert (=> b!1547938 (=> (not res!1060693) (not e!861769))))

(assert (=> b!1547938 (= res!1060693 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50355 _keys!618))))))

(declare-fun b!1547939 () Bool)

(declare-fun e!861763 () ListLongMap!22159)

(declare-fun call!69399 () ListLongMap!22159)

(assert (=> b!1547939 (= e!861763 (+!4942 call!69399 (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547940 () Bool)

(declare-fun res!1060697 () Bool)

(assert (=> b!1547940 (=> (not res!1060697) (not e!861769))))

(declare-datatypes ((List!36035 0))(
  ( (Nil!36032) (Cons!36031 (h!37494 (_ BitVec 64)) (t!50721 List!36035)) )
))
(declare-fun arrayNoDuplicates!0 (array!103218 (_ BitVec 32) List!36035) Bool)

(assert (=> b!1547940 (= res!1060697 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36032))))

(declare-fun b!1547941 () Bool)

(declare-fun call!69396 () ListLongMap!22159)

(assert (=> b!1547941 (= e!861765 call!69396)))

(declare-fun bm!69392 () Bool)

(declare-fun call!69395 () ListLongMap!22159)

(assert (=> bm!69392 (= call!69395 call!69399)))

(declare-fun c!142439 () Bool)

(declare-fun call!69397 () ListLongMap!22159)

(declare-fun call!69398 () ListLongMap!22159)

(declare-fun c!142440 () Bool)

(declare-fun bm!69393 () Bool)

(assert (=> bm!69393 (= call!69399 (+!4942 (ite c!142440 call!69397 (ite c!142439 call!69398 call!69396)) (ite (or c!142440 c!142439) (tuple2!24543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547942 () Bool)

(assert (=> b!1547942 (= e!861767 call!69395)))

(declare-fun bm!69394 () Bool)

(assert (=> bm!69394 (= call!69398 call!69397)))

(declare-fun b!1547943 () Bool)

(assert (=> b!1547943 (= e!861763 e!861767)))

(assert (=> b!1547943 (= c!142439 (and (not lt!667238) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1060696 () Bool)

(assert (=> start!132368 (=> (not res!1060696) (not e!861769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132368 (= res!1060696 (validMask!0 mask!926))))

(assert (=> start!132368 e!861769))

(declare-fun array_inv!39003 (array!103218) Bool)

(assert (=> start!132368 (array_inv!39003 _keys!618)))

(assert (=> start!132368 tp_is_empty!37945))

(assert (=> start!132368 true))

(assert (=> start!132368 tp!111258))

(declare-fun array_inv!39004 (array!103220) Bool)

(assert (=> start!132368 (and (array_inv!39004 _values!470) e!861771)))

(declare-fun b!1547944 () Bool)

(assert (=> b!1547944 (= e!861769 e!861768)))

(declare-fun res!1060694 () Bool)

(assert (=> b!1547944 (=> (not res!1060694) (not e!861768))))

(assert (=> b!1547944 (= res!1060694 (bvslt from!762 (size!50355 _keys!618)))))

(declare-fun lt!667240 () ListLongMap!22159)

(assert (=> b!1547944 (= lt!667240 e!861763)))

(assert (=> b!1547944 (= c!142440 (and (not lt!667238) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547944 (= lt!667238 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547945 () Bool)

(declare-fun res!1060691 () Bool)

(assert (=> b!1547945 (=> (not res!1060691) (not e!861769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103218 (_ BitVec 32)) Bool)

(assert (=> b!1547945 (= res!1060691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547946 () Bool)

(declare-fun res!1060692 () Bool)

(assert (=> b!1547946 (=> (not res!1060692) (not e!861769))))

(assert (=> b!1547946 (= res!1060692 (and (= (size!50356 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50355 _keys!618) (size!50356 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547947 () Bool)

(assert (=> b!1547947 (= e!861765 call!69395)))

(declare-fun bm!69395 () Bool)

(assert (=> bm!69395 (= call!69396 call!69398)))

(declare-fun mapNonEmpty!58621 () Bool)

(declare-fun tp!111259 () Bool)

(assert (=> mapNonEmpty!58621 (= mapRes!58621 (and tp!111259 e!861764))))

(declare-fun mapValue!58621 () ValueCell!18062)

(declare-fun mapRest!58621 () (Array (_ BitVec 32) ValueCell!18062))

(declare-fun mapKey!58621 () (_ BitVec 32))

(assert (=> mapNonEmpty!58621 (= (arr!49805 _values!470) (store mapRest!58621 mapKey!58621 mapValue!58621))))

(declare-fun mapIsEmpty!58621 () Bool)

(assert (=> mapIsEmpty!58621 mapRes!58621))

(declare-fun b!1547948 () Bool)

(assert (=> b!1547948 (= e!861770 tp_is_empty!37945)))

(declare-fun bm!69396 () Bool)

(assert (=> bm!69396 (= call!69397 (getCurrentListMapNoExtraKeys!6579 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132368 res!1060696) b!1547946))

(assert (= (and b!1547946 res!1060692) b!1547945))

(assert (= (and b!1547945 res!1060691) b!1547940))

(assert (= (and b!1547940 res!1060697) b!1547938))

(assert (= (and b!1547938 res!1060693) b!1547944))

(assert (= (and b!1547944 c!142440) b!1547939))

(assert (= (and b!1547944 (not c!142440)) b!1547943))

(assert (= (and b!1547943 c!142439) b!1547942))

(assert (= (and b!1547943 (not c!142439)) b!1547935))

(assert (= (and b!1547935 c!142441) b!1547947))

(assert (= (and b!1547935 (not c!142441)) b!1547941))

(assert (= (or b!1547947 b!1547941) bm!69395))

(assert (= (or b!1547942 bm!69395) bm!69394))

(assert (= (or b!1547942 b!1547947) bm!69392))

(assert (= (or b!1547939 bm!69394) bm!69396))

(assert (= (or b!1547939 bm!69392) bm!69393))

(assert (= (and b!1547944 res!1060694) b!1547933))

(assert (= (and b!1547933 res!1060695) b!1547934))

(assert (= (and b!1547937 condMapEmpty!58621) mapIsEmpty!58621))

(assert (= (and b!1547937 (not condMapEmpty!58621)) mapNonEmpty!58621))

(get-info :version)

(assert (= (and mapNonEmpty!58621 ((_ is ValueCellFull!18062) mapValue!58621)) b!1547936))

(assert (= (and b!1547937 ((_ is ValueCellFull!18062) mapDefault!58621)) b!1547948))

(assert (= start!132368 b!1547937))

(declare-fun m!1428045 () Bool)

(assert (=> mapNonEmpty!58621 m!1428045))

(declare-fun m!1428047 () Bool)

(assert (=> b!1547945 m!1428047))

(declare-fun m!1428049 () Bool)

(assert (=> b!1547940 m!1428049))

(declare-fun m!1428051 () Bool)

(assert (=> b!1547933 m!1428051))

(assert (=> b!1547933 m!1428051))

(declare-fun m!1428053 () Bool)

(assert (=> b!1547933 m!1428053))

(declare-fun m!1428055 () Bool)

(assert (=> b!1547934 m!1428055))

(assert (=> b!1547934 m!1428051))

(declare-fun m!1428057 () Bool)

(assert (=> b!1547934 m!1428057))

(assert (=> b!1547934 m!1428057))

(assert (=> b!1547934 m!1428051))

(declare-fun m!1428059 () Bool)

(assert (=> b!1547934 m!1428059))

(assert (=> b!1547934 m!1428051))

(declare-fun m!1428061 () Bool)

(assert (=> b!1547934 m!1428061))

(assert (=> bm!69396 m!1428055))

(declare-fun m!1428063 () Bool)

(assert (=> start!132368 m!1428063))

(declare-fun m!1428065 () Bool)

(assert (=> start!132368 m!1428065))

(declare-fun m!1428067 () Bool)

(assert (=> start!132368 m!1428067))

(declare-fun m!1428069 () Bool)

(assert (=> bm!69393 m!1428069))

(declare-fun m!1428071 () Bool)

(assert (=> b!1547939 m!1428071))

(check-sat (not b!1547933) (not b!1547934) b_and!51081 (not b_next!31669) (not start!132368) (not b!1547940) (not bm!69393) (not b!1547939) tp_is_empty!37945 (not bm!69396) (not b!1547945) (not mapNonEmpty!58621))
(check-sat b_and!51081 (not b_next!31669))
