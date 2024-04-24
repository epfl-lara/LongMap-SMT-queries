; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109122 () Bool)

(assert start!109122)

(declare-fun b_free!28411 () Bool)

(declare-fun b_next!28411 () Bool)

(assert (=> start!109122 (= b_free!28411 (not b_next!28411))))

(declare-fun tp!100348 () Bool)

(declare-fun b_and!46485 () Bool)

(assert (=> start!109122 (= tp!100348 b_and!46485)))

(declare-datatypes ((V!50505 0))(
  ( (V!50506 (val!17100 Int)) )
))
(declare-fun zeroValue!1387 () V!50505)

(declare-fun bm!62960 () Bool)

(declare-datatypes ((tuple2!21946 0))(
  ( (tuple2!21947 (_1!10984 (_ BitVec 64)) (_2!10984 V!50505)) )
))
(declare-datatypes ((List!29144 0))(
  ( (Nil!29141) (Cons!29140 (h!30358 tuple2!21946) (t!42688 List!29144)) )
))
(declare-datatypes ((ListLongMap!19611 0))(
  ( (ListLongMap!19612 (toList!9821 List!29144)) )
))
(declare-fun lt!577702 () ListLongMap!19611)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun c!124563 () Bool)

(declare-datatypes ((Unit!42484 0))(
  ( (Unit!42485) )
))
(declare-fun call!62964 () Unit!42484)

(declare-fun minValue!1387 () V!50505)

(declare-fun c!124564 () Bool)

(declare-fun lt!577696 () ListLongMap!19611)

(declare-fun lt!577698 () ListLongMap!19611)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!28 ((_ BitVec 64) (_ BitVec 64) V!50505 ListLongMap!19611) Unit!42484)

(assert (=> bm!62960 (= call!62964 (lemmaInListMapAfterAddingDiffThenInBefore!28 k0!1205 (ite c!124564 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124563 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124564 minValue!1387 (ite c!124563 zeroValue!1387 minValue!1387)) (ite c!124564 lt!577702 (ite c!124563 lt!577698 lt!577696))))))

(declare-fun b!1287664 () Bool)

(declare-fun res!855013 () Bool)

(declare-fun e!735566 () Bool)

