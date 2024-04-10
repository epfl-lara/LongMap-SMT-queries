; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78882 () Bool)

(assert start!78882)

(declare-fun b_free!17095 () Bool)

(declare-fun b_next!17095 () Bool)

(assert (=> start!78882 (= b_free!17095 (not b_next!17095))))

(declare-fun tp!59726 () Bool)

(declare-fun b_and!27927 () Bool)

(assert (=> start!78882 (= tp!59726 b_and!27927)))

(declare-fun b!921954 () Bool)

(declare-fun e!517333 () Bool)

(declare-fun e!517331 () Bool)

(assert (=> b!921954 (= e!517333 e!517331)))

(declare-fun res!621739 () Bool)

(assert (=> b!921954 (=> (not res!621739) (not e!517331))))

(declare-fun lt!413963 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921954 (= res!621739 (validKeyInArray!0 lt!413963))))

(declare-datatypes ((array!55184 0))(
  ( (array!55185 (arr!26537 (Array (_ BitVec 32) (_ BitVec 64))) (size!26996 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55184)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921954 (= lt!413963 (select (arr!26537 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921955 () Bool)

(declare-fun e!517336 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921955 (= e!517336 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31161 () Bool)

(declare-fun mapRes!31161 () Bool)

(assert (=> mapIsEmpty!31161 mapRes!31161))

(declare-fun b!921956 () Bool)

(declare-fun e!517329 () Bool)

(declare-fun e!517332 () Bool)

(assert (=> b!921956 (= e!517329 (and e!517332 mapRes!31161))))

(declare-fun condMapEmpty!31161 () Bool)

(declare-datatypes ((V!31103 0))(
  ( (V!31104 (val!9852 Int)) )
))
(declare-datatypes ((ValueCell!9320 0))(
  ( (ValueCellFull!9320 (v!12370 V!31103)) (EmptyCell!9320) )
))
(declare-datatypes ((array!55186 0))(
  ( (array!55187 (arr!26538 (Array (_ BitVec 32) ValueCell!9320)) (size!26997 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55186)

(declare-fun mapDefault!31161 () ValueCell!9320)

