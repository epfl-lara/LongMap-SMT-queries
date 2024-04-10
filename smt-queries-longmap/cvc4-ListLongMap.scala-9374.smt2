; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111684 () Bool)

(assert start!111684)

(declare-fun b_free!30341 () Bool)

(declare-fun b_next!30341 () Bool)

(assert (=> start!111684 (= b_free!30341 (not b_next!30341))))

(declare-fun tp!106499 () Bool)

(declare-fun b_and!48841 () Bool)

(assert (=> start!111684 (= tp!106499 b_and!48841)))

(declare-fun b!1323185 () Bool)

(declare-fun res!878275 () Bool)

(declare-fun e!754399 () Bool)

(assert (=> b!1323185 (=> (not res!878275) (not e!754399))))

(declare-datatypes ((array!89242 0))(
  ( (array!89243 (arr!43095 (Array (_ BitVec 32) (_ BitVec 64))) (size!43645 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89242)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89242 (_ BitVec 32)) Bool)

(assert (=> b!1323185 (= res!878275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323186 () Bool)

(declare-fun res!878276 () Bool)

(assert (=> b!1323186 (=> (not res!878276) (not e!754399))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53317 0))(
  ( (V!53318 (val!18155 Int)) )
))
(declare-datatypes ((ValueCell!17182 0))(
  ( (ValueCellFull!17182 (v!20785 V!53317)) (EmptyCell!17182) )
))
(declare-datatypes ((array!89244 0))(
  ( (array!89245 (arr!43096 (Array (_ BitVec 32) ValueCell!17182)) (size!43646 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89244)

(assert (=> b!1323186 (= res!878276 (and (= (size!43646 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43645 _keys!1609) (size!43646 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323187 () Bool)

(declare-fun e!754395 () Bool)

(declare-fun e!754396 () Bool)

(declare-fun mapRes!55889 () Bool)

(assert (=> b!1323187 (= e!754395 (and e!754396 mapRes!55889))))

(declare-fun condMapEmpty!55889 () Bool)

(declare-fun mapDefault!55889 () ValueCell!17182)

