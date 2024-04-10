; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111428 () Bool)

(assert start!111428)

(declare-fun b_free!30085 () Bool)

(declare-fun b_next!30085 () Bool)

(assert (=> start!111428 (= b_free!30085 (not b_next!30085))))

(declare-fun tp!105730 () Bool)

(declare-fun b_and!48329 () Bool)

(assert (=> start!111428 (= tp!105730 b_and!48329)))

(declare-fun b!1318705 () Bool)

(declare-fun res!875197 () Bool)

(declare-fun e!752476 () Bool)

(assert (=> b!1318705 (=> (not res!875197) (not e!752476))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(declare-datatypes ((array!88754 0))(
  ( (array!88755 (arr!42851 (Array (_ BitVec 32) (_ BitVec 64))) (size!43401 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88754)

(assert (=> b!1318705 (= res!875197 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43401 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318706 () Bool)

(declare-fun res!875198 () Bool)

(assert (=> b!1318706 (=> (not res!875198) (not e!752476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318706 (= res!875198 (validKeyInArray!0 (select (arr!42851 _keys!1609) from!2000)))))

(declare-fun b!1318707 () Bool)

(declare-fun e!752475 () Bool)

(declare-fun tp_is_empty!35905 () Bool)

(assert (=> b!1318707 (= e!752475 tp_is_empty!35905)))

(declare-fun b!1318708 () Bool)

(declare-fun res!875200 () Bool)

(assert (=> b!1318708 (=> (not res!875200) (not e!752476))))

(assert (=> b!1318708 (= res!875200 (not (= (select (arr!42851 _keys!1609) from!2000) k!1164)))))

(declare-fun res!875203 () Bool)

(assert (=> start!111428 (=> (not res!875203) (not e!752476))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111428 (= res!875203 (validMask!0 mask!2019))))

(assert (=> start!111428 e!752476))

(declare-fun array_inv!32355 (array!88754) Bool)

(assert (=> start!111428 (array_inv!32355 _keys!1609)))

(assert (=> start!111428 true))

(assert (=> start!111428 tp_is_empty!35905))

(declare-datatypes ((V!52977 0))(
  ( (V!52978 (val!18027 Int)) )
))
(declare-datatypes ((ValueCell!17054 0))(
  ( (ValueCellFull!17054 (v!20657 V!52977)) (EmptyCell!17054) )
))
(declare-datatypes ((array!88756 0))(
  ( (array!88757 (arr!42852 (Array (_ BitVec 32) ValueCell!17054)) (size!43402 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88756)

(declare-fun e!752478 () Bool)

(declare-fun array_inv!32356 (array!88756) Bool)

(assert (=> start!111428 (and (array_inv!32356 _values!1337) e!752478)))

(assert (=> start!111428 tp!105730))

(declare-fun mapNonEmpty!55505 () Bool)

(declare-fun mapRes!55505 () Bool)

(declare-fun tp!105731 () Bool)

(assert (=> mapNonEmpty!55505 (= mapRes!55505 (and tp!105731 e!752475))))

(declare-fun mapValue!55505 () ValueCell!17054)

(declare-fun mapKey!55505 () (_ BitVec 32))

(declare-fun mapRest!55505 () (Array (_ BitVec 32) ValueCell!17054))

(assert (=> mapNonEmpty!55505 (= (arr!42852 _values!1337) (store mapRest!55505 mapKey!55505 mapValue!55505))))

(declare-fun b!1318709 () Bool)

(declare-fun res!875202 () Bool)

(assert (=> b!1318709 (=> (not res!875202) (not e!752476))))

(declare-datatypes ((List!30354 0))(
  ( (Nil!30351) (Cons!30350 (h!31559 (_ BitVec 64)) (t!43988 List!30354)) )
))
(declare-fun arrayNoDuplicates!0 (array!88754 (_ BitVec 32) List!30354) Bool)

(assert (=> b!1318709 (= res!875202 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30351))))

(declare-fun b!1318710 () Bool)

(assert (=> b!1318710 (= e!752476 (not true))))

(declare-datatypes ((tuple2!23198 0))(
  ( (tuple2!23199 (_1!11610 (_ BitVec 64)) (_2!11610 V!52977)) )
))
(declare-datatypes ((List!30355 0))(
  ( (Nil!30352) (Cons!30351 (h!31560 tuple2!23198) (t!43989 List!30355)) )
))
(declare-datatypes ((ListLongMap!20855 0))(
  ( (ListLongMap!20856 (toList!10443 List!30355)) )
))
(declare-fun lt!586514 () ListLongMap!20855)

(declare-fun contains!8598 (ListLongMap!20855 (_ BitVec 64)) Bool)

(assert (=> b!1318710 (contains!8598 lt!586514 k!1164)))

(declare-datatypes ((Unit!43428 0))(
  ( (Unit!43429) )
))
(declare-fun lt!586515 () Unit!43428)

(declare-fun minValue!1279 () V!52977)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!100 ((_ BitVec 64) (_ BitVec 64) V!52977 ListLongMap!20855) Unit!43428)

(assert (=> b!1318710 (= lt!586515 (lemmaInListMapAfterAddingDiffThenInBefore!100 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586514))))

(declare-fun zeroValue!1279 () V!52977)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4504 (ListLongMap!20855 tuple2!23198) ListLongMap!20855)

(declare-fun getCurrentListMapNoExtraKeys!6139 (array!88754 array!88756 (_ BitVec 32) (_ BitVec 32) V!52977 V!52977 (_ BitVec 32) Int) ListLongMap!20855)

(declare-fun get!21524 (ValueCell!17054 V!52977) V!52977)

(declare-fun dynLambda!3443 (Int (_ BitVec 64)) V!52977)

(assert (=> b!1318710 (= lt!586514 (+!4504 (+!4504 (getCurrentListMapNoExtraKeys!6139 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23199 (select (arr!42851 _keys!1609) from!2000) (get!21524 (select (arr!42852 _values!1337) from!2000) (dynLambda!3443 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapIsEmpty!55505 () Bool)

(assert (=> mapIsEmpty!55505 mapRes!55505))

(declare-fun b!1318711 () Bool)

(declare-fun res!875199 () Bool)

(assert (=> b!1318711 (=> (not res!875199) (not e!752476))))

(declare-fun getCurrentListMap!5456 (array!88754 array!88756 (_ BitVec 32) (_ BitVec 32) V!52977 V!52977 (_ BitVec 32) Int) ListLongMap!20855)

(assert (=> b!1318711 (= res!875199 (contains!8598 (getCurrentListMap!5456 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1318712 () Bool)

(declare-fun e!752479 () Bool)

(assert (=> b!1318712 (= e!752479 tp_is_empty!35905)))

(declare-fun b!1318713 () Bool)

(assert (=> b!1318713 (= e!752478 (and e!752479 mapRes!55505))))

(declare-fun condMapEmpty!55505 () Bool)

(declare-fun mapDefault!55505 () ValueCell!17054)

