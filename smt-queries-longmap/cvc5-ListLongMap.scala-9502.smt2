; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112678 () Bool)

(assert start!112678)

(declare-fun b_free!31015 () Bool)

(declare-fun b_next!31015 () Bool)

(assert (=> start!112678 (= b_free!31015 (not b_next!31015))))

(declare-fun tp!108685 () Bool)

(declare-fun b_and!49967 () Bool)

(assert (=> start!112678 (= tp!108685 b_and!49967)))

(declare-fun b!1336595 () Bool)

(declare-fun res!887018 () Bool)

(declare-fun e!761136 () Bool)

(assert (=> b!1336595 (=> (not res!887018) (not e!761136))))

(declare-datatypes ((V!54337 0))(
  ( (V!54338 (val!18537 Int)) )
))
(declare-datatypes ((ValueCell!17564 0))(
  ( (ValueCellFull!17564 (v!21177 V!54337)) (EmptyCell!17564) )
))
(declare-datatypes ((array!90708 0))(
  ( (array!90709 (arr!43819 (Array (_ BitVec 32) ValueCell!17564)) (size!44369 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90708)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90710 0))(
  ( (array!90711 (arr!43820 (Array (_ BitVec 32) (_ BitVec 64))) (size!44370 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90710)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54337)

(declare-fun zeroValue!1262 () V!54337)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23908 0))(
  ( (tuple2!23909 (_1!11965 (_ BitVec 64)) (_2!11965 V!54337)) )
))
(declare-datatypes ((List!31050 0))(
  ( (Nil!31047) (Cons!31046 (h!32255 tuple2!23908) (t!45346 List!31050)) )
))
(declare-datatypes ((ListLongMap!21565 0))(
  ( (ListLongMap!21566 (toList!10798 List!31050)) )
))
(declare-fun contains!8963 (ListLongMap!21565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5770 (array!90710 array!90708 (_ BitVec 32) (_ BitVec 32) V!54337 V!54337 (_ BitVec 32) Int) ListLongMap!21565)

(assert (=> b!1336595 (= res!887018 (contains!8963 (getCurrentListMap!5770 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1336597 () Bool)

(declare-fun res!887022 () Bool)

(assert (=> b!1336597 (=> (not res!887022) (not e!761136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336597 (= res!887022 (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)))))

(declare-fun b!1336598 () Bool)

(declare-fun res!887019 () Bool)

(assert (=> b!1336598 (=> (not res!887019) (not e!761136))))

(assert (=> b!1336598 (= res!887019 (and (= (size!44369 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44370 _keys!1590) (size!44369 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336599 () Bool)

(declare-fun res!887023 () Bool)

(assert (=> b!1336599 (=> (not res!887023) (not e!761136))))

(declare-datatypes ((List!31051 0))(
  ( (Nil!31048) (Cons!31047 (h!32256 (_ BitVec 64)) (t!45347 List!31051)) )
))
(declare-fun arrayNoDuplicates!0 (array!90710 (_ BitVec 32) List!31051) Bool)

(assert (=> b!1336599 (= res!887023 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31048))))

(declare-fun b!1336600 () Bool)

(assert (=> b!1336600 (= e!761136 (not (not (= k!1153 (select (arr!43820 _keys!1590) from!1980)))))))

(declare-fun lt!592799 () ListLongMap!21565)

(assert (=> b!1336600 (contains!8963 lt!592799 k!1153)))

(declare-datatypes ((Unit!43928 0))(
  ( (Unit!43929) )
))
(declare-fun lt!592798 () Unit!43928)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!319 ((_ BitVec 64) (_ BitVec 64) V!54337 ListLongMap!21565) Unit!43928)

(assert (=> b!1336600 (= lt!592798 (lemmaInListMapAfterAddingDiffThenInBefore!319 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592799))))

(declare-fun +!4740 (ListLongMap!21565 tuple2!23908) ListLongMap!21565)

(declare-fun getCurrentListMapNoExtraKeys!6382 (array!90710 array!90708 (_ BitVec 32) (_ BitVec 32) V!54337 V!54337 (_ BitVec 32) Int) ListLongMap!21565)

(declare-fun get!22111 (ValueCell!17564 V!54337) V!54337)

(declare-fun dynLambda!3679 (Int (_ BitVec 64)) V!54337)

(assert (=> b!1336600 (= lt!592799 (+!4740 (getCurrentListMapNoExtraKeys!6382 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23909 (select (arr!43820 _keys!1590) from!1980) (get!22111 (select (arr!43819 _values!1320) from!1980) (dynLambda!3679 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336601 () Bool)

(declare-fun e!761140 () Bool)

(declare-fun tp_is_empty!36925 () Bool)

(assert (=> b!1336601 (= e!761140 tp_is_empty!36925)))

(declare-fun mapIsEmpty!57065 () Bool)

(declare-fun mapRes!57065 () Bool)

(assert (=> mapIsEmpty!57065 mapRes!57065))

(declare-fun b!1336602 () Bool)

(declare-fun e!761137 () Bool)

(assert (=> b!1336602 (= e!761137 tp_is_empty!36925)))

(declare-fun b!1336603 () Bool)

(declare-fun res!887017 () Bool)

(assert (=> b!1336603 (=> (not res!887017) (not e!761136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90710 (_ BitVec 32)) Bool)

(assert (=> b!1336603 (= res!887017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!887021 () Bool)

(assert (=> start!112678 (=> (not res!887021) (not e!761136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112678 (= res!887021 (validMask!0 mask!1998))))

(assert (=> start!112678 e!761136))

(declare-fun e!761139 () Bool)

(declare-fun array_inv!33045 (array!90708) Bool)

(assert (=> start!112678 (and (array_inv!33045 _values!1320) e!761139)))

(assert (=> start!112678 true))

(declare-fun array_inv!33046 (array!90710) Bool)

(assert (=> start!112678 (array_inv!33046 _keys!1590)))

(assert (=> start!112678 tp!108685))

(assert (=> start!112678 tp_is_empty!36925))

(declare-fun b!1336596 () Bool)

(declare-fun res!887024 () Bool)

(assert (=> b!1336596 (=> (not res!887024) (not e!761136))))

(assert (=> b!1336596 (= res!887024 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336604 () Bool)

(declare-fun res!887016 () Bool)

(assert (=> b!1336604 (=> (not res!887016) (not e!761136))))

(assert (=> b!1336604 (= res!887016 (not (= (select (arr!43820 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1336605 () Bool)

(assert (=> b!1336605 (= e!761139 (and e!761137 mapRes!57065))))

(declare-fun condMapEmpty!57065 () Bool)

(declare-fun mapDefault!57065 () ValueCell!17564)

