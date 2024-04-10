; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132134 () Bool)

(assert start!132134)

(declare-fun b_free!31847 () Bool)

(declare-fun b_next!31847 () Bool)

(assert (=> start!132134 (= b_free!31847 (not b_next!31847))))

(declare-fun tp!111793 () Bool)

(declare-fun b_and!51261 () Bool)

(assert (=> start!132134 (= tp!111793 b_and!51261)))

(declare-fun b!1549831 () Bool)

(declare-fun e!862712 () Bool)

(declare-fun tp_is_empty!38123 () Bool)

(assert (=> b!1549831 (= e!862712 tp_is_empty!38123)))

(declare-fun b!1549832 () Bool)

(declare-datatypes ((V!59273 0))(
  ( (V!59274 (val!19139 Int)) )
))
(declare-datatypes ((tuple2!24656 0))(
  ( (tuple2!24657 (_1!12339 (_ BitVec 64)) (_2!12339 V!59273)) )
))
(declare-datatypes ((List!36140 0))(
  ( (Nil!36137) (Cons!36136 (h!37581 tuple2!24656) (t!50840 List!36140)) )
))
(declare-datatypes ((ListLongMap!22265 0))(
  ( (ListLongMap!22266 (toList!11148 List!36140)) )
))
(declare-fun e!862710 () ListLongMap!22265)

(declare-fun call!70582 () ListLongMap!22265)

(assert (=> b!1549832 (= e!862710 call!70582)))

(declare-fun b!1549833 () Bool)

(declare-fun call!70580 () ListLongMap!22265)

(assert (=> b!1549833 (= e!862710 call!70580)))

(declare-fun bm!70577 () Bool)

(declare-fun call!70583 () ListLongMap!22265)

(assert (=> bm!70577 (= call!70582 call!70583)))

(declare-fun b!1549834 () Bool)

(declare-fun res!1061733 () Bool)

(declare-fun e!862717 () Bool)

(assert (=> b!1549834 (=> (not res!1061733) (not e!862717))))

