; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109128 () Bool)

(assert start!109128)

(declare-fun b_free!28617 () Bool)

(declare-fun b_next!28617 () Bool)

(assert (=> start!109128 (= b_free!28617 (not b_next!28617))))

(declare-fun tp!100970 () Bool)

(declare-fun b_and!46707 () Bool)

(assert (=> start!109128 (= tp!100970 b_and!46707)))

(declare-fun b!1290389 () Bool)

(declare-fun res!857234 () Bool)

(declare-fun e!736694 () Bool)

(assert (=> b!1290389 (=> (not res!857234) (not e!736694))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85554 0))(
  ( (array!85555 (arr!41278 (Array (_ BitVec 32) (_ BitVec 64))) (size!41828 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85554)

(assert (=> b!1290389 (= res!857234 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41828 _keys!1741))))))

(declare-fun mapIsEmpty!52946 () Bool)

(declare-fun mapRes!52946 () Bool)

(assert (=> mapIsEmpty!52946 mapRes!52946))

(declare-fun b!1290390 () Bool)

(declare-fun res!857232 () Bool)

(assert (=> b!1290390 (=> (not res!857232) (not e!736694))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50779 0))(
  ( (V!50780 (val!17203 Int)) )
))
(declare-datatypes ((ValueCell!16230 0))(
  ( (ValueCellFull!16230 (v!19806 V!50779)) (EmptyCell!16230) )
))
(declare-datatypes ((array!85556 0))(
  ( (array!85557 (arr!41279 (Array (_ BitVec 32) ValueCell!16230)) (size!41829 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85556)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290390 (= res!857232 (and (= (size!41829 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41828 _keys!1741) (size!41829 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!857237 () Bool)

(assert (=> start!109128 (=> (not res!857237) (not e!736694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109128 (= res!857237 (validMask!0 mask!2175))))

(assert (=> start!109128 e!736694))

(declare-fun tp_is_empty!34257 () Bool)

(assert (=> start!109128 tp_is_empty!34257))

(assert (=> start!109128 true))

(declare-fun e!736690 () Bool)

(declare-fun array_inv!31285 (array!85556) Bool)

(assert (=> start!109128 (and (array_inv!31285 _values!1445) e!736690)))

(declare-fun array_inv!31286 (array!85554) Bool)

(assert (=> start!109128 (array_inv!31286 _keys!1741)))

(assert (=> start!109128 tp!100970))

(declare-fun b!1290391 () Bool)

(declare-fun res!857233 () Bool)

(assert (=> b!1290391 (=> (not res!857233) (not e!736694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290391 (= res!857233 (not (validKeyInArray!0 (select (arr!41278 _keys!1741) from!2144))))))

(declare-fun b!1290392 () Bool)

(declare-fun res!857238 () Bool)

(assert (=> b!1290392 (=> (not res!857238) (not e!736694))))

(declare-datatypes ((List!29271 0))(
  ( (Nil!29268) (Cons!29267 (h!30476 (_ BitVec 64)) (t!42835 List!29271)) )
))
(declare-fun arrayNoDuplicates!0 (array!85554 (_ BitVec 32) List!29271) Bool)

(assert (=> b!1290392 (= res!857238 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29268))))

(declare-fun b!1290393 () Bool)

(declare-fun e!736693 () Bool)

(assert (=> b!1290393 (= e!736690 (and e!736693 mapRes!52946))))

(declare-fun condMapEmpty!52946 () Bool)

(declare-fun mapDefault!52946 () ValueCell!16230)

(assert (=> b!1290393 (= condMapEmpty!52946 (= (arr!41279 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16230)) mapDefault!52946)))))

(declare-fun b!1290394 () Bool)

(declare-fun e!736692 () Bool)

(assert (=> b!1290394 (= e!736692 tp_is_empty!34257)))

(declare-fun b!1290395 () Bool)

(declare-fun res!857235 () Bool)

(assert (=> b!1290395 (=> (not res!857235) (not e!736694))))

(declare-fun minValue!1387 () V!50779)

(declare-fun zeroValue!1387 () V!50779)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22104 0))(
  ( (tuple2!22105 (_1!11063 (_ BitVec 64)) (_2!11063 V!50779)) )
))
(declare-datatypes ((List!29272 0))(
  ( (Nil!29269) (Cons!29268 (h!30477 tuple2!22104) (t!42836 List!29272)) )
))
(declare-datatypes ((ListLongMap!19761 0))(
  ( (ListLongMap!19762 (toList!9896 List!29272)) )
))
(declare-fun contains!8014 (ListLongMap!19761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4954 (array!85554 array!85556 (_ BitVec 32) (_ BitVec 32) V!50779 V!50779 (_ BitVec 32) Int) ListLongMap!19761)

(assert (=> b!1290395 (= res!857235 (contains!8014 (getCurrentListMap!4954 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290396 () Bool)

(assert (=> b!1290396 (= e!736693 tp_is_empty!34257)))

(declare-fun b!1290397 () Bool)

(declare-fun res!857230 () Bool)

(assert (=> b!1290397 (=> (not res!857230) (not e!736694))))

(assert (=> b!1290397 (= res!857230 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41828 _keys!1741))))))

(declare-fun mapNonEmpty!52946 () Bool)

(declare-fun tp!100969 () Bool)

(assert (=> mapNonEmpty!52946 (= mapRes!52946 (and tp!100969 e!736692))))

(declare-fun mapValue!52946 () ValueCell!16230)

(declare-fun mapKey!52946 () (_ BitVec 32))

(declare-fun mapRest!52946 () (Array (_ BitVec 32) ValueCell!16230))

(assert (=> mapNonEmpty!52946 (= (arr!41279 _values!1445) (store mapRest!52946 mapKey!52946 mapValue!52946))))

(declare-fun b!1290398 () Bool)

(declare-fun e!736689 () Bool)

(assert (=> b!1290398 (= e!736694 (not e!736689))))

(declare-fun res!857231 () Bool)

(assert (=> b!1290398 (=> res!857231 e!736689)))

(assert (=> b!1290398 (= res!857231 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290398 (not (contains!8014 (ListLongMap!19762 Nil!29269) k0!1205))))

(declare-datatypes ((Unit!42706 0))(
  ( (Unit!42707) )
))
(declare-fun lt!578594 () Unit!42706)

(declare-fun emptyContainsNothing!79 ((_ BitVec 64)) Unit!42706)

(assert (=> b!1290398 (= lt!578594 (emptyContainsNothing!79 k0!1205))))

(declare-fun b!1290399 () Bool)

(assert (=> b!1290399 (= e!736689 true)))

(declare-fun lt!578591 () Bool)

(declare-fun lt!578592 () ListLongMap!19761)

(declare-fun lt!578590 () tuple2!22104)

(declare-fun +!4364 (ListLongMap!19761 tuple2!22104) ListLongMap!19761)

(assert (=> b!1290399 (= lt!578591 (contains!8014 (+!4364 lt!578592 lt!578590) k0!1205))))

(declare-fun lt!578593 () ListLongMap!19761)

(assert (=> b!1290399 (not (contains!8014 (+!4364 lt!578593 lt!578590) k0!1205))))

(assert (=> b!1290399 (= lt!578590 (tuple2!22105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!578588 () Unit!42706)

(declare-fun addStillNotContains!382 (ListLongMap!19761 (_ BitVec 64) V!50779 (_ BitVec 64)) Unit!42706)

(assert (=> b!1290399 (= lt!578588 (addStillNotContains!382 lt!578593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290399 (not (contains!8014 lt!578592 k0!1205))))

(assert (=> b!1290399 (= lt!578592 (+!4364 lt!578593 (tuple2!22105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578589 () Unit!42706)

(assert (=> b!1290399 (= lt!578589 (addStillNotContains!382 lt!578593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5995 (array!85554 array!85556 (_ BitVec 32) (_ BitVec 32) V!50779 V!50779 (_ BitVec 32) Int) ListLongMap!19761)

(assert (=> b!1290399 (= lt!578593 (getCurrentListMapNoExtraKeys!5995 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290400 () Bool)

(declare-fun res!857236 () Bool)

(assert (=> b!1290400 (=> (not res!857236) (not e!736694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85554 (_ BitVec 32)) Bool)

(assert (=> b!1290400 (= res!857236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109128 res!857237) b!1290390))

(assert (= (and b!1290390 res!857232) b!1290400))

(assert (= (and b!1290400 res!857236) b!1290392))

(assert (= (and b!1290392 res!857238) b!1290397))

(assert (= (and b!1290397 res!857230) b!1290395))

(assert (= (and b!1290395 res!857235) b!1290389))

(assert (= (and b!1290389 res!857234) b!1290391))

(assert (= (and b!1290391 res!857233) b!1290398))

(assert (= (and b!1290398 (not res!857231)) b!1290399))

(assert (= (and b!1290393 condMapEmpty!52946) mapIsEmpty!52946))

(assert (= (and b!1290393 (not condMapEmpty!52946)) mapNonEmpty!52946))

(get-info :version)

(assert (= (and mapNonEmpty!52946 ((_ is ValueCellFull!16230) mapValue!52946)) b!1290394))

(assert (= (and b!1290393 ((_ is ValueCellFull!16230) mapDefault!52946)) b!1290396))

(assert (= start!109128 b!1290393))

(declare-fun m!1182965 () Bool)

(assert (=> b!1290398 m!1182965))

(declare-fun m!1182967 () Bool)

(assert (=> b!1290398 m!1182967))

(declare-fun m!1182969 () Bool)

(assert (=> mapNonEmpty!52946 m!1182969))

(declare-fun m!1182971 () Bool)

(assert (=> b!1290395 m!1182971))

(assert (=> b!1290395 m!1182971))

(declare-fun m!1182973 () Bool)

(assert (=> b!1290395 m!1182973))

(declare-fun m!1182975 () Bool)

(assert (=> b!1290392 m!1182975))

(declare-fun m!1182977 () Bool)

(assert (=> b!1290391 m!1182977))

(assert (=> b!1290391 m!1182977))

(declare-fun m!1182979 () Bool)

(assert (=> b!1290391 m!1182979))

(declare-fun m!1182981 () Bool)

(assert (=> b!1290399 m!1182981))

(declare-fun m!1182983 () Bool)

(assert (=> b!1290399 m!1182983))

(declare-fun m!1182985 () Bool)

(assert (=> b!1290399 m!1182985))

(declare-fun m!1182987 () Bool)

(assert (=> b!1290399 m!1182987))

(declare-fun m!1182989 () Bool)

(assert (=> b!1290399 m!1182989))

(assert (=> b!1290399 m!1182985))

(declare-fun m!1182991 () Bool)

(assert (=> b!1290399 m!1182991))

(declare-fun m!1182993 () Bool)

(assert (=> b!1290399 m!1182993))

(declare-fun m!1182995 () Bool)

(assert (=> b!1290399 m!1182995))

(assert (=> b!1290399 m!1182993))

(declare-fun m!1182997 () Bool)

(assert (=> b!1290399 m!1182997))

(declare-fun m!1182999 () Bool)

(assert (=> start!109128 m!1182999))

(declare-fun m!1183001 () Bool)

(assert (=> start!109128 m!1183001))

(declare-fun m!1183003 () Bool)

(assert (=> start!109128 m!1183003))

(declare-fun m!1183005 () Bool)

(assert (=> b!1290400 m!1183005))

(check-sat (not b!1290392) (not b_next!28617) (not b!1290391) (not b!1290395) b_and!46707 (not mapNonEmpty!52946) (not start!109128) tp_is_empty!34257 (not b!1290399) (not b!1290400) (not b!1290398))
(check-sat b_and!46707 (not b_next!28617))
