; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133966 () Bool)

(assert start!133966)

(declare-fun b_free!32189 () Bool)

(declare-fun b_next!32189 () Bool)

(assert (=> start!133966 (= b_free!32189 (not b_next!32189))))

(declare-fun tp!113869 () Bool)

(declare-fun b_and!51819 () Bool)

(assert (=> start!133966 (= tp!113869 b_and!51819)))

(declare-fun b!1566144 () Bool)

(declare-fun res!1070558 () Bool)

(declare-fun e!872937 () Bool)

(assert (=> b!1566144 (=> (not res!1070558) (not e!872937))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104612 0))(
  ( (array!104613 (arr!50493 (Array (_ BitVec 32) (_ BitVec 64))) (size!51043 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104612)

(declare-datatypes ((V!60157 0))(
  ( (V!60158 (val!19565 Int)) )
))
(declare-datatypes ((ValueCell!18451 0))(
  ( (ValueCellFull!18451 (v!22321 V!60157)) (EmptyCell!18451) )
))
(declare-datatypes ((array!104614 0))(
  ( (array!104615 (arr!50494 (Array (_ BitVec 32) ValueCell!18451)) (size!51044 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104614)

(assert (=> b!1566144 (= res!1070558 (and (= (size!51044 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51043 _keys!637) (size!51044 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566145 () Bool)

(declare-fun res!1070555 () Bool)

(assert (=> b!1566145 (=> (not res!1070555) (not e!872937))))

(declare-datatypes ((List!36631 0))(
  ( (Nil!36628) (Cons!36627 (h!38073 (_ BitVec 64)) (t!51534 List!36631)) )
))
(declare-fun arrayNoDuplicates!0 (array!104612 (_ BitVec 32) List!36631) Bool)

(assert (=> b!1566145 (= res!1070555 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36628))))

(declare-fun b!1566146 () Bool)

(declare-fun e!872933 () Bool)

(declare-fun tp_is_empty!38963 () Bool)

(assert (=> b!1566146 (= e!872933 tp_is_empty!38963)))

(declare-fun b!1566147 () Bool)

(declare-fun e!872938 () Bool)

(assert (=> b!1566147 (= e!872937 (not e!872938))))

(declare-fun res!1070560 () Bool)

(assert (=> b!1566147 (=> (not res!1070560) (not e!872938))))

(declare-datatypes ((tuple2!25244 0))(
  ( (tuple2!25245 (_1!12633 (_ BitVec 64)) (_2!12633 V!60157)) )
))
(declare-datatypes ((List!36632 0))(
  ( (Nil!36629) (Cons!36628 (h!38074 tuple2!25244) (t!51535 List!36632)) )
))
(declare-datatypes ((ListLongMap!22679 0))(
  ( (ListLongMap!22680 (toList!11355 List!36632)) )
))
(declare-fun lt!672563 () ListLongMap!22679)

(declare-fun contains!10346 (ListLongMap!22679 (_ BitVec 64)) Bool)

(assert (=> b!1566147 (= res!1070560 (not (contains!10346 lt!672563 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566147 (not (contains!10346 lt!672563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672565 () V!60157)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672566 () ListLongMap!22679)

(declare-fun +!5085 (ListLongMap!22679 tuple2!25244) ListLongMap!22679)

(assert (=> b!1566147 (= lt!672563 (+!5085 lt!672566 (tuple2!25245 (select (arr!50493 _keys!637) from!782) lt!672565)))))

(declare-datatypes ((Unit!52034 0))(
  ( (Unit!52035) )
))
(declare-fun lt!672564 () Unit!52034)

(declare-fun addStillNotContains!575 (ListLongMap!22679 (_ BitVec 64) V!60157 (_ BitVec 64)) Unit!52034)

(assert (=> b!1566147 (= lt!672564 (addStillNotContains!575 lt!672566 (select (arr!50493 _keys!637) from!782) lt!672565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26362 (ValueCell!18451 V!60157) V!60157)

(declare-fun dynLambda!3869 (Int (_ BitVec 64)) V!60157)

(assert (=> b!1566147 (= lt!672565 (get!26362 (select (arr!50494 _values!487) from!782) (dynLambda!3869 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60157)

(declare-fun minValue!453 () V!60157)

(declare-fun getCurrentListMapNoExtraKeys!6720 (array!104612 array!104614 (_ BitVec 32) (_ BitVec 32) V!60157 V!60157 (_ BitVec 32) Int) ListLongMap!22679)

(assert (=> b!1566147 (= lt!672566 (getCurrentListMapNoExtraKeys!6720 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070553 () Bool)

(assert (=> start!133966 (=> (not res!1070553) (not e!872937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133966 (= res!1070553 (validMask!0 mask!947))))

(assert (=> start!133966 e!872937))

(assert (=> start!133966 tp!113869))

(assert (=> start!133966 tp_is_empty!38963))

(assert (=> start!133966 true))

(declare-fun array_inv!39231 (array!104612) Bool)

(assert (=> start!133966 (array_inv!39231 _keys!637)))

(declare-fun e!872934 () Bool)

(declare-fun array_inv!39232 (array!104614) Bool)

(assert (=> start!133966 (and (array_inv!39232 _values!487) e!872934)))

(declare-fun b!1566148 () Bool)

(declare-fun res!1070554 () Bool)

(assert (=> b!1566148 (=> (not res!1070554) (not e!872938))))

(assert (=> b!1566148 (= res!1070554 (contains!10346 lt!672563 (select (arr!50493 _keys!637) from!782)))))

(declare-fun b!1566149 () Bool)

(declare-fun res!1070559 () Bool)

(assert (=> b!1566149 (=> (not res!1070559) (not e!872937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566149 (= res!1070559 (validKeyInArray!0 (select (arr!50493 _keys!637) from!782)))))

(declare-fun b!1566150 () Bool)

(declare-fun res!1070556 () Bool)

(assert (=> b!1566150 (=> (not res!1070556) (not e!872937))))

(assert (=> b!1566150 (= res!1070556 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51043 _keys!637)) (bvslt from!782 (size!51043 _keys!637))))))

(declare-fun b!1566151 () Bool)

(declare-fun apply!1119 (ListLongMap!22679 (_ BitVec 64)) V!60157)

(assert (=> b!1566151 (= e!872938 (= (apply!1119 lt!672563 (select (arr!50493 _keys!637) from!782)) lt!672565))))

(declare-fun mapIsEmpty!59836 () Bool)

(declare-fun mapRes!59836 () Bool)

(assert (=> mapIsEmpty!59836 mapRes!59836))

(declare-fun b!1566152 () Bool)

(declare-fun e!872935 () Bool)

(assert (=> b!1566152 (= e!872935 tp_is_empty!38963)))

(declare-fun b!1566153 () Bool)

(assert (=> b!1566153 (= e!872934 (and e!872933 mapRes!59836))))

(declare-fun condMapEmpty!59836 () Bool)

(declare-fun mapDefault!59836 () ValueCell!18451)

