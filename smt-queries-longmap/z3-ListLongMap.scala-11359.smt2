; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132008 () Bool)

(assert start!132008)

(declare-fun b_free!31771 () Bool)

(declare-fun b_next!31771 () Bool)

(assert (=> start!132008 (= b_free!31771 (not b_next!31771))))

(declare-fun tp!111566 () Bool)

(declare-fun b_and!51163 () Bool)

(assert (=> start!132008 (= tp!111566 b_and!51163)))

(declare-fun b!1547632 () Bool)

(declare-fun res!1060779 () Bool)

(declare-fun e!861438 () Bool)

(assert (=> b!1547632 (=> (not res!1060779) (not e!861438))))

(declare-datatypes ((array!103224 0))(
  ( (array!103225 (arr!49815 (Array (_ BitVec 32) (_ BitVec 64))) (size!50367 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103224)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59173 0))(
  ( (V!59174 (val!19101 Int)) )
))
(declare-datatypes ((ValueCell!18113 0))(
  ( (ValueCellFull!18113 (v!21898 V!59173)) (EmptyCell!18113) )
))
(declare-datatypes ((array!103226 0))(
  ( (array!103227 (arr!49816 (Array (_ BitVec 32) ValueCell!18113)) (size!50368 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103226)

(assert (=> b!1547632 (= res!1060779 (and (= (size!50368 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50367 _keys!618) (size!50368 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547633 () Bool)

(declare-fun res!1060773 () Bool)

(assert (=> b!1547633 (=> (not res!1060773) (not e!861438))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547633 (= res!1060773 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50367 _keys!618))))))

(declare-fun b!1547634 () Bool)

(declare-fun res!1060776 () Bool)

(declare-fun e!861441 () Bool)

(assert (=> b!1547634 (=> (not res!1060776) (not e!861441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547634 (= res!1060776 (validKeyInArray!0 (select (arr!49815 _keys!618) from!762)))))

(declare-fun b!1547635 () Bool)

(assert (=> b!1547635 (= e!861438 e!861441)))

(declare-fun res!1060775 () Bool)

(assert (=> b!1547635 (=> (not res!1060775) (not e!861441))))

(assert (=> b!1547635 (= res!1060775 (bvslt from!762 (size!50367 _keys!618)))))

(declare-datatypes ((tuple2!24658 0))(
  ( (tuple2!24659 (_1!12340 (_ BitVec 64)) (_2!12340 V!59173)) )
))
(declare-datatypes ((List!36125 0))(
  ( (Nil!36122) (Cons!36121 (h!37567 tuple2!24658) (t!50811 List!36125)) )
))
(declare-datatypes ((ListLongMap!22267 0))(
  ( (ListLongMap!22268 (toList!11149 List!36125)) )
))
(declare-fun lt!666749 () ListLongMap!22267)

(declare-fun e!861437 () ListLongMap!22267)

(assert (=> b!1547635 (= lt!666749 e!861437)))

(declare-fun c!142010 () Bool)

(declare-fun lt!666752 () Bool)

(assert (=> b!1547635 (= c!142010 (and (not lt!666752) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547635 (= lt!666752 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547636 () Bool)

(declare-fun res!1060774 () Bool)

(assert (=> b!1547636 (=> (not res!1060774) (not e!861438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103224 (_ BitVec 32)) Bool)

(assert (=> b!1547636 (= res!1060774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69972 () Bool)

(declare-fun call!69975 () ListLongMap!22267)

(declare-fun call!69978 () ListLongMap!22267)

(assert (=> bm!69972 (= call!69975 call!69978)))

(declare-fun zeroValue!436 () V!59173)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69973 () Bool)

(declare-fun minValue!436 () V!59173)

(declare-fun getCurrentListMapNoExtraKeys!6603 (array!103224 array!103226 (_ BitVec 32) (_ BitVec 32) V!59173 V!59173 (_ BitVec 32) Int) ListLongMap!22267)

(assert (=> bm!69973 (= call!69978 (getCurrentListMapNoExtraKeys!6603 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58774 () Bool)

(declare-fun mapRes!58774 () Bool)

(assert (=> mapIsEmpty!58774 mapRes!58774))

(declare-fun b!1547638 () Bool)

(declare-fun e!861440 () Bool)

(declare-fun e!861435 () Bool)

(assert (=> b!1547638 (= e!861440 (and e!861435 mapRes!58774))))

(declare-fun condMapEmpty!58774 () Bool)

(declare-fun mapDefault!58774 () ValueCell!18113)

(assert (=> b!1547638 (= condMapEmpty!58774 (= (arr!49816 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18113)) mapDefault!58774)))))

(declare-fun b!1547639 () Bool)

(declare-fun res!1060778 () Bool)

(assert (=> b!1547639 (=> (not res!1060778) (not e!861438))))

(declare-datatypes ((List!36126 0))(
  ( (Nil!36123) (Cons!36122 (h!37568 (_ BitVec 64)) (t!50812 List!36126)) )
))
(declare-fun arrayNoDuplicates!0 (array!103224 (_ BitVec 32) List!36126) Bool)

(assert (=> b!1547639 (= res!1060778 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36123))))

(declare-fun b!1547640 () Bool)

(declare-fun e!861433 () Bool)

(declare-fun tp_is_empty!38047 () Bool)

(assert (=> b!1547640 (= e!861433 tp_is_empty!38047)))

(declare-fun b!1547641 () Bool)

(declare-fun c!142011 () Bool)

(assert (=> b!1547641 (= c!142011 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666752))))

(declare-fun e!861439 () ListLongMap!22267)

(declare-fun e!861434 () ListLongMap!22267)

(assert (=> b!1547641 (= e!861439 e!861434)))

(declare-fun b!1547642 () Bool)

(declare-fun call!69976 () ListLongMap!22267)

(declare-fun +!4975 (ListLongMap!22267 tuple2!24658) ListLongMap!22267)

(assert (=> b!1547642 (= e!861437 (+!4975 call!69976 (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547643 () Bool)

(declare-fun call!69979 () ListLongMap!22267)

(assert (=> b!1547643 (= e!861434 call!69979)))

(declare-fun mapNonEmpty!58774 () Bool)

(declare-fun tp!111565 () Bool)

(assert (=> mapNonEmpty!58774 (= mapRes!58774 (and tp!111565 e!861433))))

(declare-fun mapRest!58774 () (Array (_ BitVec 32) ValueCell!18113))

(declare-fun mapKey!58774 () (_ BitVec 32))

(declare-fun mapValue!58774 () ValueCell!18113)

(assert (=> mapNonEmpty!58774 (= (arr!49816 _values!470) (store mapRest!58774 mapKey!58774 mapValue!58774))))

(declare-fun b!1547644 () Bool)

(assert (=> b!1547644 (= e!861441 (not true))))

(declare-fun lt!666753 () ListLongMap!22267)

(declare-fun lt!666750 () Bool)

(declare-fun contains!10032 (ListLongMap!22267 (_ BitVec 64)) Bool)

(assert (=> b!1547644 (= lt!666750 (contains!10032 lt!666753 (select (arr!49815 _keys!618) from!762)))))

(declare-fun apply!1057 (ListLongMap!22267 (_ BitVec 64)) V!59173)

(assert (=> b!1547644 (= (apply!1057 (+!4975 lt!666753 (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49815 _keys!618) from!762)) (apply!1057 lt!666753 (select (arr!49815 _keys!618) from!762)))))

(declare-datatypes ((Unit!51411 0))(
  ( (Unit!51412) )
))
(declare-fun lt!666751 () Unit!51411)

(declare-fun addApplyDifferent!595 (ListLongMap!22267 (_ BitVec 64) V!59173 (_ BitVec 64)) Unit!51411)

(assert (=> b!1547644 (= lt!666751 (addApplyDifferent!595 lt!666753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49815 _keys!618) from!762)))))

(assert (=> b!1547644 (contains!10032 (+!4975 lt!666753 (tuple2!24659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49815 _keys!618) from!762))))

(declare-fun lt!666754 () Unit!51411)

(declare-fun addStillContains!1255 (ListLongMap!22267 (_ BitVec 64) V!59173 (_ BitVec 64)) Unit!51411)

(assert (=> b!1547644 (= lt!666754 (addStillContains!1255 lt!666753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49815 _keys!618) from!762)))))

(assert (=> b!1547644 (= lt!666753 (getCurrentListMapNoExtraKeys!6603 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547645 () Bool)

(declare-fun call!69977 () ListLongMap!22267)

(assert (=> b!1547645 (= e!861439 call!69977)))

(declare-fun bm!69974 () Bool)

(declare-fun c!142009 () Bool)

(assert (=> bm!69974 (= call!69976 (+!4975 (ite c!142010 call!69978 (ite c!142009 call!69975 call!69979)) (ite (or c!142010 c!142009) (tuple2!24659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69975 () Bool)

(assert (=> bm!69975 (= call!69979 call!69975)))

(declare-fun b!1547637 () Bool)

(assert (=> b!1547637 (= e!861434 call!69977)))

(declare-fun res!1060777 () Bool)

(assert (=> start!132008 (=> (not res!1060777) (not e!861438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132008 (= res!1060777 (validMask!0 mask!926))))

(assert (=> start!132008 e!861438))

(declare-fun array_inv!38943 (array!103224) Bool)

(assert (=> start!132008 (array_inv!38943 _keys!618)))

(assert (=> start!132008 tp_is_empty!38047))

(assert (=> start!132008 true))

(assert (=> start!132008 tp!111566))

(declare-fun array_inv!38944 (array!103226) Bool)

(assert (=> start!132008 (and (array_inv!38944 _values!470) e!861440)))

(declare-fun bm!69976 () Bool)

(assert (=> bm!69976 (= call!69977 call!69976)))

(declare-fun b!1547646 () Bool)

(assert (=> b!1547646 (= e!861437 e!861439)))

(assert (=> b!1547646 (= c!142009 (and (not lt!666752) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547647 () Bool)

(assert (=> b!1547647 (= e!861435 tp_is_empty!38047)))

(assert (= (and start!132008 res!1060777) b!1547632))

(assert (= (and b!1547632 res!1060779) b!1547636))

(assert (= (and b!1547636 res!1060774) b!1547639))

(assert (= (and b!1547639 res!1060778) b!1547633))

(assert (= (and b!1547633 res!1060773) b!1547635))

(assert (= (and b!1547635 c!142010) b!1547642))

(assert (= (and b!1547635 (not c!142010)) b!1547646))

(assert (= (and b!1547646 c!142009) b!1547645))

(assert (= (and b!1547646 (not c!142009)) b!1547641))

(assert (= (and b!1547641 c!142011) b!1547637))

(assert (= (and b!1547641 (not c!142011)) b!1547643))

(assert (= (or b!1547637 b!1547643) bm!69975))

(assert (= (or b!1547645 bm!69975) bm!69972))

(assert (= (or b!1547645 b!1547637) bm!69976))

(assert (= (or b!1547642 bm!69972) bm!69973))

(assert (= (or b!1547642 bm!69976) bm!69974))

(assert (= (and b!1547635 res!1060775) b!1547634))

(assert (= (and b!1547634 res!1060776) b!1547644))

(assert (= (and b!1547638 condMapEmpty!58774) mapIsEmpty!58774))

(assert (= (and b!1547638 (not condMapEmpty!58774)) mapNonEmpty!58774))

(get-info :version)

(assert (= (and mapNonEmpty!58774 ((_ is ValueCellFull!18113) mapValue!58774)) b!1547640))

(assert (= (and b!1547638 ((_ is ValueCellFull!18113) mapDefault!58774)) b!1547647))

(assert (= start!132008 b!1547638))

(declare-fun m!1426545 () Bool)

(assert (=> b!1547639 m!1426545))

(declare-fun m!1426547 () Bool)

(assert (=> b!1547642 m!1426547))

(declare-fun m!1426549 () Bool)

(assert (=> start!132008 m!1426549))

(declare-fun m!1426551 () Bool)

(assert (=> start!132008 m!1426551))

(declare-fun m!1426553 () Bool)

(assert (=> start!132008 m!1426553))

(declare-fun m!1426555 () Bool)

(assert (=> bm!69974 m!1426555))

(declare-fun m!1426557 () Bool)

(assert (=> b!1547634 m!1426557))

(assert (=> b!1547634 m!1426557))

(declare-fun m!1426559 () Bool)

(assert (=> b!1547634 m!1426559))

(declare-fun m!1426561 () Bool)

(assert (=> bm!69973 m!1426561))

(declare-fun m!1426563 () Bool)

(assert (=> mapNonEmpty!58774 m!1426563))

(declare-fun m!1426565 () Bool)

(assert (=> b!1547636 m!1426565))

(assert (=> b!1547644 m!1426557))

(declare-fun m!1426567 () Bool)

(assert (=> b!1547644 m!1426567))

(declare-fun m!1426569 () Bool)

(assert (=> b!1547644 m!1426569))

(assert (=> b!1547644 m!1426561))

(assert (=> b!1547644 m!1426557))

(assert (=> b!1547644 m!1426557))

(declare-fun m!1426571 () Bool)

(assert (=> b!1547644 m!1426571))

(assert (=> b!1547644 m!1426569))

(assert (=> b!1547644 m!1426557))

(declare-fun m!1426573 () Bool)

(assert (=> b!1547644 m!1426573))

(declare-fun m!1426575 () Bool)

(assert (=> b!1547644 m!1426575))

(assert (=> b!1547644 m!1426575))

(assert (=> b!1547644 m!1426557))

(declare-fun m!1426577 () Bool)

(assert (=> b!1547644 m!1426577))

(assert (=> b!1547644 m!1426557))

(declare-fun m!1426579 () Bool)

(assert (=> b!1547644 m!1426579))

(assert (=> b!1547644 m!1426557))

(declare-fun m!1426581 () Bool)

(assert (=> b!1547644 m!1426581))

(check-sat (not b!1547639) tp_is_empty!38047 (not b!1547644) (not bm!69973) (not mapNonEmpty!58774) (not bm!69974) (not b!1547634) (not start!132008) b_and!51163 (not b!1547636) (not b_next!31771) (not b!1547642))
(check-sat b_and!51163 (not b_next!31771))
