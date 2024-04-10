; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112694 () Bool)

(assert start!112694)

(declare-fun b_free!31031 () Bool)

(declare-fun b_next!31031 () Bool)

(assert (=> start!112694 (= b_free!31031 (not b_next!31031))))

(declare-fun tp!108734 () Bool)

(declare-fun b_and!49999 () Bool)

(assert (=> start!112694 (= tp!108734 b_and!49999)))

(declare-fun b!1336899 () Bool)

(declare-fun e!761257 () Bool)

(declare-fun tp_is_empty!36941 () Bool)

(assert (=> b!1336899 (= e!761257 tp_is_empty!36941)))

(declare-fun res!887237 () Bool)

(declare-fun e!761256 () Bool)

(assert (=> start!112694 (=> (not res!887237) (not e!761256))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112694 (= res!887237 (validMask!0 mask!1998))))

(assert (=> start!112694 e!761256))

(declare-datatypes ((V!54357 0))(
  ( (V!54358 (val!18545 Int)) )
))
(declare-datatypes ((ValueCell!17572 0))(
  ( (ValueCellFull!17572 (v!21185 V!54357)) (EmptyCell!17572) )
))
(declare-datatypes ((array!90740 0))(
  ( (array!90741 (arr!43835 (Array (_ BitVec 32) ValueCell!17572)) (size!44385 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90740)

(declare-fun e!761259 () Bool)

(declare-fun array_inv!33059 (array!90740) Bool)

(assert (=> start!112694 (and (array_inv!33059 _values!1320) e!761259)))

(assert (=> start!112694 true))

(declare-datatypes ((array!90742 0))(
  ( (array!90743 (arr!43836 (Array (_ BitVec 32) (_ BitVec 64))) (size!44386 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90742)

(declare-fun array_inv!33060 (array!90742) Bool)

(assert (=> start!112694 (array_inv!33060 _keys!1590)))

(assert (=> start!112694 tp!108734))

(assert (=> start!112694 tp_is_empty!36941))

(declare-fun b!1336900 () Bool)

(declare-fun res!887233 () Bool)

(assert (=> b!1336900 (=> (not res!887233) (not e!761256))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336900 (= res!887233 (not (= (select (arr!43836 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1336901 () Bool)

(declare-fun res!887234 () Bool)

(assert (=> b!1336901 (=> (not res!887234) (not e!761256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336901 (= res!887234 (validKeyInArray!0 (select (arr!43836 _keys!1590) from!1980)))))

(declare-fun b!1336902 () Bool)

(declare-fun res!887232 () Bool)

(assert (=> b!1336902 (=> (not res!887232) (not e!761256))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336902 (= res!887232 (and (= (size!44385 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44386 _keys!1590) (size!44385 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336903 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54357)

(declare-fun zeroValue!1262 () V!54357)

(declare-datatypes ((tuple2!23922 0))(
  ( (tuple2!23923 (_1!11972 (_ BitVec 64)) (_2!11972 V!54357)) )
))
(declare-datatypes ((List!31064 0))(
  ( (Nil!31061) (Cons!31060 (h!32269 tuple2!23922) (t!45376 List!31064)) )
))
(declare-datatypes ((ListLongMap!21579 0))(
  ( (ListLongMap!21580 (toList!10805 List!31064)) )
))
(declare-fun contains!8970 (ListLongMap!21579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5776 (array!90742 array!90740 (_ BitVec 32) (_ BitVec 32) V!54357 V!54357 (_ BitVec 32) Int) ListLongMap!21579)

(assert (=> b!1336903 (= e!761256 (not (contains!8970 (getCurrentListMap!5776 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k!1153)))))

(declare-fun lt!592908 () ListLongMap!21579)

(declare-fun +!4745 (ListLongMap!21579 tuple2!23922) ListLongMap!21579)

(assert (=> b!1336903 (contains!8970 (+!4745 lt!592908 (tuple2!23923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43938 0))(
  ( (Unit!43939) )
))
(declare-fun lt!592906 () Unit!43938)

(declare-fun addStillContains!1189 (ListLongMap!21579 (_ BitVec 64) V!54357 (_ BitVec 64)) Unit!43938)

(assert (=> b!1336903 (= lt!592906 (addStillContains!1189 lt!592908 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1336903 (contains!8970 lt!592908 k!1153)))

(declare-fun lt!592909 () V!54357)

(declare-fun lt!592910 () Unit!43938)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!324 ((_ BitVec 64) (_ BitVec 64) V!54357 ListLongMap!21579) Unit!43938)

(assert (=> b!1336903 (= lt!592910 (lemmaInListMapAfterAddingDiffThenInBefore!324 k!1153 (select (arr!43836 _keys!1590) from!1980) lt!592909 lt!592908))))

(declare-fun lt!592907 () ListLongMap!21579)

(assert (=> b!1336903 (contains!8970 lt!592907 k!1153)))

(declare-fun lt!592905 () Unit!43938)

(assert (=> b!1336903 (= lt!592905 (lemmaInListMapAfterAddingDiffThenInBefore!324 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592907))))

(assert (=> b!1336903 (= lt!592907 (+!4745 lt!592908 (tuple2!23923 (select (arr!43836 _keys!1590) from!1980) lt!592909)))))

(declare-fun get!22120 (ValueCell!17572 V!54357) V!54357)

(declare-fun dynLambda!3684 (Int (_ BitVec 64)) V!54357)

(assert (=> b!1336903 (= lt!592909 (get!22120 (select (arr!43835 _values!1320) from!1980) (dynLambda!3684 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6387 (array!90742 array!90740 (_ BitVec 32) (_ BitVec 32) V!54357 V!54357 (_ BitVec 32) Int) ListLongMap!21579)

(assert (=> b!1336903 (= lt!592908 (getCurrentListMapNoExtraKeys!6387 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336904 () Bool)

(declare-fun e!761260 () Bool)

(assert (=> b!1336904 (= e!761260 tp_is_empty!36941)))

(declare-fun b!1336905 () Bool)

(declare-fun mapRes!57089 () Bool)

(assert (=> b!1336905 (= e!761259 (and e!761260 mapRes!57089))))

(declare-fun condMapEmpty!57089 () Bool)

(declare-fun mapDefault!57089 () ValueCell!17572)

