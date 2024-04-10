; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113228 () Bool)

(assert start!113228)

(declare-fun b_free!31279 () Bool)

(declare-fun b_next!31279 () Bool)

(assert (=> start!113228 (= b_free!31279 (not b_next!31279))))

(declare-fun tp!109642 () Bool)

(declare-fun b_and!50465 () Bool)

(assert (=> start!113228 (= tp!109642 b_and!50465)))

(declare-fun b!1343195 () Bool)

(declare-fun res!891171 () Bool)

(declare-fun e!764572 () Bool)

(assert (=> b!1343195 (=> (not res!891171) (not e!764572))))

(declare-datatypes ((array!91404 0))(
  ( (array!91405 (arr!44158 (Array (_ BitVec 32) (_ BitVec 64))) (size!44708 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91404)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343195 (= res!891171 (validKeyInArray!0 (select (arr!44158 _keys!1571) from!1960)))))

(declare-fun res!891166 () Bool)

(assert (=> start!113228 (=> (not res!891166) (not e!764572))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113228 (= res!891166 (validMask!0 mask!1977))))

(assert (=> start!113228 e!764572))

(declare-fun tp_is_empty!37279 () Bool)

(assert (=> start!113228 tp_is_empty!37279))

(assert (=> start!113228 true))

(declare-fun array_inv!33285 (array!91404) Bool)

(assert (=> start!113228 (array_inv!33285 _keys!1571)))

(declare-datatypes ((V!54809 0))(
  ( (V!54810 (val!18714 Int)) )
))
(declare-datatypes ((ValueCell!17741 0))(
  ( (ValueCellFull!17741 (v!21362 V!54809)) (EmptyCell!17741) )
))
(declare-datatypes ((array!91406 0))(
  ( (array!91407 (arr!44159 (Array (_ BitVec 32) ValueCell!17741)) (size!44709 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91406)

(declare-fun e!764571 () Bool)

(declare-fun array_inv!33286 (array!91406) Bool)

(assert (=> start!113228 (and (array_inv!33286 _values!1303) e!764571)))

(assert (=> start!113228 tp!109642))

(declare-fun b!1343196 () Bool)

(declare-fun res!891165 () Bool)

(assert (=> b!1343196 (=> (not res!891165) (not e!764572))))

(declare-datatypes ((List!31264 0))(
  ( (Nil!31261) (Cons!31260 (h!32469 (_ BitVec 64)) (t!45754 List!31264)) )
))
(declare-fun arrayNoDuplicates!0 (array!91404 (_ BitVec 32) List!31264) Bool)

(assert (=> b!1343196 (= res!891165 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31261))))

(declare-fun b!1343197 () Bool)

(declare-fun res!891170 () Bool)

(assert (=> b!1343197 (=> (not res!891170) (not e!764572))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343197 (= res!891170 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57625 () Bool)

(declare-fun mapRes!57625 () Bool)

(assert (=> mapIsEmpty!57625 mapRes!57625))

(declare-fun b!1343198 () Bool)

(assert (=> b!1343198 (= e!764572 (not true))))

(declare-datatypes ((tuple2!24106 0))(
  ( (tuple2!24107 (_1!12064 (_ BitVec 64)) (_2!12064 V!54809)) )
))
(declare-datatypes ((List!31265 0))(
  ( (Nil!31262) (Cons!31261 (h!32470 tuple2!24106) (t!45755 List!31265)) )
))
(declare-datatypes ((ListLongMap!21763 0))(
  ( (ListLongMap!21764 (toList!10897 List!31265)) )
))
(declare-fun lt!594811 () ListLongMap!21763)

(declare-fun zeroValue!1245 () V!54809)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9073 (ListLongMap!21763 (_ BitVec 64)) Bool)

(declare-fun +!4805 (ListLongMap!21763 tuple2!24106) ListLongMap!21763)

(assert (=> b!1343198 (contains!9073 (+!4805 lt!594811 (tuple2!24107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44087 0))(
  ( (Unit!44088) )
))
(declare-fun lt!594810 () Unit!44087)

(declare-fun addStillContains!1198 (ListLongMap!21763 (_ BitVec 64) V!54809 (_ BitVec 64)) Unit!44087)

(assert (=> b!1343198 (= lt!594810 (addStillContains!1198 lt!594811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343198 (contains!9073 lt!594811 k!1142)))

(declare-fun lt!594813 () Unit!44087)

(declare-fun lt!594808 () V!54809)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!374 ((_ BitVec 64) (_ BitVec 64) V!54809 ListLongMap!21763) Unit!44087)

(assert (=> b!1343198 (= lt!594813 (lemmaInListMapAfterAddingDiffThenInBefore!374 k!1142 (select (arr!44158 _keys!1571) from!1960) lt!594808 lt!594811))))

(declare-fun lt!594809 () ListLongMap!21763)

(assert (=> b!1343198 (contains!9073 lt!594809 k!1142)))

(declare-fun lt!594812 () Unit!44087)

(assert (=> b!1343198 (= lt!594812 (lemmaInListMapAfterAddingDiffThenInBefore!374 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594809))))

(assert (=> b!1343198 (= lt!594809 (+!4805 lt!594811 (tuple2!24107 (select (arr!44158 _keys!1571) from!1960) lt!594808)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22304 (ValueCell!17741 V!54809) V!54809)

(declare-fun dynLambda!3744 (Int (_ BitVec 64)) V!54809)

(assert (=> b!1343198 (= lt!594808 (get!22304 (select (arr!44159 _values!1303) from!1960) (dynLambda!3744 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54809)

(declare-fun getCurrentListMapNoExtraKeys!6447 (array!91404 array!91406 (_ BitVec 32) (_ BitVec 32) V!54809 V!54809 (_ BitVec 32) Int) ListLongMap!21763)

(assert (=> b!1343198 (= lt!594811 (getCurrentListMapNoExtraKeys!6447 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343199 () Bool)

(declare-fun e!764570 () Bool)

(assert (=> b!1343199 (= e!764571 (and e!764570 mapRes!57625))))

(declare-fun condMapEmpty!57625 () Bool)

(declare-fun mapDefault!57625 () ValueCell!17741)

