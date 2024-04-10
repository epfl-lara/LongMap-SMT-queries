; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133924 () Bool)

(assert start!133924)

(declare-fun b_free!32147 () Bool)

(declare-fun b_next!32147 () Bool)

(assert (=> start!133924 (= b_free!32147 (not b_next!32147))))

(declare-fun tp!113743 () Bool)

(declare-fun b_and!51735 () Bool)

(assert (=> start!133924 (= tp!113743 b_and!51735)))

(declare-fun b!1565492 () Bool)

(declare-fun e!872592 () Bool)

(declare-fun tp_is_empty!38921 () Bool)

(assert (=> b!1565492 (= e!872592 tp_is_empty!38921)))

(declare-fun res!1070133 () Bool)

(declare-fun e!872594 () Bool)

(assert (=> start!133924 (=> (not res!1070133) (not e!872594))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133924 (= res!1070133 (validMask!0 mask!947))))

(assert (=> start!133924 e!872594))

(assert (=> start!133924 tp!113743))

(assert (=> start!133924 tp_is_empty!38921))

(assert (=> start!133924 true))

(declare-datatypes ((array!104532 0))(
  ( (array!104533 (arr!50453 (Array (_ BitVec 32) (_ BitVec 64))) (size!51003 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104532)

(declare-fun array_inv!39207 (array!104532) Bool)

(assert (=> start!133924 (array_inv!39207 _keys!637)))

(declare-datatypes ((V!60101 0))(
  ( (V!60102 (val!19544 Int)) )
))
(declare-datatypes ((ValueCell!18430 0))(
  ( (ValueCellFull!18430 (v!22300 V!60101)) (EmptyCell!18430) )
))
(declare-datatypes ((array!104534 0))(
  ( (array!104535 (arr!50454 (Array (_ BitVec 32) ValueCell!18430)) (size!51004 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104534)

(declare-fun e!872595 () Bool)

(declare-fun array_inv!39208 (array!104534) Bool)

(assert (=> start!133924 (and (array_inv!39208 _values!487) e!872595)))

(declare-fun b!1565493 () Bool)

(declare-fun e!872593 () Bool)

(assert (=> b!1565493 (= e!872593 tp_is_empty!38921)))

(declare-fun b!1565494 () Bool)

(declare-fun res!1070135 () Bool)

(assert (=> b!1565494 (=> (not res!1070135) (not e!872594))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565494 (= res!1070135 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51003 _keys!637)) (bvslt from!782 (size!51003 _keys!637))))))

(declare-fun b!1565495 () Bool)

(declare-fun res!1070134 () Bool)

(assert (=> b!1565495 (=> (not res!1070134) (not e!872594))))

(declare-datatypes ((List!36603 0))(
  ( (Nil!36600) (Cons!36599 (h!38045 (_ BitVec 64)) (t!51464 List!36603)) )
))
(declare-fun arrayNoDuplicates!0 (array!104532 (_ BitVec 32) List!36603) Bool)

(assert (=> b!1565495 (= res!1070134 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36600))))

(declare-fun b!1565496 () Bool)

(assert (=> b!1565496 (= e!872594 (not true))))

(declare-fun lt!672286 () V!60101)

(declare-datatypes ((tuple2!25216 0))(
  ( (tuple2!25217 (_1!12619 (_ BitVec 64)) (_2!12619 V!60101)) )
))
(declare-datatypes ((List!36604 0))(
  ( (Nil!36601) (Cons!36600 (h!38046 tuple2!25216) (t!51465 List!36604)) )
))
(declare-datatypes ((ListLongMap!22651 0))(
  ( (ListLongMap!22652 (toList!11341 List!36604)) )
))
(declare-fun lt!672285 () ListLongMap!22651)

(declare-fun contains!10332 (ListLongMap!22651 (_ BitVec 64)) Bool)

(declare-fun +!5071 (ListLongMap!22651 tuple2!25216) ListLongMap!22651)

(assert (=> b!1565496 (not (contains!10332 (+!5071 lt!672285 (tuple2!25217 (select (arr!50453 _keys!637) from!782) lt!672286)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!52006 0))(
  ( (Unit!52007) )
))
(declare-fun lt!672287 () Unit!52006)

(declare-fun addStillNotContains!561 (ListLongMap!22651 (_ BitVec 64) V!60101 (_ BitVec 64)) Unit!52006)

(assert (=> b!1565496 (= lt!672287 (addStillNotContains!561 lt!672285 (select (arr!50453 _keys!637) from!782) lt!672286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26334 (ValueCell!18430 V!60101) V!60101)

(declare-fun dynLambda!3855 (Int (_ BitVec 64)) V!60101)

(assert (=> b!1565496 (= lt!672286 (get!26334 (select (arr!50454 _values!487) from!782) (dynLambda!3855 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60101)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60101)

(declare-fun getCurrentListMapNoExtraKeys!6706 (array!104532 array!104534 (_ BitVec 32) (_ BitVec 32) V!60101 V!60101 (_ BitVec 32) Int) ListLongMap!22651)

(assert (=> b!1565496 (= lt!672285 (getCurrentListMapNoExtraKeys!6706 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59773 () Bool)

(declare-fun mapRes!59773 () Bool)

(declare-fun tp!113742 () Bool)

(assert (=> mapNonEmpty!59773 (= mapRes!59773 (and tp!113742 e!872593))))

(declare-fun mapRest!59773 () (Array (_ BitVec 32) ValueCell!18430))

(declare-fun mapValue!59773 () ValueCell!18430)

(declare-fun mapKey!59773 () (_ BitVec 32))

(assert (=> mapNonEmpty!59773 (= (arr!50454 _values!487) (store mapRest!59773 mapKey!59773 mapValue!59773))))

(declare-fun mapIsEmpty!59773 () Bool)

(assert (=> mapIsEmpty!59773 mapRes!59773))

(declare-fun b!1565497 () Bool)

(declare-fun res!1070137 () Bool)

(assert (=> b!1565497 (=> (not res!1070137) (not e!872594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104532 (_ BitVec 32)) Bool)

(assert (=> b!1565497 (= res!1070137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565498 () Bool)

(assert (=> b!1565498 (= e!872595 (and e!872592 mapRes!59773))))

(declare-fun condMapEmpty!59773 () Bool)

(declare-fun mapDefault!59773 () ValueCell!18430)

