; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132018 () Bool)

(assert start!132018)

(declare-fun b_free!31731 () Bool)

(declare-fun b_next!31731 () Bool)

(assert (=> start!132018 (= b_free!31731 (not b_next!31731))))

(declare-fun tp!111444 () Bool)

(declare-fun b_and!51141 () Bool)

(assert (=> start!132018 (= tp!111444 b_and!51141)))

(declare-fun b!1546985 () Bool)

(declare-datatypes ((V!59119 0))(
  ( (V!59120 (val!19081 Int)) )
))
(declare-datatypes ((tuple2!24542 0))(
  ( (tuple2!24543 (_1!12282 (_ BitVec 64)) (_2!12282 V!59119)) )
))
(declare-datatypes ((List!36043 0))(
  ( (Nil!36040) (Cons!36039 (h!37484 tuple2!24542) (t!50737 List!36043)) )
))
(declare-datatypes ((ListLongMap!22151 0))(
  ( (ListLongMap!22152 (toList!11091 List!36043)) )
))
(declare-fun e!861092 () ListLongMap!22151)

(declare-fun call!69714 () ListLongMap!22151)

(assert (=> b!1546985 (= e!861092 call!69714)))

(declare-fun b!1546986 () Bool)

(declare-fun res!1060487 () Bool)

(declare-fun e!861098 () Bool)

(assert (=> b!1546986 (=> (not res!1060487) (not e!861098))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103214 0))(
  ( (array!103215 (arr!49809 (Array (_ BitVec 32) (_ BitVec 64))) (size!50359 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103214)

(assert (=> b!1546986 (= res!1060487 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50359 _keys!618))))))

(declare-fun b!1546988 () Bool)

(declare-fun c!141918 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666733 () Bool)

(assert (=> b!1546988 (= c!141918 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666733))))

(declare-fun e!861091 () ListLongMap!22151)

(assert (=> b!1546988 (= e!861091 e!861092)))

(declare-fun b!1546989 () Bool)

(declare-fun res!1060486 () Bool)

(assert (=> b!1546989 (=> (not res!1060486) (not e!861098))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103214 (_ BitVec 32)) Bool)

