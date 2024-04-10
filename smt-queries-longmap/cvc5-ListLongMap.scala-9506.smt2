; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112728 () Bool)

(assert start!112728)

(declare-fun b_free!31039 () Bool)

(declare-fun b_next!31039 () Bool)

(assert (=> start!112728 (= b_free!31039 (not b_next!31039))))

(declare-fun tp!108760 () Bool)

(declare-fun b_and!50017 () Bool)

(assert (=> start!112728 (= tp!108760 b_and!50017)))

(declare-fun res!887381 () Bool)

(declare-fun e!761438 () Bool)

(assert (=> start!112728 (=> (not res!887381) (not e!761438))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112728 (= res!887381 (validMask!0 mask!1998))))

(assert (=> start!112728 e!761438))

(declare-datatypes ((V!54369 0))(
  ( (V!54370 (val!18549 Int)) )
))
(declare-datatypes ((ValueCell!17576 0))(
  ( (ValueCellFull!17576 (v!21190 V!54369)) (EmptyCell!17576) )
))
(declare-datatypes ((array!90756 0))(
  ( (array!90757 (arr!43842 (Array (_ BitVec 32) ValueCell!17576)) (size!44392 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90756)

(declare-fun e!761437 () Bool)

(declare-fun array_inv!33065 (array!90756) Bool)

(assert (=> start!112728 (and (array_inv!33065 _values!1320) e!761437)))

(assert (=> start!112728 true))

(declare-datatypes ((array!90758 0))(
  ( (array!90759 (arr!43843 (Array (_ BitVec 32) (_ BitVec 64))) (size!44393 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90758)

(declare-fun array_inv!33066 (array!90758) Bool)

(assert (=> start!112728 (array_inv!33066 _keys!1590)))

(assert (=> start!112728 tp!108760))

(declare-fun tp_is_empty!36949 () Bool)

(assert (=> start!112728 tp_is_empty!36949))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun b!1337198 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337198 (= e!761438 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1980 (size!44392 _values!1320))))))

(declare-fun b!1337199 () Bool)

(declare-fun res!887380 () Bool)

(assert (=> b!1337199 (=> (not res!887380) (not e!761438))))

(declare-datatypes ((List!31068 0))(
  ( (Nil!31065) (Cons!31064 (h!32273 (_ BitVec 64)) (t!45380 List!31068)) )
))
(declare-fun arrayNoDuplicates!0 (array!90758 (_ BitVec 32) List!31068) Bool)

(assert (=> b!1337199 (= res!887380 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31065))))

(declare-fun b!1337200 () Bool)

(declare-fun res!887387 () Bool)

(assert (=> b!1337200 (=> (not res!887387) (not e!761438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90758 (_ BitVec 32)) Bool)

(assert (=> b!1337200 (= res!887387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337201 () Bool)

(declare-fun e!761441 () Bool)

(assert (=> b!1337201 (= e!761441 tp_is_empty!36949)))

(declare-fun b!1337202 () Bool)

(declare-fun res!887384 () Bool)

(assert (=> b!1337202 (=> (not res!887384) (not e!761438))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1337202 (= res!887384 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44393 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337203 () Bool)

(declare-fun e!761439 () Bool)

(assert (=> b!1337203 (= e!761439 tp_is_empty!36949)))

(declare-fun b!1337204 () Bool)

(declare-fun res!887382 () Bool)

(assert (=> b!1337204 (=> (not res!887382) (not e!761438))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54369)

(declare-fun zeroValue!1262 () V!54369)

(declare-datatypes ((tuple2!23926 0))(
  ( (tuple2!23927 (_1!11974 (_ BitVec 64)) (_2!11974 V!54369)) )
))
(declare-datatypes ((List!31069 0))(
  ( (Nil!31066) (Cons!31065 (h!32274 tuple2!23926) (t!45381 List!31069)) )
))
(declare-datatypes ((ListLongMap!21583 0))(
  ( (ListLongMap!21584 (toList!10807 List!31069)) )
))
(declare-fun contains!8974 (ListLongMap!21583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5778 (array!90758 array!90756 (_ BitVec 32) (_ BitVec 32) V!54369 V!54369 (_ BitVec 32) Int) ListLongMap!21583)

(assert (=> b!1337204 (= res!887382 (contains!8974 (getCurrentListMap!5778 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!57104 () Bool)

(declare-fun mapRes!57104 () Bool)

(declare-fun tp!108761 () Bool)

(assert (=> mapNonEmpty!57104 (= mapRes!57104 (and tp!108761 e!761439))))

(declare-fun mapRest!57104 () (Array (_ BitVec 32) ValueCell!17576))

(declare-fun mapValue!57104 () ValueCell!17576)

(declare-fun mapKey!57104 () (_ BitVec 32))

(assert (=> mapNonEmpty!57104 (= (arr!43842 _values!1320) (store mapRest!57104 mapKey!57104 mapValue!57104))))

(declare-fun b!1337205 () Bool)

(assert (=> b!1337205 (= e!761437 (and e!761441 mapRes!57104))))

(declare-fun condMapEmpty!57104 () Bool)

(declare-fun mapDefault!57104 () ValueCell!17576)