(assert (=> b!1287664 (=> (not res!855013) (not e!735566))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16127 0))(
  ( (ValueCellFull!16127 (v!19697 V!50505)) (EmptyCell!16127) )
))
(declare-datatypes ((array!85187 0))(
  ( (array!85188 (arr!41091 (Array (_ BitVec 32) ValueCell!16127)) (size!41642 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85187)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85189 0))(
  ( (array!85190 (arr!41092 (Array (_ BitVec 32) (_ BitVec 64))) (size!41643 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85189)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun contains!7952 (ListLongMap!19611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4882 (array!85189 array!85187 (_ BitVec 32) (_ BitVec 32) V!50505 V!50505 (_ BitVec 32) Int) ListLongMap!19611)

(assert (=> b!1287664 (= res!855013 (contains!7952 (getCurrentListMap!4882 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun call!62966 () Bool)

(declare-fun bm!62961 () Bool)

(assert (=> bm!62961 (= call!62966 (contains!7952 (ite c!124564 lt!577702 (ite c!124563 lt!577698 lt!577696)) k0!1205))))

(declare-fun b!1287665 () Bool)

(declare-fun res!855012 () Bool)

(assert (=> b!1287665 (=> (not res!855012) (not e!735566))))

(declare-datatypes ((List!29145 0))(
  ( (Nil!29142) (Cons!29141 (h!30359 (_ BitVec 64)) (t!42689 List!29145)) )
))
(declare-fun arrayNoDuplicates!0 (array!85189 (_ BitVec 32) List!29145) Bool)

(assert (=> b!1287665 (= res!855012 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29142))))

(declare-fun mapIsEmpty!52634 () Bool)

(declare-fun mapRes!52634 () Bool)

(assert (=> mapIsEmpty!52634 mapRes!52634))

(declare-fun res!855016 () Bool)

(assert (=> start!109122 (=> (not res!855016) (not e!735566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109122 (= res!855016 (validMask!0 mask!2175))))

(assert (=> start!109122 e!735566))

(declare-fun tp_is_empty!34051 () Bool)

(assert (=> start!109122 tp_is_empty!34051))

(assert (=> start!109122 true))

(declare-fun e!735565 () Bool)

(declare-fun array_inv!31371 (array!85187) Bool)

(assert (=> start!109122 (and (array_inv!31371 _values!1445) e!735565)))

(declare-fun array_inv!31372 (array!85189) Bool)

(assert (=> start!109122 (array_inv!31372 _keys!1741)))

(assert (=> start!109122 tp!100348))

(declare-fun bm!62962 () Bool)

(declare-fun call!62968 () Bool)

(assert (=> bm!62962 (= call!62968 call!62966)))

(declare-fun b!1287666 () Bool)

(declare-fun res!855014 () Bool)

(assert (=> b!1287666 (=> (not res!855014) (not e!735566))))

(assert (=> b!1287666 (= res!855014 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41643 _keys!1741))))))

(declare-fun bm!62963 () Bool)

(declare-fun call!62963 () ListLongMap!19611)

(declare-fun getCurrentListMapNoExtraKeys!5992 (array!85189 array!85187 (_ BitVec 32) (_ BitVec 32) V!50505 V!50505 (_ BitVec 32) Int) ListLongMap!19611)

(assert (=> bm!62963 (= call!62963 (getCurrentListMapNoExtraKeys!5992 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1287667 () Bool)

(declare-fun e!735564 () Unit!42484)

(declare-fun lt!577700 () Unit!42484)

(assert (=> b!1287667 (= e!735564 lt!577700)))

(declare-fun lt!577692 () ListLongMap!19611)

(assert (=> b!1287667 (= lt!577692 call!62963)))

(declare-fun +!4359 (ListLongMap!19611 tuple2!21946) ListLongMap!19611)

(assert (=> b!1287667 (= lt!577702 (+!4359 lt!577692 (tuple2!21947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577697 () Unit!42484)

(assert (=> b!1287667 (= lt!577697 call!62964)))

(assert (=> b!1287667 call!62966))

(assert (=> b!1287667 (= lt!577700 (lemmaInListMapAfterAddingDiffThenInBefore!28 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577692))))

(assert (=> b!1287667 (contains!7952 lt!577692 k0!1205)))

(declare-fun b!1287668 () Bool)

(declare-fun e!735567 () Bool)

(assert (=> b!1287668 (= e!735567 true)))

(declare-fun lt!577691 () V!50505)

(assert (=> b!1287668 (not (contains!7952 (+!4359 (ListLongMap!19612 Nil!29141) (tuple2!21947 (select (arr!41092 _keys!1741) from!2144) lt!577691)) k0!1205))))

(declare-fun lt!577693 () Unit!42484)

(declare-fun addStillNotContains!339 (ListLongMap!19611 (_ BitVec 64) V!50505 (_ BitVec 64)) Unit!42484)

(assert (=> b!1287668 (= lt!577693 (addStillNotContains!339 (ListLongMap!19612 Nil!29141) (select (arr!41092 _keys!1741) from!2144) lt!577691 k0!1205))))

(declare-fun get!20907 (ValueCell!16127 V!50505) V!50505)

(declare-fun dynLambda!3474 (Int (_ BitVec 64)) V!50505)

(assert (=> b!1287668 (= lt!577691 (get!20907 (select (arr!41091 _values!1445) from!2144) (dynLambda!3474 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1287669 () Bool)

(declare-fun res!855015 () Bool)

(assert (=> b!1287669 (=> (not res!855015) (not e!735566))))

(assert (=> b!1287669 (= res!855015 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41643 _keys!1741))))))

(declare-fun b!1287670 () Bool)

(assert (=> b!1287670 call!62968))

(declare-fun lt!577695 () Unit!42484)

(declare-fun call!62967 () Unit!42484)

(assert (=> b!1287670 (= lt!577695 call!62967)))

(declare-fun call!62965 () ListLongMap!19611)

(assert (=> b!1287670 (= lt!577698 call!62965)))

(declare-fun e!735561 () Unit!42484)

(assert (=> b!1287670 (= e!735561 lt!577695)))

(declare-fun b!1287671 () Bool)

(declare-fun res!855018 () Bool)

(assert (=> b!1287671 (=> (not res!855018) (not e!735566))))

(assert (=> b!1287671 (= res!855018 (and (= (size!41642 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41643 _keys!1741) (size!41642 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287672 () Bool)

(declare-fun e!735563 () Bool)

(assert (=> b!1287672 (= e!735563 tp_is_empty!34051)))

(declare-fun b!1287673 () Bool)

(declare-fun e!735562 () Unit!42484)

(declare-fun lt!577701 () Unit!42484)

(assert (=> b!1287673 (= e!735562 lt!577701)))

(assert (=> b!1287673 (= lt!577696 call!62965)))

(assert (=> b!1287673 (= lt!577701 call!62967)))

(assert (=> b!1287673 call!62968))

(declare-fun b!1287674 () Bool)

(assert (=> b!1287674 (= e!735565 (and e!735563 mapRes!52634))))

(declare-fun condMapEmpty!52634 () Bool)

(declare-fun mapDefault!52634 () ValueCell!16127)

(assert (=> b!1287674 (= condMapEmpty!52634 (= (arr!41091 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16127)) mapDefault!52634)))))

(declare-fun b!1287675 () Bool)

(declare-fun res!855017 () Bool)

(assert (=> b!1287675 (=> (not res!855017) (not e!735566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85189 (_ BitVec 32)) Bool)

(assert (=> b!1287675 (= res!855017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287676 () Bool)

(declare-fun res!855011 () Bool)

(assert (=> b!1287676 (=> (not res!855011) (not e!735566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287676 (= res!855011 (validKeyInArray!0 (select (arr!41092 _keys!1741) from!2144)))))

(declare-fun bm!62964 () Bool)

(assert (=> bm!62964 (= call!62965 call!62963)))

(declare-fun b!1287677 () Bool)

(declare-fun e!735560 () Bool)

(assert (=> b!1287677 (= e!735560 tp_is_empty!34051)))

(declare-fun b!1287678 () Bool)

(assert (=> b!1287678 (= e!735564 e!735561)))

(declare-fun lt!577694 () Bool)

(assert (=> b!1287678 (= c!124563 (and (not lt!577694) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287679 () Bool)

(declare-fun Unit!42486 () Unit!42484)

(assert (=> b!1287679 (= e!735562 Unit!42486)))

(declare-fun b!1287680 () Bool)

(assert (=> b!1287680 (= e!735566 (not e!735567))))

(declare-fun res!855019 () Bool)

(assert (=> b!1287680 (=> res!855019 e!735567)))

(assert (=> b!1287680 (= res!855019 (= k0!1205 (select (arr!41092 _keys!1741) from!2144)))))

(assert (=> b!1287680 (not (contains!7952 (ListLongMap!19612 Nil!29141) k0!1205))))

(declare-fun lt!577703 () Unit!42484)

(declare-fun emptyContainsNothing!4 ((_ BitVec 64)) Unit!42484)

(assert (=> b!1287680 (= lt!577703 (emptyContainsNothing!4 k0!1205))))

(declare-fun lt!577699 () Unit!42484)

(assert (=> b!1287680 (= lt!577699 e!735564)))

(assert (=> b!1287680 (= c!124564 (and (not lt!577694) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287680 (= lt!577694 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!62965 () Bool)

(assert (=> bm!62965 (= call!62967 call!62964)))

(declare-fun b!1287681 () Bool)

(declare-fun c!124565 () Bool)

(assert (=> b!1287681 (= c!124565 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577694))))

(assert (=> b!1287681 (= e!735561 e!735562)))

(declare-fun mapNonEmpty!52634 () Bool)

(declare-fun tp!100349 () Bool)

(assert (=> mapNonEmpty!52634 (= mapRes!52634 (and tp!100349 e!735560))))

(declare-fun mapKey!52634 () (_ BitVec 32))

(declare-fun mapValue!52634 () ValueCell!16127)

(declare-fun mapRest!52634 () (Array (_ BitVec 32) ValueCell!16127))

(assert (=> mapNonEmpty!52634 (= (arr!41091 _values!1445) (store mapRest!52634 mapKey!52634 mapValue!52634))))

(assert (= (and start!109122 res!855016) b!1287671))

(assert (= (and b!1287671 res!855018) b!1287675))

(assert (= (and b!1287675 res!855017) b!1287665))

(assert (= (and b!1287665 res!855012) b!1287669))

(assert (= (and b!1287669 res!855015) b!1287664))

(assert (= (and b!1287664 res!855013) b!1287666))

(assert (= (and b!1287666 res!855014) b!1287676))

(assert (= (and b!1287676 res!855011) b!1287680))

(assert (= (and b!1287680 c!124564) b!1287667))

(assert (= (and b!1287680 (not c!124564)) b!1287678))

(assert (= (and b!1287678 c!124563) b!1287670))

(assert (= (and b!1287678 (not c!124563)) b!1287681))

(assert (= (and b!1287681 c!124565) b!1287673))

(assert (= (and b!1287681 (not c!124565)) b!1287679))

(assert (= (or b!1287670 b!1287673) bm!62964))

(assert (= (or b!1287670 b!1287673) bm!62965))

(assert (= (or b!1287670 b!1287673) bm!62962))

(assert (= (or b!1287667 bm!62964) bm!62963))

(assert (= (or b!1287667 bm!62965) bm!62960))

(assert (= (or b!1287667 bm!62962) bm!62961))

(assert (= (and b!1287680 (not res!855019)) b!1287668))

(assert (= (and b!1287674 condMapEmpty!52634) mapIsEmpty!52634))

(assert (= (and b!1287674 (not condMapEmpty!52634)) mapNonEmpty!52634))

(get-info :version)

(assert (= (and mapNonEmpty!52634 ((_ is ValueCellFull!16127) mapValue!52634)) b!1287677))

(assert (= (and b!1287674 ((_ is ValueCellFull!16127) mapDefault!52634)) b!1287672))

(assert (= start!109122 b!1287674))

(declare-fun b_lambda!23107 () Bool)

(assert (=> (not b_lambda!23107) (not b!1287668)))

(declare-fun t!42687 () Bool)

(declare-fun tb!11347 () Bool)

(assert (=> (and start!109122 (= defaultEntry!1448 defaultEntry!1448) t!42687) tb!11347))

(declare-fun result!23701 () Bool)

(assert (=> tb!11347 (= result!23701 tp_is_empty!34051)))

(assert (=> b!1287668 t!42687))

(declare-fun b_and!46487 () Bool)

(assert (= b_and!46485 (and (=> t!42687 result!23701) b_and!46487)))

(declare-fun m!1181053 () Bool)

(assert (=> bm!62960 m!1181053))

(declare-fun m!1181055 () Bool)

(assert (=> b!1287668 m!1181055))

(declare-fun m!1181057 () Bool)

(assert (=> b!1287668 m!1181057))

(declare-fun m!1181059 () Bool)

(assert (=> b!1287668 m!1181059))

(declare-fun m!1181061 () Bool)

(assert (=> b!1287668 m!1181061))

(declare-fun m!1181063 () Bool)

(assert (=> b!1287668 m!1181063))

(declare-fun m!1181065 () Bool)

(assert (=> b!1287668 m!1181065))

(assert (=> b!1287668 m!1181059))

(assert (=> b!1287668 m!1181057))

(assert (=> b!1287668 m!1181055))

(declare-fun m!1181067 () Bool)

(assert (=> b!1287668 m!1181067))

(assert (=> b!1287668 m!1181063))

(declare-fun m!1181069 () Bool)

(assert (=> b!1287675 m!1181069))

(assert (=> b!1287676 m!1181063))

(assert (=> b!1287676 m!1181063))

(declare-fun m!1181071 () Bool)

(assert (=> b!1287676 m!1181071))

(declare-fun m!1181073 () Bool)

(assert (=> bm!62963 m!1181073))

(declare-fun m!1181075 () Bool)

(assert (=> b!1287665 m!1181075))

(declare-fun m!1181077 () Bool)

(assert (=> bm!62961 m!1181077))

(declare-fun m!1181079 () Bool)

(assert (=> mapNonEmpty!52634 m!1181079))

(declare-fun m!1181081 () Bool)

(assert (=> b!1287667 m!1181081))

(declare-fun m!1181083 () Bool)

(assert (=> b!1287667 m!1181083))

(declare-fun m!1181085 () Bool)

(assert (=> b!1287667 m!1181085))

(assert (=> b!1287680 m!1181063))

(declare-fun m!1181087 () Bool)

(assert (=> b!1287680 m!1181087))

(declare-fun m!1181089 () Bool)

(assert (=> b!1287680 m!1181089))

(declare-fun m!1181091 () Bool)

(assert (=> start!109122 m!1181091))

(declare-fun m!1181093 () Bool)

(assert (=> start!109122 m!1181093))

(declare-fun m!1181095 () Bool)

(assert (=> start!109122 m!1181095))

(declare-fun m!1181097 () Bool)

(assert (=> b!1287664 m!1181097))

(assert (=> b!1287664 m!1181097))

(declare-fun m!1181099 () Bool)

(assert (=> b!1287664 m!1181099))

(check-sat (not b!1287676) b_and!46487 (not b_lambda!23107) (not b!1287667) (not b_next!28411) (not mapNonEmpty!52634) (not start!109122) (not b!1287664) (not b!1287665) (not b!1287680) (not bm!62963) tp_is_empty!34051 (not b!1287668) (not bm!62960) (not b!1287675) (not bm!62961))
(check-sat b_and!46487 (not b_next!28411))
