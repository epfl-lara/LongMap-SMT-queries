; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108474 () Bool)

(assert start!108474)

(declare-fun b_free!28021 () Bool)

(declare-fun b_next!28021 () Bool)

(assert (=> start!108474 (= b_free!28021 (not b_next!28021))))

(declare-fun tp!99173 () Bool)

(declare-fun b_and!46081 () Bool)

(assert (=> start!108474 (= tp!99173 b_and!46081)))

(declare-fun b!1280265 () Bool)

(declare-fun e!731524 () Bool)

(assert (=> b!1280265 (= e!731524 false)))

(declare-datatypes ((V!49985 0))(
  ( (V!49986 (val!16905 Int)) )
))
(declare-fun minValue!1387 () V!49985)

(declare-fun zeroValue!1387 () V!49985)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15932 0))(
  ( (ValueCellFull!15932 (v!19505 V!49985)) (EmptyCell!15932) )
))
(declare-datatypes ((array!84400 0))(
  ( (array!84401 (arr!40704 (Array (_ BitVec 32) ValueCell!15932)) (size!41254 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84400)

(declare-fun lt!576104 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84402 0))(
  ( (array!84403 (arr!40705 (Array (_ BitVec 32) (_ BitVec 64))) (size!41255 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84402)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21634 0))(
  ( (tuple2!21635 (_1!10828 (_ BitVec 64)) (_2!10828 V!49985)) )
))
(declare-datatypes ((List!28834 0))(
  ( (Nil!28831) (Cons!28830 (h!30039 tuple2!21634) (t!42374 List!28834)) )
))
(declare-datatypes ((ListLongMap!19291 0))(
  ( (ListLongMap!19292 (toList!9661 List!28834)) )
))
(declare-fun contains!7776 (ListLongMap!19291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4745 (array!84402 array!84400 (_ BitVec 32) (_ BitVec 32) V!49985 V!49985 (_ BitVec 32) Int) ListLongMap!19291)

(assert (=> b!1280265 (= lt!576104 (contains!7776 (getCurrentListMap!4745 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280266 () Bool)

(declare-fun res!850426 () Bool)

(assert (=> b!1280266 (=> (not res!850426) (not e!731524))))

(assert (=> b!1280266 (= res!850426 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41255 _keys!1741))))))

(declare-fun b!1280267 () Bool)

(declare-fun e!731523 () Bool)

(declare-fun e!731521 () Bool)

(declare-fun mapRes!52043 () Bool)

(assert (=> b!1280267 (= e!731523 (and e!731521 mapRes!52043))))

(declare-fun condMapEmpty!52043 () Bool)

(declare-fun mapDefault!52043 () ValueCell!15932)

