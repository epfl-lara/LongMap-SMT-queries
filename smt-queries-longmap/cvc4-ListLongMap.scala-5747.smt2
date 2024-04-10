; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74314 () Bool)

(assert start!74314)

(declare-fun b_free!15077 () Bool)

(declare-fun b_next!15077 () Bool)

(assert (=> start!74314 (= b_free!15077 (not b_next!15077))))

(declare-fun tp!52906 () Bool)

(declare-fun b_and!24853 () Bool)

(assert (=> start!74314 (= tp!52906 b_and!24853)))

(declare-fun b!874446 () Bool)

(declare-fun res!594251 () Bool)

(declare-fun e!486873 () Bool)

(assert (=> b!874446 (=> (not res!594251) (not e!486873))))

(declare-datatypes ((array!50770 0))(
  ( (array!50771 (arr!24413 (Array (_ BitVec 32) (_ BitVec 64))) (size!24853 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50770)

(declare-datatypes ((List!17329 0))(
  ( (Nil!17326) (Cons!17325 (h!18456 (_ BitVec 64)) (t!24370 List!17329)) )
))
(declare-fun arrayNoDuplicates!0 (array!50770 (_ BitVec 32) List!17329) Bool)

(assert (=> b!874446 (= res!594251 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17326))))

(declare-fun b!874447 () Bool)

(declare-fun res!594256 () Bool)

(assert (=> b!874447 (=> (not res!594256) (not e!486873))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874447 (= res!594256 (and (= (select (arr!24413 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874448 () Bool)

(declare-fun res!594255 () Bool)

(assert (=> b!874448 (=> (not res!594255) (not e!486873))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874448 (= res!594255 (validMask!0 mask!1196))))

(declare-fun b!874449 () Bool)

(assert (=> b!874449 (= e!486873 false)))

(declare-datatypes ((V!28141 0))(
  ( (V!28142 (val!8708 Int)) )
))
(declare-fun v!557 () V!28141)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11508 0))(
  ( (tuple2!11509 (_1!5765 (_ BitVec 64)) (_2!5765 V!28141)) )
))
(declare-datatypes ((List!17330 0))(
  ( (Nil!17327) (Cons!17326 (h!18457 tuple2!11508) (t!24371 List!17330)) )
))
(declare-datatypes ((ListLongMap!10277 0))(
  ( (ListLongMap!10278 (toList!5154 List!17330)) )
))
(declare-fun lt!395944 () ListLongMap!10277)

(declare-datatypes ((ValueCell!8221 0))(
  ( (ValueCellFull!8221 (v!11137 V!28141)) (EmptyCell!8221) )
))
(declare-datatypes ((array!50772 0))(
  ( (array!50773 (arr!24414 (Array (_ BitVec 32) ValueCell!8221)) (size!24854 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50772)

(declare-fun minValue!654 () V!28141)

(declare-fun zeroValue!654 () V!28141)

(declare-fun getCurrentListMapNoExtraKeys!3121 (array!50770 array!50772 (_ BitVec 32) (_ BitVec 32) V!28141 V!28141 (_ BitVec 32) Int) ListLongMap!10277)

(assert (=> b!874449 (= lt!395944 (getCurrentListMapNoExtraKeys!3121 _keys!868 (array!50773 (store (arr!24414 _values!688) i!612 (ValueCellFull!8221 v!557)) (size!24854 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395945 () ListLongMap!10277)

(assert (=> b!874449 (= lt!395945 (getCurrentListMapNoExtraKeys!3121 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874450 () Bool)

(declare-fun res!594258 () Bool)

(assert (=> b!874450 (=> (not res!594258) (not e!486873))))

(assert (=> b!874450 (= res!594258 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24853 _keys!868))))))

(declare-fun b!874451 () Bool)

(declare-fun res!594252 () Bool)

(assert (=> b!874451 (=> (not res!594252) (not e!486873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874451 (= res!594252 (validKeyInArray!0 k!854))))

(declare-fun b!874452 () Bool)

(declare-fun e!486875 () Bool)

(declare-fun tp_is_empty!17321 () Bool)

(assert (=> b!874452 (= e!486875 tp_is_empty!17321)))

(declare-fun b!874453 () Bool)

(declare-fun res!594257 () Bool)

(assert (=> b!874453 (=> (not res!594257) (not e!486873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50770 (_ BitVec 32)) Bool)

(assert (=> b!874453 (= res!594257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27590 () Bool)

(declare-fun mapRes!27590 () Bool)

(assert (=> mapIsEmpty!27590 mapRes!27590))

(declare-fun b!874454 () Bool)

(declare-fun e!486871 () Bool)

(assert (=> b!874454 (= e!486871 (and e!486875 mapRes!27590))))

(declare-fun condMapEmpty!27590 () Bool)

(declare-fun mapDefault!27590 () ValueCell!8221)

