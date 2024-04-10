; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111480 () Bool)

(assert start!111480)

(declare-fun b_free!30137 () Bool)

(declare-fun b_next!30137 () Bool)

(assert (=> start!111480 (= b_free!30137 (not b_next!30137))))

(declare-fun tp!105886 () Bool)

(declare-fun b_and!48433 () Bool)

(assert (=> start!111480 (= tp!105886 b_and!48433)))

(declare-fun b!1319615 () Bool)

(declare-fun res!875826 () Bool)

(declare-fun e!752869 () Bool)

(assert (=> b!1319615 (=> (not res!875826) (not e!752869))))

(declare-datatypes ((array!88852 0))(
  ( (array!88853 (arr!42900 (Array (_ BitVec 32) (_ BitVec 64))) (size!43450 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88852)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53045 0))(
  ( (V!53046 (val!18053 Int)) )
))
(declare-datatypes ((ValueCell!17080 0))(
  ( (ValueCellFull!17080 (v!20683 V!53045)) (EmptyCell!17080) )
))
(declare-datatypes ((array!88854 0))(
  ( (array!88855 (arr!42901 (Array (_ BitVec 32) ValueCell!17080)) (size!43451 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88854)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319615 (= res!875826 (and (= (size!43451 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43450 _keys!1609) (size!43451 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!875824 () Bool)

(assert (=> start!111480 (=> (not res!875824) (not e!752869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111480 (= res!875824 (validMask!0 mask!2019))))

(assert (=> start!111480 e!752869))

(declare-fun array_inv!32389 (array!88852) Bool)

(assert (=> start!111480 (array_inv!32389 _keys!1609)))

(assert (=> start!111480 true))

(declare-fun tp_is_empty!35957 () Bool)

(assert (=> start!111480 tp_is_empty!35957))

(declare-fun e!752868 () Bool)

(declare-fun array_inv!32390 (array!88854) Bool)

(assert (=> start!111480 (and (array_inv!32390 _values!1337) e!752868)))

(assert (=> start!111480 tp!105886))

(declare-fun b!1319616 () Bool)

(declare-fun res!875823 () Bool)

(assert (=> b!1319616 (=> (not res!875823) (not e!752869))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53045)

(declare-fun minValue!1279 () V!53045)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23238 0))(
  ( (tuple2!23239 (_1!11630 (_ BitVec 64)) (_2!11630 V!53045)) )
))
(declare-datatypes ((List!30391 0))(
  ( (Nil!30388) (Cons!30387 (h!31596 tuple2!23238) (t!44077 List!30391)) )
))
(declare-datatypes ((ListLongMap!20895 0))(
  ( (ListLongMap!20896 (toList!10463 List!30391)) )
))
(declare-fun contains!8618 (ListLongMap!20895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5472 (array!88852 array!88854 (_ BitVec 32) (_ BitVec 32) V!53045 V!53045 (_ BitVec 32) Int) ListLongMap!20895)

(assert (=> b!1319616 (= res!875823 (contains!8618 (getCurrentListMap!5472 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319617 () Bool)

(declare-fun res!875825 () Bool)

(assert (=> b!1319617 (=> (not res!875825) (not e!752869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319617 (= res!875825 (validKeyInArray!0 (select (arr!42900 _keys!1609) from!2000)))))

(declare-fun b!1319618 () Bool)

(assert (=> b!1319618 (= e!752869 (not true))))

(declare-fun lt!586671 () ListLongMap!20895)

(assert (=> b!1319618 (contains!8618 lt!586671 k!1164)))

(declare-datatypes ((Unit!43464 0))(
  ( (Unit!43465) )
))
(declare-fun lt!586670 () Unit!43464)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!118 ((_ BitVec 64) (_ BitVec 64) V!53045 ListLongMap!20895) Unit!43464)

(assert (=> b!1319618 (= lt!586670 (lemmaInListMapAfterAddingDiffThenInBefore!118 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586671))))

(declare-fun +!4522 (ListLongMap!20895 tuple2!23238) ListLongMap!20895)

(declare-fun getCurrentListMapNoExtraKeys!6157 (array!88852 array!88854 (_ BitVec 32) (_ BitVec 32) V!53045 V!53045 (_ BitVec 32) Int) ListLongMap!20895)

(declare-fun get!21558 (ValueCell!17080 V!53045) V!53045)

(declare-fun dynLambda!3461 (Int (_ BitVec 64)) V!53045)

(assert (=> b!1319618 (= lt!586671 (+!4522 (+!4522 (getCurrentListMapNoExtraKeys!6157 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23239 (select (arr!42900 _keys!1609) from!2000) (get!21558 (select (arr!42901 _values!1337) from!2000) (dynLambda!3461 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319619 () Bool)

(declare-fun e!752865 () Bool)

(assert (=> b!1319619 (= e!752865 tp_is_empty!35957)))

(declare-fun b!1319620 () Bool)

(declare-fun res!875828 () Bool)

(assert (=> b!1319620 (=> (not res!875828) (not e!752869))))

(assert (=> b!1319620 (= res!875828 (not (= (select (arr!42900 _keys!1609) from!2000) k!1164)))))

(declare-fun mapNonEmpty!55583 () Bool)

(declare-fun mapRes!55583 () Bool)

(declare-fun tp!105887 () Bool)

(assert (=> mapNonEmpty!55583 (= mapRes!55583 (and tp!105887 e!752865))))

(declare-fun mapKey!55583 () (_ BitVec 32))

(declare-fun mapRest!55583 () (Array (_ BitVec 32) ValueCell!17080))

(declare-fun mapValue!55583 () ValueCell!17080)

(assert (=> mapNonEmpty!55583 (= (arr!42901 _values!1337) (store mapRest!55583 mapKey!55583 mapValue!55583))))

(declare-fun b!1319621 () Bool)

(declare-fun res!875827 () Bool)

(assert (=> b!1319621 (=> (not res!875827) (not e!752869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88852 (_ BitVec 32)) Bool)

(assert (=> b!1319621 (= res!875827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55583 () Bool)

(assert (=> mapIsEmpty!55583 mapRes!55583))

(declare-fun b!1319622 () Bool)

(declare-fun e!752867 () Bool)

(assert (=> b!1319622 (= e!752868 (and e!752867 mapRes!55583))))

(declare-fun condMapEmpty!55583 () Bool)

(declare-fun mapDefault!55583 () ValueCell!17080)

