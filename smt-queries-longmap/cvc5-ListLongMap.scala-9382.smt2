; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111728 () Bool)

(assert start!111728)

(declare-fun b_free!30385 () Bool)

(declare-fun b_next!30385 () Bool)

(assert (=> start!111728 (= b_free!30385 (not b_next!30385))))

(declare-fun tp!106630 () Bool)

(declare-fun b_and!48923 () Bool)

(assert (=> start!111728 (= tp!106630 b_and!48923)))

(declare-fun b!1323916 () Bool)

(declare-fun res!878768 () Bool)

(declare-fun e!754727 () Bool)

(assert (=> b!1323916 (=> (not res!878768) (not e!754727))))

(declare-datatypes ((array!89326 0))(
  ( (array!89327 (arr!43137 (Array (_ BitVec 32) (_ BitVec 64))) (size!43687 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89326)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89326 (_ BitVec 32)) Bool)

(assert (=> b!1323916 (= res!878768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323917 () Bool)

(declare-fun e!754726 () Bool)

(declare-fun tp_is_empty!36205 () Bool)

(assert (=> b!1323917 (= e!754726 tp_is_empty!36205)))

(declare-fun b!1323918 () Bool)

(declare-fun e!754725 () Bool)

(assert (=> b!1323918 (= e!754725 tp_is_empty!36205)))

(declare-fun b!1323919 () Bool)

(assert (=> b!1323919 (= e!754727 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53377 0))(
  ( (V!53378 (val!18177 Int)) )
))
(declare-fun zeroValue!1279 () V!53377)

(declare-datatypes ((ValueCell!17204 0))(
  ( (ValueCellFull!17204 (v!20807 V!53377)) (EmptyCell!17204) )
))
(declare-datatypes ((array!89328 0))(
  ( (array!89329 (arr!43138 (Array (_ BitVec 32) ValueCell!17204)) (size!43688 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89328)

(declare-fun minValue!1279 () V!53377)

(declare-fun lt!589410 () Bool)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23438 0))(
  ( (tuple2!23439 (_1!11730 (_ BitVec 64)) (_2!11730 V!53377)) )
))
(declare-datatypes ((List!30578 0))(
  ( (Nil!30575) (Cons!30574 (h!31783 tuple2!23438) (t!44504 List!30578)) )
))
(declare-datatypes ((ListLongMap!21095 0))(
  ( (ListLongMap!21096 (toList!10563 List!30578)) )
))
(declare-fun contains!8718 (ListLongMap!21095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5559 (array!89326 array!89328 (_ BitVec 32) (_ BitVec 32) V!53377 V!53377 (_ BitVec 32) Int) ListLongMap!21095)

(assert (=> b!1323919 (= lt!589410 (contains!8718 (getCurrentListMap!5559 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!55955 () Bool)

(declare-fun mapRes!55955 () Bool)

(declare-fun tp!106631 () Bool)

(assert (=> mapNonEmpty!55955 (= mapRes!55955 (and tp!106631 e!754725))))

(declare-fun mapRest!55955 () (Array (_ BitVec 32) ValueCell!17204))

(declare-fun mapKey!55955 () (_ BitVec 32))

(declare-fun mapValue!55955 () ValueCell!17204)

(assert (=> mapNonEmpty!55955 (= (arr!43138 _values!1337) (store mapRest!55955 mapKey!55955 mapValue!55955))))

(declare-fun b!1323920 () Bool)

(declare-fun e!754729 () Bool)

(assert (=> b!1323920 (= e!754729 (and e!754726 mapRes!55955))))

(declare-fun condMapEmpty!55955 () Bool)

(declare-fun mapDefault!55955 () ValueCell!17204)

