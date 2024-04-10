; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113556 () Bool)

(assert start!113556)

(declare-fun b_free!31549 () Bool)

(declare-fun b_next!31549 () Bool)

(assert (=> start!113556 (= b_free!31549 (not b_next!31549))))

(declare-fun tp!110456 () Bool)

(declare-fun b_and!50887 () Bool)

(assert (=> start!113556 (= tp!110456 b_and!50887)))

(declare-fun b!1348073 () Bool)

(declare-fun res!894465 () Bool)

(declare-fun e!766920 () Bool)

(assert (=> b!1348073 (=> (not res!894465) (not e!766920))))

(declare-datatypes ((V!55169 0))(
  ( (V!55170 (val!18849 Int)) )
))
(declare-fun minValue!1245 () V!55169)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91928 0))(
  ( (array!91929 (arr!44419 (Array (_ BitVec 32) (_ BitVec 64))) (size!44969 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91928)

(declare-fun zeroValue!1245 () V!55169)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17876 0))(
  ( (ValueCellFull!17876 (v!21500 V!55169)) (EmptyCell!17876) )
))
(declare-datatypes ((array!91930 0))(
  ( (array!91931 (arr!44420 (Array (_ BitVec 32) ValueCell!17876)) (size!44970 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91930)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24302 0))(
  ( (tuple2!24303 (_1!12162 (_ BitVec 64)) (_2!12162 V!55169)) )
))
(declare-datatypes ((List!31456 0))(
  ( (Nil!31453) (Cons!31452 (h!32661 tuple2!24302) (t!46084 List!31456)) )
))
(declare-datatypes ((ListLongMap!21959 0))(
  ( (ListLongMap!21960 (toList!10995 List!31456)) )
))
(declare-fun contains!9173 (ListLongMap!21959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5945 (array!91928 array!91930 (_ BitVec 32) (_ BitVec 32) V!55169 V!55169 (_ BitVec 32) Int) ListLongMap!21959)

(assert (=> b!1348073 (= res!894465 (contains!9173 (getCurrentListMap!5945 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1348074 () Bool)

(declare-fun res!894473 () Bool)

(assert (=> b!1348074 (=> (not res!894473) (not e!766920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91928 (_ BitVec 32)) Bool)

(assert (=> b!1348074 (= res!894473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348075 () Bool)

(declare-fun res!894469 () Bool)

(assert (=> b!1348075 (=> (not res!894469) (not e!766920))))

(assert (=> b!1348075 (= res!894469 (not (= (select (arr!44419 _keys!1571) from!1960) k!1142)))))

(declare-fun mapIsEmpty!58034 () Bool)

(declare-fun mapRes!58034 () Bool)

(assert (=> mapIsEmpty!58034 mapRes!58034))

(declare-fun b!1348076 () Bool)

(declare-fun res!894472 () Bool)

(assert (=> b!1348076 (=> (not res!894472) (not e!766920))))

(assert (=> b!1348076 (= res!894472 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1348077 () Bool)

(declare-fun e!766921 () Bool)

(declare-fun e!766918 () Bool)

(assert (=> b!1348077 (= e!766921 (and e!766918 mapRes!58034))))

(declare-fun condMapEmpty!58034 () Bool)

(declare-fun mapDefault!58034 () ValueCell!17876)

