; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113674 () Bool)

(assert start!113674)

(declare-fun b_free!31583 () Bool)

(declare-fun b_next!31583 () Bool)

(assert (=> start!113674 (= b_free!31583 (not b_next!31583))))

(declare-fun tp!110564 () Bool)

(declare-fun b_and!50965 () Bool)

(assert (=> start!113674 (= tp!110564 b_and!50965)))

(declare-fun mapNonEmpty!58092 () Bool)

(declare-fun mapRes!58092 () Bool)

(declare-fun tp!110565 () Bool)

(declare-fun e!767524 () Bool)

(assert (=> mapNonEmpty!58092 (= mapRes!58092 (and tp!110565 e!767524))))

(declare-datatypes ((V!55213 0))(
  ( (V!55214 (val!18866 Int)) )
))
(declare-datatypes ((ValueCell!17893 0))(
  ( (ValueCellFull!17893 (v!21521 V!55213)) (EmptyCell!17893) )
))
(declare-fun mapRest!58092 () (Array (_ BitVec 32) ValueCell!17893))

(declare-fun mapValue!58092 () ValueCell!17893)

(declare-datatypes ((array!91996 0))(
  ( (array!91997 (arr!44451 (Array (_ BitVec 32) ValueCell!17893)) (size!45001 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91996)

(declare-fun mapKey!58092 () (_ BitVec 32))

(assert (=> mapNonEmpty!58092 (= (arr!44451 _values!1303) (store mapRest!58092 mapKey!58092 mapValue!58092))))

(declare-fun b!1349218 () Bool)

(declare-fun res!895119 () Bool)

(declare-fun e!767523 () Bool)

(assert (=> b!1349218 (=> (not res!895119) (not e!767523))))

(declare-fun minValue!1245 () V!55213)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91998 0))(
  ( (array!91999 (arr!44452 (Array (_ BitVec 32) (_ BitVec 64))) (size!45002 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91998)

(declare-fun zeroValue!1245 () V!55213)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24332 0))(
  ( (tuple2!24333 (_1!12177 (_ BitVec 64)) (_2!12177 V!55213)) )
))
(declare-datatypes ((List!31483 0))(
  ( (Nil!31480) (Cons!31479 (h!32688 tuple2!24332) (t!46133 List!31483)) )
))
(declare-datatypes ((ListLongMap!21989 0))(
  ( (ListLongMap!21990 (toList!11010 List!31483)) )
))
(declare-fun contains!9192 (ListLongMap!21989 (_ BitVec 64)) Bool)

(declare-fun +!4853 (ListLongMap!21989 tuple2!24332) ListLongMap!21989)

(declare-fun getCurrentListMapNoExtraKeys!6499 (array!91998 array!91996 (_ BitVec 32) (_ BitVec 32) V!55213 V!55213 (_ BitVec 32) Int) ListLongMap!21989)

(declare-fun get!22460 (ValueCell!17893 V!55213) V!55213)

(declare-fun dynLambda!3792 (Int (_ BitVec 64)) V!55213)

(assert (=> b!1349218 (= res!895119 (contains!9192 (+!4853 (getCurrentListMapNoExtraKeys!6499 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24333 (select (arr!44452 _keys!1571) from!1960) (get!22460 (select (arr!44451 _values!1303) from!1960) (dynLambda!3792 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1142))))

(declare-fun b!1349219 () Bool)

(declare-fun res!895117 () Bool)

(assert (=> b!1349219 (=> (not res!895117) (not e!767523))))

(assert (=> b!1349219 (= res!895117 (not (= (select (arr!44452 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1349220 () Bool)

(declare-fun res!895121 () Bool)

(assert (=> b!1349220 (=> (not res!895121) (not e!767523))))

(declare-datatypes ((List!31484 0))(
  ( (Nil!31481) (Cons!31480 (h!32689 (_ BitVec 64)) (t!46134 List!31484)) )
))
(declare-fun arrayNoDuplicates!0 (array!91998 (_ BitVec 32) List!31484) Bool)

(assert (=> b!1349220 (= res!895121 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31481))))

(declare-fun b!1349221 () Bool)

(declare-fun e!767526 () Bool)

(declare-fun e!767525 () Bool)

(assert (=> b!1349221 (= e!767526 (and e!767525 mapRes!58092))))

(declare-fun condMapEmpty!58092 () Bool)

(declare-fun mapDefault!58092 () ValueCell!17893)

