; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113538 () Bool)

(assert start!113538)

(declare-fun b_free!31531 () Bool)

(declare-fun b_next!31531 () Bool)

(assert (=> start!113538 (= b_free!31531 (not b_next!31531))))

(declare-fun tp!110402 () Bool)

(declare-fun b_and!50851 () Bool)

(assert (=> start!113538 (= tp!110402 b_and!50851)))

(declare-fun b!1347731 () Bool)

(declare-fun res!894228 () Bool)

(declare-fun e!766785 () Bool)

(assert (=> b!1347731 (=> (not res!894228) (not e!766785))))

(declare-datatypes ((V!55145 0))(
  ( (V!55146 (val!18840 Int)) )
))
(declare-fun minValue!1245 () V!55145)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91894 0))(
  ( (array!91895 (arr!44402 (Array (_ BitVec 32) (_ BitVec 64))) (size!44952 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91894)

(declare-fun zeroValue!1245 () V!55145)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17867 0))(
  ( (ValueCellFull!17867 (v!21491 V!55145)) (EmptyCell!17867) )
))
(declare-datatypes ((array!91896 0))(
  ( (array!91897 (arr!44403 (Array (_ BitVec 32) ValueCell!17867)) (size!44953 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91896)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((tuple2!24288 0))(
  ( (tuple2!24289 (_1!12155 (_ BitVec 64)) (_2!12155 V!55145)) )
))
(declare-datatypes ((List!31443 0))(
  ( (Nil!31440) (Cons!31439 (h!32648 tuple2!24288) (t!46053 List!31443)) )
))
(declare-datatypes ((ListLongMap!21945 0))(
  ( (ListLongMap!21946 (toList!10988 List!31443)) )
))
(declare-fun contains!9166 (ListLongMap!21945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5939 (array!91894 array!91896 (_ BitVec 32) (_ BitVec 32) V!55145 V!55145 (_ BitVec 32) Int) ListLongMap!21945)

(assert (=> b!1347731 (= res!894228 (contains!9166 (getCurrentListMap!5939 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1347732 () Bool)

(declare-fun e!766784 () Bool)

(declare-fun e!766787 () Bool)

(declare-fun mapRes!58007 () Bool)

(assert (=> b!1347732 (= e!766784 (and e!766787 mapRes!58007))))

(declare-fun condMapEmpty!58007 () Bool)

(declare-fun mapDefault!58007 () ValueCell!17867)

