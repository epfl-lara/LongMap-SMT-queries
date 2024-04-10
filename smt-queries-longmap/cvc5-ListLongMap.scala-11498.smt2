; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133796 () Bool)

(assert start!133796)

(declare-fun b!1564484 () Bool)

(declare-fun e!871974 () Bool)

(assert (=> b!1564484 (= e!871974 false)))

(declare-fun lt!672045 () Bool)

(declare-datatypes ((V!60033 0))(
  ( (V!60034 (val!19518 Int)) )
))
(declare-datatypes ((tuple2!25184 0))(
  ( (tuple2!25185 (_1!12603 (_ BitVec 64)) (_2!12603 V!60033)) )
))
(declare-datatypes ((List!36570 0))(
  ( (Nil!36567) (Cons!36566 (h!38012 tuple2!25184) (t!51417 List!36570)) )
))
(declare-datatypes ((ListLongMap!22619 0))(
  ( (ListLongMap!22620 (toList!11325 List!36570)) )
))
(declare-fun contains!10316 (ListLongMap!22619 (_ BitVec 64)) Bool)

(assert (=> b!1564484 (= lt!672045 (contains!10316 (ListLongMap!22620 Nil!36567) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59682 () Bool)

(declare-fun mapRes!59682 () Bool)

(declare-fun tp!113607 () Bool)

(declare-fun e!871972 () Bool)

(assert (=> mapNonEmpty!59682 (= mapRes!59682 (and tp!113607 e!871972))))

(declare-datatypes ((ValueCell!18404 0))(
  ( (ValueCellFull!18404 (v!22270 V!60033)) (EmptyCell!18404) )
))
(declare-fun mapValue!59682 () ValueCell!18404)

(declare-fun mapRest!59682 () (Array (_ BitVec 32) ValueCell!18404))

(declare-datatypes ((array!104428 0))(
  ( (array!104429 (arr!50405 (Array (_ BitVec 32) ValueCell!18404)) (size!50955 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104428)

(declare-fun mapKey!59682 () (_ BitVec 32))

(assert (=> mapNonEmpty!59682 (= (arr!50405 _values!487) (store mapRest!59682 mapKey!59682 mapValue!59682))))

(declare-fun res!1069550 () Bool)

(assert (=> start!133796 (=> (not res!1069550) (not e!871974))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133796 (= res!1069550 (validMask!0 mask!947))))

(assert (=> start!133796 e!871974))

(assert (=> start!133796 true))

(declare-datatypes ((array!104430 0))(
  ( (array!104431 (arr!50406 (Array (_ BitVec 32) (_ BitVec 64))) (size!50956 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104430)

(declare-fun array_inv!39173 (array!104430) Bool)

(assert (=> start!133796 (array_inv!39173 _keys!637)))

(declare-fun e!871975 () Bool)

(declare-fun array_inv!39174 (array!104428) Bool)

(assert (=> start!133796 (and (array_inv!39174 _values!487) e!871975)))

(declare-fun b!1564485 () Bool)

(declare-fun tp_is_empty!38869 () Bool)

(assert (=> b!1564485 (= e!871972 tp_is_empty!38869)))

(declare-fun b!1564486 () Bool)

(declare-fun e!871973 () Bool)

(assert (=> b!1564486 (= e!871973 tp_is_empty!38869)))

(declare-fun b!1564487 () Bool)

(declare-fun res!1069554 () Bool)

(assert (=> b!1564487 (=> (not res!1069554) (not e!871974))))

(declare-datatypes ((List!36571 0))(
  ( (Nil!36568) (Cons!36567 (h!38013 (_ BitVec 64)) (t!51418 List!36571)) )
))
(declare-fun arrayNoDuplicates!0 (array!104430 (_ BitVec 32) List!36571) Bool)

(assert (=> b!1564487 (= res!1069554 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36568))))

(declare-fun b!1564488 () Bool)

(declare-fun res!1069553 () Bool)

(assert (=> b!1564488 (=> (not res!1069553) (not e!871974))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564488 (= res!1069553 (and (= (size!50955 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50956 _keys!637) (size!50955 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564489 () Bool)

(declare-fun res!1069551 () Bool)

(assert (=> b!1564489 (=> (not res!1069551) (not e!871974))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564489 (= res!1069551 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50956 _keys!637)) (bvsge from!782 (size!50956 _keys!637))))))

(declare-fun b!1564490 () Bool)

(declare-fun res!1069552 () Bool)

(assert (=> b!1564490 (=> (not res!1069552) (not e!871974))))

(assert (=> b!1564490 (= res!1069552 (not (contains!10316 (ListLongMap!22620 Nil!36567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564491 () Bool)

(assert (=> b!1564491 (= e!871975 (and e!871973 mapRes!59682))))

(declare-fun condMapEmpty!59682 () Bool)

(declare-fun mapDefault!59682 () ValueCell!18404)

