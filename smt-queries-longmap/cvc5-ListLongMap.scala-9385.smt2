; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111746 () Bool)

(assert start!111746)

(declare-fun b_free!30403 () Bool)

(declare-fun b_next!30403 () Bool)

(assert (=> start!111746 (= b_free!30403 (not b_next!30403))))

(declare-fun tp!106685 () Bool)

(declare-fun b_and!48941 () Bool)

(assert (=> start!111746 (= tp!106685 b_and!48941)))

(declare-fun b!1324132 () Bool)

(declare-fun res!878903 () Bool)

(declare-fun e!754863 () Bool)

(assert (=> b!1324132 (=> (not res!878903) (not e!754863))))

(declare-datatypes ((array!89362 0))(
  ( (array!89363 (arr!43155 (Array (_ BitVec 32) (_ BitVec 64))) (size!43705 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89362)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89362 (_ BitVec 32)) Bool)

(assert (=> b!1324132 (= res!878903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324133 () Bool)

(declare-fun res!878900 () Bool)

(assert (=> b!1324133 (=> (not res!878900) (not e!754863))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53401 0))(
  ( (V!53402 (val!18186 Int)) )
))
(declare-datatypes ((ValueCell!17213 0))(
  ( (ValueCellFull!17213 (v!20816 V!53401)) (EmptyCell!17213) )
))
(declare-datatypes ((array!89364 0))(
  ( (array!89365 (arr!43156 (Array (_ BitVec 32) ValueCell!17213)) (size!43706 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89364)

(assert (=> b!1324133 (= res!878900 (and (= (size!43706 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43705 _keys!1609) (size!43706 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324134 () Bool)

(declare-fun res!878899 () Bool)

(assert (=> b!1324134 (=> (not res!878899) (not e!754863))))

(declare-datatypes ((List!30591 0))(
  ( (Nil!30588) (Cons!30587 (h!31796 (_ BitVec 64)) (t!44517 List!30591)) )
))
(declare-fun arrayNoDuplicates!0 (array!89362 (_ BitVec 32) List!30591) Bool)

(assert (=> b!1324134 (= res!878899 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30588))))

(declare-fun res!878901 () Bool)

(assert (=> start!111746 (=> (not res!878901) (not e!754863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111746 (= res!878901 (validMask!0 mask!2019))))

(assert (=> start!111746 e!754863))

(declare-fun array_inv!32579 (array!89362) Bool)

(assert (=> start!111746 (array_inv!32579 _keys!1609)))

(assert (=> start!111746 true))

(declare-fun tp_is_empty!36223 () Bool)

(assert (=> start!111746 tp_is_empty!36223))

(declare-fun e!754862 () Bool)

(declare-fun array_inv!32580 (array!89364) Bool)

(assert (=> start!111746 (and (array_inv!32580 _values!1337) e!754862)))

(assert (=> start!111746 tp!106685))

(declare-fun b!1324135 () Bool)

(assert (=> b!1324135 (= e!754863 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53401)

(declare-fun minValue!1279 () V!53401)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589437 () Bool)

(declare-datatypes ((tuple2!23450 0))(
  ( (tuple2!23451 (_1!11736 (_ BitVec 64)) (_2!11736 V!53401)) )
))
(declare-datatypes ((List!30592 0))(
  ( (Nil!30589) (Cons!30588 (h!31797 tuple2!23450) (t!44518 List!30592)) )
))
(declare-datatypes ((ListLongMap!21107 0))(
  ( (ListLongMap!21108 (toList!10569 List!30592)) )
))
(declare-fun contains!8724 (ListLongMap!21107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5565 (array!89362 array!89364 (_ BitVec 32) (_ BitVec 32) V!53401 V!53401 (_ BitVec 32) Int) ListLongMap!21107)

(assert (=> b!1324135 (= lt!589437 (contains!8724 (getCurrentListMap!5565 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324136 () Bool)

(declare-fun e!754861 () Bool)

(assert (=> b!1324136 (= e!754861 tp_is_empty!36223)))

(declare-fun b!1324137 () Bool)

(declare-fun e!754864 () Bool)

(assert (=> b!1324137 (= e!754864 tp_is_empty!36223)))

(declare-fun mapIsEmpty!55982 () Bool)

(declare-fun mapRes!55982 () Bool)

(assert (=> mapIsEmpty!55982 mapRes!55982))

(declare-fun b!1324138 () Bool)

(assert (=> b!1324138 (= e!754862 (and e!754864 mapRes!55982))))

(declare-fun condMapEmpty!55982 () Bool)

(declare-fun mapDefault!55982 () ValueCell!17213)

