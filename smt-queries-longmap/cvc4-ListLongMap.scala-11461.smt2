; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133568 () Bool)

(assert start!133568)

(declare-fun b_free!31985 () Bool)

(declare-fun b_next!31985 () Bool)

(assert (=> start!133568 (= b_free!31985 (not b_next!31985))))

(declare-fun tp!113079 () Bool)

(declare-fun b_and!51481 () Bool)

(assert (=> start!133568 (= tp!113079 b_and!51481)))

(declare-fun mapNonEmpty!59352 () Bool)

(declare-fun mapRes!59352 () Bool)

(declare-fun tp!113078 () Bool)

(declare-fun e!870210 () Bool)

(assert (=> mapNonEmpty!59352 (= mapRes!59352 (and tp!113078 e!870210))))

(declare-datatypes ((V!59741 0))(
  ( (V!59742 (val!19409 Int)) )
))
(declare-datatypes ((ValueCell!18295 0))(
  ( (ValueCellFull!18295 (v!22161 V!59741)) (EmptyCell!18295) )
))
(declare-datatypes ((array!104020 0))(
  ( (array!104021 (arr!50202 (Array (_ BitVec 32) ValueCell!18295)) (size!50752 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104020)

(declare-fun mapKey!59352 () (_ BitVec 32))

(declare-fun mapRest!59352 () (Array (_ BitVec 32) ValueCell!18295))

(declare-fun mapValue!59352 () ValueCell!18295)

(assert (=> mapNonEmpty!59352 (= (arr!50202 _values!487) (store mapRest!59352 mapKey!59352 mapValue!59352))))

(declare-fun b!1561558 () Bool)

(declare-fun res!1067703 () Bool)

(declare-fun e!870213 () Bool)

(assert (=> b!1561558 (=> (not res!1067703) (not e!870213))))

(declare-datatypes ((array!104022 0))(
  ( (array!104023 (arr!50203 (Array (_ BitVec 32) (_ BitVec 64))) (size!50753 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104022)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561558 (= res!1067703 (validKeyInArray!0 (select (arr!50203 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59352 () Bool)

(assert (=> mapIsEmpty!59352 mapRes!59352))

(declare-fun b!1561559 () Bool)

(declare-fun tp_is_empty!38651 () Bool)

(assert (=> b!1561559 (= e!870210 tp_is_empty!38651)))

(declare-fun b!1561560 () Bool)

(declare-fun res!1067700 () Bool)

(assert (=> b!1561560 (=> (not res!1067700) (not e!870213))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561560 (= res!1067700 (and (= (size!50752 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50753 _keys!637) (size!50752 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561561 () Bool)

(declare-fun e!870212 () Bool)

(assert (=> b!1561561 (= e!870212 tp_is_empty!38651)))

(declare-fun b!1561562 () Bool)

(declare-fun res!1067699 () Bool)

(assert (=> b!1561562 (=> (not res!1067699) (not e!870213))))

(declare-datatypes ((List!36445 0))(
  ( (Nil!36442) (Cons!36441 (h!37887 (_ BitVec 64)) (t!51220 List!36445)) )
))
(declare-fun arrayNoDuplicates!0 (array!104022 (_ BitVec 32) List!36445) Bool)

(assert (=> b!1561562 (= res!1067699 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36442))))

(declare-fun b!1561563 () Bool)

(declare-fun res!1067701 () Bool)

(assert (=> b!1561563 (=> (not res!1067701) (not e!870213))))

(assert (=> b!1561563 (= res!1067701 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50753 _keys!637)) (bvslt from!782 (size!50753 _keys!637))))))

(declare-fun b!1561565 () Bool)

(assert (=> b!1561565 (= e!870213 (not true))))

(declare-fun lt!671249 () V!59741)

(declare-datatypes ((tuple2!25076 0))(
  ( (tuple2!25077 (_1!12549 (_ BitVec 64)) (_2!12549 V!59741)) )
))
(declare-datatypes ((List!36446 0))(
  ( (Nil!36443) (Cons!36442 (h!37888 tuple2!25076) (t!51221 List!36446)) )
))
(declare-datatypes ((ListLongMap!22511 0))(
  ( (ListLongMap!22512 (toList!11271 List!36446)) )
))
(declare-fun lt!671250 () ListLongMap!22511)

(declare-fun contains!10261 (ListLongMap!22511 (_ BitVec 64)) Bool)

(declare-fun +!5041 (ListLongMap!22511 tuple2!25076) ListLongMap!22511)

(assert (=> b!1561565 (not (contains!10261 (+!5041 lt!671250 (tuple2!25077 (select (arr!50203 _keys!637) from!782) lt!671249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51936 0))(
  ( (Unit!51937) )
))
(declare-fun lt!671248 () Unit!51936)

(declare-fun addStillNotContains!531 (ListLongMap!22511 (_ BitVec 64) V!59741 (_ BitVec 64)) Unit!51936)

(assert (=> b!1561565 (= lt!671248 (addStillNotContains!531 lt!671250 (select (arr!50203 _keys!637) from!782) lt!671249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26212 (ValueCell!18295 V!59741) V!59741)

(declare-fun dynLambda!3825 (Int (_ BitVec 64)) V!59741)

(assert (=> b!1561565 (= lt!671249 (get!26212 (select (arr!50202 _values!487) from!782) (dynLambda!3825 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59741)

(declare-fun minValue!453 () V!59741)

(declare-fun getCurrentListMapNoExtraKeys!6655 (array!104022 array!104020 (_ BitVec 32) (_ BitVec 32) V!59741 V!59741 (_ BitVec 32) Int) ListLongMap!22511)

(assert (=> b!1561565 (= lt!671250 (getCurrentListMapNoExtraKeys!6655 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561566 () Bool)

(declare-fun e!870214 () Bool)

(assert (=> b!1561566 (= e!870214 (and e!870212 mapRes!59352))))

(declare-fun condMapEmpty!59352 () Bool)

(declare-fun mapDefault!59352 () ValueCell!18295)

