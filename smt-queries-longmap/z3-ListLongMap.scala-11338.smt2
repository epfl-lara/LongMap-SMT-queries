; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131882 () Bool)

(assert start!131882)

(declare-fun b_free!31645 () Bool)

(declare-fun b_next!31645 () Bool)

(assert (=> start!131882 (= b_free!31645 (not b_next!31645))))

(declare-fun tp!111188 () Bool)

(declare-fun b_and!51037 () Bool)

(assert (=> start!131882 (= tp!111188 b_and!51037)))

(declare-fun b!1544622 () Bool)

(declare-fun e!859745 () Bool)

(declare-fun tp_is_empty!37921 () Bool)

(assert (=> b!1544622 (= e!859745 tp_is_empty!37921)))

(declare-fun b!1544623 () Bool)

(declare-fun e!859740 () Bool)

(assert (=> b!1544623 (= e!859740 tp_is_empty!37921)))

(declare-fun b!1544624 () Bool)

(declare-datatypes ((V!59005 0))(
  ( (V!59006 (val!19038 Int)) )
))
(declare-datatypes ((tuple2!24536 0))(
  ( (tuple2!24537 (_1!12279 (_ BitVec 64)) (_2!12279 V!59005)) )
))
(declare-datatypes ((List!36019 0))(
  ( (Nil!36016) (Cons!36015 (h!37461 tuple2!24536) (t!50705 List!36019)) )
))
(declare-datatypes ((ListLongMap!22145 0))(
  ( (ListLongMap!22146 (toList!11088 List!36019)) )
))
(declare-fun e!859739 () ListLongMap!22145)

(declare-fun call!69032 () ListLongMap!22145)

(assert (=> b!1544624 (= e!859739 call!69032)))

(declare-fun bm!69027 () Bool)

(declare-fun call!69033 () ListLongMap!22145)

(assert (=> bm!69027 (= call!69032 call!69033)))

(declare-fun b!1544625 () Bool)

(declare-fun e!859741 () ListLongMap!22145)

(declare-fun call!69031 () ListLongMap!22145)

(assert (=> b!1544625 (= e!859741 call!69031)))

(declare-fun b!1544626 () Bool)

(declare-fun res!1059465 () Bool)

(declare-fun e!859746 () Bool)

(assert (=> b!1544626 (=> (not res!1059465) (not e!859746))))

