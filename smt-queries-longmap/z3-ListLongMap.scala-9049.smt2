; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109080 () Bool)

(assert start!109080)

(declare-fun b_free!28569 () Bool)

(declare-fun b_next!28569 () Bool)

(assert (=> start!109080 (= b_free!28569 (not b_next!28569))))

(declare-fun tp!100826 () Bool)

(declare-fun b_and!46659 () Bool)

(assert (=> start!109080 (= tp!100826 b_and!46659)))

(declare-fun mapNonEmpty!52874 () Bool)

(declare-fun mapRes!52874 () Bool)

(declare-fun tp!100825 () Bool)

(declare-fun e!736262 () Bool)

(assert (=> mapNonEmpty!52874 (= mapRes!52874 (and tp!100825 e!736262))))

(declare-fun mapKey!52874 () (_ BitVec 32))

(declare-datatypes ((V!50715 0))(
  ( (V!50716 (val!17179 Int)) )
))
(declare-datatypes ((ValueCell!16206 0))(
  ( (ValueCellFull!16206 (v!19782 V!50715)) (EmptyCell!16206) )
))
(declare-fun mapRest!52874 () (Array (_ BitVec 32) ValueCell!16206))

(declare-fun mapValue!52874 () ValueCell!16206)

(declare-datatypes ((array!85460 0))(
  ( (array!85461 (arr!41231 (Array (_ BitVec 32) ValueCell!16206)) (size!41781 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85460)

(assert (=> mapNonEmpty!52874 (= (arr!41231 _values!1445) (store mapRest!52874 mapKey!52874 mapValue!52874))))

(declare-fun b!1289525 () Bool)

(declare-fun res!856582 () Bool)

(declare-fun e!736261 () Bool)

(assert (=> b!1289525 (=> (not res!856582) (not e!736261))))

(declare-datatypes ((array!85462 0))(
  ( (array!85463 (arr!41232 (Array (_ BitVec 32) (_ BitVec 64))) (size!41782 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85462)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85462 (_ BitVec 32)) Bool)

(assert (=> b!1289525 (= res!856582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289526 () Bool)

(declare-fun res!856589 () Bool)

(assert (=> b!1289526 (=> (not res!856589) (not e!736261))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289526 (= res!856589 (and (= (size!41781 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41782 _keys!1741) (size!41781 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289527 () Bool)

(declare-fun e!736259 () Bool)

(declare-fun tp_is_empty!34209 () Bool)

(assert (=> b!1289527 (= e!736259 tp_is_empty!34209)))

(declare-fun b!1289528 () Bool)

(assert (=> b!1289528 (= e!736262 tp_is_empty!34209)))

(declare-fun b!1289529 () Bool)

(declare-fun res!856586 () Bool)

(assert (=> b!1289529 (=> (not res!856586) (not e!736261))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1289529 (= res!856586 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41782 _keys!1741))))))

(declare-fun mapIsEmpty!52874 () Bool)

(assert (=> mapIsEmpty!52874 mapRes!52874))

(declare-fun b!1289531 () Bool)

(declare-fun res!856590 () Bool)

(assert (=> b!1289531 (=> (not res!856590) (not e!736261))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1289531 (= res!856590 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41782 _keys!1741))))))

(declare-fun b!1289532 () Bool)

(declare-fun res!856583 () Bool)

(assert (=> b!1289532 (=> (not res!856583) (not e!736261))))

(declare-datatypes ((List!29234 0))(
  ( (Nil!29231) (Cons!29230 (h!30439 (_ BitVec 64)) (t!42798 List!29234)) )
))
(declare-fun arrayNoDuplicates!0 (array!85462 (_ BitVec 32) List!29234) Bool)

(assert (=> b!1289532 (= res!856583 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29231))))

(declare-fun b!1289533 () Bool)

(declare-fun e!736257 () Bool)

(assert (=> b!1289533 (= e!736257 (and e!736259 mapRes!52874))))

(declare-fun condMapEmpty!52874 () Bool)

(declare-fun mapDefault!52874 () ValueCell!16206)

(assert (=> b!1289533 (= condMapEmpty!52874 (= (arr!41231 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16206)) mapDefault!52874)))))

(declare-fun b!1289534 () Bool)

(declare-fun e!736260 () Bool)

(assert (=> b!1289534 (= e!736260 true)))

(declare-datatypes ((tuple2!22066 0))(
  ( (tuple2!22067 (_1!11044 (_ BitVec 64)) (_2!11044 V!50715)) )
))
(declare-datatypes ((List!29235 0))(
  ( (Nil!29232) (Cons!29231 (h!30440 tuple2!22066) (t!42799 List!29235)) )
))
(declare-datatypes ((ListLongMap!19723 0))(
  ( (ListLongMap!19724 (toList!9877 List!29235)) )
))
(declare-fun lt!578286 () ListLongMap!19723)

(declare-fun minValue!1387 () V!50715)

(declare-fun contains!7995 (ListLongMap!19723 (_ BitVec 64)) Bool)

(declare-fun +!4349 (ListLongMap!19723 tuple2!22066) ListLongMap!19723)

(assert (=> b!1289534 (not (contains!7995 (+!4349 lt!578286 (tuple2!22067 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42672 0))(
  ( (Unit!42673) )
))
(declare-fun lt!578285 () Unit!42672)

(declare-fun addStillNotContains!367 (ListLongMap!19723 (_ BitVec 64) V!50715 (_ BitVec 64)) Unit!42672)

(assert (=> b!1289534 (= lt!578285 (addStillNotContains!367 lt!578286 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50715)

(assert (=> b!1289534 (not (contains!7995 (+!4349 lt!578286 (tuple2!22067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578288 () Unit!42672)

(assert (=> b!1289534 (= lt!578288 (addStillNotContains!367 lt!578286 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5980 (array!85462 array!85460 (_ BitVec 32) (_ BitVec 32) V!50715 V!50715 (_ BitVec 32) Int) ListLongMap!19723)

(assert (=> b!1289534 (= lt!578286 (getCurrentListMapNoExtraKeys!5980 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289530 () Bool)

(declare-fun res!856587 () Bool)

(assert (=> b!1289530 (=> (not res!856587) (not e!736261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289530 (= res!856587 (not (validKeyInArray!0 (select (arr!41232 _keys!1741) from!2144))))))

(declare-fun res!856588 () Bool)

(assert (=> start!109080 (=> (not res!856588) (not e!736261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109080 (= res!856588 (validMask!0 mask!2175))))

(assert (=> start!109080 e!736261))

(assert (=> start!109080 tp_is_empty!34209))

(assert (=> start!109080 true))

(declare-fun array_inv!31253 (array!85460) Bool)

(assert (=> start!109080 (and (array_inv!31253 _values!1445) e!736257)))

(declare-fun array_inv!31254 (array!85462) Bool)

(assert (=> start!109080 (array_inv!31254 _keys!1741)))

(assert (=> start!109080 tp!100826))

(declare-fun b!1289535 () Bool)

(declare-fun res!856584 () Bool)

(assert (=> b!1289535 (=> (not res!856584) (not e!736261))))

(declare-fun getCurrentListMap!4937 (array!85462 array!85460 (_ BitVec 32) (_ BitVec 32) V!50715 V!50715 (_ BitVec 32) Int) ListLongMap!19723)

(assert (=> b!1289535 (= res!856584 (contains!7995 (getCurrentListMap!4937 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289536 () Bool)

(assert (=> b!1289536 (= e!736261 (not e!736260))))

(declare-fun res!856585 () Bool)

(assert (=> b!1289536 (=> res!856585 e!736260)))

(assert (=> b!1289536 (= res!856585 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289536 (not (contains!7995 (ListLongMap!19724 Nil!29232) k0!1205))))

(declare-fun lt!578287 () Unit!42672)

(declare-fun emptyContainsNothing!64 ((_ BitVec 64)) Unit!42672)

(assert (=> b!1289536 (= lt!578287 (emptyContainsNothing!64 k0!1205))))

(assert (= (and start!109080 res!856588) b!1289526))

(assert (= (and b!1289526 res!856589) b!1289525))

(assert (= (and b!1289525 res!856582) b!1289532))

(assert (= (and b!1289532 res!856583) b!1289529))

(assert (= (and b!1289529 res!856586) b!1289535))

(assert (= (and b!1289535 res!856584) b!1289531))

(assert (= (and b!1289531 res!856590) b!1289530))

(assert (= (and b!1289530 res!856587) b!1289536))

(assert (= (and b!1289536 (not res!856585)) b!1289534))

(assert (= (and b!1289533 condMapEmpty!52874) mapIsEmpty!52874))

(assert (= (and b!1289533 (not condMapEmpty!52874)) mapNonEmpty!52874))

(get-info :version)

(assert (= (and mapNonEmpty!52874 ((_ is ValueCellFull!16206) mapValue!52874)) b!1289528))

(assert (= (and b!1289533 ((_ is ValueCellFull!16206) mapDefault!52874)) b!1289527))

(assert (= start!109080 b!1289533))

(declare-fun m!1182049 () Bool)

(assert (=> b!1289536 m!1182049))

(declare-fun m!1182051 () Bool)

(assert (=> b!1289536 m!1182051))

(declare-fun m!1182053 () Bool)

(assert (=> start!109080 m!1182053))

(declare-fun m!1182055 () Bool)

(assert (=> start!109080 m!1182055))

(declare-fun m!1182057 () Bool)

(assert (=> start!109080 m!1182057))

(declare-fun m!1182059 () Bool)

(assert (=> b!1289532 m!1182059))

(declare-fun m!1182061 () Bool)

(assert (=> b!1289530 m!1182061))

(assert (=> b!1289530 m!1182061))

(declare-fun m!1182063 () Bool)

(assert (=> b!1289530 m!1182063))

(declare-fun m!1182065 () Bool)

(assert (=> b!1289535 m!1182065))

(assert (=> b!1289535 m!1182065))

(declare-fun m!1182067 () Bool)

(assert (=> b!1289535 m!1182067))

(declare-fun m!1182069 () Bool)

(assert (=> mapNonEmpty!52874 m!1182069))

(declare-fun m!1182071 () Bool)

(assert (=> b!1289534 m!1182071))

(assert (=> b!1289534 m!1182071))

(declare-fun m!1182073 () Bool)

(assert (=> b!1289534 m!1182073))

(declare-fun m!1182075 () Bool)

(assert (=> b!1289534 m!1182075))

(declare-fun m!1182077 () Bool)

(assert (=> b!1289534 m!1182077))

(declare-fun m!1182079 () Bool)

(assert (=> b!1289534 m!1182079))

(assert (=> b!1289534 m!1182077))

(declare-fun m!1182081 () Bool)

(assert (=> b!1289534 m!1182081))

(declare-fun m!1182083 () Bool)

(assert (=> b!1289534 m!1182083))

(declare-fun m!1182085 () Bool)

(assert (=> b!1289525 m!1182085))

(check-sat (not b!1289530) (not b!1289532) b_and!46659 (not b_next!28569) (not mapNonEmpty!52874) (not b!1289534) (not b!1289535) (not b!1289536) (not b!1289525) (not start!109080) tp_is_empty!34209)
(check-sat b_and!46659 (not b_next!28569))
