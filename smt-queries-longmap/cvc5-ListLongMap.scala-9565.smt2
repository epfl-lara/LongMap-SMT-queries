; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113252 () Bool)

(assert start!113252)

(declare-fun b_free!31303 () Bool)

(declare-fun b_next!31303 () Bool)

(assert (=> start!113252 (= b_free!31303 (not b_next!31303))))

(declare-fun tp!109714 () Bool)

(declare-fun b_and!50513 () Bool)

(assert (=> start!113252 (= tp!109714 b_and!50513)))

(declare-fun b!1343651 () Bool)

(declare-fun res!891489 () Bool)

(declare-fun e!764753 () Bool)

(assert (=> b!1343651 (=> (not res!891489) (not e!764753))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91450 0))(
  ( (array!91451 (arr!44181 (Array (_ BitVec 32) (_ BitVec 64))) (size!44731 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91450)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54841 0))(
  ( (V!54842 (val!18726 Int)) )
))
(declare-datatypes ((ValueCell!17753 0))(
  ( (ValueCellFull!17753 (v!21374 V!54841)) (EmptyCell!17753) )
))
(declare-datatypes ((array!91452 0))(
  ( (array!91453 (arr!44182 (Array (_ BitVec 32) ValueCell!17753)) (size!44732 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91452)

(assert (=> b!1343651 (= res!891489 (and (= (size!44732 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44731 _keys!1571) (size!44732 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343652 () Bool)

(declare-fun res!891487 () Bool)

(assert (=> b!1343652 (=> (not res!891487) (not e!764753))))

(declare-fun minValue!1245 () V!54841)

(declare-fun zeroValue!1245 () V!54841)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24126 0))(
  ( (tuple2!24127 (_1!12074 (_ BitVec 64)) (_2!12074 V!54841)) )
))
(declare-datatypes ((List!31283 0))(
  ( (Nil!31280) (Cons!31279 (h!32488 tuple2!24126) (t!45797 List!31283)) )
))
(declare-datatypes ((ListLongMap!21783 0))(
  ( (ListLongMap!21784 (toList!10907 List!31283)) )
))
(declare-fun contains!9083 (ListLongMap!21783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5865 (array!91450 array!91452 (_ BitVec 32) (_ BitVec 32) V!54841 V!54841 (_ BitVec 32) Int) ListLongMap!21783)

(assert (=> b!1343652 (= res!891487 (contains!9083 (getCurrentListMap!5865 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57661 () Bool)

(declare-fun mapRes!57661 () Bool)

(declare-fun tp!109713 () Bool)

(declare-fun e!764751 () Bool)

(assert (=> mapNonEmpty!57661 (= mapRes!57661 (and tp!109713 e!764751))))

(declare-fun mapRest!57661 () (Array (_ BitVec 32) ValueCell!17753))

(declare-fun mapValue!57661 () ValueCell!17753)

(declare-fun mapKey!57661 () (_ BitVec 32))

(assert (=> mapNonEmpty!57661 (= (arr!44182 _values!1303) (store mapRest!57661 mapKey!57661 mapValue!57661))))

(declare-fun b!1343654 () Bool)

(declare-fun res!891490 () Bool)

(assert (=> b!1343654 (=> (not res!891490) (not e!764753))))

(assert (=> b!1343654 (= res!891490 (not (= (select (arr!44181 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1343655 () Bool)

(declare-fun res!891495 () Bool)

(assert (=> b!1343655 (=> (not res!891495) (not e!764753))))

(assert (=> b!1343655 (= res!891495 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44731 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343656 () Bool)

(declare-fun tp_is_empty!37303 () Bool)

(assert (=> b!1343656 (= e!764751 tp_is_empty!37303)))

(declare-fun b!1343657 () Bool)

(declare-fun res!891488 () Bool)

(assert (=> b!1343657 (=> (not res!891488) (not e!764753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343657 (= res!891488 (validKeyInArray!0 (select (arr!44181 _keys!1571) from!1960)))))

(declare-fun b!1343658 () Bool)

(declare-fun e!764749 () Bool)

(declare-fun e!764752 () Bool)

(assert (=> b!1343658 (= e!764749 (and e!764752 mapRes!57661))))

(declare-fun condMapEmpty!57661 () Bool)

(declare-fun mapDefault!57661 () ValueCell!17753)

