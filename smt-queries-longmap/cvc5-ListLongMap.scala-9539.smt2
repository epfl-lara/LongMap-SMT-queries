; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113096 () Bool)

(assert start!113096)

(declare-fun b_free!31147 () Bool)

(declare-fun b_next!31147 () Bool)

(assert (=> start!113096 (= b_free!31147 (not b_next!31147))))

(declare-fun tp!109245 () Bool)

(declare-fun b_and!50201 () Bool)

(assert (=> start!113096 (= tp!109245 b_and!50201)))

(declare-fun b!1340687 () Bool)

(declare-fun e!763583 () Bool)

(declare-fun tp_is_empty!37147 () Bool)

(assert (=> b!1340687 (= e!763583 tp_is_empty!37147)))

(declare-fun mapIsEmpty!57427 () Bool)

(declare-fun mapRes!57427 () Bool)

(assert (=> mapIsEmpty!57427 mapRes!57427))

(declare-fun mapNonEmpty!57427 () Bool)

(declare-fun tp!109246 () Bool)

(assert (=> mapNonEmpty!57427 (= mapRes!57427 (and tp!109246 e!763583))))

(declare-fun mapKey!57427 () (_ BitVec 32))

(declare-datatypes ((V!54633 0))(
  ( (V!54634 (val!18648 Int)) )
))
(declare-datatypes ((ValueCell!17675 0))(
  ( (ValueCellFull!17675 (v!21296 V!54633)) (EmptyCell!17675) )
))
(declare-fun mapRest!57427 () (Array (_ BitVec 32) ValueCell!17675))

(declare-fun mapValue!57427 () ValueCell!17675)

(declare-datatypes ((array!91146 0))(
  ( (array!91147 (arr!44029 (Array (_ BitVec 32) ValueCell!17675)) (size!44579 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91146)

(assert (=> mapNonEmpty!57427 (= (arr!44029 _values!1303) (store mapRest!57427 mapKey!57427 mapValue!57427))))

(declare-fun b!1340688 () Bool)

(declare-fun e!763581 () Bool)

(assert (=> b!1340688 (= e!763581 tp_is_empty!37147)))

(declare-fun b!1340689 () Bool)

(declare-fun res!889386 () Bool)

(declare-fun e!763580 () Bool)

(assert (=> b!1340689 (=> (not res!889386) (not e!763580))))

(declare-datatypes ((array!91148 0))(
  ( (array!91149 (arr!44030 (Array (_ BitVec 32) (_ BitVec 64))) (size!44580 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91148)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91148 (_ BitVec 32)) Bool)

(assert (=> b!1340689 (= res!889386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340691 () Bool)

(declare-fun res!889387 () Bool)

(assert (=> b!1340691 (=> (not res!889387) (not e!763580))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340691 (= res!889387 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44580 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340692 () Bool)

(declare-fun res!889389 () Bool)

(assert (=> b!1340692 (=> (not res!889389) (not e!763580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340692 (= res!889389 (validKeyInArray!0 (select (arr!44030 _keys!1571) from!1960)))))

(declare-fun b!1340693 () Bool)

(declare-fun res!889388 () Bool)

(assert (=> b!1340693 (=> (not res!889388) (not e!763580))))

(declare-fun minValue!1245 () V!54633)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54633)

(declare-datatypes ((tuple2!24004 0))(
  ( (tuple2!24005 (_1!12013 (_ BitVec 64)) (_2!12013 V!54633)) )
))
(declare-datatypes ((List!31166 0))(
  ( (Nil!31163) (Cons!31162 (h!32371 tuple2!24004) (t!45524 List!31166)) )
))
(declare-datatypes ((ListLongMap!21661 0))(
  ( (ListLongMap!21662 (toList!10846 List!31166)) )
))
(declare-fun contains!9022 (ListLongMap!21661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5814 (array!91148 array!91146 (_ BitVec 32) (_ BitVec 32) V!54633 V!54633 (_ BitVec 32) Int) ListLongMap!21661)

(assert (=> b!1340693 (= res!889388 (contains!9022 (getCurrentListMap!5814 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340694 () Bool)

(declare-fun res!889383 () Bool)

(assert (=> b!1340694 (=> (not res!889383) (not e!763580))))

(assert (=> b!1340694 (= res!889383 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340695 () Bool)

(assert (=> b!1340695 (= e!763580 (not true))))

(declare-fun lt!594027 () ListLongMap!21661)

(assert (=> b!1340695 (contains!9022 lt!594027 k!1142)))

(declare-datatypes ((Unit!43999 0))(
  ( (Unit!44000) )
))
(declare-fun lt!594026 () Unit!43999)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!330 ((_ BitVec 64) (_ BitVec 64) V!54633 ListLongMap!21661) Unit!43999)

(assert (=> b!1340695 (= lt!594026 (lemmaInListMapAfterAddingDiffThenInBefore!330 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594027))))

(declare-fun +!4761 (ListLongMap!21661 tuple2!24004) ListLongMap!21661)

(declare-fun getCurrentListMapNoExtraKeys!6403 (array!91148 array!91146 (_ BitVec 32) (_ BitVec 32) V!54633 V!54633 (_ BitVec 32) Int) ListLongMap!21661)

(declare-fun get!22216 (ValueCell!17675 V!54633) V!54633)

(declare-fun dynLambda!3700 (Int (_ BitVec 64)) V!54633)

(assert (=> b!1340695 (= lt!594027 (+!4761 (getCurrentListMapNoExtraKeys!6403 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24005 (select (arr!44030 _keys!1571) from!1960) (get!22216 (select (arr!44029 _values!1303) from!1960) (dynLambda!3700 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340696 () Bool)

(declare-fun res!889384 () Bool)

(assert (=> b!1340696 (=> (not res!889384) (not e!763580))))

(declare-datatypes ((List!31167 0))(
  ( (Nil!31164) (Cons!31163 (h!32372 (_ BitVec 64)) (t!45525 List!31167)) )
))
(declare-fun arrayNoDuplicates!0 (array!91148 (_ BitVec 32) List!31167) Bool)

(assert (=> b!1340696 (= res!889384 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31164))))

(declare-fun b!1340690 () Bool)

(declare-fun res!889385 () Bool)

(assert (=> b!1340690 (=> (not res!889385) (not e!763580))))

(assert (=> b!1340690 (= res!889385 (and (= (size!44579 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44580 _keys!1571) (size!44579 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889382 () Bool)

(assert (=> start!113096 (=> (not res!889382) (not e!763580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113096 (= res!889382 (validMask!0 mask!1977))))

(assert (=> start!113096 e!763580))

(assert (=> start!113096 tp_is_empty!37147))

(assert (=> start!113096 true))

(declare-fun array_inv!33197 (array!91148) Bool)

(assert (=> start!113096 (array_inv!33197 _keys!1571)))

(declare-fun e!763582 () Bool)

(declare-fun array_inv!33198 (array!91146) Bool)

(assert (=> start!113096 (and (array_inv!33198 _values!1303) e!763582)))

(assert (=> start!113096 tp!109245))

(declare-fun b!1340697 () Bool)

(declare-fun res!889381 () Bool)

(assert (=> b!1340697 (=> (not res!889381) (not e!763580))))

(assert (=> b!1340697 (= res!889381 (not (= (select (arr!44030 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340698 () Bool)

(assert (=> b!1340698 (= e!763582 (and e!763581 mapRes!57427))))

(declare-fun condMapEmpty!57427 () Bool)

(declare-fun mapDefault!57427 () ValueCell!17675)

