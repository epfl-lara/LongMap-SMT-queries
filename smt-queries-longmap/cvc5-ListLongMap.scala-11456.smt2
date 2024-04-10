; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133534 () Bool)

(assert start!133534)

(declare-fun b_free!31951 () Bool)

(declare-fun b_next!31951 () Bool)

(assert (=> start!133534 (= b_free!31951 (not b_next!31951))))

(declare-fun tp!112976 () Bool)

(declare-fun b_and!51413 () Bool)

(assert (=> start!133534 (= tp!112976 b_and!51413)))

(declare-fun b!1561065 () Bool)

(declare-fun e!869956 () Bool)

(declare-fun tp_is_empty!38617 () Bool)

(assert (=> b!1561065 (= e!869956 tp_is_empty!38617)))

(declare-fun b!1561066 () Bool)

(declare-fun res!1067393 () Bool)

(declare-fun e!869955 () Bool)

(assert (=> b!1561066 (=> (not res!1067393) (not e!869955))))

(declare-datatypes ((array!103952 0))(
  ( (array!103953 (arr!50168 (Array (_ BitVec 32) (_ BitVec 64))) (size!50718 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103952)

(declare-datatypes ((List!36419 0))(
  ( (Nil!36416) (Cons!36415 (h!37861 (_ BitVec 64)) (t!51160 List!36419)) )
))
(declare-fun arrayNoDuplicates!0 (array!103952 (_ BitVec 32) List!36419) Bool)

(assert (=> b!1561066 (= res!1067393 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36416))))

(declare-fun mapIsEmpty!59301 () Bool)

(declare-fun mapRes!59301 () Bool)

(assert (=> mapIsEmpty!59301 mapRes!59301))

(declare-fun b!1561067 () Bool)

(declare-fun res!1067392 () Bool)

(assert (=> b!1561067 (=> (not res!1067392) (not e!869955))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59697 0))(
  ( (V!59698 (val!19392 Int)) )
))
(declare-datatypes ((ValueCell!18278 0))(
  ( (ValueCellFull!18278 (v!22144 V!59697)) (EmptyCell!18278) )
))
(declare-datatypes ((array!103954 0))(
  ( (array!103955 (arr!50169 (Array (_ BitVec 32) ValueCell!18278)) (size!50719 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103954)

(assert (=> b!1561067 (= res!1067392 (and (= (size!50719 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50718 _keys!637) (size!50719 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561068 () Bool)

(declare-fun res!1067395 () Bool)

(assert (=> b!1561068 (=> (not res!1067395) (not e!869955))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561068 (= res!1067395 (validKeyInArray!0 (select (arr!50168 _keys!637) from!782)))))

(declare-fun b!1561069 () Bool)

(declare-fun e!869957 () Bool)

(assert (=> b!1561069 (= e!869957 tp_is_empty!38617)))

(declare-fun res!1067396 () Bool)

(assert (=> start!133534 (=> (not res!1067396) (not e!869955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133534 (= res!1067396 (validMask!0 mask!947))))

(assert (=> start!133534 e!869955))

(assert (=> start!133534 tp!112976))

(assert (=> start!133534 tp_is_empty!38617))

(assert (=> start!133534 true))

(declare-fun array_inv!38997 (array!103952) Bool)

(assert (=> start!133534 (array_inv!38997 _keys!637)))

(declare-fun e!869958 () Bool)

(declare-fun array_inv!38998 (array!103954) Bool)

(assert (=> start!133534 (and (array_inv!38998 _values!487) e!869958)))

(declare-fun b!1561070 () Bool)

(assert (=> b!1561070 (= e!869955 (not true))))

(declare-fun lt!671097 () V!59697)

(declare-datatypes ((tuple2!25046 0))(
  ( (tuple2!25047 (_1!12534 (_ BitVec 64)) (_2!12534 V!59697)) )
))
(declare-datatypes ((List!36420 0))(
  ( (Nil!36417) (Cons!36416 (h!37862 tuple2!25046) (t!51161 List!36420)) )
))
(declare-datatypes ((ListLongMap!22481 0))(
  ( (ListLongMap!22482 (toList!11256 List!36420)) )
))
(declare-fun lt!671095 () ListLongMap!22481)

(declare-fun contains!10246 (ListLongMap!22481 (_ BitVec 64)) Bool)

(declare-fun +!5026 (ListLongMap!22481 tuple2!25046) ListLongMap!22481)

(assert (=> b!1561070 (not (contains!10246 (+!5026 lt!671095 (tuple2!25047 (select (arr!50168 _keys!637) from!782) lt!671097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51906 0))(
  ( (Unit!51907) )
))
(declare-fun lt!671096 () Unit!51906)

(declare-fun addStillNotContains!516 (ListLongMap!22481 (_ BitVec 64) V!59697 (_ BitVec 64)) Unit!51906)

(assert (=> b!1561070 (= lt!671096 (addStillNotContains!516 lt!671095 (select (arr!50168 _keys!637) from!782) lt!671097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26187 (ValueCell!18278 V!59697) V!59697)

(declare-fun dynLambda!3810 (Int (_ BitVec 64)) V!59697)

(assert (=> b!1561070 (= lt!671097 (get!26187 (select (arr!50169 _values!487) from!782) (dynLambda!3810 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59697)

(declare-fun minValue!453 () V!59697)

(declare-fun getCurrentListMapNoExtraKeys!6640 (array!103952 array!103954 (_ BitVec 32) (_ BitVec 32) V!59697 V!59697 (_ BitVec 32) Int) ListLongMap!22481)

(assert (=> b!1561070 (= lt!671095 (getCurrentListMapNoExtraKeys!6640 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59301 () Bool)

(declare-fun tp!112977 () Bool)

(assert (=> mapNonEmpty!59301 (= mapRes!59301 (and tp!112977 e!869956))))

(declare-fun mapRest!59301 () (Array (_ BitVec 32) ValueCell!18278))

(declare-fun mapValue!59301 () ValueCell!18278)

(declare-fun mapKey!59301 () (_ BitVec 32))

(assert (=> mapNonEmpty!59301 (= (arr!50169 _values!487) (store mapRest!59301 mapKey!59301 mapValue!59301))))

(declare-fun b!1561071 () Bool)

(declare-fun res!1067394 () Bool)

(assert (=> b!1561071 (=> (not res!1067394) (not e!869955))))

(assert (=> b!1561071 (= res!1067394 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50718 _keys!637)) (bvslt from!782 (size!50718 _keys!637))))))

(declare-fun b!1561072 () Bool)

(assert (=> b!1561072 (= e!869958 (and e!869957 mapRes!59301))))

(declare-fun condMapEmpty!59301 () Bool)

(declare-fun mapDefault!59301 () ValueCell!18278)

