; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131972 () Bool)

(assert start!131972)

(declare-fun b_free!31735 () Bool)

(declare-fun b_next!31735 () Bool)

(assert (=> start!131972 (= b_free!31735 (not b_next!31735))))

(declare-fun tp!111458 () Bool)

(declare-fun b_and!51127 () Bool)

(assert (=> start!131972 (= tp!111458 b_and!51127)))

(declare-fun b!1546768 () Bool)

(declare-fun res!1060401 () Bool)

(declare-fun e!860950 () Bool)

(assert (=> b!1546768 (=> (not res!1060401) (not e!860950))))

(declare-datatypes ((array!103152 0))(
  ( (array!103153 (arr!49779 (Array (_ BitVec 32) (_ BitVec 64))) (size!50331 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103152)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546768 (= res!1060401 (validKeyInArray!0 (select (arr!49779 _keys!618) from!762)))))

(declare-fun b!1546769 () Bool)

(declare-fun e!860951 () Bool)

(declare-fun e!860955 () Bool)

(declare-fun mapRes!58720 () Bool)

(assert (=> b!1546769 (= e!860951 (and e!860955 mapRes!58720))))

(declare-fun condMapEmpty!58720 () Bool)

(declare-datatypes ((V!59125 0))(
  ( (V!59126 (val!19083 Int)) )
))
(declare-datatypes ((ValueCell!18095 0))(
  ( (ValueCellFull!18095 (v!21880 V!59125)) (EmptyCell!18095) )
))
(declare-datatypes ((array!103154 0))(
  ( (array!103155 (arr!49780 (Array (_ BitVec 32) ValueCell!18095)) (size!50332 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103154)

(declare-fun mapDefault!58720 () ValueCell!18095)

(assert (=> b!1546769 (= condMapEmpty!58720 (= (arr!49780 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18095)) mapDefault!58720)))))

(declare-fun mapIsEmpty!58720 () Bool)

(assert (=> mapIsEmpty!58720 mapRes!58720))

(declare-fun b!1546770 () Bool)

(declare-fun e!860949 () Bool)

(declare-fun tp_is_empty!38011 () Bool)

(assert (=> b!1546770 (= e!860949 tp_is_empty!38011)))

(declare-fun b!1546771 () Bool)

(declare-datatypes ((tuple2!24622 0))(
  ( (tuple2!24623 (_1!12322 (_ BitVec 64)) (_2!12322 V!59125)) )
))
(declare-datatypes ((List!36093 0))(
  ( (Nil!36090) (Cons!36089 (h!37535 tuple2!24622) (t!50779 List!36093)) )
))
(declare-datatypes ((ListLongMap!22231 0))(
  ( (ListLongMap!22232 (toList!11131 List!36093)) )
))
(declare-fun e!860953 () ListLongMap!22231)

(declare-fun call!69708 () ListLongMap!22231)

(assert (=> b!1546771 (= e!860953 call!69708)))

(declare-fun b!1546772 () Bool)

(declare-fun res!1060400 () Bool)

(declare-fun e!860947 () Bool)

(assert (=> b!1546772 (=> (not res!1060400) (not e!860947))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1546772 (= res!1060400 (and (= (size!50332 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50331 _keys!618) (size!50332 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546773 () Bool)

(declare-fun e!860948 () ListLongMap!22231)

(declare-fun call!69705 () ListLongMap!22231)

(declare-fun minValue!436 () V!59125)

(declare-fun +!4957 (ListLongMap!22231 tuple2!24622) ListLongMap!22231)

(assert (=> b!1546773 (= e!860948 (+!4957 call!69705 (tuple2!24623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun zeroValue!436 () V!59125)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!69706 () ListLongMap!22231)

(declare-fun bm!69702 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6585 (array!103152 array!103154 (_ BitVec 32) (_ BitVec 32) V!59125 V!59125 (_ BitVec 32) Int) ListLongMap!22231)

(assert (=> bm!69702 (= call!69706 (getCurrentListMapNoExtraKeys!6585 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546774 () Bool)

(assert (=> b!1546774 (= e!860950 (not true))))

(declare-fun lt!666478 () ListLongMap!22231)

(declare-fun apply!1042 (ListLongMap!22231 (_ BitVec 64)) V!59125)

(assert (=> b!1546774 (= (apply!1042 (+!4957 lt!666478 (tuple2!24623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49779 _keys!618) from!762)) (apply!1042 lt!666478 (select (arr!49779 _keys!618) from!762)))))

(declare-datatypes ((Unit!51381 0))(
  ( (Unit!51382) )
))
(declare-fun lt!666479 () Unit!51381)

(declare-fun addApplyDifferent!580 (ListLongMap!22231 (_ BitVec 64) V!59125 (_ BitVec 64)) Unit!51381)

(assert (=> b!1546774 (= lt!666479 (addApplyDifferent!580 lt!666478 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49779 _keys!618) from!762)))))

(declare-fun contains!10017 (ListLongMap!22231 (_ BitVec 64)) Bool)

(assert (=> b!1546774 (contains!10017 (+!4957 lt!666478 (tuple2!24623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49779 _keys!618) from!762))))

(declare-fun lt!666480 () Unit!51381)

(declare-fun addStillContains!1240 (ListLongMap!22231 (_ BitVec 64) V!59125 (_ BitVec 64)) Unit!51381)

(assert (=> b!1546774 (= lt!666480 (addStillContains!1240 lt!666478 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49779 _keys!618) from!762)))))

(assert (=> b!1546774 (= lt!666478 (getCurrentListMapNoExtraKeys!6585 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546776 () Bool)

(declare-fun res!1060399 () Bool)

(assert (=> b!1546776 (=> (not res!1060399) (not e!860947))))

(assert (=> b!1546776 (= res!1060399 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50331 _keys!618))))))

(declare-fun bm!69703 () Bool)

(declare-fun call!69707 () ListLongMap!22231)

(assert (=> bm!69703 (= call!69707 call!69706)))

(declare-fun b!1546777 () Bool)

(declare-fun c!141847 () Bool)

(declare-fun lt!666477 () Bool)

(assert (=> b!1546777 (= c!141847 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666477))))

(declare-fun e!860954 () ListLongMap!22231)

(assert (=> b!1546777 (= e!860953 e!860954)))

(declare-fun b!1546778 () Bool)

(assert (=> b!1546778 (= e!860947 e!860950)))

(declare-fun res!1060396 () Bool)

(assert (=> b!1546778 (=> (not res!1060396) (not e!860950))))

(assert (=> b!1546778 (= res!1060396 (bvslt from!762 (size!50331 _keys!618)))))

(declare-fun lt!666481 () ListLongMap!22231)

(assert (=> b!1546778 (= lt!666481 e!860948)))

(declare-fun c!141848 () Bool)

(assert (=> b!1546778 (= c!141848 (and (not lt!666477) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546778 (= lt!666477 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546779 () Bool)

(assert (=> b!1546779 (= e!860948 e!860953)))

(declare-fun c!141849 () Bool)

(assert (=> b!1546779 (= c!141849 (and (not lt!666477) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58720 () Bool)

(declare-fun tp!111457 () Bool)

(assert (=> mapNonEmpty!58720 (= mapRes!58720 (and tp!111457 e!860949))))

(declare-fun mapKey!58720 () (_ BitVec 32))

(declare-fun mapRest!58720 () (Array (_ BitVec 32) ValueCell!18095))

(declare-fun mapValue!58720 () ValueCell!18095)

(assert (=> mapNonEmpty!58720 (= (arr!49780 _values!470) (store mapRest!58720 mapKey!58720 mapValue!58720))))

(declare-fun bm!69704 () Bool)

(assert (=> bm!69704 (= call!69708 call!69705)))

(declare-fun b!1546780 () Bool)

(declare-fun res!1060398 () Bool)

(assert (=> b!1546780 (=> (not res!1060398) (not e!860947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103152 (_ BitVec 32)) Bool)

(assert (=> b!1546780 (= res!1060398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546781 () Bool)

(declare-fun res!1060397 () Bool)

(assert (=> b!1546781 (=> (not res!1060397) (not e!860947))))

(declare-datatypes ((List!36094 0))(
  ( (Nil!36091) (Cons!36090 (h!37536 (_ BitVec 64)) (t!50780 List!36094)) )
))
(declare-fun arrayNoDuplicates!0 (array!103152 (_ BitVec 32) List!36094) Bool)

(assert (=> b!1546781 (= res!1060397 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36091))))

(declare-fun b!1546782 () Bool)

(assert (=> b!1546782 (= e!860955 tp_is_empty!38011)))

(declare-fun b!1546783 () Bool)

(declare-fun call!69709 () ListLongMap!22231)

(assert (=> b!1546783 (= e!860954 call!69709)))

(declare-fun bm!69705 () Bool)

(assert (=> bm!69705 (= call!69709 call!69707)))

(declare-fun bm!69706 () Bool)

(assert (=> bm!69706 (= call!69705 (+!4957 (ite c!141848 call!69706 (ite c!141849 call!69707 call!69709)) (ite (or c!141848 c!141849) (tuple2!24623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1060395 () Bool)

(assert (=> start!131972 (=> (not res!1060395) (not e!860947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131972 (= res!1060395 (validMask!0 mask!926))))

(assert (=> start!131972 e!860947))

(declare-fun array_inv!38913 (array!103152) Bool)

(assert (=> start!131972 (array_inv!38913 _keys!618)))

(assert (=> start!131972 tp_is_empty!38011))

(assert (=> start!131972 true))

(assert (=> start!131972 tp!111458))

(declare-fun array_inv!38914 (array!103154) Bool)

(assert (=> start!131972 (and (array_inv!38914 _values!470) e!860951)))

(declare-fun b!1546775 () Bool)

(assert (=> b!1546775 (= e!860954 call!69708)))

(assert (= (and start!131972 res!1060395) b!1546772))

(assert (= (and b!1546772 res!1060400) b!1546780))

(assert (= (and b!1546780 res!1060398) b!1546781))

(assert (= (and b!1546781 res!1060397) b!1546776))

(assert (= (and b!1546776 res!1060399) b!1546778))

(assert (= (and b!1546778 c!141848) b!1546773))

(assert (= (and b!1546778 (not c!141848)) b!1546779))

(assert (= (and b!1546779 c!141849) b!1546771))

(assert (= (and b!1546779 (not c!141849)) b!1546777))

(assert (= (and b!1546777 c!141847) b!1546775))

(assert (= (and b!1546777 (not c!141847)) b!1546783))

(assert (= (or b!1546775 b!1546783) bm!69705))

(assert (= (or b!1546771 bm!69705) bm!69703))

(assert (= (or b!1546771 b!1546775) bm!69704))

(assert (= (or b!1546773 bm!69703) bm!69702))

(assert (= (or b!1546773 bm!69704) bm!69706))

(assert (= (and b!1546778 res!1060396) b!1546768))

(assert (= (and b!1546768 res!1060401) b!1546774))

(assert (= (and b!1546769 condMapEmpty!58720) mapIsEmpty!58720))

(assert (= (and b!1546769 (not condMapEmpty!58720)) mapNonEmpty!58720))

(get-info :version)

(assert (= (and mapNonEmpty!58720 ((_ is ValueCellFull!18095) mapValue!58720)) b!1546770))

(assert (= (and b!1546769 ((_ is ValueCellFull!18095) mapDefault!58720)) b!1546782))

(assert (= start!131972 b!1546769))

(declare-fun m!1425897 () Bool)

(assert (=> b!1546774 m!1425897))

(declare-fun m!1425899 () Bool)

(assert (=> b!1546774 m!1425899))

(declare-fun m!1425901 () Bool)

(assert (=> b!1546774 m!1425901))

(assert (=> b!1546774 m!1425899))

(declare-fun m!1425903 () Bool)

(assert (=> b!1546774 m!1425903))

(declare-fun m!1425905 () Bool)

(assert (=> b!1546774 m!1425905))

(declare-fun m!1425907 () Bool)

(assert (=> b!1546774 m!1425907))

(assert (=> b!1546774 m!1425899))

(declare-fun m!1425909 () Bool)

(assert (=> b!1546774 m!1425909))

(assert (=> b!1546774 m!1425899))

(assert (=> b!1546774 m!1425899))

(declare-fun m!1425911 () Bool)

(assert (=> b!1546774 m!1425911))

(assert (=> b!1546774 m!1425905))

(assert (=> b!1546774 m!1425899))

(declare-fun m!1425913 () Bool)

(assert (=> b!1546774 m!1425913))

(assert (=> b!1546774 m!1425907))

(assert (=> b!1546768 m!1425899))

(assert (=> b!1546768 m!1425899))

(declare-fun m!1425915 () Bool)

(assert (=> b!1546768 m!1425915))

(declare-fun m!1425917 () Bool)

(assert (=> start!131972 m!1425917))

(declare-fun m!1425919 () Bool)

(assert (=> start!131972 m!1425919))

(declare-fun m!1425921 () Bool)

(assert (=> start!131972 m!1425921))

(declare-fun m!1425923 () Bool)

(assert (=> mapNonEmpty!58720 m!1425923))

(declare-fun m!1425925 () Bool)

(assert (=> b!1546781 m!1425925))

(declare-fun m!1425927 () Bool)

(assert (=> b!1546773 m!1425927))

(assert (=> bm!69702 m!1425897))

(declare-fun m!1425929 () Bool)

(assert (=> bm!69706 m!1425929))

(declare-fun m!1425931 () Bool)

(assert (=> b!1546780 m!1425931))

(check-sat (not b!1546773) (not b!1546768) b_and!51127 (not start!131972) (not b!1546780) (not bm!69706) (not b!1546781) (not bm!69702) (not mapNonEmpty!58720) (not b!1546774) tp_is_empty!38011 (not b_next!31735))
(check-sat b_and!51127 (not b_next!31735))
