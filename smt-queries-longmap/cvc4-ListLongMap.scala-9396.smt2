; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111874 () Bool)

(assert start!111874)

(declare-fun b_free!30473 () Bool)

(declare-fun b_next!30473 () Bool)

(assert (=> start!111874 (= b_free!30473 (not b_next!30473))))

(declare-fun tp!106899 () Bool)

(declare-fun b_and!49041 () Bool)

(assert (=> start!111874 (= tp!106899 b_and!49041)))

(declare-fun b!1325558 () Bool)

(declare-fun res!879755 () Bool)

(declare-fun e!755647 () Bool)

(assert (=> b!1325558 (=> (not res!879755) (not e!755647))))

(declare-datatypes ((array!89494 0))(
  ( (array!89495 (arr!43220 (Array (_ BitVec 32) (_ BitVec 64))) (size!43770 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89494)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89494 (_ BitVec 32)) Bool)

(assert (=> b!1325558 (= res!879755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325559 () Bool)

(declare-fun res!879756 () Bool)

(assert (=> b!1325559 (=> (not res!879756) (not e!755647))))

(declare-datatypes ((List!30640 0))(
  ( (Nil!30637) (Cons!30636 (h!31845 (_ BitVec 64)) (t!44584 List!30640)) )
))
(declare-fun arrayNoDuplicates!0 (array!89494 (_ BitVec 32) List!30640) Bool)

(assert (=> b!1325559 (= res!879756 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30637))))

(declare-fun b!1325560 () Bool)

(declare-fun res!879754 () Bool)

(assert (=> b!1325560 (=> (not res!879754) (not e!755647))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53493 0))(
  ( (V!53494 (val!18221 Int)) )
))
(declare-datatypes ((ValueCell!17248 0))(
  ( (ValueCellFull!17248 (v!20854 V!53493)) (EmptyCell!17248) )
))
(declare-datatypes ((array!89496 0))(
  ( (array!89497 (arr!43221 (Array (_ BitVec 32) ValueCell!17248)) (size!43771 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89496)

(assert (=> b!1325560 (= res!879754 (and (= (size!43771 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43770 _keys!1609) (size!43771 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325561 () Bool)

(declare-fun res!879758 () Bool)

(assert (=> b!1325561 (=> (not res!879758) (not e!755647))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1325561 (= res!879758 (not (= (select (arr!43220 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325562 () Bool)

(assert (=> b!1325562 (= e!755647 (not true))))

(declare-datatypes ((tuple2!23500 0))(
  ( (tuple2!23501 (_1!11761 (_ BitVec 64)) (_2!11761 V!53493)) )
))
(declare-datatypes ((List!30641 0))(
  ( (Nil!30638) (Cons!30637 (h!31846 tuple2!23500) (t!44585 List!30641)) )
))
(declare-datatypes ((ListLongMap!21157 0))(
  ( (ListLongMap!21158 (toList!10594 List!30641)) )
))
(declare-fun lt!589802 () ListLongMap!21157)

(declare-fun contains!8751 (ListLongMap!21157 (_ BitVec 64)) Bool)

(assert (=> b!1325562 (contains!8751 lt!589802 k!1164)))

(declare-fun minValue!1279 () V!53493)

(declare-datatypes ((Unit!43662 0))(
  ( (Unit!43663) )
))
(declare-fun lt!589803 () Unit!43662)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!209 ((_ BitVec 64) (_ BitVec 64) V!53493 ListLongMap!21157) Unit!43662)

(assert (=> b!1325562 (= lt!589803 (lemmaInListMapAfterAddingDiffThenInBefore!209 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589802))))

(declare-fun zeroValue!1279 () V!53493)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4617 (ListLongMap!21157 tuple2!23500) ListLongMap!21157)

(declare-fun getCurrentListMapNoExtraKeys!6255 (array!89494 array!89496 (_ BitVec 32) (_ BitVec 32) V!53493 V!53493 (_ BitVec 32) Int) ListLongMap!21157)

(declare-fun get!21768 (ValueCell!17248 V!53493) V!53493)

(declare-fun dynLambda!3556 (Int (_ BitVec 64)) V!53493)

(assert (=> b!1325562 (= lt!589802 (+!4617 (+!4617 (getCurrentListMapNoExtraKeys!6255 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23501 (select (arr!43220 _keys!1609) from!2000) (get!21768 (select (arr!43221 _values!1337) from!2000) (dynLambda!3556 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapIsEmpty!56091 () Bool)

(declare-fun mapRes!56091 () Bool)

(assert (=> mapIsEmpty!56091 mapRes!56091))

(declare-fun b!1325563 () Bool)

(declare-fun e!755643 () Bool)

(declare-fun e!755644 () Bool)

(assert (=> b!1325563 (= e!755643 (and e!755644 mapRes!56091))))

(declare-fun condMapEmpty!56091 () Bool)

(declare-fun mapDefault!56091 () ValueCell!17248)

