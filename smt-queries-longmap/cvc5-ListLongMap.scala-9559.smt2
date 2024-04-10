; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113216 () Bool)

(assert start!113216)

(declare-fun b_free!31267 () Bool)

(declare-fun b_next!31267 () Bool)

(assert (=> start!113216 (= b_free!31267 (not b_next!31267))))

(declare-fun tp!109605 () Bool)

(declare-fun b_and!50441 () Bool)

(assert (=> start!113216 (= tp!109605 b_and!50441)))

(declare-fun b!1342967 () Bool)

(declare-fun e!764479 () Bool)

(declare-fun tp_is_empty!37267 () Bool)

(assert (=> b!1342967 (= e!764479 tp_is_empty!37267)))

(declare-fun b!1342968 () Bool)

(declare-fun res!891005 () Bool)

(declare-fun e!764483 () Bool)

(assert (=> b!1342968 (=> (not res!891005) (not e!764483))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91382 0))(
  ( (array!91383 (arr!44147 (Array (_ BitVec 32) (_ BitVec 64))) (size!44697 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91382)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342968 (= res!891005 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44697 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342969 () Bool)

(declare-fun e!764482 () Bool)

(assert (=> b!1342969 (= e!764482 tp_is_empty!37267)))

(declare-fun b!1342970 () Bool)

(declare-fun res!891002 () Bool)

(assert (=> b!1342970 (=> (not res!891002) (not e!764483))))

(assert (=> b!1342970 (= res!891002 (not (= (select (arr!44147 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342971 () Bool)

(declare-fun res!891008 () Bool)

(assert (=> b!1342971 (=> (not res!891008) (not e!764483))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91382 (_ BitVec 32)) Bool)

(assert (=> b!1342971 (= res!891008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57607 () Bool)

(declare-fun mapRes!57607 () Bool)

(assert (=> mapIsEmpty!57607 mapRes!57607))

(declare-fun res!891001 () Bool)

(assert (=> start!113216 (=> (not res!891001) (not e!764483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113216 (= res!891001 (validMask!0 mask!1977))))

(assert (=> start!113216 e!764483))

(assert (=> start!113216 tp_is_empty!37267))

(assert (=> start!113216 true))

(declare-fun array_inv!33279 (array!91382) Bool)

(assert (=> start!113216 (array_inv!33279 _keys!1571)))

(declare-datatypes ((V!54793 0))(
  ( (V!54794 (val!18708 Int)) )
))
(declare-datatypes ((ValueCell!17735 0))(
  ( (ValueCellFull!17735 (v!21356 V!54793)) (EmptyCell!17735) )
))
(declare-datatypes ((array!91384 0))(
  ( (array!91385 (arr!44148 (Array (_ BitVec 32) ValueCell!17735)) (size!44698 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91384)

(declare-fun e!764481 () Bool)

(declare-fun array_inv!33280 (array!91384) Bool)

(assert (=> start!113216 (and (array_inv!33280 _values!1303) e!764481)))

(assert (=> start!113216 tp!109605))

(declare-fun b!1342972 () Bool)

(assert (=> b!1342972 (= e!764483 (not true))))

(declare-datatypes ((tuple2!24100 0))(
  ( (tuple2!24101 (_1!12061 (_ BitVec 64)) (_2!12061 V!54793)) )
))
(declare-datatypes ((List!31257 0))(
  ( (Nil!31254) (Cons!31253 (h!32462 tuple2!24100) (t!45735 List!31257)) )
))
(declare-datatypes ((ListLongMap!21757 0))(
  ( (ListLongMap!21758 (toList!10894 List!31257)) )
))
(declare-fun lt!594705 () ListLongMap!21757)

(declare-fun zeroValue!1245 () V!54793)

(declare-fun contains!9070 (ListLongMap!21757 (_ BitVec 64)) Bool)

(declare-fun +!4802 (ListLongMap!21757 tuple2!24100) ListLongMap!21757)

(assert (=> b!1342972 (contains!9070 (+!4802 lt!594705 (tuple2!24101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44081 0))(
  ( (Unit!44082) )
))
(declare-fun lt!594700 () Unit!44081)

(declare-fun addStillContains!1195 (ListLongMap!21757 (_ BitVec 64) V!54793 (_ BitVec 64)) Unit!44081)

(assert (=> b!1342972 (= lt!594700 (addStillContains!1195 lt!594705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1342972 (contains!9070 lt!594705 k!1142)))

(declare-fun lt!594703 () V!54793)

(declare-fun lt!594702 () Unit!44081)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!371 ((_ BitVec 64) (_ BitVec 64) V!54793 ListLongMap!21757) Unit!44081)

(assert (=> b!1342972 (= lt!594702 (lemmaInListMapAfterAddingDiffThenInBefore!371 k!1142 (select (arr!44147 _keys!1571) from!1960) lt!594703 lt!594705))))

(declare-fun lt!594701 () ListLongMap!21757)

(assert (=> b!1342972 (contains!9070 lt!594701 k!1142)))

(declare-fun lt!594704 () Unit!44081)

(assert (=> b!1342972 (= lt!594704 (lemmaInListMapAfterAddingDiffThenInBefore!371 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594701))))

(assert (=> b!1342972 (= lt!594701 (+!4802 lt!594705 (tuple2!24101 (select (arr!44147 _keys!1571) from!1960) lt!594703)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22297 (ValueCell!17735 V!54793) V!54793)

(declare-fun dynLambda!3741 (Int (_ BitVec 64)) V!54793)

(assert (=> b!1342972 (= lt!594703 (get!22297 (select (arr!44148 _values!1303) from!1960) (dynLambda!3741 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54793)

(declare-fun getCurrentListMapNoExtraKeys!6444 (array!91382 array!91384 (_ BitVec 32) (_ BitVec 32) V!54793 V!54793 (_ BitVec 32) Int) ListLongMap!21757)

(assert (=> b!1342972 (= lt!594705 (getCurrentListMapNoExtraKeys!6444 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342973 () Bool)

(declare-fun res!891006 () Bool)

(assert (=> b!1342973 (=> (not res!891006) (not e!764483))))

(declare-datatypes ((List!31258 0))(
  ( (Nil!31255) (Cons!31254 (h!32463 (_ BitVec 64)) (t!45736 List!31258)) )
))
(declare-fun arrayNoDuplicates!0 (array!91382 (_ BitVec 32) List!31258) Bool)

(assert (=> b!1342973 (= res!891006 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31255))))

(declare-fun b!1342974 () Bool)

(declare-fun res!891009 () Bool)

(assert (=> b!1342974 (=> (not res!891009) (not e!764483))))

(assert (=> b!1342974 (= res!891009 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342975 () Bool)

(assert (=> b!1342975 (= e!764481 (and e!764482 mapRes!57607))))

(declare-fun condMapEmpty!57607 () Bool)

(declare-fun mapDefault!57607 () ValueCell!17735)

