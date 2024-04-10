; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113018 () Bool)

(assert start!113018)

(declare-fun b_free!31069 () Bool)

(declare-fun b_next!31069 () Bool)

(assert (=> start!113018 (= b_free!31069 (not b_next!31069))))

(declare-fun tp!109011 () Bool)

(declare-fun b_and!50099 () Bool)

(assert (=> start!113018 (= tp!109011 b_and!50099)))

(declare-fun b!1339548 () Bool)

(declare-fun e!762995 () Bool)

(declare-fun tp_is_empty!37069 () Bool)

(assert (=> b!1339548 (= e!762995 tp_is_empty!37069)))

(declare-fun mapIsEmpty!57310 () Bool)

(declare-fun mapRes!57310 () Bool)

(assert (=> mapIsEmpty!57310 mapRes!57310))

(declare-fun mapNonEmpty!57310 () Bool)

(declare-fun tp!109012 () Bool)

(declare-fun e!762994 () Bool)

(assert (=> mapNonEmpty!57310 (= mapRes!57310 (and tp!109012 e!762994))))

(declare-fun mapKey!57310 () (_ BitVec 32))

(declare-datatypes ((V!54529 0))(
  ( (V!54530 (val!18609 Int)) )
))
(declare-datatypes ((ValueCell!17636 0))(
  ( (ValueCellFull!17636 (v!21257 V!54529)) (EmptyCell!17636) )
))
(declare-fun mapValue!57310 () ValueCell!17636)

(declare-fun mapRest!57310 () (Array (_ BitVec 32) ValueCell!17636))

(declare-datatypes ((array!90994 0))(
  ( (array!90995 (arr!43953 (Array (_ BitVec 32) ValueCell!17636)) (size!44503 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90994)

(assert (=> mapNonEmpty!57310 (= (arr!43953 _values!1303) (store mapRest!57310 mapKey!57310 mapValue!57310))))

(declare-fun res!888621 () Bool)

(declare-fun e!762998 () Bool)

(assert (=> start!113018 (=> (not res!888621) (not e!762998))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113018 (= res!888621 (validMask!0 mask!1977))))

(assert (=> start!113018 e!762998))

(assert (=> start!113018 tp_is_empty!37069))

(assert (=> start!113018 true))

(declare-datatypes ((array!90996 0))(
  ( (array!90997 (arr!43954 (Array (_ BitVec 32) (_ BitVec 64))) (size!44504 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90996)

(declare-fun array_inv!33143 (array!90996) Bool)

(assert (=> start!113018 (array_inv!33143 _keys!1571)))

(declare-fun e!762996 () Bool)

(declare-fun array_inv!33144 (array!90994) Bool)

(assert (=> start!113018 (and (array_inv!33144 _values!1303) e!762996)))

(assert (=> start!113018 tp!109011))

(declare-fun b!1339549 () Bool)

(declare-fun res!888619 () Bool)

(assert (=> b!1339549 (=> (not res!888619) (not e!762998))))

(declare-datatypes ((List!31113 0))(
  ( (Nil!31110) (Cons!31109 (h!32318 (_ BitVec 64)) (t!45445 List!31113)) )
))
(declare-fun arrayNoDuplicates!0 (array!90996 (_ BitVec 32) List!31113) Bool)

(assert (=> b!1339549 (= res!888619 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31110))))

(declare-fun b!1339550 () Bool)

(assert (=> b!1339550 (= e!762998 false)))

(declare-fun lt!593898 () Bool)

(declare-fun minValue!1245 () V!54529)

(declare-fun zeroValue!1245 () V!54529)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23948 0))(
  ( (tuple2!23949 (_1!11985 (_ BitVec 64)) (_2!11985 V!54529)) )
))
(declare-datatypes ((List!31114 0))(
  ( (Nil!31111) (Cons!31110 (h!32319 tuple2!23948) (t!45446 List!31114)) )
))
(declare-datatypes ((ListLongMap!21605 0))(
  ( (ListLongMap!21606 (toList!10818 List!31114)) )
))
(declare-fun contains!8994 (ListLongMap!21605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5787 (array!90996 array!90994 (_ BitVec 32) (_ BitVec 32) V!54529 V!54529 (_ BitVec 32) Int) ListLongMap!21605)

(assert (=> b!1339550 (= lt!593898 (contains!8994 (getCurrentListMap!5787 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1339551 () Bool)

(assert (=> b!1339551 (= e!762994 tp_is_empty!37069)))

(declare-fun b!1339552 () Bool)

(declare-fun res!888620 () Bool)

(assert (=> b!1339552 (=> (not res!888620) (not e!762998))))

(assert (=> b!1339552 (= res!888620 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44504 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339553 () Bool)

(assert (=> b!1339553 (= e!762996 (and e!762995 mapRes!57310))))

(declare-fun condMapEmpty!57310 () Bool)

(declare-fun mapDefault!57310 () ValueCell!17636)

