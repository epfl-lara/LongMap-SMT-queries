; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108982 () Bool)

(assert start!108982)

(declare-fun b_free!28471 () Bool)

(declare-fun b_next!28471 () Bool)

(assert (=> start!108982 (= b_free!28471 (not b_next!28471))))

(declare-fun tp!100532 () Bool)

(declare-fun b_and!46543 () Bool)

(assert (=> start!108982 (= tp!100532 b_and!46543)))

(declare-fun b!1287731 () Bool)

(declare-fun res!855272 () Bool)

(declare-fun e!735380 () Bool)

(assert (=> b!1287731 (=> (not res!855272) (not e!735380))))

(declare-datatypes ((array!85159 0))(
  ( (array!85160 (arr!41081 (Array (_ BitVec 32) (_ BitVec 64))) (size!41633 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85159)

(declare-datatypes ((List!29209 0))(
  ( (Nil!29206) (Cons!29205 (h!30414 (_ BitVec 64)) (t!42765 List!29209)) )
))
(declare-fun arrayNoDuplicates!0 (array!85159 (_ BitVec 32) List!29209) Bool)

(assert (=> b!1287731 (= res!855272 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29206))))

(declare-fun b!1287732 () Bool)

(assert (=> b!1287732 (= e!735380 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50585 0))(
  ( (V!50586 (val!17130 Int)) )
))
(declare-datatypes ((tuple2!22038 0))(
  ( (tuple2!22039 (_1!11030 (_ BitVec 64)) (_2!11030 V!50585)) )
))
(declare-datatypes ((List!29210 0))(
  ( (Nil!29207) (Cons!29206 (h!30415 tuple2!22038) (t!42766 List!29210)) )
))
(declare-datatypes ((ListLongMap!19695 0))(
  ( (ListLongMap!19696 (toList!9863 List!29210)) )
))
(declare-fun contains!7911 (ListLongMap!19695 (_ BitVec 64)) Bool)

(assert (=> b!1287732 (not (contains!7911 (ListLongMap!19696 Nil!29207) k0!1205))))

(declare-datatypes ((Unit!42432 0))(
  ( (Unit!42433) )
))
(declare-fun lt!577720 () Unit!42432)

(declare-fun emptyContainsNothing!23 ((_ BitVec 64)) Unit!42432)

(assert (=> b!1287732 (= lt!577720 (emptyContainsNothing!23 k0!1205))))

(declare-fun b!1287733 () Bool)

(declare-fun e!735384 () Bool)

(declare-fun tp_is_empty!34111 () Bool)

(assert (=> b!1287733 (= e!735384 tp_is_empty!34111)))

(declare-fun b!1287734 () Bool)

(declare-fun res!855273 () Bool)

(assert (=> b!1287734 (=> (not res!855273) (not e!735380))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85159 (_ BitVec 32)) Bool)

(assert (=> b!1287734 (= res!855273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287735 () Bool)

(declare-fun e!735382 () Bool)

(assert (=> b!1287735 (= e!735382 tp_is_empty!34111)))

(declare-fun res!855267 () Bool)

(assert (=> start!108982 (=> (not res!855267) (not e!735380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108982 (= res!855267 (validMask!0 mask!2175))))

(assert (=> start!108982 e!735380))

(assert (=> start!108982 tp_is_empty!34111))

(assert (=> start!108982 true))

(declare-datatypes ((ValueCell!16157 0))(
  ( (ValueCellFull!16157 (v!19732 V!50585)) (EmptyCell!16157) )
))
(declare-datatypes ((array!85161 0))(
  ( (array!85162 (arr!41082 (Array (_ BitVec 32) ValueCell!16157)) (size!41634 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85161)

(declare-fun e!735381 () Bool)

(declare-fun array_inv!31307 (array!85161) Bool)

(assert (=> start!108982 (and (array_inv!31307 _values!1445) e!735381)))

(declare-fun array_inv!31308 (array!85159) Bool)

(assert (=> start!108982 (array_inv!31308 _keys!1741)))

(assert (=> start!108982 tp!100532))

(declare-fun b!1287736 () Bool)

(declare-fun res!855271 () Bool)

(assert (=> b!1287736 (=> (not res!855271) (not e!735380))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287736 (= res!855271 (not (validKeyInArray!0 (select (arr!41081 _keys!1741) from!2144))))))

(declare-fun b!1287737 () Bool)

(declare-fun res!855270 () Bool)

(assert (=> b!1287737 (=> (not res!855270) (not e!735380))))

(declare-fun minValue!1387 () V!50585)

(declare-fun zeroValue!1387 () V!50585)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4824 (array!85159 array!85161 (_ BitVec 32) (_ BitVec 32) V!50585 V!50585 (_ BitVec 32) Int) ListLongMap!19695)

(assert (=> b!1287737 (= res!855270 (contains!7911 (getCurrentListMap!4824 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287738 () Bool)

(declare-fun res!855268 () Bool)

(assert (=> b!1287738 (=> (not res!855268) (not e!735380))))

(assert (=> b!1287738 (= res!855268 (and (= (size!41634 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41633 _keys!1741) (size!41634 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287739 () Bool)

(declare-fun res!855269 () Bool)

(assert (=> b!1287739 (=> (not res!855269) (not e!735380))))

(assert (=> b!1287739 (= res!855269 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41633 _keys!1741))))))

(declare-fun mapIsEmpty!52727 () Bool)

(declare-fun mapRes!52727 () Bool)

(assert (=> mapIsEmpty!52727 mapRes!52727))

(declare-fun mapNonEmpty!52727 () Bool)

(declare-fun tp!100533 () Bool)

(assert (=> mapNonEmpty!52727 (= mapRes!52727 (and tp!100533 e!735384))))

(declare-fun mapKey!52727 () (_ BitVec 32))

(declare-fun mapValue!52727 () ValueCell!16157)

(declare-fun mapRest!52727 () (Array (_ BitVec 32) ValueCell!16157))

(assert (=> mapNonEmpty!52727 (= (arr!41082 _values!1445) (store mapRest!52727 mapKey!52727 mapValue!52727))))

(declare-fun b!1287740 () Bool)

(assert (=> b!1287740 (= e!735381 (and e!735382 mapRes!52727))))

(declare-fun condMapEmpty!52727 () Bool)

(declare-fun mapDefault!52727 () ValueCell!16157)

(assert (=> b!1287740 (= condMapEmpty!52727 (= (arr!41082 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16157)) mapDefault!52727)))))

(declare-fun b!1287741 () Bool)

(declare-fun res!855266 () Bool)

(assert (=> b!1287741 (=> (not res!855266) (not e!735380))))

(assert (=> b!1287741 (= res!855266 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41633 _keys!1741))))))

(assert (= (and start!108982 res!855267) b!1287738))

(assert (= (and b!1287738 res!855268) b!1287734))

(assert (= (and b!1287734 res!855273) b!1287731))

(assert (= (and b!1287731 res!855272) b!1287739))

(assert (= (and b!1287739 res!855269) b!1287737))

(assert (= (and b!1287737 res!855270) b!1287741))

(assert (= (and b!1287741 res!855266) b!1287736))

(assert (= (and b!1287736 res!855271) b!1287732))

(assert (= (and b!1287740 condMapEmpty!52727) mapIsEmpty!52727))

(assert (= (and b!1287740 (not condMapEmpty!52727)) mapNonEmpty!52727))

(get-info :version)

(assert (= (and mapNonEmpty!52727 ((_ is ValueCellFull!16157) mapValue!52727)) b!1287733))

(assert (= (and b!1287740 ((_ is ValueCellFull!16157) mapDefault!52727)) b!1287735))

(assert (= start!108982 b!1287740))

(declare-fun m!1180059 () Bool)

(assert (=> b!1287737 m!1180059))

(assert (=> b!1287737 m!1180059))

(declare-fun m!1180061 () Bool)

(assert (=> b!1287737 m!1180061))

(declare-fun m!1180063 () Bool)

(assert (=> mapNonEmpty!52727 m!1180063))

(declare-fun m!1180065 () Bool)

(assert (=> b!1287736 m!1180065))

(assert (=> b!1287736 m!1180065))

(declare-fun m!1180067 () Bool)

(assert (=> b!1287736 m!1180067))

(declare-fun m!1180069 () Bool)

(assert (=> b!1287732 m!1180069))

(declare-fun m!1180071 () Bool)

(assert (=> b!1287732 m!1180071))

(declare-fun m!1180073 () Bool)

(assert (=> b!1287734 m!1180073))

(declare-fun m!1180075 () Bool)

(assert (=> b!1287731 m!1180075))

(declare-fun m!1180077 () Bool)

(assert (=> start!108982 m!1180077))

(declare-fun m!1180079 () Bool)

(assert (=> start!108982 m!1180079))

(declare-fun m!1180081 () Bool)

(assert (=> start!108982 m!1180081))

(check-sat (not b!1287736) (not b!1287734) b_and!46543 (not mapNonEmpty!52727) (not start!108982) (not b_next!28471) tp_is_empty!34111 (not b!1287732) (not b!1287737) (not b!1287731))
(check-sat b_and!46543 (not b_next!28471))