(assert (=> b!1546989 (= res!1060486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58714 () Bool)

(declare-fun mapRes!58714 () Bool)

(assert (=> mapIsEmpty!58714 mapRes!58714))

(declare-fun b!1546990 () Bool)

(declare-fun e!861095 () Bool)

(declare-fun tp_is_empty!38007 () Bool)

(assert (=> b!1546990 (= e!861095 tp_is_empty!38007)))

(declare-fun bm!69707 () Bool)

(declare-fun call!69712 () ListLongMap!22151)

(assert (=> bm!69707 (= call!69714 call!69712)))

(declare-fun bm!69708 () Bool)

(declare-fun minValue!436 () V!59119)

(declare-fun call!69711 () ListLongMap!22151)

(declare-fun call!69713 () ListLongMap!22151)

(declare-fun call!69710 () ListLongMap!22151)

(declare-fun zeroValue!436 () V!59119)

(declare-fun c!141919 () Bool)

(declare-fun c!141920 () Bool)

(declare-fun +!4923 (ListLongMap!22151 tuple2!24542) ListLongMap!22151)

(assert (=> bm!69708 (= call!69712 (+!4923 (ite c!141919 call!69711 (ite c!141920 call!69713 call!69710)) (ite (or c!141919 c!141920) (tuple2!24543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546991 () Bool)

(declare-fun res!1060483 () Bool)

(assert (=> b!1546991 (=> (not res!1060483) (not e!861098))))

(declare-datatypes ((ValueCell!18093 0))(
  ( (ValueCellFull!18093 (v!21882 V!59119)) (EmptyCell!18093) )
))
(declare-datatypes ((array!103216 0))(
  ( (array!103217 (arr!49810 (Array (_ BitVec 32) ValueCell!18093)) (size!50360 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103216)

(assert (=> b!1546991 (= res!1060483 (and (= (size!50360 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50359 _keys!618) (size!50360 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546992 () Bool)

(declare-fun e!861093 () Bool)

(declare-fun e!861097 () Bool)

(assert (=> b!1546992 (= e!861093 (and e!861097 mapRes!58714))))

(declare-fun condMapEmpty!58714 () Bool)

(declare-fun mapDefault!58714 () ValueCell!18093)

(assert (=> b!1546992 (= condMapEmpty!58714 (= (arr!49810 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18093)) mapDefault!58714)))))

(declare-fun b!1546993 () Bool)

(declare-fun e!861094 () ListLongMap!22151)

(assert (=> b!1546993 (= e!861094 e!861091)))

(assert (=> b!1546993 (= c!141920 (and (not lt!666733) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546994 () Bool)

(declare-fun e!861096 () Bool)

(assert (=> b!1546994 (= e!861096 (not true))))

(declare-fun lt!666737 () ListLongMap!22151)

(declare-fun apply!1045 (ListLongMap!22151 (_ BitVec 64)) V!59119)

(assert (=> b!1546994 (= (apply!1045 (+!4923 lt!666737 (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49809 _keys!618) from!762)) (apply!1045 lt!666737 (select (arr!49809 _keys!618) from!762)))))

(declare-datatypes ((Unit!51540 0))(
  ( (Unit!51541) )
))
(declare-fun lt!666735 () Unit!51540)

(declare-fun addApplyDifferent!587 (ListLongMap!22151 (_ BitVec 64) V!59119 (_ BitVec 64)) Unit!51540)

(assert (=> b!1546994 (= lt!666735 (addApplyDifferent!587 lt!666737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49809 _keys!618) from!762)))))

(declare-fun contains!10052 (ListLongMap!22151 (_ BitVec 64)) Bool)

(assert (=> b!1546994 (contains!10052 (+!4923 lt!666737 (tuple2!24543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49809 _keys!618) from!762))))

(declare-fun lt!666736 () Unit!51540)

(declare-fun addStillContains!1240 (ListLongMap!22151 (_ BitVec 64) V!59119 (_ BitVec 64)) Unit!51540)

(assert (=> b!1546994 (= lt!666736 (addStillContains!1240 lt!666737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49809 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6552 (array!103214 array!103216 (_ BitVec 32) (_ BitVec 32) V!59119 V!59119 (_ BitVec 32) Int) ListLongMap!22151)

(assert (=> b!1546994 (= lt!666737 (getCurrentListMapNoExtraKeys!6552 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546995 () Bool)

(declare-fun res!1060488 () Bool)

(assert (=> b!1546995 (=> (not res!1060488) (not e!861096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546995 (= res!1060488 (validKeyInArray!0 (select (arr!49809 _keys!618) from!762)))))

(declare-fun res!1060482 () Bool)

(assert (=> start!132018 (=> (not res!1060482) (not e!861098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132018 (= res!1060482 (validMask!0 mask!926))))

(assert (=> start!132018 e!861098))

(declare-fun array_inv!38739 (array!103214) Bool)

(assert (=> start!132018 (array_inv!38739 _keys!618)))

(assert (=> start!132018 tp_is_empty!38007))

(assert (=> start!132018 true))

(assert (=> start!132018 tp!111444))

(declare-fun array_inv!38740 (array!103216) Bool)

(assert (=> start!132018 (and (array_inv!38740 _values!470) e!861093)))

(declare-fun b!1546987 () Bool)

(assert (=> b!1546987 (= e!861092 call!69710)))

(declare-fun bm!69709 () Bool)

(assert (=> bm!69709 (= call!69710 call!69713)))

(declare-fun mapNonEmpty!58714 () Bool)

(declare-fun tp!111445 () Bool)

(assert (=> mapNonEmpty!58714 (= mapRes!58714 (and tp!111445 e!861095))))

(declare-fun mapRest!58714 () (Array (_ BitVec 32) ValueCell!18093))

(declare-fun mapValue!58714 () ValueCell!18093)

(declare-fun mapKey!58714 () (_ BitVec 32))

(assert (=> mapNonEmpty!58714 (= (arr!49810 _values!470) (store mapRest!58714 mapKey!58714 mapValue!58714))))

(declare-fun b!1546996 () Bool)

(assert (=> b!1546996 (= e!861094 (+!4923 call!69712 (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546997 () Bool)

(assert (=> b!1546997 (= e!861098 e!861096)))

(declare-fun res!1060484 () Bool)

(assert (=> b!1546997 (=> (not res!1060484) (not e!861096))))

(assert (=> b!1546997 (= res!1060484 (bvslt from!762 (size!50359 _keys!618)))))

(declare-fun lt!666734 () ListLongMap!22151)

(assert (=> b!1546997 (= lt!666734 e!861094)))

(assert (=> b!1546997 (= c!141919 (and (not lt!666733) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546997 (= lt!666733 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69710 () Bool)

(assert (=> bm!69710 (= call!69713 call!69711)))

(declare-fun b!1546998 () Bool)

(declare-fun res!1060485 () Bool)

(assert (=> b!1546998 (=> (not res!1060485) (not e!861098))))

(declare-datatypes ((List!36044 0))(
  ( (Nil!36041) (Cons!36040 (h!37485 (_ BitVec 64)) (t!50738 List!36044)) )
))
(declare-fun arrayNoDuplicates!0 (array!103214 (_ BitVec 32) List!36044) Bool)

(assert (=> b!1546998 (= res!1060485 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36041))))

(declare-fun b!1546999 () Bool)

(assert (=> b!1546999 (= e!861097 tp_is_empty!38007)))

(declare-fun bm!69711 () Bool)

(assert (=> bm!69711 (= call!69711 (getCurrentListMapNoExtraKeys!6552 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547000 () Bool)

(assert (=> b!1547000 (= e!861091 call!69714)))

(assert (= (and start!132018 res!1060482) b!1546991))

(assert (= (and b!1546991 res!1060483) b!1546989))

(assert (= (and b!1546989 res!1060486) b!1546998))

(assert (= (and b!1546998 res!1060485) b!1546986))

(assert (= (and b!1546986 res!1060487) b!1546997))

(assert (= (and b!1546997 c!141919) b!1546996))

(assert (= (and b!1546997 (not c!141919)) b!1546993))

(assert (= (and b!1546993 c!141920) b!1547000))

(assert (= (and b!1546993 (not c!141920)) b!1546988))

(assert (= (and b!1546988 c!141918) b!1546985))

(assert (= (and b!1546988 (not c!141918)) b!1546987))

(assert (= (or b!1546985 b!1546987) bm!69709))

(assert (= (or b!1547000 bm!69709) bm!69710))

(assert (= (or b!1547000 b!1546985) bm!69707))

(assert (= (or b!1546996 bm!69710) bm!69711))

(assert (= (or b!1546996 bm!69707) bm!69708))

(assert (= (and b!1546997 res!1060484) b!1546995))

(assert (= (and b!1546995 res!1060488) b!1546994))

(assert (= (and b!1546992 condMapEmpty!58714) mapIsEmpty!58714))

(assert (= (and b!1546992 (not condMapEmpty!58714)) mapNonEmpty!58714))

(get-info :version)

(assert (= (and mapNonEmpty!58714 ((_ is ValueCellFull!18093) mapValue!58714)) b!1546990))

(assert (= (and b!1546992 ((_ is ValueCellFull!18093) mapDefault!58714)) b!1546999))

(assert (= start!132018 b!1546992))

(declare-fun m!1426717 () Bool)

(assert (=> bm!69711 m!1426717))

(declare-fun m!1426719 () Bool)

(assert (=> start!132018 m!1426719))

(declare-fun m!1426721 () Bool)

(assert (=> start!132018 m!1426721))

(declare-fun m!1426723 () Bool)

(assert (=> start!132018 m!1426723))

(declare-fun m!1426725 () Bool)

(assert (=> mapNonEmpty!58714 m!1426725))

(declare-fun m!1426727 () Bool)

(assert (=> b!1546996 m!1426727))

(declare-fun m!1426729 () Bool)

(assert (=> b!1546995 m!1426729))

(assert (=> b!1546995 m!1426729))

(declare-fun m!1426731 () Bool)

(assert (=> b!1546995 m!1426731))

(declare-fun m!1426733 () Bool)

(assert (=> b!1546989 m!1426733))

(declare-fun m!1426735 () Bool)

(assert (=> b!1546994 m!1426735))

(assert (=> b!1546994 m!1426729))

(declare-fun m!1426737 () Bool)

(assert (=> b!1546994 m!1426737))

(assert (=> b!1546994 m!1426717))

(assert (=> b!1546994 m!1426729))

(assert (=> b!1546994 m!1426735))

(declare-fun m!1426739 () Bool)

(assert (=> b!1546994 m!1426739))

(assert (=> b!1546994 m!1426729))

(declare-fun m!1426741 () Bool)

(assert (=> b!1546994 m!1426741))

(assert (=> b!1546994 m!1426729))

(declare-fun m!1426743 () Bool)

(assert (=> b!1546994 m!1426743))

(assert (=> b!1546994 m!1426729))

(declare-fun m!1426745 () Bool)

(assert (=> b!1546994 m!1426745))

(assert (=> b!1546994 m!1426739))

(assert (=> b!1546994 m!1426729))

(declare-fun m!1426747 () Bool)

(assert (=> b!1546994 m!1426747))

(declare-fun m!1426749 () Bool)

(assert (=> bm!69708 m!1426749))

(declare-fun m!1426751 () Bool)

(assert (=> b!1546998 m!1426751))

(check-sat tp_is_empty!38007 b_and!51141 (not b_next!31731) (not b!1546996) (not start!132018) (not bm!69708) (not mapNonEmpty!58714) (not b!1546989) (not bm!69711) (not b!1546994) (not b!1546995) (not b!1546998))
(check-sat b_and!51141 (not b_next!31731))
