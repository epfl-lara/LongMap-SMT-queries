; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111416 () Bool)

(assert start!111416)

(declare-fun b_free!30073 () Bool)

(declare-fun b_next!30073 () Bool)

(assert (=> start!111416 (= b_free!30073 (not b_next!30073))))

(declare-fun tp!105694 () Bool)

(declare-fun b_and!48305 () Bool)

(assert (=> start!111416 (= tp!105694 b_and!48305)))

(declare-fun b!1318495 () Bool)

(declare-fun res!875054 () Bool)

(declare-fun e!752386 () Bool)

(assert (=> b!1318495 (=> (not res!875054) (not e!752386))))

(declare-datatypes ((array!88730 0))(
  ( (array!88731 (arr!42839 (Array (_ BitVec 32) (_ BitVec 64))) (size!43389 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88730)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88730 (_ BitVec 32)) Bool)

(assert (=> b!1318495 (= res!875054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318496 () Bool)

(declare-fun res!875055 () Bool)

(assert (=> b!1318496 (=> (not res!875055) (not e!752386))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318496 (= res!875055 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43389 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318497 () Bool)

(declare-fun res!875056 () Bool)

(assert (=> b!1318497 (=> (not res!875056) (not e!752386))))

(declare-datatypes ((V!52961 0))(
  ( (V!52962 (val!18021 Int)) )
))
(declare-datatypes ((ValueCell!17048 0))(
  ( (ValueCellFull!17048 (v!20651 V!52961)) (EmptyCell!17048) )
))
(declare-datatypes ((array!88732 0))(
  ( (array!88733 (arr!42840 (Array (_ BitVec 32) ValueCell!17048)) (size!43390 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88732)

(assert (=> b!1318497 (= res!875056 (and (= (size!43390 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43389 _keys!1609) (size!43390 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318498 () Bool)

(declare-fun res!875057 () Bool)

(assert (=> b!1318498 (=> (not res!875057) (not e!752386))))

(declare-datatypes ((List!30347 0))(
  ( (Nil!30344) (Cons!30343 (h!31552 (_ BitVec 64)) (t!43969 List!30347)) )
))
(declare-fun arrayNoDuplicates!0 (array!88730 (_ BitVec 32) List!30347) Bool)

(assert (=> b!1318498 (= res!875057 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30344))))

(declare-fun mapNonEmpty!55487 () Bool)

(declare-fun mapRes!55487 () Bool)

(declare-fun tp!105695 () Bool)

(declare-fun e!752385 () Bool)

(assert (=> mapNonEmpty!55487 (= mapRes!55487 (and tp!105695 e!752385))))

(declare-fun mapRest!55487 () (Array (_ BitVec 32) ValueCell!17048))

(declare-fun mapKey!55487 () (_ BitVec 32))

(declare-fun mapValue!55487 () ValueCell!17048)

(assert (=> mapNonEmpty!55487 (= (arr!42840 _values!1337) (store mapRest!55487 mapKey!55487 mapValue!55487))))

(declare-fun b!1318499 () Bool)

(declare-fun res!875053 () Bool)

(assert (=> b!1318499 (=> (not res!875053) (not e!752386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318499 (= res!875053 (validKeyInArray!0 (select (arr!42839 _keys!1609) from!2000)))))

(declare-fun b!1318500 () Bool)

(declare-fun e!752387 () Bool)

(declare-fun e!752389 () Bool)

(assert (=> b!1318500 (= e!752387 (and e!752389 mapRes!55487))))

(declare-fun condMapEmpty!55487 () Bool)

(declare-fun mapDefault!55487 () ValueCell!17048)

