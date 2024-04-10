; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111798 () Bool)

(assert start!111798)

(declare-fun b_free!30455 () Bool)

(declare-fun b_next!30455 () Bool)

(assert (=> start!111798 (= b_free!30455 (not b_next!30455))))

(declare-fun tp!106841 () Bool)

(declare-fun b_and!48993 () Bool)

(assert (=> start!111798 (= tp!106841 b_and!48993)))

(declare-fun b!1324834 () Bool)

(declare-fun res!879371 () Bool)

(declare-fun e!755250 () Bool)

(assert (=> b!1324834 (=> (not res!879371) (not e!755250))))

(declare-datatypes ((array!89458 0))(
  ( (array!89459 (arr!43203 (Array (_ BitVec 32) (_ BitVec 64))) (size!43753 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89458)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324834 (= res!879371 (not (= (select (arr!43203 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1324835 () Bool)

(declare-fun res!879370 () Bool)

(assert (=> b!1324835 (=> (not res!879370) (not e!755250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324835 (= res!879370 (validKeyInArray!0 (select (arr!43203 _keys!1609) from!2000)))))

(declare-fun res!879372 () Bool)

(assert (=> start!111798 (=> (not res!879372) (not e!755250))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111798 (= res!879372 (validMask!0 mask!2019))))

(assert (=> start!111798 e!755250))

(declare-fun array_inv!32609 (array!89458) Bool)

(assert (=> start!111798 (array_inv!32609 _keys!1609)))

(assert (=> start!111798 true))

(declare-fun tp_is_empty!36275 () Bool)

(assert (=> start!111798 tp_is_empty!36275))

(declare-datatypes ((V!53469 0))(
  ( (V!53470 (val!18212 Int)) )
))
(declare-datatypes ((ValueCell!17239 0))(
  ( (ValueCellFull!17239 (v!20842 V!53469)) (EmptyCell!17239) )
))
(declare-datatypes ((array!89460 0))(
  ( (array!89461 (arr!43204 (Array (_ BitVec 32) ValueCell!17239)) (size!43754 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89460)

(declare-fun e!755253 () Bool)

(declare-fun array_inv!32610 (array!89460) Bool)

(assert (=> start!111798 (and (array_inv!32610 _values!1337) e!755253)))

(assert (=> start!111798 tp!106841))

(declare-fun b!1324836 () Bool)

(declare-fun res!879367 () Bool)

(assert (=> b!1324836 (=> (not res!879367) (not e!755250))))

(declare-datatypes ((List!30626 0))(
  ( (Nil!30623) (Cons!30622 (h!31831 (_ BitVec 64)) (t!44552 List!30626)) )
))
(declare-fun arrayNoDuplicates!0 (array!89458 (_ BitVec 32) List!30626) Bool)

(assert (=> b!1324836 (= res!879367 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30623))))

(declare-fun b!1324837 () Bool)

(declare-fun res!879374 () Bool)

(assert (=> b!1324837 (=> (not res!879374) (not e!755250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89458 (_ BitVec 32)) Bool)

(assert (=> b!1324837 (= res!879374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!56060 () Bool)

(declare-fun mapRes!56060 () Bool)

(declare-fun tp!106840 () Bool)

(declare-fun e!755251 () Bool)

(assert (=> mapNonEmpty!56060 (= mapRes!56060 (and tp!106840 e!755251))))

(declare-fun mapValue!56060 () ValueCell!17239)

(declare-fun mapRest!56060 () (Array (_ BitVec 32) ValueCell!17239))

(declare-fun mapKey!56060 () (_ BitVec 32))

(assert (=> mapNonEmpty!56060 (= (arr!43204 _values!1337) (store mapRest!56060 mapKey!56060 mapValue!56060))))

(declare-fun b!1324838 () Bool)

(declare-fun res!879368 () Bool)

(assert (=> b!1324838 (=> (not res!879368) (not e!755250))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53469)

(declare-fun minValue!1279 () V!53469)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23486 0))(
  ( (tuple2!23487 (_1!11754 (_ BitVec 64)) (_2!11754 V!53469)) )
))
(declare-datatypes ((List!30627 0))(
  ( (Nil!30624) (Cons!30623 (h!31832 tuple2!23486) (t!44553 List!30627)) )
))
(declare-datatypes ((ListLongMap!21143 0))(
  ( (ListLongMap!21144 (toList!10587 List!30627)) )
))
(declare-fun contains!8742 (ListLongMap!21143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5583 (array!89458 array!89460 (_ BitVec 32) (_ BitVec 32) V!53469 V!53469 (_ BitVec 32) Int) ListLongMap!21143)

(assert (=> b!1324838 (= res!879368 (contains!8742 (getCurrentListMap!5583 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324839 () Bool)

(declare-fun res!879369 () Bool)

(assert (=> b!1324839 (=> (not res!879369) (not e!755250))))

(assert (=> b!1324839 (= res!879369 (and (= (size!43754 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43753 _keys!1609) (size!43754 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56060 () Bool)

(assert (=> mapIsEmpty!56060 mapRes!56060))

(declare-fun b!1324840 () Bool)

(declare-fun e!755254 () Bool)

(assert (=> b!1324840 (= e!755253 (and e!755254 mapRes!56060))))

(declare-fun condMapEmpty!56060 () Bool)

(declare-fun mapDefault!56060 () ValueCell!17239)

