; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81852 () Bool)

(assert start!81852)

(declare-fun b_free!18347 () Bool)

(declare-fun b_next!18347 () Bool)

(assert (=> start!81852 (= b_free!18347 (not b_next!18347))))

(declare-fun tp!63741 () Bool)

(declare-fun b_and!29833 () Bool)

(assert (=> start!81852 (= tp!63741 b_and!29833)))

(declare-fun b!954562 () Bool)

(declare-fun e!537793 () Bool)

(assert (=> b!954562 (= e!537793 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32837 0))(
  ( (V!32838 (val!10496 Int)) )
))
(declare-fun zeroValue!1139 () V!32837)

(declare-fun lt!429914 () Bool)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57893 0))(
  ( (array!57894 (arr!27826 (Array (_ BitVec 32) (_ BitVec 64))) (size!28305 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57893)

(declare-datatypes ((ValueCell!9964 0))(
  ( (ValueCellFull!9964 (v!13051 V!32837)) (EmptyCell!9964) )
))
(declare-datatypes ((array!57895 0))(
  ( (array!57896 (arr!27827 (Array (_ BitVec 32) ValueCell!9964)) (size!28306 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57895)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32837)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13620 0))(
  ( (tuple2!13621 (_1!6821 (_ BitVec 64)) (_2!6821 V!32837)) )
))
(declare-datatypes ((List!19400 0))(
  ( (Nil!19397) (Cons!19396 (h!20558 tuple2!13620) (t!27761 List!19400)) )
))
(declare-datatypes ((ListLongMap!12317 0))(
  ( (ListLongMap!12318 (toList!6174 List!19400)) )
))
(declare-fun contains!5272 (ListLongMap!12317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3407 (array!57893 array!57895 (_ BitVec 32) (_ BitVec 32) V!32837 V!32837 (_ BitVec 32) Int) ListLongMap!12317)

(assert (=> b!954562 (= lt!429914 (contains!5272 (getCurrentListMap!3407 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27826 _keys!1441) i!735)))))

(declare-fun b!954563 () Bool)

(declare-fun res!639221 () Bool)

(assert (=> b!954563 (=> (not res!639221) (not e!537793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954563 (= res!639221 (validKeyInArray!0 (select (arr!27826 _keys!1441) i!735)))))

(declare-fun b!954564 () Bool)

(declare-fun e!537792 () Bool)

(declare-fun e!537791 () Bool)

(declare-fun mapRes!33298 () Bool)

(assert (=> b!954564 (= e!537792 (and e!537791 mapRes!33298))))

(declare-fun condMapEmpty!33298 () Bool)

(declare-fun mapDefault!33298 () ValueCell!9964)

