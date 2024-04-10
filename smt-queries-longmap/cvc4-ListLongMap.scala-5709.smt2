; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74042 () Bool)

(assert start!74042)

(declare-fun b_free!14957 () Bool)

(declare-fun b_next!14957 () Bool)

(assert (=> start!74042 (= b_free!14957 (not b_next!14957))))

(declare-fun tp!52375 () Bool)

(declare-fun b_and!24709 () Bool)

(assert (=> start!74042 (= tp!52375 b_and!24709)))

(declare-fun b!870879 () Bool)

(declare-fun e!484912 () Bool)

(declare-fun e!484914 () Bool)

(assert (=> b!870879 (= e!484912 e!484914)))

(declare-fun res!591940 () Bool)

(assert (=> b!870879 (=> (not res!591940) (not e!484914))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870879 (= res!591940 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27837 0))(
  ( (V!27838 (val!8594 Int)) )
))
(declare-datatypes ((ValueCell!8107 0))(
  ( (ValueCellFull!8107 (v!11019 V!27837)) (EmptyCell!8107) )
))
(declare-datatypes ((array!50330 0))(
  ( (array!50331 (arr!24196 (Array (_ BitVec 32) ValueCell!8107)) (size!24636 (_ BitVec 32))) )
))
(declare-fun lt!395284 () array!50330)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50332 0))(
  ( (array!50333 (arr!24197 (Array (_ BitVec 32) (_ BitVec 64))) (size!24637 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50332)

(declare-datatypes ((tuple2!11418 0))(
  ( (tuple2!11419 (_1!5720 (_ BitVec 64)) (_2!5720 V!27837)) )
))
(declare-datatypes ((List!17207 0))(
  ( (Nil!17204) (Cons!17203 (h!18334 tuple2!11418) (t!24244 List!17207)) )
))
(declare-datatypes ((ListLongMap!10187 0))(
  ( (ListLongMap!10188 (toList!5109 List!17207)) )
))
(declare-fun lt!395281 () ListLongMap!10187)

(declare-fun minValue!654 () V!27837)

(declare-fun zeroValue!654 () V!27837)

(declare-fun getCurrentListMapNoExtraKeys!3078 (array!50332 array!50330 (_ BitVec 32) (_ BitVec 32) V!27837 V!27837 (_ BitVec 32) Int) ListLongMap!10187)

(assert (=> b!870879 (= lt!395281 (getCurrentListMapNoExtraKeys!3078 _keys!868 lt!395284 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27837)

(declare-fun _values!688 () array!50330)

(assert (=> b!870879 (= lt!395284 (array!50331 (store (arr!24196 _values!688) i!612 (ValueCellFull!8107 v!557)) (size!24636 _values!688)))))

(declare-fun lt!395282 () ListLongMap!10187)

(assert (=> b!870879 (= lt!395282 (getCurrentListMapNoExtraKeys!3078 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870880 () Bool)

(declare-fun e!484911 () Bool)

(declare-fun e!484910 () Bool)

(declare-fun mapRes!27239 () Bool)

(assert (=> b!870880 (= e!484911 (and e!484910 mapRes!27239))))

(declare-fun condMapEmpty!27239 () Bool)

(declare-fun mapDefault!27239 () ValueCell!8107)

