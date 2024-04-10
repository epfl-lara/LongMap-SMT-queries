; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112194 () Bool)

(assert start!112194)

(declare-fun b_free!30589 () Bool)

(declare-fun b_next!30589 () Bool)

(assert (=> start!112194 (= b_free!30589 (not b_next!30589))))

(declare-fun tp!107404 () Bool)

(declare-fun b_and!49239 () Bool)

(assert (=> start!112194 (= tp!107404 b_and!49239)))

(declare-fun b!1328766 () Bool)

(declare-fun e!757618 () Bool)

(declare-fun tp_is_empty!36499 () Bool)

(assert (=> b!1328766 (= e!757618 tp_is_empty!36499)))

(declare-fun res!881621 () Bool)

(declare-fun e!757621 () Bool)

(assert (=> start!112194 (=> (not res!881621) (not e!757621))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112194 (= res!881621 (validMask!0 mask!1998))))

(assert (=> start!112194 e!757621))

(declare-datatypes ((V!53769 0))(
  ( (V!53770 (val!18324 Int)) )
))
(declare-datatypes ((ValueCell!17351 0))(
  ( (ValueCellFull!17351 (v!20961 V!53769)) (EmptyCell!17351) )
))
(declare-datatypes ((array!89890 0))(
  ( (array!89891 (arr!43411 (Array (_ BitVec 32) ValueCell!17351)) (size!43961 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89890)

(declare-fun e!757617 () Bool)

(declare-fun array_inv!32755 (array!89890) Bool)

(assert (=> start!112194 (and (array_inv!32755 _values!1320) e!757617)))

(assert (=> start!112194 true))

(declare-datatypes ((array!89892 0))(
  ( (array!89893 (arr!43412 (Array (_ BitVec 32) (_ BitVec 64))) (size!43962 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89892)

(declare-fun array_inv!32756 (array!89892) Bool)

(assert (=> start!112194 (array_inv!32756 _keys!1590)))

(assert (=> start!112194 tp!107404))

(assert (=> start!112194 tp_is_empty!36499))

(declare-fun b!1328767 () Bool)

(declare-fun res!881615 () Bool)

(assert (=> b!1328767 (=> (not res!881615) (not e!757621))))

(declare-datatypes ((List!30743 0))(
  ( (Nil!30740) (Cons!30739 (h!31948 (_ BitVec 64)) (t!44749 List!30743)) )
))
(declare-fun arrayNoDuplicates!0 (array!89892 (_ BitVec 32) List!30743) Bool)

(assert (=> b!1328767 (= res!881615 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30740))))

(declare-fun b!1328768 () Bool)

(declare-fun res!881619 () Bool)

(assert (=> b!1328768 (=> (not res!881619) (not e!757621))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328768 (= res!881619 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43962 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328769 () Bool)

(declare-fun res!881618 () Bool)

(assert (=> b!1328769 (=> (not res!881618) (not e!757621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328769 (= res!881618 (validKeyInArray!0 (select (arr!43412 _keys!1590) from!1980)))))

(declare-fun b!1328770 () Bool)

(declare-fun res!881620 () Bool)

(assert (=> b!1328770 (=> (not res!881620) (not e!757621))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53769)

(declare-fun zeroValue!1262 () V!53769)

(declare-datatypes ((tuple2!23586 0))(
  ( (tuple2!23587 (_1!11804 (_ BitVec 64)) (_2!11804 V!53769)) )
))
(declare-datatypes ((List!30744 0))(
  ( (Nil!30741) (Cons!30740 (h!31949 tuple2!23586) (t!44750 List!30744)) )
))
(declare-datatypes ((ListLongMap!21243 0))(
  ( (ListLongMap!21244 (toList!10637 List!30744)) )
))
(declare-fun contains!8801 (ListLongMap!21243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5628 (array!89892 array!89890 (_ BitVec 32) (_ BitVec 32) V!53769 V!53769 (_ BitVec 32) Int) ListLongMap!21243)

(assert (=> b!1328770 (= res!881620 (contains!8801 (getCurrentListMap!5628 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56422 () Bool)

(declare-fun mapRes!56422 () Bool)

(assert (=> mapIsEmpty!56422 mapRes!56422))

(declare-fun b!1328771 () Bool)

(declare-fun e!757619 () Bool)

(assert (=> b!1328771 (= e!757617 (and e!757619 mapRes!56422))))

(declare-fun condMapEmpty!56422 () Bool)

(declare-fun mapDefault!56422 () ValueCell!17351)

