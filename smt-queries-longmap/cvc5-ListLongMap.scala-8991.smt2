; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108706 () Bool)

(assert start!108706)

(declare-fun b_free!28219 () Bool)

(declare-fun b_next!28219 () Bool)

(assert (=> start!108706 (= b_free!28219 (not b_next!28219))))

(declare-fun tp!99773 () Bool)

(declare-fun b_and!46285 () Bool)

(assert (=> start!108706 (= tp!99773 b_and!46285)))

(declare-fun mapIsEmpty!52346 () Bool)

(declare-fun mapRes!52346 () Bool)

(assert (=> mapIsEmpty!52346 mapRes!52346))

(declare-fun b!1283380 () Bool)

(declare-fun res!852503 () Bool)

(declare-fun e!733202 () Bool)

(assert (=> b!1283380 (=> (not res!852503) (not e!733202))))

(declare-datatypes ((array!84780 0))(
  ( (array!84781 (arr!40892 (Array (_ BitVec 32) (_ BitVec 64))) (size!41442 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84780)

(declare-datatypes ((List!28972 0))(
  ( (Nil!28969) (Cons!28968 (h!30177 (_ BitVec 64)) (t!42516 List!28972)) )
))
(declare-fun arrayNoDuplicates!0 (array!84780 (_ BitVec 32) List!28972) Bool)

(assert (=> b!1283380 (= res!852503 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28969))))

(declare-fun mapNonEmpty!52346 () Bool)

(declare-fun tp!99772 () Bool)

(declare-fun e!733205 () Bool)

(assert (=> mapNonEmpty!52346 (= mapRes!52346 (and tp!99772 e!733205))))

(declare-datatypes ((V!50249 0))(
  ( (V!50250 (val!17004 Int)) )
))
(declare-datatypes ((ValueCell!16031 0))(
  ( (ValueCellFull!16031 (v!19606 V!50249)) (EmptyCell!16031) )
))
(declare-fun mapValue!52346 () ValueCell!16031)

(declare-datatypes ((array!84782 0))(
  ( (array!84783 (arr!40893 (Array (_ BitVec 32) ValueCell!16031)) (size!41443 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84782)

(declare-fun mapKey!52346 () (_ BitVec 32))

(declare-fun mapRest!52346 () (Array (_ BitVec 32) ValueCell!16031))

(assert (=> mapNonEmpty!52346 (= (arr!40893 _values!1445) (store mapRest!52346 mapKey!52346 mapValue!52346))))

(declare-fun b!1283381 () Bool)

(declare-fun res!852509 () Bool)

(assert (=> b!1283381 (=> (not res!852509) (not e!733202))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283381 (= res!852509 (validKeyInArray!0 (select (arr!40892 _keys!1741) from!2144)))))

(declare-fun b!1283382 () Bool)

(declare-fun res!852510 () Bool)

(assert (=> b!1283382 (=> (not res!852510) (not e!733202))))

(assert (=> b!1283382 (= res!852510 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41442 _keys!1741))))))

(declare-fun b!1283383 () Bool)

(declare-fun res!852505 () Bool)

(assert (=> b!1283383 (=> (not res!852505) (not e!733202))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283383 (= res!852505 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283384 () Bool)

(declare-fun res!852508 () Bool)

(assert (=> b!1283384 (=> (not res!852508) (not e!733202))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283384 (= res!852508 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41442 _keys!1741))))))

(declare-fun b!1283385 () Bool)

(declare-fun tp_is_empty!33859 () Bool)

(assert (=> b!1283385 (= e!733205 tp_is_empty!33859)))

(declare-fun b!1283386 () Bool)

(declare-fun res!852507 () Bool)

(assert (=> b!1283386 (=> (not res!852507) (not e!733202))))

(declare-fun minValue!1387 () V!50249)

(declare-fun zeroValue!1387 () V!50249)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21774 0))(
  ( (tuple2!21775 (_1!10898 (_ BitVec 64)) (_2!10898 V!50249)) )
))
(declare-datatypes ((List!28973 0))(
  ( (Nil!28970) (Cons!28969 (h!30178 tuple2!21774) (t!42517 List!28973)) )
))
(declare-datatypes ((ListLongMap!19431 0))(
  ( (ListLongMap!19432 (toList!9731 List!28973)) )
))
(declare-fun contains!7848 (ListLongMap!19431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4814 (array!84780 array!84782 (_ BitVec 32) (_ BitVec 32) V!50249 V!50249 (_ BitVec 32) Int) ListLongMap!19431)

(assert (=> b!1283386 (= res!852507 (contains!7848 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1283387 () Bool)

(declare-fun res!852504 () Bool)

(assert (=> b!1283387 (=> (not res!852504) (not e!733202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84780 (_ BitVec 32)) Bool)

(assert (=> b!1283387 (= res!852504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283388 () Bool)

(declare-fun e!733201 () Bool)

(assert (=> b!1283388 (= e!733201 tp_is_empty!33859)))

(declare-fun b!1283389 () Bool)

(declare-fun e!733203 () Bool)

(assert (=> b!1283389 (= e!733203 (and e!733201 mapRes!52346))))

(declare-fun condMapEmpty!52346 () Bool)

(declare-fun mapDefault!52346 () ValueCell!16031)

