; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132160 () Bool)

(assert start!132160)

(declare-fun b_free!31885 () Bool)

(declare-fun b_next!31885 () Bool)

(assert (=> start!132160 (= b_free!31885 (not b_next!31885))))

(declare-fun tp!111913 () Bool)

(declare-fun b_and!51297 () Bool)

(assert (=> start!132160 (= tp!111913 b_and!51297)))

(declare-fun b!1550701 () Bool)

(declare-fun c!142601 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668209 () Bool)

(assert (=> b!1550701 (= c!142601 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668209))))

(declare-datatypes ((V!59325 0))(
  ( (V!59326 (val!19158 Int)) )
))
(declare-datatypes ((tuple2!24768 0))(
  ( (tuple2!24769 (_1!12395 (_ BitVec 64)) (_2!12395 V!59325)) )
))
(declare-datatypes ((List!36219 0))(
  ( (Nil!36216) (Cons!36215 (h!37661 tuple2!24768) (t!50921 List!36219)) )
))
(declare-datatypes ((ListLongMap!22377 0))(
  ( (ListLongMap!22378 (toList!11204 List!36219)) )
))
(declare-fun e!863201 () ListLongMap!22377)

(declare-fun e!863205 () ListLongMap!22377)

(assert (=> b!1550701 (= e!863201 e!863205)))

(declare-fun b!1550702 () Bool)

(declare-fun res!1062117 () Bool)

(declare-fun e!863206 () Bool)

(assert (=> b!1550702 (=> (not res!1062117) (not e!863206))))

