; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113066 () Bool)

(assert start!113066)

(declare-fun b_free!31117 () Bool)

(declare-fun b_next!31117 () Bool)

(assert (=> start!113066 (= b_free!31117 (not b_next!31117))))

(declare-fun tp!109155 () Bool)

(declare-fun b_and!50147 () Bool)

(assert (=> start!113066 (= tp!109155 b_and!50147)))

(declare-fun b!1340130 () Bool)

(declare-fun res!888988 () Bool)

(declare-fun e!763354 () Bool)

(assert (=> b!1340130 (=> (not res!888988) (not e!763354))))

(declare-datatypes ((V!54593 0))(
  ( (V!54594 (val!18633 Int)) )
))
(declare-fun minValue!1245 () V!54593)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91088 0))(
  ( (array!91089 (arr!44000 (Array (_ BitVec 32) (_ BitVec 64))) (size!44550 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91088)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17660 0))(
  ( (ValueCellFull!17660 (v!21281 V!54593)) (EmptyCell!17660) )
))
(declare-datatypes ((array!91090 0))(
  ( (array!91091 (arr!44001 (Array (_ BitVec 32) ValueCell!17660)) (size!44551 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91090)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun zeroValue!1245 () V!54593)

(declare-datatypes ((tuple2!23980 0))(
  ( (tuple2!23981 (_1!12001 (_ BitVec 64)) (_2!12001 V!54593)) )
))
(declare-datatypes ((List!31145 0))(
  ( (Nil!31142) (Cons!31141 (h!32350 tuple2!23980) (t!45477 List!31145)) )
))
(declare-datatypes ((ListLongMap!21637 0))(
  ( (ListLongMap!21638 (toList!10834 List!31145)) )
))
(declare-fun contains!9010 (ListLongMap!21637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5803 (array!91088 array!91090 (_ BitVec 32) (_ BitVec 32) V!54593 V!54593 (_ BitVec 32) Int) ListLongMap!21637)

(assert (=> b!1340130 (= res!888988 (contains!9010 (getCurrentListMap!5803 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!57382 () Bool)

(declare-fun mapRes!57382 () Bool)

(assert (=> mapIsEmpty!57382 mapRes!57382))

(declare-fun b!1340131 () Bool)

(declare-fun res!888990 () Bool)

(assert (=> b!1340131 (=> (not res!888990) (not e!763354))))

(assert (=> b!1340131 (= res!888990 (not (= (select (arr!44000 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340132 () Bool)

(declare-fun e!763358 () Bool)

(declare-fun e!763355 () Bool)

(assert (=> b!1340132 (= e!763358 (and e!763355 mapRes!57382))))

(declare-fun condMapEmpty!57382 () Bool)

(declare-fun mapDefault!57382 () ValueCell!17660)

