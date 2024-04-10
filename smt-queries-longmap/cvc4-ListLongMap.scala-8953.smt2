; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108448 () Bool)

(assert start!108448)

(declare-fun b_free!27995 () Bool)

(declare-fun b_next!27995 () Bool)

(assert (=> start!108448 (= b_free!27995 (not b_next!27995))))

(declare-fun tp!99095 () Bool)

(declare-fun b_and!46055 () Bool)

(assert (=> start!108448 (= tp!99095 b_and!46055)))

(declare-fun b!1279953 () Bool)

(declare-fun e!731329 () Bool)

(declare-fun tp_is_empty!33635 () Bool)

(assert (=> b!1279953 (= e!731329 tp_is_empty!33635)))

(declare-fun res!850232 () Bool)

(declare-fun e!731326 () Bool)

(assert (=> start!108448 (=> (not res!850232) (not e!731326))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108448 (= res!850232 (validMask!0 mask!2175))))

(assert (=> start!108448 e!731326))

(assert (=> start!108448 tp_is_empty!33635))

(assert (=> start!108448 true))

(declare-datatypes ((V!49949 0))(
  ( (V!49950 (val!16892 Int)) )
))
(declare-datatypes ((ValueCell!15919 0))(
  ( (ValueCellFull!15919 (v!19492 V!49949)) (EmptyCell!15919) )
))
(declare-datatypes ((array!84352 0))(
  ( (array!84353 (arr!40680 (Array (_ BitVec 32) ValueCell!15919)) (size!41230 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84352)

(declare-fun e!731330 () Bool)

(declare-fun array_inv!30879 (array!84352) Bool)

(assert (=> start!108448 (and (array_inv!30879 _values!1445) e!731330)))

(declare-datatypes ((array!84354 0))(
  ( (array!84355 (arr!40681 (Array (_ BitVec 32) (_ BitVec 64))) (size!41231 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84354)

(declare-fun array_inv!30880 (array!84354) Bool)

(assert (=> start!108448 (array_inv!30880 _keys!1741)))

(assert (=> start!108448 tp!99095))

(declare-fun b!1279954 () Bool)

(assert (=> b!1279954 (= e!731326 false)))

(declare-fun minValue!1387 () V!49949)

(declare-fun zeroValue!1387 () V!49949)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576065 () Bool)

(declare-datatypes ((tuple2!21614 0))(
  ( (tuple2!21615 (_1!10818 (_ BitVec 64)) (_2!10818 V!49949)) )
))
(declare-datatypes ((List!28814 0))(
  ( (Nil!28811) (Cons!28810 (h!30019 tuple2!21614) (t!42354 List!28814)) )
))
(declare-datatypes ((ListLongMap!19271 0))(
  ( (ListLongMap!19272 (toList!9651 List!28814)) )
))
(declare-fun contains!7766 (ListLongMap!19271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4735 (array!84354 array!84352 (_ BitVec 32) (_ BitVec 32) V!49949 V!49949 (_ BitVec 32) Int) ListLongMap!19271)

(assert (=> b!1279954 (= lt!576065 (contains!7766 (getCurrentListMap!4735 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279955 () Bool)

(declare-fun res!850235 () Bool)

(assert (=> b!1279955 (=> (not res!850235) (not e!731326))))

(assert (=> b!1279955 (= res!850235 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41231 _keys!1741))))))

(declare-fun mapIsEmpty!52004 () Bool)

(declare-fun mapRes!52004 () Bool)

(assert (=> mapIsEmpty!52004 mapRes!52004))

(declare-fun b!1279956 () Bool)

(assert (=> b!1279956 (= e!731330 (and e!731329 mapRes!52004))))

(declare-fun condMapEmpty!52004 () Bool)

(declare-fun mapDefault!52004 () ValueCell!15919)

