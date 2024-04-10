; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113530 () Bool)

(assert start!113530)

(declare-fun b_free!31523 () Bool)

(declare-fun b_next!31523 () Bool)

(assert (=> start!113530 (= b_free!31523 (not b_next!31523))))

(declare-fun tp!110378 () Bool)

(declare-fun b_and!50835 () Bool)

(assert (=> start!113530 (= tp!110378 b_and!50835)))

(declare-fun mapNonEmpty!57995 () Bool)

(declare-fun mapRes!57995 () Bool)

(declare-fun tp!110377 () Bool)

(declare-fun e!766726 () Bool)

(assert (=> mapNonEmpty!57995 (= mapRes!57995 (and tp!110377 e!766726))))

(declare-datatypes ((V!55133 0))(
  ( (V!55134 (val!18836 Int)) )
))
(declare-datatypes ((ValueCell!17863 0))(
  ( (ValueCellFull!17863 (v!21487 V!55133)) (EmptyCell!17863) )
))
(declare-fun mapValue!57995 () ValueCell!17863)

(declare-fun mapKey!57995 () (_ BitVec 32))

(declare-fun mapRest!57995 () (Array (_ BitVec 32) ValueCell!17863))

(declare-datatypes ((array!91880 0))(
  ( (array!91881 (arr!44395 (Array (_ BitVec 32) ValueCell!17863)) (size!44945 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91880)

(assert (=> mapNonEmpty!57995 (= (arr!44395 _values!1303) (store mapRest!57995 mapKey!57995 mapValue!57995))))

(declare-fun res!894122 () Bool)

(declare-fun e!766727 () Bool)

(assert (=> start!113530 (=> (not res!894122) (not e!766727))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113530 (= res!894122 (validMask!0 mask!1977))))

(assert (=> start!113530 e!766727))

(declare-fun tp_is_empty!37523 () Bool)

(assert (=> start!113530 tp_is_empty!37523))

(assert (=> start!113530 true))

(declare-datatypes ((array!91882 0))(
  ( (array!91883 (arr!44396 (Array (_ BitVec 32) (_ BitVec 64))) (size!44946 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91882)

(declare-fun array_inv!33447 (array!91882) Bool)

(assert (=> start!113530 (array_inv!33447 _keys!1571)))

(declare-fun e!766725 () Bool)

(declare-fun array_inv!33448 (array!91880) Bool)

(assert (=> start!113530 (and (array_inv!33448 _values!1303) e!766725)))

(assert (=> start!113530 tp!110378))

(declare-fun b!1347579 () Bool)

(declare-fun res!894120 () Bool)

(assert (=> b!1347579 (=> (not res!894120) (not e!766727))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347579 (= res!894120 (not (= (select (arr!44396 _keys!1571) from!1960) k!1142)))))

(declare-fun mapIsEmpty!57995 () Bool)

(assert (=> mapIsEmpty!57995 mapRes!57995))

(declare-fun b!1347580 () Bool)

(assert (=> b!1347580 (= e!766726 tp_is_empty!37523)))

(declare-fun b!1347581 () Bool)

(declare-fun res!894114 () Bool)

(assert (=> b!1347581 (=> (not res!894114) (not e!766727))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347581 (= res!894114 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44946 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347582 () Bool)

(declare-fun res!894119 () Bool)

(assert (=> b!1347582 (=> (not res!894119) (not e!766727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347582 (= res!894119 (validKeyInArray!0 (select (arr!44396 _keys!1571) from!1960)))))

(declare-fun b!1347583 () Bool)

(declare-fun res!894121 () Bool)

(assert (=> b!1347583 (=> (not res!894121) (not e!766727))))

(assert (=> b!1347583 (= res!894121 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347584 () Bool)

(declare-fun e!766724 () Bool)

(assert (=> b!1347584 (= e!766725 (and e!766724 mapRes!57995))))

(declare-fun condMapEmpty!57995 () Bool)

(declare-fun mapDefault!57995 () ValueCell!17863)

