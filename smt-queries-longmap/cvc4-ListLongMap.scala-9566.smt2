; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113262 () Bool)

(assert start!113262)

(declare-fun b_free!31313 () Bool)

(declare-fun b_next!31313 () Bool)

(assert (=> start!113262 (= b_free!31313 (not b_next!31313))))

(declare-fun tp!109743 () Bool)

(declare-fun b_and!50533 () Bool)

(assert (=> start!113262 (= tp!109743 b_and!50533)))

(declare-fun mapIsEmpty!57676 () Bool)

(declare-fun mapRes!57676 () Bool)

(assert (=> mapIsEmpty!57676 mapRes!57676))

(declare-fun b!1343841 () Bool)

(declare-fun e!764826 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343841 (= e!764826 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54853 0))(
  ( (V!54854 (val!18731 Int)) )
))
(declare-datatypes ((tuple2!24134 0))(
  ( (tuple2!24135 (_1!12078 (_ BitVec 64)) (_2!12078 V!54853)) )
))
(declare-datatypes ((List!31289 0))(
  ( (Nil!31286) (Cons!31285 (h!32494 tuple2!24134) (t!45813 List!31289)) )
))
(declare-datatypes ((ListLongMap!21791 0))(
  ( (ListLongMap!21792 (toList!10911 List!31289)) )
))
(declare-fun lt!595117 () ListLongMap!21791)

(declare-fun zeroValue!1245 () V!54853)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9087 (ListLongMap!21791 (_ BitVec 64)) Bool)

(declare-fun +!4818 (ListLongMap!21791 tuple2!24134) ListLongMap!21791)

(assert (=> b!1343841 (contains!9087 (+!4818 lt!595117 (tuple2!24135 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44113 0))(
  ( (Unit!44114) )
))
(declare-fun lt!595119 () Unit!44113)

(declare-fun addStillContains!1211 (ListLongMap!21791 (_ BitVec 64) V!54853 (_ BitVec 64)) Unit!44113)

(assert (=> b!1343841 (= lt!595119 (addStillContains!1211 lt!595117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343841 (contains!9087 lt!595117 k!1142)))

(declare-datatypes ((array!91470 0))(
  ( (array!91471 (arr!44191 (Array (_ BitVec 32) (_ BitVec 64))) (size!44741 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91470)

(declare-fun lt!595114 () Unit!44113)

(declare-fun lt!595118 () V!54853)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!387 ((_ BitVec 64) (_ BitVec 64) V!54853 ListLongMap!21791) Unit!44113)

(assert (=> b!1343841 (= lt!595114 (lemmaInListMapAfterAddingDiffThenInBefore!387 k!1142 (select (arr!44191 _keys!1571) from!1960) lt!595118 lt!595117))))

(declare-fun lt!595115 () ListLongMap!21791)

(assert (=> b!1343841 (contains!9087 lt!595115 k!1142)))

(declare-fun lt!595116 () Unit!44113)

(assert (=> b!1343841 (= lt!595116 (lemmaInListMapAfterAddingDiffThenInBefore!387 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595115))))

(assert (=> b!1343841 (= lt!595115 (+!4818 lt!595117 (tuple2!24135 (select (arr!44191 _keys!1571) from!1960) lt!595118)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17758 0))(
  ( (ValueCellFull!17758 (v!21379 V!54853)) (EmptyCell!17758) )
))
(declare-datatypes ((array!91472 0))(
  ( (array!91473 (arr!44192 (Array (_ BitVec 32) ValueCell!17758)) (size!44742 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91472)

(declare-fun get!22327 (ValueCell!17758 V!54853) V!54853)

(declare-fun dynLambda!3757 (Int (_ BitVec 64)) V!54853)

(assert (=> b!1343841 (= lt!595118 (get!22327 (select (arr!44192 _values!1303) from!1960) (dynLambda!3757 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54853)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6460 (array!91470 array!91472 (_ BitVec 32) (_ BitVec 32) V!54853 V!54853 (_ BitVec 32) Int) ListLongMap!21791)

(assert (=> b!1343841 (= lt!595117 (getCurrentListMapNoExtraKeys!6460 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343842 () Bool)

(declare-fun res!891626 () Bool)

(assert (=> b!1343842 (=> (not res!891626) (not e!764826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91470 (_ BitVec 32)) Bool)

(assert (=> b!1343842 (= res!891626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343843 () Bool)

(declare-fun res!891627 () Bool)

(assert (=> b!1343843 (=> (not res!891627) (not e!764826))))

(assert (=> b!1343843 (= res!891627 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343844 () Bool)

(declare-fun res!891625 () Bool)

(assert (=> b!1343844 (=> (not res!891625) (not e!764826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343844 (= res!891625 (validKeyInArray!0 (select (arr!44191 _keys!1571) from!1960)))))

(declare-fun b!1343845 () Bool)

(declare-fun res!891622 () Bool)

(assert (=> b!1343845 (=> (not res!891622) (not e!764826))))

(assert (=> b!1343845 (= res!891622 (not (= (select (arr!44191 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1343846 () Bool)

(declare-fun res!891629 () Bool)

(assert (=> b!1343846 (=> (not res!891629) (not e!764826))))

(declare-datatypes ((List!31290 0))(
  ( (Nil!31287) (Cons!31286 (h!32495 (_ BitVec 64)) (t!45814 List!31290)) )
))
(declare-fun arrayNoDuplicates!0 (array!91470 (_ BitVec 32) List!31290) Bool)

(assert (=> b!1343846 (= res!891629 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31287))))

(declare-fun b!1343847 () Bool)

(declare-fun e!764827 () Bool)

(declare-fun tp_is_empty!37313 () Bool)

(assert (=> b!1343847 (= e!764827 tp_is_empty!37313)))

(declare-fun b!1343848 () Bool)

(declare-fun res!891630 () Bool)

(assert (=> b!1343848 (=> (not res!891630) (not e!764826))))

(assert (=> b!1343848 (= res!891630 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44741 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343849 () Bool)

(declare-fun res!891628 () Bool)

(assert (=> b!1343849 (=> (not res!891628) (not e!764826))))

(assert (=> b!1343849 (= res!891628 (and (= (size!44742 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44741 _keys!1571) (size!44742 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343850 () Bool)

(declare-fun e!764828 () Bool)

(declare-fun e!764825 () Bool)

(assert (=> b!1343850 (= e!764828 (and e!764825 mapRes!57676))))

(declare-fun condMapEmpty!57676 () Bool)

(declare-fun mapDefault!57676 () ValueCell!17758)

