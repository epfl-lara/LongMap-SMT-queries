; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113554 () Bool)

(assert start!113554)

(declare-fun b_free!31547 () Bool)

(declare-fun b_next!31547 () Bool)

(assert (=> start!113554 (= b_free!31547 (not b_next!31547))))

(declare-fun tp!110450 () Bool)

(declare-fun b_and!50883 () Bool)

(assert (=> start!113554 (= tp!110450 b_and!50883)))

(declare-fun mapNonEmpty!58031 () Bool)

(declare-fun mapRes!58031 () Bool)

(declare-fun tp!110449 () Bool)

(declare-fun e!766906 () Bool)

(assert (=> mapNonEmpty!58031 (= mapRes!58031 (and tp!110449 e!766906))))

(declare-datatypes ((V!55165 0))(
  ( (V!55166 (val!18848 Int)) )
))
(declare-datatypes ((ValueCell!17875 0))(
  ( (ValueCellFull!17875 (v!21499 V!55165)) (EmptyCell!17875) )
))
(declare-fun mapValue!58031 () ValueCell!17875)

(declare-fun mapRest!58031 () (Array (_ BitVec 32) ValueCell!17875))

(declare-fun mapKey!58031 () (_ BitVec 32))

(declare-datatypes ((array!91924 0))(
  ( (array!91925 (arr!44417 (Array (_ BitVec 32) ValueCell!17875)) (size!44967 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91924)

(assert (=> mapNonEmpty!58031 (= (arr!44417 _values!1303) (store mapRest!58031 mapKey!58031 mapValue!58031))))

(declare-fun b!1348035 () Bool)

(declare-fun tp_is_empty!37547 () Bool)

(assert (=> b!1348035 (= e!766906 tp_is_empty!37547)))

(declare-fun mapIsEmpty!58031 () Bool)

(assert (=> mapIsEmpty!58031 mapRes!58031))

(declare-fun b!1348036 () Bool)

(declare-fun res!894442 () Bool)

(declare-fun e!766907 () Bool)

(assert (=> b!1348036 (=> (not res!894442) (not e!766907))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91926 0))(
  ( (array!91927 (arr!44418 (Array (_ BitVec 32) (_ BitVec 64))) (size!44968 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91926)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348036 (= res!894442 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44968 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348037 () Bool)

(declare-fun res!894446 () Bool)

(assert (=> b!1348037 (=> (not res!894446) (not e!766907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348037 (= res!894446 (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)))))

(declare-fun b!1348038 () Bool)

(declare-fun res!894441 () Bool)

(assert (=> b!1348038 (=> (not res!894441) (not e!766907))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1348038 (= res!894441 (and (= (size!44967 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44968 _keys!1571) (size!44967 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348039 () Bool)

(declare-fun res!894444 () Bool)

(assert (=> b!1348039 (=> (not res!894444) (not e!766907))))

(declare-fun minValue!1245 () V!55165)

(declare-fun zeroValue!1245 () V!55165)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24300 0))(
  ( (tuple2!24301 (_1!12161 (_ BitVec 64)) (_2!12161 V!55165)) )
))
(declare-datatypes ((List!31455 0))(
  ( (Nil!31452) (Cons!31451 (h!32660 tuple2!24300) (t!46081 List!31455)) )
))
(declare-datatypes ((ListLongMap!21957 0))(
  ( (ListLongMap!21958 (toList!10994 List!31455)) )
))
(declare-fun contains!9172 (ListLongMap!21957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5944 (array!91926 array!91924 (_ BitVec 32) (_ BitVec 32) V!55165 V!55165 (_ BitVec 32) Int) ListLongMap!21957)

(assert (=> b!1348039 (= res!894444 (contains!9172 (getCurrentListMap!5944 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1348040 () Bool)

(declare-fun res!894438 () Bool)

(assert (=> b!1348040 (=> (not res!894438) (not e!766907))))

(assert (=> b!1348040 (= res!894438 (not (= (select (arr!44418 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1348041 () Bool)

(declare-fun e!766903 () Bool)

(declare-fun e!766905 () Bool)

(assert (=> b!1348041 (= e!766903 (and e!766905 mapRes!58031))))

(declare-fun condMapEmpty!58031 () Bool)

(declare-fun mapDefault!58031 () ValueCell!17875)

