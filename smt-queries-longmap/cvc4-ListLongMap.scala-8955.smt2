; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108460 () Bool)

(assert start!108460)

(declare-fun b_free!28007 () Bool)

(declare-fun b_next!28007 () Bool)

(assert (=> start!108460 (= b_free!28007 (not b_next!28007))))

(declare-fun tp!99131 () Bool)

(declare-fun b_and!46067 () Bool)

(assert (=> start!108460 (= tp!99131 b_and!46067)))

(declare-fun b!1280097 () Bool)

(declare-fun res!850323 () Bool)

(declare-fun e!731416 () Bool)

(assert (=> b!1280097 (=> (not res!850323) (not e!731416))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84374 0))(
  ( (array!84375 (arr!40691 (Array (_ BitVec 32) (_ BitVec 64))) (size!41241 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84374)

(assert (=> b!1280097 (= res!850323 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41241 _keys!1741))))))

(declare-fun b!1280098 () Bool)

(declare-fun res!850321 () Bool)

(assert (=> b!1280098 (=> (not res!850321) (not e!731416))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49965 0))(
  ( (V!49966 (val!16898 Int)) )
))
(declare-datatypes ((ValueCell!15925 0))(
  ( (ValueCellFull!15925 (v!19498 V!49965)) (EmptyCell!15925) )
))
(declare-datatypes ((array!84376 0))(
  ( (array!84377 (arr!40692 (Array (_ BitVec 32) ValueCell!15925)) (size!41242 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84376)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280098 (= res!850321 (and (= (size!41242 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41241 _keys!1741) (size!41242 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52022 () Bool)

(declare-fun mapRes!52022 () Bool)

(declare-fun tp!99130 () Bool)

(declare-fun e!731417 () Bool)

(assert (=> mapNonEmpty!52022 (= mapRes!52022 (and tp!99130 e!731417))))

(declare-fun mapRest!52022 () (Array (_ BitVec 32) ValueCell!15925))

(declare-fun mapValue!52022 () ValueCell!15925)

(declare-fun mapKey!52022 () (_ BitVec 32))

(assert (=> mapNonEmpty!52022 (= (arr!40692 _values!1445) (store mapRest!52022 mapKey!52022 mapValue!52022))))

(declare-fun b!1280099 () Bool)

(declare-fun res!850325 () Bool)

(assert (=> b!1280099 (=> (not res!850325) (not e!731416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84374 (_ BitVec 32)) Bool)

(assert (=> b!1280099 (= res!850325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280101 () Bool)

(declare-fun tp_is_empty!33647 () Bool)

(assert (=> b!1280101 (= e!731417 tp_is_empty!33647)))

(declare-fun b!1280102 () Bool)

(declare-fun e!731418 () Bool)

(assert (=> b!1280102 (= e!731418 tp_is_empty!33647)))

(declare-fun mapIsEmpty!52022 () Bool)

(assert (=> mapIsEmpty!52022 mapRes!52022))

(declare-fun res!850324 () Bool)

(assert (=> start!108460 (=> (not res!850324) (not e!731416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108460 (= res!850324 (validMask!0 mask!2175))))

(assert (=> start!108460 e!731416))

(assert (=> start!108460 tp_is_empty!33647))

(assert (=> start!108460 true))

(declare-fun e!731419 () Bool)

(declare-fun array_inv!30885 (array!84376) Bool)

(assert (=> start!108460 (and (array_inv!30885 _values!1445) e!731419)))

(declare-fun array_inv!30886 (array!84374) Bool)

(assert (=> start!108460 (array_inv!30886 _keys!1741)))

(assert (=> start!108460 tp!99131))

(declare-fun b!1280100 () Bool)

(declare-fun res!850322 () Bool)

(assert (=> b!1280100 (=> (not res!850322) (not e!731416))))

(declare-datatypes ((List!28823 0))(
  ( (Nil!28820) (Cons!28819 (h!30028 (_ BitVec 64)) (t!42363 List!28823)) )
))
(declare-fun arrayNoDuplicates!0 (array!84374 (_ BitVec 32) List!28823) Bool)

(assert (=> b!1280100 (= res!850322 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28820))))

(declare-fun b!1280103 () Bool)

(assert (=> b!1280103 (= e!731416 false)))

(declare-fun minValue!1387 () V!49965)

(declare-fun zeroValue!1387 () V!49965)

(declare-fun lt!576083 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21624 0))(
  ( (tuple2!21625 (_1!10823 (_ BitVec 64)) (_2!10823 V!49965)) )
))
(declare-datatypes ((List!28824 0))(
  ( (Nil!28821) (Cons!28820 (h!30029 tuple2!21624) (t!42364 List!28824)) )
))
(declare-datatypes ((ListLongMap!19281 0))(
  ( (ListLongMap!19282 (toList!9656 List!28824)) )
))
(declare-fun contains!7771 (ListLongMap!19281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4740 (array!84374 array!84376 (_ BitVec 32) (_ BitVec 32) V!49965 V!49965 (_ BitVec 32) Int) ListLongMap!19281)

(assert (=> b!1280103 (= lt!576083 (contains!7771 (getCurrentListMap!4740 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280104 () Bool)

(assert (=> b!1280104 (= e!731419 (and e!731418 mapRes!52022))))

(declare-fun condMapEmpty!52022 () Bool)

(declare-fun mapDefault!52022 () ValueCell!15925)

