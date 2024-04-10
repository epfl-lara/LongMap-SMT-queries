; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113232 () Bool)

(assert start!113232)

(declare-fun b_free!31283 () Bool)

(declare-fun b_next!31283 () Bool)

(assert (=> start!113232 (= b_free!31283 (not b_next!31283))))

(declare-fun tp!109654 () Bool)

(declare-fun b_and!50473 () Bool)

(assert (=> start!113232 (= tp!109654 b_and!50473)))

(declare-fun b!1343271 () Bool)

(declare-fun e!764601 () Bool)

(assert (=> b!1343271 (= e!764601 (not true))))

(declare-datatypes ((V!54813 0))(
  ( (V!54814 (val!18716 Int)) )
))
(declare-datatypes ((tuple2!24110 0))(
  ( (tuple2!24111 (_1!12066 (_ BitVec 64)) (_2!12066 V!54813)) )
))
(declare-datatypes ((List!31268 0))(
  ( (Nil!31265) (Cons!31264 (h!32473 tuple2!24110) (t!45762 List!31268)) )
))
(declare-datatypes ((ListLongMap!21767 0))(
  ( (ListLongMap!21768 (toList!10899 List!31268)) )
))
(declare-fun lt!594846 () ListLongMap!21767)

(declare-fun zeroValue!1245 () V!54813)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9075 (ListLongMap!21767 (_ BitVec 64)) Bool)

(declare-fun +!4807 (ListLongMap!21767 tuple2!24110) ListLongMap!21767)

(assert (=> b!1343271 (contains!9075 (+!4807 lt!594846 (tuple2!24111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44091 0))(
  ( (Unit!44092) )
))
(declare-fun lt!594844 () Unit!44091)

(declare-fun addStillContains!1200 (ListLongMap!21767 (_ BitVec 64) V!54813 (_ BitVec 64)) Unit!44091)

(assert (=> b!1343271 (= lt!594844 (addStillContains!1200 lt!594846 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343271 (contains!9075 lt!594846 k!1142)))

(declare-fun lt!594845 () Unit!44091)

(declare-datatypes ((array!91412 0))(
  ( (array!91413 (arr!44162 (Array (_ BitVec 32) (_ BitVec 64))) (size!44712 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91412)

(declare-fun lt!594849 () V!54813)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!376 ((_ BitVec 64) (_ BitVec 64) V!54813 ListLongMap!21767) Unit!44091)

(assert (=> b!1343271 (= lt!594845 (lemmaInListMapAfterAddingDiffThenInBefore!376 k!1142 (select (arr!44162 _keys!1571) from!1960) lt!594849 lt!594846))))

(declare-fun lt!594847 () ListLongMap!21767)

(assert (=> b!1343271 (contains!9075 lt!594847 k!1142)))

(declare-fun lt!594848 () Unit!44091)

(assert (=> b!1343271 (= lt!594848 (lemmaInListMapAfterAddingDiffThenInBefore!376 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594847))))

(assert (=> b!1343271 (= lt!594847 (+!4807 lt!594846 (tuple2!24111 (select (arr!44162 _keys!1571) from!1960) lt!594849)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17743 0))(
  ( (ValueCellFull!17743 (v!21364 V!54813)) (EmptyCell!17743) )
))
(declare-datatypes ((array!91414 0))(
  ( (array!91415 (arr!44163 (Array (_ BitVec 32) ValueCell!17743)) (size!44713 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91414)

(declare-fun get!22306 (ValueCell!17743 V!54813) V!54813)

(declare-fun dynLambda!3746 (Int (_ BitVec 64)) V!54813)

(assert (=> b!1343271 (= lt!594849 (get!22306 (select (arr!44163 _values!1303) from!1960) (dynLambda!3746 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54813)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6449 (array!91412 array!91414 (_ BitVec 32) (_ BitVec 32) V!54813 V!54813 (_ BitVec 32) Int) ListLongMap!21767)

(assert (=> b!1343271 (= lt!594846 (getCurrentListMapNoExtraKeys!6449 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343272 () Bool)

(declare-fun e!764599 () Bool)

(declare-fun tp_is_empty!37283 () Bool)

(assert (=> b!1343272 (= e!764599 tp_is_empty!37283)))

(declare-fun b!1343273 () Bool)

(declare-fun e!764600 () Bool)

(assert (=> b!1343273 (= e!764600 tp_is_empty!37283)))

(declare-fun b!1343274 () Bool)

(declare-fun res!891225 () Bool)

(assert (=> b!1343274 (=> (not res!891225) (not e!764601))))

(declare-datatypes ((List!31269 0))(
  ( (Nil!31266) (Cons!31265 (h!32474 (_ BitVec 64)) (t!45763 List!31269)) )
))
(declare-fun arrayNoDuplicates!0 (array!91412 (_ BitVec 32) List!31269) Bool)

(assert (=> b!1343274 (= res!891225 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31266))))

(declare-fun b!1343275 () Bool)

(declare-fun res!891220 () Bool)

(assert (=> b!1343275 (=> (not res!891220) (not e!764601))))

(assert (=> b!1343275 (= res!891220 (and (= (size!44713 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44712 _keys!1571) (size!44713 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343276 () Bool)

(declare-fun res!891218 () Bool)

(assert (=> b!1343276 (=> (not res!891218) (not e!764601))))

(assert (=> b!1343276 (= res!891218 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343277 () Bool)

(declare-fun e!764602 () Bool)

(declare-fun mapRes!57631 () Bool)

(assert (=> b!1343277 (= e!764602 (and e!764600 mapRes!57631))))

(declare-fun condMapEmpty!57631 () Bool)

(declare-fun mapDefault!57631 () ValueCell!17743)