(declare-datatypes ((array!103442 0))(
  ( (array!103443 (arr!49923 (Array (_ BitVec 32) (_ BitVec 64))) (size!50473 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103442)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18151 0))(
  ( (ValueCellFull!18151 (v!21940 V!59273)) (EmptyCell!18151) )
))
(declare-datatypes ((array!103444 0))(
  ( (array!103445 (arr!49924 (Array (_ BitVec 32) ValueCell!18151)) (size!50474 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103444)

(assert (=> b!1549834 (= res!1061733 (and (= (size!50474 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50473 _keys!618) (size!50474 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549835 () Bool)

(declare-fun res!1061728 () Bool)

(assert (=> b!1549835 (=> (not res!1061728) (not e!862717))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1549835 (= res!1061728 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50473 _keys!618))))))

(declare-fun bm!70578 () Bool)

(declare-fun call!70581 () ListLongMap!22265)

(assert (=> bm!70578 (= call!70580 call!70581)))

(declare-fun zeroValue!436 () V!59273)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70579 () Bool)

(declare-fun minValue!436 () V!59273)

(declare-fun call!70584 () ListLongMap!22265)

(declare-fun getCurrentListMapNoExtraKeys!6598 (array!103442 array!103444 (_ BitVec 32) (_ BitVec 32) V!59273 V!59273 (_ BitVec 32) Int) ListLongMap!22265)

(assert (=> bm!70579 (= call!70584 (getCurrentListMapNoExtraKeys!6598 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549836 () Bool)

(declare-datatypes ((Unit!51631 0))(
  ( (Unit!51632) )
))
(declare-fun e!862718 () Unit!51631)

(declare-fun lt!668100 () Unit!51631)

(assert (=> b!1549836 (= e!862718 lt!668100)))

(declare-fun lt!668107 () ListLongMap!22265)

(assert (=> b!1549836 (= lt!668107 (getCurrentListMapNoExtraKeys!6598 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668110 () Unit!51631)

(declare-fun addStillContains!1281 (ListLongMap!22265 (_ BitVec 64) V!59273 (_ BitVec 64)) Unit!51631)

(assert (=> b!1549836 (= lt!668110 (addStillContains!1281 lt!668107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49923 _keys!618) from!762)))))

(declare-fun lt!668106 () ListLongMap!22265)

(declare-fun +!4973 (ListLongMap!22265 tuple2!24656) ListLongMap!22265)

(assert (=> b!1549836 (= lt!668106 (+!4973 lt!668107 (tuple2!24657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10094 (ListLongMap!22265 (_ BitVec 64)) Bool)

(assert (=> b!1549836 (contains!10094 lt!668106 (select (arr!49923 _keys!618) from!762))))

(declare-fun addApplyDifferent!628 (ListLongMap!22265 (_ BitVec 64) V!59273 (_ BitVec 64)) Unit!51631)

(assert (=> b!1549836 (= lt!668100 (addApplyDifferent!628 lt!668107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49923 _keys!618) from!762)))))

(declare-fun lt!668105 () V!59273)

(declare-fun apply!1087 (ListLongMap!22265 (_ BitVec 64)) V!59273)

(assert (=> b!1549836 (= lt!668105 (apply!1087 (+!4973 lt!668107 (tuple2!24657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49923 _keys!618) from!762)))))

(declare-fun lt!668104 () V!59273)

(assert (=> b!1549836 (= lt!668104 (apply!1087 lt!668107 (select (arr!49923 _keys!618) from!762)))))

(assert (=> b!1549836 (= lt!668105 lt!668104)))

(declare-fun lt!668108 () Unit!51631)

(assert (=> b!1549836 (= lt!668108 (addApplyDifferent!628 lt!668107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49923 _keys!618) from!762)))))

(assert (=> b!1549836 (= (apply!1087 lt!668106 (select (arr!49923 _keys!618) from!762)) lt!668104)))

(declare-fun b!1549837 () Bool)

(declare-fun e!862716 () Bool)

(declare-fun e!862709 () Bool)

(assert (=> b!1549837 (= e!862716 e!862709)))

(declare-fun res!1061725 () Bool)

(assert (=> b!1549837 (=> (not res!1061725) (not e!862709))))

(declare-fun lt!668111 () ListLongMap!22265)

(assert (=> b!1549837 (= res!1061725 (contains!10094 lt!668111 (select (arr!49923 _keys!618) from!762)))))

(declare-fun bm!70580 () Bool)

(assert (=> bm!70580 (= call!70583 call!70584)))

(declare-fun b!1549838 () Bool)

(declare-fun e!862711 () ListLongMap!22265)

(assert (=> b!1549838 (= e!862711 (+!4973 call!70581 (tuple2!24657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58888 () Bool)

(declare-fun mapRes!58888 () Bool)

(assert (=> mapIsEmpty!58888 mapRes!58888))

(declare-fun b!1549839 () Bool)

(declare-fun e!862713 () ListLongMap!22265)

(assert (=> b!1549839 (= e!862713 call!70580)))

(declare-fun mapNonEmpty!58888 () Bool)

(declare-fun tp!111792 () Bool)

(assert (=> mapNonEmpty!58888 (= mapRes!58888 (and tp!111792 e!862712))))

(declare-fun mapValue!58888 () ValueCell!18151)

(declare-fun mapRest!58888 () (Array (_ BitVec 32) ValueCell!18151))

(declare-fun mapKey!58888 () (_ BitVec 32))

(assert (=> mapNonEmpty!58888 (= (arr!49924 _values!470) (store mapRest!58888 mapKey!58888 mapValue!58888))))

(declare-fun b!1549840 () Bool)

(declare-fun c!142458 () Bool)

(declare-fun lt!668101 () Bool)

(assert (=> b!1549840 (= c!142458 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668101))))

(assert (=> b!1549840 (= e!862713 e!862710)))

(declare-fun b!1549841 () Bool)

(declare-fun res!1061726 () Bool)

(assert (=> b!1549841 (=> (not res!1061726) (not e!862717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103442 (_ BitVec 32)) Bool)

(assert (=> b!1549841 (= res!1061726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549842 () Bool)

(declare-fun res!1061730 () Bool)

(declare-fun e!862714 () Bool)

(assert (=> b!1549842 (=> (not res!1061730) (not e!862714))))

(assert (=> b!1549842 (= res!1061730 (not lt!668101))))

(declare-fun b!1549843 () Bool)

(declare-fun get!25996 (ValueCell!18151 V!59273) V!59273)

(declare-fun dynLambda!3797 (Int (_ BitVec 64)) V!59273)

(assert (=> b!1549843 (= e!862709 (= (apply!1087 lt!668111 (select (arr!49923 _keys!618) from!762)) (get!25996 (select (arr!49924 _values!470) from!762) (dynLambda!3797 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1549844 () Bool)

(assert (=> b!1549844 (= e!862714 false)))

(declare-fun lt!668109 () Bool)

(assert (=> b!1549844 (= lt!668109 (contains!10094 lt!668111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549845 () Bool)

(declare-fun res!1061732 () Bool)

(assert (=> b!1549845 (=> (not res!1061732) (not e!862717))))

(declare-datatypes ((List!36141 0))(
  ( (Nil!36138) (Cons!36137 (h!37582 (_ BitVec 64)) (t!50841 List!36141)) )
))
(declare-fun arrayNoDuplicates!0 (array!103442 (_ BitVec 32) List!36141) Bool)

(assert (=> b!1549845 (= res!1061732 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36138))))

(declare-fun b!1549846 () Bool)

(declare-fun e!862707 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549846 (= e!862707 (not (validKeyInArray!0 (select (arr!49923 _keys!618) from!762))))))

(declare-fun b!1549847 () Bool)

(declare-fun Unit!51633 () Unit!51631)

(assert (=> b!1549847 (= e!862718 Unit!51633)))

(declare-fun res!1061731 () Bool)

(assert (=> start!132134 (=> (not res!1061731) (not e!862717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132134 (= res!1061731 (validMask!0 mask!926))))

(assert (=> start!132134 e!862717))

(declare-fun array_inv!38813 (array!103442) Bool)

(assert (=> start!132134 (array_inv!38813 _keys!618)))

(assert (=> start!132134 tp_is_empty!38123))

(assert (=> start!132134 true))

(assert (=> start!132134 tp!111793))

(declare-fun e!862708 () Bool)

(declare-fun array_inv!38814 (array!103444) Bool)

(assert (=> start!132134 (and (array_inv!38814 _values!470) e!862708)))

(declare-fun b!1549848 () Bool)

(assert (=> b!1549848 (= e!862717 e!862714)))

(declare-fun res!1061727 () Bool)

(assert (=> b!1549848 (=> (not res!1061727) (not e!862714))))

(assert (=> b!1549848 (= res!1061727 e!862716)))

(declare-fun res!1061724 () Bool)

(assert (=> b!1549848 (=> res!1061724 e!862716)))

(declare-fun lt!668102 () Bool)

(assert (=> b!1549848 (= res!1061724 lt!668102)))

(declare-fun lt!668103 () Unit!51631)

(assert (=> b!1549848 (= lt!668103 e!862718)))

(declare-fun c!142459 () Bool)

(assert (=> b!1549848 (= c!142459 (not lt!668102))))

(assert (=> b!1549848 (= lt!668102 e!862707)))

(declare-fun res!1061729 () Bool)

(assert (=> b!1549848 (=> res!1061729 e!862707)))

(assert (=> b!1549848 (= res!1061729 (bvsge from!762 (size!50473 _keys!618)))))

(assert (=> b!1549848 (= lt!668111 e!862711)))

(declare-fun c!142457 () Bool)

(assert (=> b!1549848 (= c!142457 (and (not lt!668101) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549848 (= lt!668101 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549849 () Bool)

(declare-fun e!862719 () Bool)

(assert (=> b!1549849 (= e!862708 (and e!862719 mapRes!58888))))

(declare-fun condMapEmpty!58888 () Bool)

(declare-fun mapDefault!58888 () ValueCell!18151)

