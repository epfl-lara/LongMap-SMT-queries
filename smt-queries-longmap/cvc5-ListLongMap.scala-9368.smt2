; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111644 () Bool)

(assert start!111644)

(declare-fun b_free!30301 () Bool)

(declare-fun b_next!30301 () Bool)

(assert (=> start!111644 (= b_free!30301 (not b_next!30301))))

(declare-fun tp!106378 () Bool)

(declare-fun b_and!48761 () Bool)

(assert (=> start!111644 (= tp!106378 b_and!48761)))

(declare-fun mapNonEmpty!55829 () Bool)

(declare-fun mapRes!55829 () Bool)

(declare-fun tp!106379 () Bool)

(declare-fun e!754098 () Bool)

(assert (=> mapNonEmpty!55829 (= mapRes!55829 (and tp!106379 e!754098))))

(declare-datatypes ((V!53265 0))(
  ( (V!53266 (val!18135 Int)) )
))
(declare-datatypes ((ValueCell!17162 0))(
  ( (ValueCellFull!17162 (v!20765 V!53265)) (EmptyCell!17162) )
))
(declare-fun mapRest!55829 () (Array (_ BitVec 32) ValueCell!17162))

(declare-fun mapValue!55829 () ValueCell!17162)

(declare-datatypes ((array!89164 0))(
  ( (array!89165 (arr!43056 (Array (_ BitVec 32) ValueCell!17162)) (size!43606 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89164)

(declare-fun mapKey!55829 () (_ BitVec 32))

(assert (=> mapNonEmpty!55829 (= (arr!43056 _values!1337) (store mapRest!55829 mapKey!55829 mapValue!55829))))

(declare-fun b!1322485 () Bool)

(declare-fun res!877794 () Bool)

(declare-fun e!754095 () Bool)

(assert (=> b!1322485 (=> (not res!877794) (not e!754095))))

(declare-datatypes ((array!89166 0))(
  ( (array!89167 (arr!43057 (Array (_ BitVec 32) (_ BitVec 64))) (size!43607 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89166)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322485 (= res!877794 (and (= (size!43606 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43607 _keys!1609) (size!43606 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!877795 () Bool)

(assert (=> start!111644 (=> (not res!877795) (not e!754095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111644 (= res!877795 (validMask!0 mask!2019))))

(assert (=> start!111644 e!754095))

(declare-fun array_inv!32507 (array!89166) Bool)

(assert (=> start!111644 (array_inv!32507 _keys!1609)))

(assert (=> start!111644 true))

(declare-fun tp_is_empty!36121 () Bool)

(assert (=> start!111644 tp_is_empty!36121))

(declare-fun e!754099 () Bool)

(declare-fun array_inv!32508 (array!89164) Bool)

(assert (=> start!111644 (and (array_inv!32508 _values!1337) e!754099)))

(assert (=> start!111644 tp!106378))

(declare-fun b!1322486 () Bool)

(declare-fun res!877792 () Bool)

(assert (=> b!1322486 (=> (not res!877792) (not e!754095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89166 (_ BitVec 32)) Bool)

(assert (=> b!1322486 (= res!877792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322487 () Bool)

(declare-fun res!877791 () Bool)

(assert (=> b!1322487 (=> (not res!877791) (not e!754095))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53265)

(declare-fun minValue!1279 () V!53265)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23366 0))(
  ( (tuple2!23367 (_1!11694 (_ BitVec 64)) (_2!11694 V!53265)) )
))
(declare-datatypes ((List!30512 0))(
  ( (Nil!30509) (Cons!30508 (h!31717 tuple2!23366) (t!44362 List!30512)) )
))
(declare-datatypes ((ListLongMap!21023 0))(
  ( (ListLongMap!21024 (toList!10527 List!30512)) )
))
(declare-fun contains!8682 (ListLongMap!21023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5528 (array!89166 array!89164 (_ BitVec 32) (_ BitVec 32) V!53265 V!53265 (_ BitVec 32) Int) ListLongMap!21023)

(assert (=> b!1322487 (= res!877791 (contains!8682 (getCurrentListMap!5528 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322488 () Bool)

(assert (=> b!1322488 (= e!754098 tp_is_empty!36121)))

(declare-fun b!1322489 () Bool)

(declare-fun e!754096 () Bool)

(assert (=> b!1322489 (= e!754099 (and e!754096 mapRes!55829))))

(declare-fun condMapEmpty!55829 () Bool)

(declare-fun mapDefault!55829 () ValueCell!17162)

