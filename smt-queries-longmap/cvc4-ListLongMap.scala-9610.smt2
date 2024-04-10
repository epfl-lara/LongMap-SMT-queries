; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113610 () Bool)

(assert start!113610)

(declare-fun b_free!31577 () Bool)

(declare-fun b_next!31577 () Bool)

(assert (=> start!113610 (= b_free!31577 (not b_next!31577))))

(declare-fun tp!110542 () Bool)

(declare-fun b_and!50939 () Bool)

(assert (=> start!113610 (= tp!110542 b_and!50939)))

(declare-fun b!1348739 () Bool)

(declare-fun res!894884 () Bool)

(declare-fun e!767251 () Bool)

(assert (=> b!1348739 (=> (not res!894884) (not e!767251))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91982 0))(
  ( (array!91983 (arr!44445 (Array (_ BitVec 32) (_ BitVec 64))) (size!44995 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91982)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348739 (= res!894884 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44995 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348740 () Bool)

(declare-fun res!894878 () Bool)

(assert (=> b!1348740 (=> (not res!894878) (not e!767251))))

(assert (=> b!1348740 (= res!894878 (not (= (select (arr!44445 _keys!1571) from!1960) k!1142)))))

(declare-fun mapIsEmpty!58079 () Bool)

(declare-fun mapRes!58079 () Bool)

(assert (=> mapIsEmpty!58079 mapRes!58079))

(declare-fun b!1348741 () Bool)

(declare-fun e!767252 () Bool)

(declare-fun tp_is_empty!37577 () Bool)

(assert (=> b!1348741 (= e!767252 tp_is_empty!37577)))

(declare-fun b!1348742 () Bool)

(declare-fun res!894880 () Bool)

(assert (=> b!1348742 (=> (not res!894880) (not e!767251))))

(declare-datatypes ((V!55205 0))(
  ( (V!55206 (val!18863 Int)) )
))
(declare-fun minValue!1245 () V!55205)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55205)

(declare-datatypes ((ValueCell!17890 0))(
  ( (ValueCellFull!17890 (v!21515 V!55205)) (EmptyCell!17890) )
))
(declare-datatypes ((array!91984 0))(
  ( (array!91985 (arr!44446 (Array (_ BitVec 32) ValueCell!17890)) (size!44996 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91984)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24326 0))(
  ( (tuple2!24327 (_1!12174 (_ BitVec 64)) (_2!12174 V!55205)) )
))
(declare-datatypes ((List!31478 0))(
  ( (Nil!31475) (Cons!31474 (h!32683 tuple2!24326) (t!46122 List!31478)) )
))
(declare-datatypes ((ListLongMap!21983 0))(
  ( (ListLongMap!21984 (toList!11007 List!31478)) )
))
(declare-fun contains!9187 (ListLongMap!21983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5956 (array!91982 array!91984 (_ BitVec 32) (_ BitVec 32) V!55205 V!55205 (_ BitVec 32) Int) ListLongMap!21983)

(assert (=> b!1348742 (= res!894880 (contains!9187 (getCurrentListMap!5956 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1348743 () Bool)

(declare-fun res!894877 () Bool)

(assert (=> b!1348743 (=> (not res!894877) (not e!767251))))

(assert (=> b!1348743 (= res!894877 (and (= (size!44996 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44995 _keys!1571) (size!44996 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348744 () Bool)

(declare-fun e!767253 () Bool)

(assert (=> b!1348744 (= e!767253 (and e!767252 mapRes!58079))))

(declare-fun condMapEmpty!58079 () Bool)

(declare-fun mapDefault!58079 () ValueCell!17890)

