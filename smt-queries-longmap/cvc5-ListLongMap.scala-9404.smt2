; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111918 () Bool)

(assert start!111918)

(declare-fun b_free!30517 () Bool)

(declare-fun b_next!30517 () Bool)

(assert (=> start!111918 (= b_free!30517 (not b_next!30517))))

(declare-fun tp!107030 () Bool)

(declare-fun b_and!49129 () Bool)

(assert (=> start!111918 (= tp!107030 b_and!49129)))

(declare-fun b!1326328 () Bool)

(declare-fun res!880286 () Bool)

(declare-fun e!755973 () Bool)

(assert (=> b!1326328 (=> (not res!880286) (not e!755973))))

(declare-datatypes ((array!89580 0))(
  ( (array!89581 (arr!43263 (Array (_ BitVec 32) (_ BitVec 64))) (size!43813 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89580)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1326328 (= res!880286 (not (= (select (arr!43263 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326329 () Bool)

(declare-fun e!755977 () Bool)

(declare-fun tp_is_empty!36337 () Bool)

(assert (=> b!1326329 (= e!755977 tp_is_empty!36337)))

(declare-fun b!1326330 () Bool)

(declare-fun res!880284 () Bool)

(assert (=> b!1326330 (=> (not res!880284) (not e!755973))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53553 0))(
  ( (V!53554 (val!18243 Int)) )
))
(declare-datatypes ((ValueCell!17270 0))(
  ( (ValueCellFull!17270 (v!20876 V!53553)) (EmptyCell!17270) )
))
(declare-datatypes ((array!89582 0))(
  ( (array!89583 (arr!43264 (Array (_ BitVec 32) ValueCell!17270)) (size!43814 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89582)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326330 (= res!880284 (and (= (size!43814 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43813 _keys!1609) (size!43814 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326331 () Bool)

(declare-fun res!880287 () Bool)

(assert (=> b!1326331 (=> (not res!880287) (not e!755973))))

(declare-fun zeroValue!1279 () V!53553)

(declare-fun minValue!1279 () V!53553)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23538 0))(
  ( (tuple2!23539 (_1!11780 (_ BitVec 64)) (_2!11780 V!53553)) )
))
(declare-datatypes ((List!30674 0))(
  ( (Nil!30671) (Cons!30670 (h!31879 tuple2!23538) (t!44662 List!30674)) )
))
(declare-datatypes ((ListLongMap!21195 0))(
  ( (ListLongMap!21196 (toList!10613 List!30674)) )
))
(declare-fun contains!8770 (ListLongMap!21195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5604 (array!89580 array!89582 (_ BitVec 32) (_ BitVec 32) V!53553 V!53553 (_ BitVec 32) Int) ListLongMap!21195)

(assert (=> b!1326331 (= res!880287 (contains!8770 (getCurrentListMap!5604 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!56157 () Bool)

(declare-fun mapRes!56157 () Bool)

(declare-fun tp!107031 () Bool)

(declare-fun e!755975 () Bool)

(assert (=> mapNonEmpty!56157 (= mapRes!56157 (and tp!107031 e!755975))))

(declare-fun mapKey!56157 () (_ BitVec 32))

(declare-fun mapRest!56157 () (Array (_ BitVec 32) ValueCell!17270))

(declare-fun mapValue!56157 () ValueCell!17270)

(assert (=> mapNonEmpty!56157 (= (arr!43264 _values!1337) (store mapRest!56157 mapKey!56157 mapValue!56157))))

(declare-fun b!1326332 () Bool)

(declare-fun res!880283 () Bool)

(assert (=> b!1326332 (=> (not res!880283) (not e!755973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89580 (_ BitVec 32)) Bool)

(assert (=> b!1326332 (= res!880283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326333 () Bool)

(declare-fun res!880282 () Bool)

(assert (=> b!1326333 (=> (not res!880282) (not e!755973))))

(assert (=> b!1326333 (= res!880282 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43813 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326334 () Bool)

(declare-fun e!755974 () Bool)

(assert (=> b!1326334 (= e!755974 (and e!755977 mapRes!56157))))

(declare-fun condMapEmpty!56157 () Bool)

(declare-fun mapDefault!56157 () ValueCell!17270)

