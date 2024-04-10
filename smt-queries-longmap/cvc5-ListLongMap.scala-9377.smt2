; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111698 () Bool)

(assert start!111698)

(declare-fun b_free!30355 () Bool)

(declare-fun b_next!30355 () Bool)

(assert (=> start!111698 (= b_free!30355 (not b_next!30355))))

(declare-fun tp!106540 () Bool)

(declare-fun b_and!48869 () Bool)

(assert (=> start!111698 (= tp!106540 b_and!48869)))

(declare-fun b!1323430 () Bool)

(declare-fun res!878438 () Bool)

(declare-fun e!754500 () Bool)

(assert (=> b!1323430 (=> (not res!878438) (not e!754500))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53337 0))(
  ( (V!53338 (val!18162 Int)) )
))
(declare-datatypes ((ValueCell!17189 0))(
  ( (ValueCellFull!17189 (v!20792 V!53337)) (EmptyCell!17189) )
))
(declare-datatypes ((array!89268 0))(
  ( (array!89269 (arr!43108 (Array (_ BitVec 32) ValueCell!17189)) (size!43658 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89268)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89270 0))(
  ( (array!89271 (arr!43109 (Array (_ BitVec 32) (_ BitVec 64))) (size!43659 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89270)

(assert (=> b!1323430 (= res!878438 (and (= (size!43658 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43659 _keys!1609) (size!43658 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323431 () Bool)

(declare-fun res!878437 () Bool)

(assert (=> b!1323431 (=> (not res!878437) (not e!754500))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53337)

(declare-fun minValue!1279 () V!53337)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23412 0))(
  ( (tuple2!23413 (_1!11717 (_ BitVec 64)) (_2!11717 V!53337)) )
))
(declare-datatypes ((List!30554 0))(
  ( (Nil!30551) (Cons!30550 (h!31759 tuple2!23412) (t!44458 List!30554)) )
))
(declare-datatypes ((ListLongMap!21069 0))(
  ( (ListLongMap!21070 (toList!10550 List!30554)) )
))
(declare-fun contains!8705 (ListLongMap!21069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5547 (array!89270 array!89268 (_ BitVec 32) (_ BitVec 32) V!53337 V!53337 (_ BitVec 32) Int) ListLongMap!21069)

(assert (=> b!1323431 (= res!878437 (contains!8705 (getCurrentListMap!5547 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323432 () Bool)

(declare-fun res!878439 () Bool)

(assert (=> b!1323432 (=> (not res!878439) (not e!754500))))

(declare-datatypes ((List!30555 0))(
  ( (Nil!30552) (Cons!30551 (h!31760 (_ BitVec 64)) (t!44459 List!30555)) )
))
(declare-fun arrayNoDuplicates!0 (array!89270 (_ BitVec 32) List!30555) Bool)

(assert (=> b!1323432 (= res!878439 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30552))))

(declare-fun b!1323433 () Bool)

(declare-fun e!754501 () Bool)

(declare-fun tp_is_empty!36175 () Bool)

(assert (=> b!1323433 (= e!754501 tp_is_empty!36175)))

(declare-fun b!1323435 () Bool)

(declare-fun res!878444 () Bool)

(assert (=> b!1323435 (=> (not res!878444) (not e!754500))))

(assert (=> b!1323435 (= res!878444 (not (= (select (arr!43109 _keys!1609) from!2000) k!1164)))))

(declare-fun mapNonEmpty!55910 () Bool)

(declare-fun mapRes!55910 () Bool)

(declare-fun tp!106541 () Bool)

(assert (=> mapNonEmpty!55910 (= mapRes!55910 (and tp!106541 e!754501))))

(declare-fun mapValue!55910 () ValueCell!17189)

(declare-fun mapRest!55910 () (Array (_ BitVec 32) ValueCell!17189))

(declare-fun mapKey!55910 () (_ BitVec 32))

(assert (=> mapNonEmpty!55910 (= (arr!43108 _values!1337) (store mapRest!55910 mapKey!55910 mapValue!55910))))

(declare-fun b!1323436 () Bool)

(declare-fun e!754503 () Bool)

(declare-fun e!754504 () Bool)

(assert (=> b!1323436 (= e!754503 (and e!754504 mapRes!55910))))

(declare-fun condMapEmpty!55910 () Bool)

(declare-fun mapDefault!55910 () ValueCell!17189)

