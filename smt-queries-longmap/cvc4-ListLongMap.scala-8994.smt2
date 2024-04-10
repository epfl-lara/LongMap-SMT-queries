; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108728 () Bool)

(assert start!108728)

(declare-fun b_free!28241 () Bool)

(declare-fun b_next!28241 () Bool)

(assert (=> start!108728 (= b_free!28241 (not b_next!28241))))

(declare-fun tp!99839 () Bool)

(declare-fun b_and!46307 () Bool)

(assert (=> start!108728 (= tp!99839 b_and!46307)))

(declare-fun res!852803 () Bool)

(declare-fun e!733368 () Bool)

(assert (=> start!108728 (=> (not res!852803) (not e!733368))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108728 (= res!852803 (validMask!0 mask!2175))))

(assert (=> start!108728 e!733368))

(declare-fun tp_is_empty!33881 () Bool)

(assert (=> start!108728 tp_is_empty!33881))

(assert (=> start!108728 true))

(declare-datatypes ((V!50277 0))(
  ( (V!50278 (val!17015 Int)) )
))
(declare-datatypes ((ValueCell!16042 0))(
  ( (ValueCellFull!16042 (v!19617 V!50277)) (EmptyCell!16042) )
))
(declare-datatypes ((array!84824 0))(
  ( (array!84825 (arr!40914 (Array (_ BitVec 32) ValueCell!16042)) (size!41464 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84824)

(declare-fun e!733370 () Bool)

(declare-fun array_inv!31033 (array!84824) Bool)

(assert (=> start!108728 (and (array_inv!31033 _values!1445) e!733370)))

(declare-datatypes ((array!84826 0))(
  ( (array!84827 (arr!40915 (Array (_ BitVec 32) (_ BitVec 64))) (size!41465 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84826)

(declare-fun array_inv!31034 (array!84826) Bool)

(assert (=> start!108728 (array_inv!31034 _keys!1741)))

(assert (=> start!108728 tp!99839))

(declare-fun b!1283776 () Bool)

(declare-fun res!852799 () Bool)

(assert (=> b!1283776 (=> (not res!852799) (not e!733368))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283776 (= res!852799 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41465 _keys!1741))))))

(declare-fun b!1283777 () Bool)

(declare-fun e!733366 () Bool)

(assert (=> b!1283777 (= e!733366 tp_is_empty!33881)))

(declare-fun mapIsEmpty!52379 () Bool)

(declare-fun mapRes!52379 () Bool)

(assert (=> mapIsEmpty!52379 mapRes!52379))

(declare-fun mapNonEmpty!52379 () Bool)

(declare-fun tp!99838 () Bool)

(declare-fun e!733369 () Bool)

(assert (=> mapNonEmpty!52379 (= mapRes!52379 (and tp!99838 e!733369))))

(declare-fun mapKey!52379 () (_ BitVec 32))

(declare-fun mapValue!52379 () ValueCell!16042)

(declare-fun mapRest!52379 () (Array (_ BitVec 32) ValueCell!16042))

(assert (=> mapNonEmpty!52379 (= (arr!40914 _values!1445) (store mapRest!52379 mapKey!52379 mapValue!52379))))

(declare-fun b!1283778 () Bool)

(assert (=> b!1283778 (= e!733368 (not true))))

(declare-datatypes ((tuple2!21792 0))(
  ( (tuple2!21793 (_1!10907 (_ BitVec 64)) (_2!10907 V!50277)) )
))
(declare-datatypes ((List!28988 0))(
  ( (Nil!28985) (Cons!28984 (h!30193 tuple2!21792) (t!42532 List!28988)) )
))
(declare-datatypes ((ListLongMap!19449 0))(
  ( (ListLongMap!19450 (toList!9740 List!28988)) )
))
(declare-fun lt!576712 () ListLongMap!19449)

(declare-fun contains!7857 (ListLongMap!19449 (_ BitVec 64)) Bool)

(assert (=> b!1283778 (contains!7857 lt!576712 k!1205)))

(declare-fun minValue!1387 () V!50277)

(declare-datatypes ((Unit!42487 0))(
  ( (Unit!42488) )
))
(declare-fun lt!576711 () Unit!42487)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!14 ((_ BitVec 64) (_ BitVec 64) V!50277 ListLongMap!19449) Unit!42487)

(assert (=> b!1283778 (= lt!576711 (lemmaInListMapAfterAddingDiffThenInBefore!14 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576712))))

(declare-fun zeroValue!1387 () V!50277)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4290 (ListLongMap!19449 tuple2!21792) ListLongMap!19449)

(declare-fun getCurrentListMapNoExtraKeys!5920 (array!84826 array!84824 (_ BitVec 32) (_ BitVec 32) V!50277 V!50277 (_ BitVec 32) Int) ListLongMap!19449)

(assert (=> b!1283778 (= lt!576712 (+!4290 (getCurrentListMapNoExtraKeys!5920 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283779 () Bool)

(declare-fun res!852802 () Bool)

(assert (=> b!1283779 (=> (not res!852802) (not e!733368))))

(assert (=> b!1283779 (= res!852802 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283780 () Bool)

(assert (=> b!1283780 (= e!733369 tp_is_empty!33881)))

(declare-fun b!1283781 () Bool)

(declare-fun res!852800 () Bool)

(assert (=> b!1283781 (=> (not res!852800) (not e!733368))))

(assert (=> b!1283781 (= res!852800 (and (= (size!41464 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41465 _keys!1741) (size!41464 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283782 () Bool)

(declare-fun res!852805 () Bool)

(assert (=> b!1283782 (=> (not res!852805) (not e!733368))))

(declare-datatypes ((List!28989 0))(
  ( (Nil!28986) (Cons!28985 (h!30194 (_ BitVec 64)) (t!42533 List!28989)) )
))
(declare-fun arrayNoDuplicates!0 (array!84826 (_ BitVec 32) List!28989) Bool)

(assert (=> b!1283782 (= res!852805 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28986))))

(declare-fun b!1283783 () Bool)

(assert (=> b!1283783 (= e!733370 (and e!733366 mapRes!52379))))

(declare-fun condMapEmpty!52379 () Bool)

(declare-fun mapDefault!52379 () ValueCell!16042)

