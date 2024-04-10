; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111752 () Bool)

(assert start!111752)

(declare-fun b_free!30409 () Bool)

(declare-fun b_next!30409 () Bool)

(assert (=> start!111752 (= b_free!30409 (not b_next!30409))))

(declare-fun tp!106702 () Bool)

(declare-fun b_and!48947 () Bool)

(assert (=> start!111752 (= tp!106702 b_and!48947)))

(declare-fun b!1324204 () Bool)

(declare-fun e!754909 () Bool)

(assert (=> b!1324204 (= e!754909 false)))

(declare-datatypes ((array!89374 0))(
  ( (array!89375 (arr!43161 (Array (_ BitVec 32) (_ BitVec 64))) (size!43711 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89374)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53409 0))(
  ( (V!53410 (val!18189 Int)) )
))
(declare-fun zeroValue!1279 () V!53409)

(declare-datatypes ((ValueCell!17216 0))(
  ( (ValueCellFull!17216 (v!20819 V!53409)) (EmptyCell!17216) )
))
(declare-datatypes ((array!89376 0))(
  ( (array!89377 (arr!43162 (Array (_ BitVec 32) ValueCell!17216)) (size!43712 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89376)

(declare-fun minValue!1279 () V!53409)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun lt!589446 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23454 0))(
  ( (tuple2!23455 (_1!11738 (_ BitVec 64)) (_2!11738 V!53409)) )
))
(declare-datatypes ((List!30595 0))(
  ( (Nil!30592) (Cons!30591 (h!31800 tuple2!23454) (t!44521 List!30595)) )
))
(declare-datatypes ((ListLongMap!21111 0))(
  ( (ListLongMap!21112 (toList!10571 List!30595)) )
))
(declare-fun contains!8726 (ListLongMap!21111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5567 (array!89374 array!89376 (_ BitVec 32) (_ BitVec 32) V!53409 V!53409 (_ BitVec 32) Int) ListLongMap!21111)

(assert (=> b!1324204 (= lt!589446 (contains!8726 (getCurrentListMap!5567 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324205 () Bool)

(declare-fun e!754907 () Bool)

(declare-fun tp_is_empty!36229 () Bool)

(assert (=> b!1324205 (= e!754907 tp_is_empty!36229)))

(declare-fun b!1324207 () Bool)

(declare-fun res!878946 () Bool)

(assert (=> b!1324207 (=> (not res!878946) (not e!754909))))

(assert (=> b!1324207 (= res!878946 (and (= (size!43712 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43711 _keys!1609) (size!43712 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55991 () Bool)

(declare-fun mapRes!55991 () Bool)

(assert (=> mapIsEmpty!55991 mapRes!55991))

(declare-fun mapNonEmpty!55991 () Bool)

(declare-fun tp!106703 () Bool)

(assert (=> mapNonEmpty!55991 (= mapRes!55991 (and tp!106703 e!754907))))

(declare-fun mapValue!55991 () ValueCell!17216)

(declare-fun mapKey!55991 () (_ BitVec 32))

(declare-fun mapRest!55991 () (Array (_ BitVec 32) ValueCell!17216))

(assert (=> mapNonEmpty!55991 (= (arr!43162 _values!1337) (store mapRest!55991 mapKey!55991 mapValue!55991))))

(declare-fun b!1324208 () Bool)

(declare-fun res!878947 () Bool)

(assert (=> b!1324208 (=> (not res!878947) (not e!754909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89374 (_ BitVec 32)) Bool)

(assert (=> b!1324208 (= res!878947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324209 () Bool)

(declare-fun e!754905 () Bool)

(assert (=> b!1324209 (= e!754905 tp_is_empty!36229)))

(declare-fun b!1324210 () Bool)

(declare-fun res!878944 () Bool)

(assert (=> b!1324210 (=> (not res!878944) (not e!754909))))

(declare-datatypes ((List!30596 0))(
  ( (Nil!30593) (Cons!30592 (h!31801 (_ BitVec 64)) (t!44522 List!30596)) )
))
(declare-fun arrayNoDuplicates!0 (array!89374 (_ BitVec 32) List!30596) Bool)

(assert (=> b!1324210 (= res!878944 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30593))))

(declare-fun b!1324211 () Bool)

(declare-fun res!878948 () Bool)

(assert (=> b!1324211 (=> (not res!878948) (not e!754909))))

(assert (=> b!1324211 (= res!878948 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43711 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324206 () Bool)

(declare-fun e!754906 () Bool)

(assert (=> b!1324206 (= e!754906 (and e!754905 mapRes!55991))))

(declare-fun condMapEmpty!55991 () Bool)

(declare-fun mapDefault!55991 () ValueCell!17216)