(declare-datatypes ((array!102982 0))(
  ( (array!102983 (arr!49694 (Array (_ BitVec 32) (_ BitVec 64))) (size!50246 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102982)

(declare-datatypes ((List!36020 0))(
  ( (Nil!36017) (Cons!36016 (h!37462 (_ BitVec 64)) (t!50706 List!36020)) )
))
(declare-fun arrayNoDuplicates!0 (array!102982 (_ BitVec 32) List!36020) Bool)

(assert (=> b!1544626 (= res!1059465 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36017))))

(declare-fun b!1544627 () Bool)

(assert (=> b!1544627 (= e!859746 false)))

(declare-fun lt!665923 () ListLongMap!22145)

(declare-fun e!859743 () ListLongMap!22145)

(assert (=> b!1544627 (= lt!665923 e!859743)))

(declare-fun c!141444 () Bool)

(declare-fun lt!665922 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544627 (= c!141444 (and (not lt!665922) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544627 (= lt!665922 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!59005)

(declare-fun call!69030 () ListLongMap!22145)

(declare-fun c!141442 () Bool)

(declare-fun minValue!436 () V!59005)

(declare-fun call!69034 () ListLongMap!22145)

(declare-fun bm!69028 () Bool)

(declare-fun +!4920 (ListLongMap!22145 tuple2!24536) ListLongMap!22145)

(assert (=> bm!69028 (= call!69033 (+!4920 (ite c!141444 call!69030 (ite c!141442 call!69034 call!69031)) (ite (or c!141444 c!141442) (tuple2!24537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544628 () Bool)

(declare-fun c!141443 () Bool)

(assert (=> b!1544628 (= c!141443 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665922))))

(assert (=> b!1544628 (= e!859739 e!859741)))

(declare-fun mapIsEmpty!58585 () Bool)

(declare-fun mapRes!58585 () Bool)

(assert (=> mapIsEmpty!58585 mapRes!58585))

(declare-fun b!1544629 () Bool)

(declare-fun res!1059467 () Bool)

(assert (=> b!1544629 (=> (not res!1059467) (not e!859746))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18050 0))(
  ( (ValueCellFull!18050 (v!21835 V!59005)) (EmptyCell!18050) )
))
(declare-datatypes ((array!102984 0))(
  ( (array!102985 (arr!49695 (Array (_ BitVec 32) ValueCell!18050)) (size!50247 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102984)

(assert (=> b!1544629 (= res!1059467 (and (= (size!50247 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50246 _keys!618) (size!50247 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544630 () Bool)

(assert (=> b!1544630 (= e!859743 (+!4920 call!69033 (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1059466 () Bool)

(assert (=> start!131882 (=> (not res!1059466) (not e!859746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131882 (= res!1059466 (validMask!0 mask!926))))

(assert (=> start!131882 e!859746))

(declare-fun array_inv!38851 (array!102982) Bool)

(assert (=> start!131882 (array_inv!38851 _keys!618)))

(assert (=> start!131882 tp_is_empty!37921))

(assert (=> start!131882 true))

(assert (=> start!131882 tp!111188))

(declare-fun e!859742 () Bool)

(declare-fun array_inv!38852 (array!102984) Bool)

(assert (=> start!131882 (and (array_inv!38852 _values!470) e!859742)))

(declare-fun b!1544631 () Bool)

(assert (=> b!1544631 (= e!859743 e!859739)))

(assert (=> b!1544631 (= c!141442 (and (not lt!665922) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69029 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6550 (array!102982 array!102984 (_ BitVec 32) (_ BitVec 32) V!59005 V!59005 (_ BitVec 32) Int) ListLongMap!22145)

(assert (=> bm!69029 (= call!69030 (getCurrentListMapNoExtraKeys!6550 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544632 () Bool)

(declare-fun res!1059464 () Bool)

(assert (=> b!1544632 (=> (not res!1059464) (not e!859746))))

(assert (=> b!1544632 (= res!1059464 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50246 _keys!618))))))

(declare-fun b!1544633 () Bool)

(assert (=> b!1544633 (= e!859741 call!69032)))

(declare-fun b!1544634 () Bool)

(declare-fun res!1059468 () Bool)

(assert (=> b!1544634 (=> (not res!1059468) (not e!859746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102982 (_ BitVec 32)) Bool)

(assert (=> b!1544634 (= res!1059468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58585 () Bool)

(declare-fun tp!111187 () Bool)

(assert (=> mapNonEmpty!58585 (= mapRes!58585 (and tp!111187 e!859740))))

(declare-fun mapValue!58585 () ValueCell!18050)

(declare-fun mapRest!58585 () (Array (_ BitVec 32) ValueCell!18050))

(declare-fun mapKey!58585 () (_ BitVec 32))

(assert (=> mapNonEmpty!58585 (= (arr!49695 _values!470) (store mapRest!58585 mapKey!58585 mapValue!58585))))

(declare-fun bm!69030 () Bool)

(assert (=> bm!69030 (= call!69031 call!69034)))

(declare-fun b!1544635 () Bool)

(assert (=> b!1544635 (= e!859742 (and e!859745 mapRes!58585))))

(declare-fun condMapEmpty!58585 () Bool)

(declare-fun mapDefault!58585 () ValueCell!18050)

(assert (=> b!1544635 (= condMapEmpty!58585 (= (arr!49695 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18050)) mapDefault!58585)))))

(declare-fun bm!69031 () Bool)

(assert (=> bm!69031 (= call!69034 call!69030)))

(assert (= (and start!131882 res!1059466) b!1544629))

(assert (= (and b!1544629 res!1059467) b!1544634))

(assert (= (and b!1544634 res!1059468) b!1544626))

(assert (= (and b!1544626 res!1059465) b!1544632))

(assert (= (and b!1544632 res!1059464) b!1544627))

(assert (= (and b!1544627 c!141444) b!1544630))

(assert (= (and b!1544627 (not c!141444)) b!1544631))

(assert (= (and b!1544631 c!141442) b!1544624))

(assert (= (and b!1544631 (not c!141442)) b!1544628))

(assert (= (and b!1544628 c!141443) b!1544633))

(assert (= (and b!1544628 (not c!141443)) b!1544625))

(assert (= (or b!1544633 b!1544625) bm!69030))

(assert (= (or b!1544624 bm!69030) bm!69031))

(assert (= (or b!1544624 b!1544633) bm!69027))

(assert (= (or b!1544630 bm!69031) bm!69029))

(assert (= (or b!1544630 bm!69027) bm!69028))

(assert (= (and b!1544635 condMapEmpty!58585) mapIsEmpty!58585))

(assert (= (and b!1544635 (not condMapEmpty!58585)) mapNonEmpty!58585))

(get-info :version)

(assert (= (and mapNonEmpty!58585 ((_ is ValueCellFull!18050) mapValue!58585)) b!1544623))

(assert (= (and b!1544635 ((_ is ValueCellFull!18050) mapDefault!58585)) b!1544622))

(assert (= start!131882 b!1544635))

(declare-fun m!1424601 () Bool)

(assert (=> b!1544634 m!1424601))

(declare-fun m!1424603 () Bool)

(assert (=> bm!69028 m!1424603))

(declare-fun m!1424605 () Bool)

(assert (=> mapNonEmpty!58585 m!1424605))

(declare-fun m!1424607 () Bool)

(assert (=> b!1544630 m!1424607))

(declare-fun m!1424609 () Bool)

(assert (=> start!131882 m!1424609))

(declare-fun m!1424611 () Bool)

(assert (=> start!131882 m!1424611))

(declare-fun m!1424613 () Bool)

(assert (=> start!131882 m!1424613))

(declare-fun m!1424615 () Bool)

(assert (=> bm!69029 m!1424615))

(declare-fun m!1424617 () Bool)

(assert (=> b!1544626 m!1424617))

(check-sat (not b!1544626) (not start!131882) (not bm!69028) (not b!1544634) tp_is_empty!37921 (not bm!69029) (not b!1544630) (not b_next!31645) b_and!51037 (not mapNonEmpty!58585))
(check-sat b_and!51037 (not b_next!31645))
