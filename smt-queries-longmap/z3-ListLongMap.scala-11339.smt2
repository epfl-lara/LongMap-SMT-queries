; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131888 () Bool)

(assert start!131888)

(declare-fun b_free!31651 () Bool)

(declare-fun b_next!31651 () Bool)

(assert (=> start!131888 (= b_free!31651 (not b_next!31651))))

(declare-fun tp!111205 () Bool)

(declare-fun b_and!51043 () Bool)

(assert (=> start!131888 (= tp!111205 b_and!51043)))

(declare-fun res!1059518 () Bool)

(declare-fun e!859817 () Bool)

(assert (=> start!131888 (=> (not res!1059518) (not e!859817))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131888 (= res!1059518 (validMask!0 mask!926))))

(assert (=> start!131888 e!859817))

(declare-datatypes ((array!102994 0))(
  ( (array!102995 (arr!49700 (Array (_ BitVec 32) (_ BitVec 64))) (size!50252 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102994)

(declare-fun array_inv!38853 (array!102994) Bool)

(assert (=> start!131888 (array_inv!38853 _keys!618)))

(declare-fun tp_is_empty!37927 () Bool)

(assert (=> start!131888 tp_is_empty!37927))

(assert (=> start!131888 true))

(assert (=> start!131888 tp!111205))

(declare-datatypes ((V!59013 0))(
  ( (V!59014 (val!19041 Int)) )
))
(declare-datatypes ((ValueCell!18053 0))(
  ( (ValueCellFull!18053 (v!21838 V!59013)) (EmptyCell!18053) )
))
(declare-datatypes ((array!102996 0))(
  ( (array!102997 (arr!49701 (Array (_ BitVec 32) ValueCell!18053)) (size!50253 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102996)

(declare-fun e!859815 () Bool)

(declare-fun array_inv!38854 (array!102996) Bool)

(assert (=> start!131888 (and (array_inv!38854 _values!470) e!859815)))

(declare-fun mapIsEmpty!58594 () Bool)

(declare-fun mapRes!58594 () Bool)

(assert (=> mapIsEmpty!58594 mapRes!58594))

(declare-fun b!1544752 () Bool)

(declare-fun res!1059515 () Bool)

(assert (=> b!1544752 (=> (not res!1059515) (not e!859817))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544752 (= res!1059515 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50252 _keys!618))))))

(declare-fun bm!69072 () Bool)

(declare-datatypes ((tuple2!24542 0))(
  ( (tuple2!24543 (_1!12282 (_ BitVec 64)) (_2!12282 V!59013)) )
))
(declare-datatypes ((List!36025 0))(
  ( (Nil!36022) (Cons!36021 (h!37467 tuple2!24542) (t!50711 List!36025)) )
))
(declare-datatypes ((ListLongMap!22151 0))(
  ( (ListLongMap!22152 (toList!11091 List!36025)) )
))
(declare-fun call!69076 () ListLongMap!22151)

(declare-fun call!69075 () ListLongMap!22151)

(assert (=> bm!69072 (= call!69076 call!69075)))

(declare-fun b!1544753 () Bool)

(declare-fun e!859814 () ListLongMap!22151)

(declare-fun call!69077 () ListLongMap!22151)

(assert (=> b!1544753 (= e!859814 call!69077)))

(declare-fun b!1544754 () Bool)

(declare-fun c!141469 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!665944 () Bool)

(assert (=> b!1544754 (= c!141469 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665944))))

(declare-fun e!859813 () ListLongMap!22151)

(assert (=> b!1544754 (= e!859814 e!859813)))

(declare-fun b!1544755 () Bool)

(assert (=> b!1544755 (= e!859813 call!69077)))

(declare-fun b!1544756 () Bool)

(declare-fun res!1059519 () Bool)

(declare-fun e!859818 () Bool)

(assert (=> b!1544756 (=> (not res!1059519) (not e!859818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1544756 (= res!1059519 (validKeyInArray!0 (select (arr!49700 _keys!618) from!762)))))

(declare-fun b!1544757 () Bool)

(declare-fun e!859820 () ListLongMap!22151)

(assert (=> b!1544757 (= e!859820 e!859814)))

(declare-fun c!141471 () Bool)

(assert (=> b!1544757 (= c!141471 (and (not lt!665944) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58594 () Bool)

(declare-fun tp!111206 () Bool)

(declare-fun e!859819 () Bool)

(assert (=> mapNonEmpty!58594 (= mapRes!58594 (and tp!111206 e!859819))))

(declare-fun mapValue!58594 () ValueCell!18053)

(declare-fun mapKey!58594 () (_ BitVec 32))

(declare-fun mapRest!58594 () (Array (_ BitVec 32) ValueCell!18053))

(assert (=> mapNonEmpty!58594 (= (arr!49701 _values!470) (store mapRest!58594 mapKey!58594 mapValue!58594))))

(declare-fun bm!69073 () Bool)

(declare-fun call!69078 () ListLongMap!22151)

(assert (=> bm!69073 (= call!69077 call!69078)))

(declare-fun bm!69074 () Bool)

(declare-fun zeroValue!436 () V!59013)

(declare-fun c!141470 () Bool)

(declare-fun minValue!436 () V!59013)

(declare-fun call!69079 () ListLongMap!22151)

(declare-fun +!4922 (ListLongMap!22151 tuple2!24542) ListLongMap!22151)

(assert (=> bm!69074 (= call!69078 (+!4922 (ite c!141470 call!69075 (ite c!141471 call!69076 call!69079)) (ite (or c!141470 c!141471) (tuple2!24543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544758 () Bool)

(assert (=> b!1544758 (= e!859817 e!859818)))

(declare-fun res!1059517 () Bool)

(assert (=> b!1544758 (=> (not res!1059517) (not e!859818))))

(assert (=> b!1544758 (= res!1059517 (bvslt from!762 (size!50252 _keys!618)))))

(declare-fun lt!665942 () ListLongMap!22151)

(assert (=> b!1544758 (= lt!665942 e!859820)))

(assert (=> b!1544758 (= c!141470 (and (not lt!665944) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544758 (= lt!665944 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69075 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6552 (array!102994 array!102996 (_ BitVec 32) (_ BitVec 32) V!59013 V!59013 (_ BitVec 32) Int) ListLongMap!22151)

(assert (=> bm!69075 (= call!69075 (getCurrentListMapNoExtraKeys!6552 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544759 () Bool)

(declare-fun e!859821 () Bool)

(assert (=> b!1544759 (= e!859815 (and e!859821 mapRes!58594))))

(declare-fun condMapEmpty!58594 () Bool)

(declare-fun mapDefault!58594 () ValueCell!18053)

(assert (=> b!1544759 (= condMapEmpty!58594 (= (arr!49701 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18053)) mapDefault!58594)))))

(declare-fun b!1544760 () Bool)

(assert (=> b!1544760 (= e!859818 false)))

(declare-fun lt!665943 () Bool)

(declare-fun contains!9988 (ListLongMap!22151 (_ BitVec 64)) Bool)

(assert (=> b!1544760 (= lt!665943 (contains!9988 (getCurrentListMapNoExtraKeys!6552 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49700 _keys!618) from!762)))))

(declare-fun bm!69076 () Bool)

(assert (=> bm!69076 (= call!69079 call!69076)))

(declare-fun b!1544761 () Bool)

(assert (=> b!1544761 (= e!859813 call!69079)))

(declare-fun b!1544762 () Bool)

(assert (=> b!1544762 (= e!859821 tp_is_empty!37927)))

(declare-fun b!1544763 () Bool)

(declare-fun res!1059516 () Bool)

(assert (=> b!1544763 (=> (not res!1059516) (not e!859817))))

(declare-datatypes ((List!36026 0))(
  ( (Nil!36023) (Cons!36022 (h!37468 (_ BitVec 64)) (t!50712 List!36026)) )
))
(declare-fun arrayNoDuplicates!0 (array!102994 (_ BitVec 32) List!36026) Bool)

(assert (=> b!1544763 (= res!1059516 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36023))))

(declare-fun b!1544764 () Bool)

(declare-fun res!1059514 () Bool)

(assert (=> b!1544764 (=> (not res!1059514) (not e!859817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102994 (_ BitVec 32)) Bool)

(assert (=> b!1544764 (= res!1059514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544765 () Bool)

(assert (=> b!1544765 (= e!859820 (+!4922 call!69078 (tuple2!24543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544766 () Bool)

(declare-fun res!1059513 () Bool)

(assert (=> b!1544766 (=> (not res!1059513) (not e!859817))))

(assert (=> b!1544766 (= res!1059513 (and (= (size!50253 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50252 _keys!618) (size!50253 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544767 () Bool)

(assert (=> b!1544767 (= e!859819 tp_is_empty!37927)))

(assert (= (and start!131888 res!1059518) b!1544766))

(assert (= (and b!1544766 res!1059513) b!1544764))

(assert (= (and b!1544764 res!1059514) b!1544763))

(assert (= (and b!1544763 res!1059516) b!1544752))

(assert (= (and b!1544752 res!1059515) b!1544758))

(assert (= (and b!1544758 c!141470) b!1544765))

(assert (= (and b!1544758 (not c!141470)) b!1544757))

(assert (= (and b!1544757 c!141471) b!1544753))

(assert (= (and b!1544757 (not c!141471)) b!1544754))

(assert (= (and b!1544754 c!141469) b!1544755))

(assert (= (and b!1544754 (not c!141469)) b!1544761))

(assert (= (or b!1544755 b!1544761) bm!69076))

(assert (= (or b!1544753 bm!69076) bm!69072))

(assert (= (or b!1544753 b!1544755) bm!69073))

(assert (= (or b!1544765 bm!69072) bm!69075))

(assert (= (or b!1544765 bm!69073) bm!69074))

(assert (= (and b!1544758 res!1059517) b!1544756))

(assert (= (and b!1544756 res!1059519) b!1544760))

(assert (= (and b!1544759 condMapEmpty!58594) mapIsEmpty!58594))

(assert (= (and b!1544759 (not condMapEmpty!58594)) mapNonEmpty!58594))

(get-info :version)

(assert (= (and mapNonEmpty!58594 ((_ is ValueCellFull!18053) mapValue!58594)) b!1544767))

(assert (= (and b!1544759 ((_ is ValueCellFull!18053) mapDefault!58594)) b!1544762))

(assert (= start!131888 b!1544759))

(declare-fun m!1424655 () Bool)

(assert (=> b!1544764 m!1424655))

(declare-fun m!1424657 () Bool)

(assert (=> b!1544765 m!1424657))

(declare-fun m!1424659 () Bool)

(assert (=> b!1544756 m!1424659))

(assert (=> b!1544756 m!1424659))

(declare-fun m!1424661 () Bool)

(assert (=> b!1544756 m!1424661))

(declare-fun m!1424663 () Bool)

(assert (=> start!131888 m!1424663))

(declare-fun m!1424665 () Bool)

(assert (=> start!131888 m!1424665))

(declare-fun m!1424667 () Bool)

(assert (=> start!131888 m!1424667))

(declare-fun m!1424669 () Bool)

(assert (=> bm!69075 m!1424669))

(declare-fun m!1424671 () Bool)

(assert (=> mapNonEmpty!58594 m!1424671))

(assert (=> b!1544760 m!1424669))

(assert (=> b!1544760 m!1424659))

(assert (=> b!1544760 m!1424669))

(assert (=> b!1544760 m!1424659))

(declare-fun m!1424673 () Bool)

(assert (=> b!1544760 m!1424673))

(declare-fun m!1424675 () Bool)

(assert (=> b!1544763 m!1424675))

(declare-fun m!1424677 () Bool)

(assert (=> bm!69074 m!1424677))

(check-sat tp_is_empty!37927 (not bm!69075) (not b!1544764) (not mapNonEmpty!58594) (not start!131888) (not bm!69074) (not b!1544760) (not b_next!31651) (not b!1544756) (not b!1544765) b_and!51043 (not b!1544763))
(check-sat b_and!51043 (not b_next!31651))
