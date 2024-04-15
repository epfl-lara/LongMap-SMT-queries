; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109132 () Bool)

(assert start!109132)

(declare-fun b_free!28621 () Bool)

(declare-fun b_next!28621 () Bool)

(assert (=> start!109132 (= b_free!28621 (not b_next!28621))))

(declare-fun tp!100982 () Bool)

(declare-fun b_and!46693 () Bool)

(assert (=> start!109132 (= tp!100982 b_and!46693)))

(declare-fun b!1290397 () Bool)

(declare-fun e!736699 () Bool)

(declare-fun e!736701 () Bool)

(assert (=> b!1290397 (= e!736699 (not e!736701))))

(declare-fun res!857258 () Bool)

(assert (=> b!1290397 (=> res!857258 e!736701)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290397 (= res!857258 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50785 0))(
  ( (V!50786 (val!17205 Int)) )
))
(declare-datatypes ((tuple2!22160 0))(
  ( (tuple2!22161 (_1!11091 (_ BitVec 64)) (_2!11091 V!50785)) )
))
(declare-datatypes ((List!29318 0))(
  ( (Nil!29315) (Cons!29314 (h!30523 tuple2!22160) (t!42874 List!29318)) )
))
(declare-datatypes ((ListLongMap!19817 0))(
  ( (ListLongMap!19818 (toList!9924 List!29318)) )
))
(declare-fun contains!7972 (ListLongMap!19817 (_ BitVec 64)) Bool)

(assert (=> b!1290397 (not (contains!7972 (ListLongMap!19818 Nil!29315) k0!1205))))

(declare-datatypes ((Unit!42544 0))(
  ( (Unit!42545) )
))
(declare-fun lt!578456 () Unit!42544)

(declare-fun emptyContainsNothing!72 ((_ BitVec 64)) Unit!42544)

(assert (=> b!1290397 (= lt!578456 (emptyContainsNothing!72 k0!1205))))

(declare-fun b!1290398 () Bool)

(assert (=> b!1290398 (= e!736701 true)))

(declare-fun lt!578458 () ListLongMap!19817)

(declare-fun lt!578452 () Bool)

(declare-fun lt!578453 () tuple2!22160)

(declare-fun +!4401 (ListLongMap!19817 tuple2!22160) ListLongMap!19817)

(assert (=> b!1290398 (= lt!578452 (contains!7972 (+!4401 lt!578458 lt!578453) k0!1205))))

(declare-fun lt!578457 () ListLongMap!19817)

(assert (=> b!1290398 (not (contains!7972 (+!4401 lt!578457 lt!578453) k0!1205))))

(declare-fun minValue!1387 () V!50785)

