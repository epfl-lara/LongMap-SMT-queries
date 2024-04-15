; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131894 () Bool)

(assert start!131894)

(declare-fun b_free!31657 () Bool)

(declare-fun b_next!31657 () Bool)

(assert (=> start!131894 (= b_free!31657 (not b_next!31657))))

(declare-fun tp!111223 () Bool)

(declare-fun b_and!51049 () Bool)

(assert (=> start!131894 (= tp!111223 b_and!51049)))

(declare-fun mapNonEmpty!58603 () Bool)

(declare-fun mapRes!58603 () Bool)

(declare-fun tp!111224 () Bool)

(declare-fun e!859902 () Bool)

(assert (=> mapNonEmpty!58603 (= mapRes!58603 (and tp!111224 e!859902))))

(declare-datatypes ((V!59021 0))(
  ( (V!59022 (val!19044 Int)) )
))
(declare-datatypes ((ValueCell!18056 0))(
  ( (ValueCellFull!18056 (v!21841 V!59021)) (EmptyCell!18056) )
))
(declare-fun mapValue!58603 () ValueCell!18056)

(declare-fun mapKey!58603 () (_ BitVec 32))

(declare-datatypes ((array!103004 0))(
  ( (array!103005 (arr!49705 (Array (_ BitVec 32) ValueCell!18056)) (size!50257 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103004)

(declare-fun mapRest!58603 () (Array (_ BitVec 32) ValueCell!18056))

(assert (=> mapNonEmpty!58603 (= (arr!49705 _values!470) (store mapRest!58603 mapKey!58603 mapValue!58603))))

(declare-fun mapIsEmpty!58603 () Bool)

(assert (=> mapIsEmpty!58603 mapRes!58603))

(declare-fun b!1544896 () Bool)

(declare-fun c!141498 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!665973 () Bool)

(assert (=> b!1544896 (= c!141498 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665973))))

(declare-datatypes ((tuple2!24548 0))(
  ( (tuple2!24549 (_1!12285 (_ BitVec 64)) (_2!12285 V!59021)) )
))
(declare-datatypes ((List!36030 0))(
  ( (Nil!36027) (Cons!36026 (h!37472 tuple2!24548) (t!50716 List!36030)) )
))
(declare-datatypes ((ListLongMap!22157 0))(
  ( (ListLongMap!22158 (toList!11094 List!36030)) )
))
(declare-fun e!859900 () ListLongMap!22157)

(declare-fun e!859901 () ListLongMap!22157)

(assert (=> b!1544896 (= e!859900 e!859901)))

(declare-fun b!1544898 () Bool)

(declare-fun e!859899 () ListLongMap!22157)

(assert (=> b!1544898 (= e!859899 e!859900)))

(declare-fun c!141496 () Bool)

(assert (=> b!1544898 (= c!141496 (and (not lt!665973) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544899 () Bool)

(declare-fun e!859898 () Bool)

(declare-fun e!859897 () Bool)

(assert (=> b!1544899 (= e!859898 e!859897)))

(declare-fun res!1059581 () Bool)

(assert (=> b!1544899 (=> (not res!1059581) (not e!859897))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103006 0))(
  ( (array!103007 (arr!49706 (Array (_ BitVec 32) (_ BitVec 64))) (size!50258 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103006)

(assert (=> b!1544899 (= res!1059581 (bvslt from!762 (size!50258 _keys!618)))))

(declare-fun lt!665974 () ListLongMap!22157)

(assert (=> b!1544899 (= lt!665974 e!859899)))

(declare-fun c!141497 () Bool)

(assert (=> b!1544899 (= c!141497 (and (not lt!665973) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544899 (= lt!665973 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544900 () Bool)

(declare-fun e!859895 () Bool)

(declare-fun e!859896 () Bool)

(assert (=> b!1544900 (= e!859895 (and e!859896 mapRes!58603))))

(declare-fun condMapEmpty!58603 () Bool)

(declare-fun mapDefault!58603 () ValueCell!18056)

(assert (=> b!1544900 (= condMapEmpty!58603 (= (arr!49705 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18056)) mapDefault!58603)))))

(declare-fun bm!69117 () Bool)

(declare-fun call!69120 () ListLongMap!22157)

(declare-fun call!69124 () ListLongMap!22157)

(assert (=> bm!69117 (= call!69120 call!69124)))

(declare-fun b!1544901 () Bool)

(assert (=> b!1544901 (= e!859897 (not true))))

(declare-fun zeroValue!436 () V!59021)

(declare-fun lt!665971 () ListLongMap!22157)

(declare-fun contains!9989 (ListLongMap!22157 (_ BitVec 64)) Bool)

(declare-fun +!4925 (ListLongMap!22157 tuple2!24548) ListLongMap!22157)

(assert (=> b!1544901 (contains!9989 (+!4925 lt!665971 (tuple2!24549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49706 _keys!618) from!762))))

(declare-datatypes ((Unit!51325 0))(
  ( (Unit!51326) )
))
(declare-fun lt!665972 () Unit!51325)

(declare-fun addStillContains!1212 (ListLongMap!22157 (_ BitVec 64) V!59021 (_ BitVec 64)) Unit!51325)

(assert (=> b!1544901 (= lt!665972 (addStillContains!1212 lt!665971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49706 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59021)

(declare-fun getCurrentListMapNoExtraKeys!6553 (array!103006 array!103004 (_ BitVec 32) (_ BitVec 32) V!59021 V!59021 (_ BitVec 32) Int) ListLongMap!22157)

(assert (=> b!1544901 (= lt!665971 (getCurrentListMapNoExtraKeys!6553 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69118 () Bool)

(declare-fun call!69123 () ListLongMap!22157)

(declare-fun call!69121 () ListLongMap!22157)

(assert (=> bm!69118 (= call!69123 call!69121)))

(declare-fun bm!69119 () Bool)

(declare-fun call!69122 () ListLongMap!22157)

(assert (=> bm!69119 (= call!69121 (+!4925 (ite c!141497 call!69122 (ite c!141496 call!69124 call!69120)) (ite (or c!141497 c!141496) (tuple2!24549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544902 () Bool)

(declare-fun res!1059578 () Bool)

(assert (=> b!1544902 (=> (not res!1059578) (not e!859898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103006 (_ BitVec 32)) Bool)

(assert (=> b!1544902 (= res!1059578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544903 () Bool)

(declare-fun res!1059576 () Bool)

(assert (=> b!1544903 (=> (not res!1059576) (not e!859898))))

(assert (=> b!1544903 (= res!1059576 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50258 _keys!618))))))

(declare-fun b!1544904 () Bool)

(assert (=> b!1544904 (= e!859901 call!69123)))

(declare-fun b!1544905 () Bool)

(declare-fun res!1059582 () Bool)

(assert (=> b!1544905 (=> (not res!1059582) (not e!859898))))

(assert (=> b!1544905 (= res!1059582 (and (= (size!50257 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50258 _keys!618) (size!50257 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544897 () Bool)

(assert (=> b!1544897 (= e!859900 call!69123)))

(declare-fun res!1059577 () Bool)

(assert (=> start!131894 (=> (not res!1059577) (not e!859898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131894 (= res!1059577 (validMask!0 mask!926))))

(assert (=> start!131894 e!859898))

(declare-fun array_inv!38857 (array!103006) Bool)

(assert (=> start!131894 (array_inv!38857 _keys!618)))

(declare-fun tp_is_empty!37933 () Bool)

(assert (=> start!131894 tp_is_empty!37933))

(assert (=> start!131894 true))

(assert (=> start!131894 tp!111223))

(declare-fun array_inv!38858 (array!103004) Bool)

(assert (=> start!131894 (and (array_inv!38858 _values!470) e!859895)))

(declare-fun b!1544906 () Bool)

(declare-fun res!1059580 () Bool)

(assert (=> b!1544906 (=> (not res!1059580) (not e!859898))))

(declare-datatypes ((List!36031 0))(
  ( (Nil!36028) (Cons!36027 (h!37473 (_ BitVec 64)) (t!50717 List!36031)) )
))
(declare-fun arrayNoDuplicates!0 (array!103006 (_ BitVec 32) List!36031) Bool)

(assert (=> b!1544906 (= res!1059580 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36028))))

(declare-fun b!1544907 () Bool)

(assert (=> b!1544907 (= e!859899 (+!4925 call!69121 (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69120 () Bool)

(assert (=> bm!69120 (= call!69124 call!69122)))

(declare-fun b!1544908 () Bool)

(assert (=> b!1544908 (= e!859901 call!69120)))

(declare-fun b!1544909 () Bool)

(assert (=> b!1544909 (= e!859896 tp_is_empty!37933)))

(declare-fun b!1544910 () Bool)

(assert (=> b!1544910 (= e!859902 tp_is_empty!37933)))

(declare-fun bm!69121 () Bool)

(assert (=> bm!69121 (= call!69122 (getCurrentListMapNoExtraKeys!6553 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544911 () Bool)

(declare-fun res!1059579 () Bool)

(assert (=> b!1544911 (=> (not res!1059579) (not e!859897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1544911 (= res!1059579 (validKeyInArray!0 (select (arr!49706 _keys!618) from!762)))))

(assert (= (and start!131894 res!1059577) b!1544905))

(assert (= (and b!1544905 res!1059582) b!1544902))

(assert (= (and b!1544902 res!1059578) b!1544906))

(assert (= (and b!1544906 res!1059580) b!1544903))

(assert (= (and b!1544903 res!1059576) b!1544899))

(assert (= (and b!1544899 c!141497) b!1544907))

(assert (= (and b!1544899 (not c!141497)) b!1544898))

(assert (= (and b!1544898 c!141496) b!1544897))

(assert (= (and b!1544898 (not c!141496)) b!1544896))

(assert (= (and b!1544896 c!141498) b!1544904))

(assert (= (and b!1544896 (not c!141498)) b!1544908))

(assert (= (or b!1544904 b!1544908) bm!69117))

(assert (= (or b!1544897 bm!69117) bm!69120))

(assert (= (or b!1544897 b!1544904) bm!69118))

(assert (= (or b!1544907 bm!69120) bm!69121))

(assert (= (or b!1544907 bm!69118) bm!69119))

(assert (= (and b!1544899 res!1059581) b!1544911))

(assert (= (and b!1544911 res!1059579) b!1544901))

(assert (= (and b!1544900 condMapEmpty!58603) mapIsEmpty!58603))

(assert (= (and b!1544900 (not condMapEmpty!58603)) mapNonEmpty!58603))

(get-info :version)

(assert (= (and mapNonEmpty!58603 ((_ is ValueCellFull!18056) mapValue!58603)) b!1544910))

(assert (= (and b!1544900 ((_ is ValueCellFull!18056) mapDefault!58603)) b!1544909))

(assert (= start!131894 b!1544900))

(declare-fun m!1424727 () Bool)

(assert (=> bm!69121 m!1424727))

(declare-fun m!1424729 () Bool)

(assert (=> b!1544901 m!1424729))

(assert (=> b!1544901 m!1424729))

(declare-fun m!1424731 () Bool)

(assert (=> b!1544901 m!1424731))

(declare-fun m!1424733 () Bool)

(assert (=> b!1544901 m!1424733))

(assert (=> b!1544901 m!1424729))

(declare-fun m!1424735 () Bool)

(assert (=> b!1544901 m!1424735))

(assert (=> b!1544901 m!1424727))

(assert (=> b!1544901 m!1424733))

(declare-fun m!1424737 () Bool)

(assert (=> b!1544907 m!1424737))

(assert (=> b!1544911 m!1424729))

(assert (=> b!1544911 m!1424729))

(declare-fun m!1424739 () Bool)

(assert (=> b!1544911 m!1424739))

(declare-fun m!1424741 () Bool)

(assert (=> b!1544902 m!1424741))

(declare-fun m!1424743 () Bool)

(assert (=> b!1544906 m!1424743))

(declare-fun m!1424745 () Bool)

(assert (=> start!131894 m!1424745))

(declare-fun m!1424747 () Bool)

(assert (=> start!131894 m!1424747))

(declare-fun m!1424749 () Bool)

(assert (=> start!131894 m!1424749))

(declare-fun m!1424751 () Bool)

(assert (=> bm!69119 m!1424751))

(declare-fun m!1424753 () Bool)

(assert (=> mapNonEmpty!58603 m!1424753))

(check-sat (not b!1544911) (not b!1544907) (not start!131894) (not mapNonEmpty!58603) (not bm!69119) b_and!51049 (not b!1544901) (not bm!69121) (not b!1544906) (not b_next!31657) tp_is_empty!37933 (not b!1544902))
(check-sat b_and!51049 (not b_next!31657))