(declare-datatypes ((array!103446 0))(
  ( (array!103447 (arr!49924 (Array (_ BitVec 32) (_ BitVec 64))) (size!50476 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103446)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18170 0))(
  ( (ValueCellFull!18170 (v!21957 V!59325)) (EmptyCell!18170) )
))
(declare-datatypes ((array!103448 0))(
  ( (array!103449 (arr!49925 (Array (_ BitVec 32) ValueCell!18170)) (size!50477 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103448)

(assert (=> b!1550702 (= res!1062117 (and (= (size!50477 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50476 _keys!618) (size!50477 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70854 () Bool)

(declare-fun call!70861 () ListLongMap!22377)

(declare-fun call!70858 () ListLongMap!22377)

(assert (=> bm!70854 (= call!70861 call!70858)))

(declare-fun bm!70855 () Bool)

(declare-fun call!70859 () ListLongMap!22377)

(declare-fun call!70857 () ListLongMap!22377)

(assert (=> bm!70855 (= call!70859 call!70857)))

(declare-fun b!1550703 () Bool)

(declare-fun e!863204 () Bool)

(declare-fun tp_is_empty!38161 () Bool)

(assert (=> b!1550703 (= e!863204 tp_is_empty!38161)))

(declare-fun b!1550704 () Bool)

(declare-fun e!863207 () ListLongMap!22377)

(declare-fun minValue!436 () V!59325)

(declare-fun +!5020 (ListLongMap!22377 tuple2!24768) ListLongMap!22377)

(assert (=> b!1550704 (= e!863207 (+!5020 call!70857 (tuple2!24769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550705 () Bool)

(declare-fun res!1062114 () Bool)

(assert (=> b!1550705 (=> (not res!1062114) (not e!863206))))

(declare-datatypes ((List!36220 0))(
  ( (Nil!36217) (Cons!36216 (h!37662 (_ BitVec 64)) (t!50922 List!36220)) )
))
(declare-fun arrayNoDuplicates!0 (array!103446 (_ BitVec 32) List!36220) Bool)

(assert (=> b!1550705 (= res!1062114 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36217))))

(declare-fun b!1550706 () Bool)

(assert (=> b!1550706 (= e!863201 call!70859)))

(declare-fun b!1550707 () Bool)

(assert (=> b!1550707 (= e!863205 call!70859)))

(declare-fun mapIsEmpty!58951 () Bool)

(declare-fun mapRes!58951 () Bool)

(assert (=> mapIsEmpty!58951 mapRes!58951))

(declare-fun zeroValue!436 () V!59325)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!70856 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6644 (array!103446 array!103448 (_ BitVec 32) (_ BitVec 32) V!59325 V!59325 (_ BitVec 32) Int) ListLongMap!22377)

(assert (=> bm!70856 (= call!70858 (getCurrentListMapNoExtraKeys!6644 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1062118 () Bool)

(assert (=> start!132160 (=> (not res!1062118) (not e!863206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132160 (= res!1062118 (validMask!0 mask!926))))

(assert (=> start!132160 e!863206))

(declare-fun array_inv!39013 (array!103446) Bool)

(assert (=> start!132160 (array_inv!39013 _keys!618)))

(assert (=> start!132160 tp_is_empty!38161))

(assert (=> start!132160 true))

(assert (=> start!132160 tp!111913))

(declare-fun e!863200 () Bool)

(declare-fun array_inv!39014 (array!103448) Bool)

(assert (=> start!132160 (and (array_inv!39014 _values!470) e!863200)))

(declare-fun b!1550708 () Bool)

(declare-fun res!1062112 () Bool)

(declare-fun e!863199 () Bool)

(assert (=> b!1550708 (=> (not res!1062112) (not e!863199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550708 (= res!1062112 (validKeyInArray!0 (select (arr!49924 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58951 () Bool)

(declare-fun tp!111914 () Bool)

(assert (=> mapNonEmpty!58951 (= mapRes!58951 (and tp!111914 e!863204))))

(declare-fun mapKey!58951 () (_ BitVec 32))

(declare-fun mapRest!58951 () (Array (_ BitVec 32) ValueCell!18170))

(declare-fun mapValue!58951 () ValueCell!18170)

(assert (=> mapNonEmpty!58951 (= (arr!49925 _values!470) (store mapRest!58951 mapKey!58951 mapValue!58951))))

(declare-fun b!1550709 () Bool)

(assert (=> b!1550709 (= e!863199 (not true))))

(declare-fun lt!668207 () ListLongMap!22377)

(declare-fun apply!1083 (ListLongMap!22377 (_ BitVec 64)) V!59325)

(assert (=> b!1550709 (= (apply!1083 (+!5020 lt!668207 (tuple2!24769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49924 _keys!618) from!762)) (apply!1083 lt!668207 (select (arr!49924 _keys!618) from!762)))))

(declare-datatypes ((Unit!51480 0))(
  ( (Unit!51481) )
))
(declare-fun lt!668208 () Unit!51480)

(declare-fun addApplyDifferent!619 (ListLongMap!22377 (_ BitVec 64) V!59325 (_ BitVec 64)) Unit!51480)

(assert (=> b!1550709 (= lt!668208 (addApplyDifferent!619 lt!668207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49924 _keys!618) from!762)))))

(declare-fun contains!10069 (ListLongMap!22377 (_ BitVec 64)) Bool)

(assert (=> b!1550709 (contains!10069 (+!5020 lt!668207 (tuple2!24769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49924 _keys!618) from!762))))

(declare-fun lt!668210 () Unit!51480)

(declare-fun addStillContains!1284 (ListLongMap!22377 (_ BitVec 64) V!59325 (_ BitVec 64)) Unit!51480)

(assert (=> b!1550709 (= lt!668210 (addStillContains!1284 lt!668207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49924 _keys!618) from!762)))))

(assert (=> b!1550709 (= lt!668207 (getCurrentListMapNoExtraKeys!6644 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550710 () Bool)

(declare-fun res!1062113 () Bool)

(assert (=> b!1550710 (=> (not res!1062113) (not e!863206))))

(assert (=> b!1550710 (= res!1062113 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50476 _keys!618))))))

(declare-fun bm!70857 () Bool)

(declare-fun call!70860 () ListLongMap!22377)

(assert (=> bm!70857 (= call!70860 call!70861)))

(declare-fun b!1550711 () Bool)

(assert (=> b!1550711 (= e!863206 e!863199)))

(declare-fun res!1062115 () Bool)

(assert (=> b!1550711 (=> (not res!1062115) (not e!863199))))

(assert (=> b!1550711 (= res!1062115 (bvslt from!762 (size!50476 _keys!618)))))

(declare-fun lt!668206 () ListLongMap!22377)

(assert (=> b!1550711 (= lt!668206 e!863207)))

(declare-fun c!142603 () Bool)

(assert (=> b!1550711 (= c!142603 (and (not lt!668209) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550711 (= lt!668209 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550712 () Bool)

(assert (=> b!1550712 (= e!863207 e!863201)))

(declare-fun c!142602 () Bool)

(assert (=> b!1550712 (= c!142602 (and (not lt!668209) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550713 () Bool)

(declare-fun e!863202 () Bool)

(assert (=> b!1550713 (= e!863200 (and e!863202 mapRes!58951))))

(declare-fun condMapEmpty!58951 () Bool)

(declare-fun mapDefault!58951 () ValueCell!18170)

(assert (=> b!1550713 (= condMapEmpty!58951 (= (arr!49925 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18170)) mapDefault!58951)))))

(declare-fun b!1550714 () Bool)

(assert (=> b!1550714 (= e!863202 tp_is_empty!38161)))

(declare-fun b!1550715 () Bool)

(assert (=> b!1550715 (= e!863205 call!70860)))

(declare-fun bm!70858 () Bool)

(assert (=> bm!70858 (= call!70857 (+!5020 (ite c!142603 call!70858 (ite c!142602 call!70861 call!70860)) (ite (or c!142603 c!142602) (tuple2!24769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550716 () Bool)

(declare-fun res!1062116 () Bool)

(assert (=> b!1550716 (=> (not res!1062116) (not e!863206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103446 (_ BitVec 32)) Bool)

(assert (=> b!1550716 (= res!1062116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132160 res!1062118) b!1550702))

(assert (= (and b!1550702 res!1062117) b!1550716))

(assert (= (and b!1550716 res!1062116) b!1550705))

(assert (= (and b!1550705 res!1062114) b!1550710))

(assert (= (and b!1550710 res!1062113) b!1550711))

(assert (= (and b!1550711 c!142603) b!1550704))

(assert (= (and b!1550711 (not c!142603)) b!1550712))

(assert (= (and b!1550712 c!142602) b!1550706))

(assert (= (and b!1550712 (not c!142602)) b!1550701))

(assert (= (and b!1550701 c!142601) b!1550707))

(assert (= (and b!1550701 (not c!142601)) b!1550715))

(assert (= (or b!1550707 b!1550715) bm!70857))

(assert (= (or b!1550706 bm!70857) bm!70854))

(assert (= (or b!1550706 b!1550707) bm!70855))

(assert (= (or b!1550704 bm!70854) bm!70856))

(assert (= (or b!1550704 bm!70855) bm!70858))

(assert (= (and b!1550711 res!1062115) b!1550708))

(assert (= (and b!1550708 res!1062112) b!1550709))

(assert (= (and b!1550713 condMapEmpty!58951) mapIsEmpty!58951))

(assert (= (and b!1550713 (not condMapEmpty!58951)) mapNonEmpty!58951))

(get-info :version)

(assert (= (and mapNonEmpty!58951 ((_ is ValueCellFull!18170) mapValue!58951)) b!1550703))

(assert (= (and b!1550713 ((_ is ValueCellFull!18170) mapDefault!58951)) b!1550714))

(assert (= start!132160 b!1550713))

(declare-fun m!1428855 () Bool)

(assert (=> bm!70858 m!1428855))

(declare-fun m!1428857 () Bool)

(assert (=> bm!70856 m!1428857))

(assert (=> b!1550709 m!1428857))

(declare-fun m!1428859 () Bool)

(assert (=> b!1550709 m!1428859))

(declare-fun m!1428861 () Bool)

(assert (=> b!1550709 m!1428861))

(declare-fun m!1428863 () Bool)

(assert (=> b!1550709 m!1428863))

(assert (=> b!1550709 m!1428859))

(declare-fun m!1428865 () Bool)

(assert (=> b!1550709 m!1428865))

(declare-fun m!1428867 () Bool)

(assert (=> b!1550709 m!1428867))

(assert (=> b!1550709 m!1428859))

(declare-fun m!1428869 () Bool)

(assert (=> b!1550709 m!1428869))

(assert (=> b!1550709 m!1428863))

(assert (=> b!1550709 m!1428867))

(assert (=> b!1550709 m!1428859))

(declare-fun m!1428871 () Bool)

(assert (=> b!1550709 m!1428871))

(assert (=> b!1550709 m!1428859))

(declare-fun m!1428873 () Bool)

(assert (=> b!1550709 m!1428873))

(assert (=> b!1550709 m!1428859))

(declare-fun m!1428875 () Bool)

(assert (=> mapNonEmpty!58951 m!1428875))

(assert (=> b!1550708 m!1428859))

(assert (=> b!1550708 m!1428859))

(declare-fun m!1428877 () Bool)

(assert (=> b!1550708 m!1428877))

(declare-fun m!1428879 () Bool)

(assert (=> b!1550716 m!1428879))

(declare-fun m!1428881 () Bool)

(assert (=> b!1550704 m!1428881))

(declare-fun m!1428883 () Bool)

(assert (=> b!1550705 m!1428883))

(declare-fun m!1428885 () Bool)

(assert (=> start!132160 m!1428885))

(declare-fun m!1428887 () Bool)

(assert (=> start!132160 m!1428887))

(declare-fun m!1428889 () Bool)

(assert (=> start!132160 m!1428889))

(check-sat (not b!1550708) b_and!51297 (not mapNonEmpty!58951) (not b!1550716) (not b!1550704) tp_is_empty!38161 (not bm!70856) (not b!1550709) (not b!1550705) (not bm!70858) (not start!132160) (not b_next!31885))
(check-sat b_and!51297 (not b_next!31885))
