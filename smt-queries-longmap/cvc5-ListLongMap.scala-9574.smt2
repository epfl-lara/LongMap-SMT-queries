; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113306 () Bool)

(assert start!113306)

(declare-fun b_free!31357 () Bool)

(declare-fun b_next!31357 () Bool)

(assert (=> start!113306 (= b_free!31357 (not b_next!31357))))

(declare-fun tp!109875 () Bool)

(declare-fun b_and!50579 () Bool)

(assert (=> start!113306 (= tp!109875 b_and!50579)))

(declare-fun b!1344375 () Bool)

(declare-fun e!765155 () Bool)

(declare-fun tp_is_empty!37357 () Bool)

(assert (=> b!1344375 (= e!765155 tp_is_empty!37357)))

(declare-fun b!1344376 () Bool)

(declare-fun e!765158 () Bool)

(assert (=> b!1344376 (= e!765158 tp_is_empty!37357)))

(declare-fun b!1344377 () Bool)

(declare-fun res!891957 () Bool)

(declare-fun e!765157 () Bool)

(assert (=> b!1344377 (=> (not res!891957) (not e!765157))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91556 0))(
  ( (array!91557 (arr!44234 (Array (_ BitVec 32) (_ BitVec 64))) (size!44784 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91556)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344377 (= res!891957 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44784 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57742 () Bool)

(declare-fun mapRes!57742 () Bool)

(assert (=> mapIsEmpty!57742 mapRes!57742))

(declare-fun b!1344378 () Bool)

(assert (=> b!1344378 (= e!765157 false)))

(declare-datatypes ((V!54913 0))(
  ( (V!54914 (val!18753 Int)) )
))
(declare-fun minValue!1245 () V!54913)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54913)

(declare-fun lt!595185 () Bool)

(declare-datatypes ((ValueCell!17780 0))(
  ( (ValueCellFull!17780 (v!21401 V!54913)) (EmptyCell!17780) )
))
(declare-datatypes ((array!91558 0))(
  ( (array!91559 (arr!44235 (Array (_ BitVec 32) ValueCell!17780)) (size!44785 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91558)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24166 0))(
  ( (tuple2!24167 (_1!12094 (_ BitVec 64)) (_2!12094 V!54913)) )
))
(declare-datatypes ((List!31322 0))(
  ( (Nil!31319) (Cons!31318 (h!32527 tuple2!24166) (t!45846 List!31322)) )
))
(declare-datatypes ((ListLongMap!21823 0))(
  ( (ListLongMap!21824 (toList!10927 List!31322)) )
))
(declare-fun contains!9103 (ListLongMap!21823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5883 (array!91556 array!91558 (_ BitVec 32) (_ BitVec 32) V!54913 V!54913 (_ BitVec 32) Int) ListLongMap!21823)

(assert (=> b!1344378 (= lt!595185 (contains!9103 (getCurrentListMap!5883 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57742 () Bool)

(declare-fun tp!109876 () Bool)

(assert (=> mapNonEmpty!57742 (= mapRes!57742 (and tp!109876 e!765158))))

(declare-fun mapValue!57742 () ValueCell!17780)

(declare-fun mapRest!57742 () (Array (_ BitVec 32) ValueCell!17780))

(declare-fun mapKey!57742 () (_ BitVec 32))

(assert (=> mapNonEmpty!57742 (= (arr!44235 _values!1303) (store mapRest!57742 mapKey!57742 mapValue!57742))))

(declare-fun res!891956 () Bool)

(assert (=> start!113306 (=> (not res!891956) (not e!765157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113306 (= res!891956 (validMask!0 mask!1977))))

(assert (=> start!113306 e!765157))

(assert (=> start!113306 tp_is_empty!37357))

(assert (=> start!113306 true))

(declare-fun array_inv!33335 (array!91556) Bool)

(assert (=> start!113306 (array_inv!33335 _keys!1571)))

(declare-fun e!765154 () Bool)

(declare-fun array_inv!33336 (array!91558) Bool)

(assert (=> start!113306 (and (array_inv!33336 _values!1303) e!765154)))

(assert (=> start!113306 tp!109875))

(declare-fun b!1344379 () Bool)

(assert (=> b!1344379 (= e!765154 (and e!765155 mapRes!57742))))

(declare-fun condMapEmpty!57742 () Bool)

(declare-fun mapDefault!57742 () ValueCell!17780)

