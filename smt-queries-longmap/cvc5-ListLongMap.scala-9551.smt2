; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113168 () Bool)

(assert start!113168)

(declare-fun b_free!31219 () Bool)

(declare-fun b_next!31219 () Bool)

(assert (=> start!113168 (= b_free!31219 (not b_next!31219))))

(declare-fun tp!109461 () Bool)

(declare-fun b_and!50345 () Bool)

(assert (=> start!113168 (= tp!109461 b_and!50345)))

(declare-fun b!1342055 () Bool)

(declare-fun res!890355 () Bool)

(declare-fun e!764120 () Bool)

(assert (=> b!1342055 (=> (not res!890355) (not e!764120))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91290 0))(
  ( (array!91291 (arr!44101 (Array (_ BitVec 32) (_ BitVec 64))) (size!44651 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91290)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342055 (= res!890355 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44651 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342056 () Bool)

(declare-fun res!890358 () Bool)

(assert (=> b!1342056 (=> (not res!890358) (not e!764120))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91290 (_ BitVec 32)) Bool)

(assert (=> b!1342056 (= res!890358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342057 () Bool)

(declare-fun res!890359 () Bool)

(assert (=> b!1342057 (=> (not res!890359) (not e!764120))))

(declare-datatypes ((List!31222 0))(
  ( (Nil!31219) (Cons!31218 (h!32427 (_ BitVec 64)) (t!45652 List!31222)) )
))
(declare-fun arrayNoDuplicates!0 (array!91290 (_ BitVec 32) List!31222) Bool)

(assert (=> b!1342057 (= res!890359 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31219))))

(declare-fun b!1342058 () Bool)

(declare-fun res!890360 () Bool)

(assert (=> b!1342058 (=> (not res!890360) (not e!764120))))

(declare-datatypes ((V!54729 0))(
  ( (V!54730 (val!18684 Int)) )
))
(declare-datatypes ((ValueCell!17711 0))(
  ( (ValueCellFull!17711 (v!21332 V!54729)) (EmptyCell!17711) )
))
(declare-datatypes ((array!91292 0))(
  ( (array!91293 (arr!44102 (Array (_ BitVec 32) ValueCell!17711)) (size!44652 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91292)

(assert (=> b!1342058 (= res!890360 (and (= (size!44652 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44651 _keys!1571) (size!44652 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342059 () Bool)

(declare-fun res!890356 () Bool)

(assert (=> b!1342059 (=> (not res!890356) (not e!764120))))

(declare-fun minValue!1245 () V!54729)

(declare-fun zeroValue!1245 () V!54729)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24066 0))(
  ( (tuple2!24067 (_1!12044 (_ BitVec 64)) (_2!12044 V!54729)) )
))
(declare-datatypes ((List!31223 0))(
  ( (Nil!31220) (Cons!31219 (h!32428 tuple2!24066) (t!45653 List!31223)) )
))
(declare-datatypes ((ListLongMap!21723 0))(
  ( (ListLongMap!21724 (toList!10877 List!31223)) )
))
(declare-fun contains!9053 (ListLongMap!21723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5841 (array!91290 array!91292 (_ BitVec 32) (_ BitVec 32) V!54729 V!54729 (_ BitVec 32) Int) ListLongMap!21723)

(assert (=> b!1342059 (= res!890356 (contains!9053 (getCurrentListMap!5841 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342061 () Bool)

(declare-fun res!890357 () Bool)

(assert (=> b!1342061 (=> (not res!890357) (not e!764120))))

(assert (=> b!1342061 (= res!890357 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342062 () Bool)

(declare-fun e!764119 () Bool)

(declare-fun tp_is_empty!37219 () Bool)

(assert (=> b!1342062 (= e!764119 tp_is_empty!37219)))

(declare-fun mapIsEmpty!57535 () Bool)

(declare-fun mapRes!57535 () Bool)

(assert (=> mapIsEmpty!57535 mapRes!57535))

(declare-fun mapNonEmpty!57535 () Bool)

(declare-fun tp!109462 () Bool)

(assert (=> mapNonEmpty!57535 (= mapRes!57535 (and tp!109462 e!764119))))

(declare-fun mapValue!57535 () ValueCell!17711)

(declare-fun mapRest!57535 () (Array (_ BitVec 32) ValueCell!17711))

(declare-fun mapKey!57535 () (_ BitVec 32))

(assert (=> mapNonEmpty!57535 (= (arr!44102 _values!1303) (store mapRest!57535 mapKey!57535 mapValue!57535))))

(declare-fun b!1342063 () Bool)

(declare-fun e!764123 () Bool)

(assert (=> b!1342063 (= e!764123 tp_is_empty!37219)))

(declare-fun res!890353 () Bool)

(assert (=> start!113168 (=> (not res!890353) (not e!764120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113168 (= res!890353 (validMask!0 mask!1977))))

(assert (=> start!113168 e!764120))

(assert (=> start!113168 tp_is_empty!37219))

(assert (=> start!113168 true))

(declare-fun array_inv!33245 (array!91290) Bool)

(assert (=> start!113168 (array_inv!33245 _keys!1571)))

(declare-fun e!764121 () Bool)

(declare-fun array_inv!33246 (array!91292) Bool)

(assert (=> start!113168 (and (array_inv!33246 _values!1303) e!764121)))

(assert (=> start!113168 tp!109461))

(declare-fun b!1342060 () Bool)

(declare-fun res!890361 () Bool)

(assert (=> b!1342060 (=> (not res!890361) (not e!764120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342060 (= res!890361 (validKeyInArray!0 (select (arr!44101 _keys!1571) from!1960)))))

(declare-fun b!1342064 () Bool)

(declare-fun res!890354 () Bool)

(assert (=> b!1342064 (=> (not res!890354) (not e!764120))))

(assert (=> b!1342064 (= res!890354 (not (= (select (arr!44101 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342065 () Bool)

(assert (=> b!1342065 (= e!764121 (and e!764123 mapRes!57535))))

(declare-fun condMapEmpty!57535 () Bool)

(declare-fun mapDefault!57535 () ValueCell!17711)

