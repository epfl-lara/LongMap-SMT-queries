; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134110 () Bool)

(assert start!134110)

(declare-fun b_free!32221 () Bool)

(declare-fun b_next!32221 () Bool)

(assert (=> start!134110 (= b_free!32221 (not b_next!32221))))

(declare-fun tp!113984 () Bool)

(declare-fun b_and!51869 () Bool)

(assert (=> start!134110 (= tp!113984 b_and!51869)))

(declare-fun b!1567367 () Bool)

(declare-fun res!1071212 () Bool)

(declare-fun e!873694 () Bool)

(assert (=> b!1567367 (=> (not res!1071212) (not e!873694))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104692 0))(
  ( (array!104693 (arr!50530 (Array (_ BitVec 32) (_ BitVec 64))) (size!51080 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104692)

(assert (=> b!1567367 (= res!1071212 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51080 _keys!637)) (bvslt from!782 (size!51080 _keys!637))))))

(declare-fun b!1567368 () Bool)

(declare-fun e!873695 () Bool)

(declare-datatypes ((V!60209 0))(
  ( (V!60210 (val!19584 Int)) )
))
(declare-datatypes ((tuple2!25270 0))(
  ( (tuple2!25271 (_1!12646 (_ BitVec 64)) (_2!12646 V!60209)) )
))
(declare-datatypes ((List!36656 0))(
  ( (Nil!36653) (Cons!36652 (h!38099 tuple2!25270) (t!51562 List!36656)) )
))
(declare-datatypes ((ListLongMap!22705 0))(
  ( (ListLongMap!22706 (toList!11368 List!36656)) )
))
(declare-fun lt!672933 () ListLongMap!22705)

(declare-fun contains!10363 (ListLongMap!22705 (_ BitVec 64)) Bool)

(assert (=> b!1567368 (= e!873695 (contains!10363 lt!672933 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567369 () Bool)

(declare-fun res!1071208 () Bool)

(assert (=> b!1567369 (=> (not res!1071208) (not e!873694))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104692 (_ BitVec 32)) Bool)

(assert (=> b!1567369 (= res!1071208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567370 () Bool)

(declare-fun e!873699 () Bool)

(declare-fun tp_is_empty!39001 () Bool)

(assert (=> b!1567370 (= e!873699 tp_is_empty!39001)))

(declare-fun b!1567371 () Bool)

(declare-fun res!1071207 () Bool)

(assert (=> b!1567371 (=> (not res!1071207) (not e!873694))))

(declare-datatypes ((List!36657 0))(
  ( (Nil!36654) (Cons!36653 (h!38100 (_ BitVec 64)) (t!51563 List!36657)) )
))
(declare-fun arrayNoDuplicates!0 (array!104692 (_ BitVec 32) List!36657) Bool)

(assert (=> b!1567371 (= res!1071207 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36654))))

(declare-fun mapIsEmpty!59904 () Bool)

(declare-fun mapRes!59904 () Bool)

(assert (=> mapIsEmpty!59904 mapRes!59904))

(declare-fun b!1567372 () Bool)

(declare-fun res!1071206 () Bool)

(assert (=> b!1567372 (=> (not res!1071206) (not e!873694))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18470 0))(
  ( (ValueCellFull!18470 (v!22344 V!60209)) (EmptyCell!18470) )
))
(declare-datatypes ((array!104694 0))(
  ( (array!104695 (arr!50531 (Array (_ BitVec 32) ValueCell!18470)) (size!51081 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104694)

(assert (=> b!1567372 (= res!1071206 (and (= (size!51081 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51080 _keys!637) (size!51081 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567373 () Bool)

(declare-fun e!873697 () Bool)

(assert (=> b!1567373 (= e!873697 tp_is_empty!39001)))

(declare-fun b!1567375 () Bool)

(assert (=> b!1567375 (= e!873694 e!873695)))

(declare-fun res!1071209 () Bool)

(assert (=> b!1567375 (=> res!1071209 e!873695)))

(assert (=> b!1567375 (= res!1071209 (contains!10363 lt!672933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60209)

(declare-fun minValue!453 () V!60209)

(declare-fun getCurrentListMapNoExtraKeys!6733 (array!104692 array!104694 (_ BitVec 32) (_ BitVec 32) V!60209 V!60209 (_ BitVec 32) Int) ListLongMap!22705)

(assert (=> b!1567375 (= lt!672933 (getCurrentListMapNoExtraKeys!6733 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567376 () Bool)

(declare-fun e!873696 () Bool)

(assert (=> b!1567376 (= e!873696 (and e!873697 mapRes!59904))))

(declare-fun condMapEmpty!59904 () Bool)

(declare-fun mapDefault!59904 () ValueCell!18470)