(assert (=> b!1290398 (= lt!578453 (tuple2!22161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!578454 () Unit!42544)

(declare-fun addStillNotContains!378 (ListLongMap!19817 (_ BitVec 64) V!50785 (_ BitVec 64)) Unit!42544)

(assert (=> b!1290398 (= lt!578454 (addStillNotContains!378 lt!578457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290398 (not (contains!7972 lt!578458 k0!1205))))

(declare-fun zeroValue!1387 () V!50785)

(assert (=> b!1290398 (= lt!578458 (+!4401 lt!578457 (tuple2!22161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578455 () Unit!42544)

(assert (=> b!1290398 (= lt!578455 (addStillNotContains!378 lt!578457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16232 0))(
  ( (ValueCellFull!16232 (v!19807 V!50785)) (EmptyCell!16232) )
))
(declare-datatypes ((array!85451 0))(
  ( (array!85452 (arr!41227 (Array (_ BitVec 32) ValueCell!16232)) (size!41779 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85451)

(declare-datatypes ((array!85453 0))(
  ( (array!85454 (arr!41228 (Array (_ BitVec 32) (_ BitVec 64))) (size!41780 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85453)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6032 (array!85453 array!85451 (_ BitVec 32) (_ BitVec 32) V!50785 V!50785 (_ BitVec 32) Int) ListLongMap!19817)

(assert (=> b!1290398 (= lt!578457 (getCurrentListMapNoExtraKeys!6032 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290399 () Bool)

(declare-fun res!857262 () Bool)

(assert (=> b!1290399 (=> (not res!857262) (not e!736699))))

(assert (=> b!1290399 (= res!857262 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41780 _keys!1741))))))

(declare-fun mapNonEmpty!52952 () Bool)

(declare-fun mapRes!52952 () Bool)

(declare-fun tp!100983 () Bool)

(declare-fun e!736697 () Bool)

(assert (=> mapNonEmpty!52952 (= mapRes!52952 (and tp!100983 e!736697))))

(declare-fun mapValue!52952 () ValueCell!16232)

(declare-fun mapKey!52952 () (_ BitVec 32))

(declare-fun mapRest!52952 () (Array (_ BitVec 32) ValueCell!16232))

(assert (=> mapNonEmpty!52952 (= (arr!41227 _values!1445) (store mapRest!52952 mapKey!52952 mapValue!52952))))

(declare-fun b!1290400 () Bool)

(declare-fun tp_is_empty!34261 () Bool)

(assert (=> b!1290400 (= e!736697 tp_is_empty!34261)))

(declare-fun res!857259 () Bool)

(assert (=> start!109132 (=> (not res!857259) (not e!736699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109132 (= res!857259 (validMask!0 mask!2175))))

(assert (=> start!109132 e!736699))

(assert (=> start!109132 tp_is_empty!34261))

(assert (=> start!109132 true))

(declare-fun e!736696 () Bool)

(declare-fun array_inv!31411 (array!85451) Bool)

(assert (=> start!109132 (and (array_inv!31411 _values!1445) e!736696)))

(declare-fun array_inv!31412 (array!85453) Bool)

(assert (=> start!109132 (array_inv!31412 _keys!1741)))

(assert (=> start!109132 tp!100982))

(declare-fun b!1290401 () Bool)

(declare-fun res!857265 () Bool)

(assert (=> b!1290401 (=> (not res!857265) (not e!736699))))

(declare-fun getCurrentListMap!4873 (array!85453 array!85451 (_ BitVec 32) (_ BitVec 32) V!50785 V!50785 (_ BitVec 32) Int) ListLongMap!19817)

(assert (=> b!1290401 (= res!857265 (contains!7972 (getCurrentListMap!4873 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290402 () Bool)

(declare-fun res!857264 () Bool)

(assert (=> b!1290402 (=> (not res!857264) (not e!736699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85453 (_ BitVec 32)) Bool)

(assert (=> b!1290402 (= res!857264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290403 () Bool)

(declare-fun res!857261 () Bool)

(assert (=> b!1290403 (=> (not res!857261) (not e!736699))))

(assert (=> b!1290403 (= res!857261 (and (= (size!41779 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41780 _keys!1741) (size!41779 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290404 () Bool)

(declare-fun res!857263 () Bool)

(assert (=> b!1290404 (=> (not res!857263) (not e!736699))))

(assert (=> b!1290404 (= res!857263 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41780 _keys!1741))))))

(declare-fun b!1290405 () Bool)

(declare-fun e!736700 () Bool)

(assert (=> b!1290405 (= e!736700 tp_is_empty!34261)))

(declare-fun b!1290406 () Bool)

(declare-fun res!857260 () Bool)

(assert (=> b!1290406 (=> (not res!857260) (not e!736699))))

(declare-datatypes ((List!29319 0))(
  ( (Nil!29316) (Cons!29315 (h!30524 (_ BitVec 64)) (t!42875 List!29319)) )
))
(declare-fun arrayNoDuplicates!0 (array!85453 (_ BitVec 32) List!29319) Bool)

(assert (=> b!1290406 (= res!857260 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29316))))

(declare-fun mapIsEmpty!52952 () Bool)

(assert (=> mapIsEmpty!52952 mapRes!52952))

(declare-fun b!1290407 () Bool)

(declare-fun res!857257 () Bool)

(assert (=> b!1290407 (=> (not res!857257) (not e!736699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290407 (= res!857257 (not (validKeyInArray!0 (select (arr!41228 _keys!1741) from!2144))))))

(declare-fun b!1290408 () Bool)

(assert (=> b!1290408 (= e!736696 (and e!736700 mapRes!52952))))

(declare-fun condMapEmpty!52952 () Bool)

(declare-fun mapDefault!52952 () ValueCell!16232)

(assert (=> b!1290408 (= condMapEmpty!52952 (= (arr!41227 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16232)) mapDefault!52952)))))

(assert (= (and start!109132 res!857259) b!1290403))

(assert (= (and b!1290403 res!857261) b!1290402))

(assert (= (and b!1290402 res!857264) b!1290406))

(assert (= (and b!1290406 res!857260) b!1290404))

(assert (= (and b!1290404 res!857263) b!1290401))

(assert (= (and b!1290401 res!857265) b!1290399))

(assert (= (and b!1290399 res!857262) b!1290407))

(assert (= (and b!1290407 res!857257) b!1290397))

(assert (= (and b!1290397 (not res!857258)) b!1290398))

(assert (= (and b!1290408 condMapEmpty!52952) mapIsEmpty!52952))

(assert (= (and b!1290408 (not condMapEmpty!52952)) mapNonEmpty!52952))

(get-info :version)

(assert (= (and mapNonEmpty!52952 ((_ is ValueCellFull!16232) mapValue!52952)) b!1290400))

(assert (= (and b!1290408 ((_ is ValueCellFull!16232) mapDefault!52952)) b!1290405))

(assert (= start!109132 b!1290408))

(declare-fun m!1182549 () Bool)

(assert (=> b!1290398 m!1182549))

(declare-fun m!1182551 () Bool)

(assert (=> b!1290398 m!1182551))

(declare-fun m!1182553 () Bool)

(assert (=> b!1290398 m!1182553))

(declare-fun m!1182555 () Bool)

(assert (=> b!1290398 m!1182555))

(declare-fun m!1182557 () Bool)

(assert (=> b!1290398 m!1182557))

(declare-fun m!1182559 () Bool)

(assert (=> b!1290398 m!1182559))

(assert (=> b!1290398 m!1182549))

(declare-fun m!1182561 () Bool)

(assert (=> b!1290398 m!1182561))

(declare-fun m!1182563 () Bool)

(assert (=> b!1290398 m!1182563))

(declare-fun m!1182565 () Bool)

(assert (=> b!1290398 m!1182565))

(assert (=> b!1290398 m!1182555))

(declare-fun m!1182567 () Bool)

(assert (=> b!1290402 m!1182567))

(declare-fun m!1182569 () Bool)

(assert (=> b!1290406 m!1182569))

(declare-fun m!1182571 () Bool)

(assert (=> mapNonEmpty!52952 m!1182571))

(declare-fun m!1182573 () Bool)

(assert (=> b!1290407 m!1182573))

(assert (=> b!1290407 m!1182573))

(declare-fun m!1182575 () Bool)

(assert (=> b!1290407 m!1182575))

(declare-fun m!1182577 () Bool)

(assert (=> start!109132 m!1182577))

(declare-fun m!1182579 () Bool)

(assert (=> start!109132 m!1182579))

(declare-fun m!1182581 () Bool)

(assert (=> start!109132 m!1182581))

(declare-fun m!1182583 () Bool)

(assert (=> b!1290401 m!1182583))

(assert (=> b!1290401 m!1182583))

(declare-fun m!1182585 () Bool)

(assert (=> b!1290401 m!1182585))

(declare-fun m!1182587 () Bool)

(assert (=> b!1290397 m!1182587))

(declare-fun m!1182589 () Bool)

(assert (=> b!1290397 m!1182589))

(check-sat tp_is_empty!34261 (not b_next!28621) (not b!1290397) (not b!1290398) (not b!1290402) (not start!109132) (not mapNonEmpty!52952) (not b!1290407) (not b!1290406) (not b!1290401) b_and!46693)
(check-sat b_and!46693 (not b_next!28621))
