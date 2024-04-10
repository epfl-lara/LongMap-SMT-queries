; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113048 () Bool)

(assert start!113048)

(declare-fun b_free!31099 () Bool)

(declare-fun b_next!31099 () Bool)

(assert (=> start!113048 (= b_free!31099 (not b_next!31099))))

(declare-fun tp!109101 () Bool)

(declare-fun b_and!50129 () Bool)

(assert (=> start!113048 (= tp!109101 b_and!50129)))

(declare-fun b!1339908 () Bool)

(declare-fun res!888845 () Bool)

(declare-fun e!763221 () Bool)

(assert (=> b!1339908 (=> (not res!888845) (not e!763221))))

(declare-datatypes ((array!91052 0))(
  ( (array!91053 (arr!43982 (Array (_ BitVec 32) (_ BitVec 64))) (size!44532 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91052)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1339908 (= res!888845 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44532 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339909 () Bool)

(declare-fun e!763220 () Bool)

(declare-fun tp_is_empty!37099 () Bool)

(assert (=> b!1339909 (= e!763220 tp_is_empty!37099)))

(declare-fun b!1339910 () Bool)

(assert (=> b!1339910 (= e!763221 false)))

(declare-datatypes ((V!54569 0))(
  ( (V!54570 (val!18624 Int)) )
))
(declare-fun minValue!1245 () V!54569)

(declare-fun lt!593943 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54569)

(declare-datatypes ((ValueCell!17651 0))(
  ( (ValueCellFull!17651 (v!21272 V!54569)) (EmptyCell!17651) )
))
(declare-datatypes ((array!91054 0))(
  ( (array!91055 (arr!43983 (Array (_ BitVec 32) ValueCell!17651)) (size!44533 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91054)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23966 0))(
  ( (tuple2!23967 (_1!11994 (_ BitVec 64)) (_2!11994 V!54569)) )
))
(declare-datatypes ((List!31134 0))(
  ( (Nil!31131) (Cons!31130 (h!32339 tuple2!23966) (t!45466 List!31134)) )
))
(declare-datatypes ((ListLongMap!21623 0))(
  ( (ListLongMap!21624 (toList!10827 List!31134)) )
))
(declare-fun contains!9003 (ListLongMap!21623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5796 (array!91052 array!91054 (_ BitVec 32) (_ BitVec 32) V!54569 V!54569 (_ BitVec 32) Int) ListLongMap!21623)

(assert (=> b!1339910 (= lt!593943 (contains!9003 (getCurrentListMap!5796 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1339911 () Bool)

(declare-fun res!888846 () Bool)

(assert (=> b!1339911 (=> (not res!888846) (not e!763221))))

(assert (=> b!1339911 (= res!888846 (and (= (size!44533 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44532 _keys!1571) (size!44533 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57355 () Bool)

(declare-fun mapRes!57355 () Bool)

(declare-fun tp!109102 () Bool)

(declare-fun e!763219 () Bool)

(assert (=> mapNonEmpty!57355 (= mapRes!57355 (and tp!109102 e!763219))))

(declare-fun mapKey!57355 () (_ BitVec 32))

(declare-fun mapRest!57355 () (Array (_ BitVec 32) ValueCell!17651))

(declare-fun mapValue!57355 () ValueCell!17651)

(assert (=> mapNonEmpty!57355 (= (arr!43983 _values!1303) (store mapRest!57355 mapKey!57355 mapValue!57355))))

(declare-fun mapIsEmpty!57355 () Bool)

(assert (=> mapIsEmpty!57355 mapRes!57355))

(declare-fun b!1339912 () Bool)

(assert (=> b!1339912 (= e!763219 tp_is_empty!37099)))

(declare-fun b!1339913 () Bool)

(declare-fun e!763222 () Bool)

(assert (=> b!1339913 (= e!763222 (and e!763220 mapRes!57355))))

(declare-fun condMapEmpty!57355 () Bool)

(declare-fun mapDefault!57355 () ValueCell!17651)

