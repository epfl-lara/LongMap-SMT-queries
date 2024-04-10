; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74032 () Bool)

(assert start!74032)

(declare-fun b_free!14947 () Bool)

(declare-fun b_next!14947 () Bool)

(assert (=> start!74032 (= b_free!14947 (not b_next!14947))))

(declare-fun tp!52345 () Bool)

(declare-fun b_and!24699 () Bool)

(assert (=> start!74032 (= tp!52345 b_and!24699)))

(declare-fun b!870699 () Bool)

(declare-fun res!591800 () Bool)

(declare-fun e!484824 () Bool)

(assert (=> b!870699 (=> (not res!591800) (not e!484824))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870699 (= res!591800 (validKeyInArray!0 k!854))))

(declare-fun b!870700 () Bool)

(declare-fun res!591806 () Bool)

(assert (=> b!870700 (=> (not res!591806) (not e!484824))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870700 (= res!591806 (validMask!0 mask!1196))))

(declare-fun b!870701 () Bool)

(declare-fun e!484825 () Bool)

(assert (=> b!870701 (= e!484824 e!484825)))

(declare-fun res!591802 () Bool)

(assert (=> b!870701 (=> (not res!591802) (not e!484825))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870701 (= res!591802 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27825 0))(
  ( (V!27826 (val!8589 Int)) )
))
(declare-datatypes ((ValueCell!8102 0))(
  ( (ValueCellFull!8102 (v!11014 V!27825)) (EmptyCell!8102) )
))
(declare-datatypes ((array!50310 0))(
  ( (array!50311 (arr!24186 (Array (_ BitVec 32) ValueCell!8102)) (size!24626 (_ BitVec 32))) )
))
(declare-fun lt!395221 () array!50310)

(declare-datatypes ((tuple2!11412 0))(
  ( (tuple2!11413 (_1!5717 (_ BitVec 64)) (_2!5717 V!27825)) )
))
(declare-datatypes ((List!17202 0))(
  ( (Nil!17199) (Cons!17198 (h!18329 tuple2!11412) (t!24239 List!17202)) )
))
(declare-datatypes ((ListLongMap!10181 0))(
  ( (ListLongMap!10182 (toList!5106 List!17202)) )
))
(declare-fun lt!395222 () ListLongMap!10181)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50312 0))(
  ( (array!50313 (arr!24187 (Array (_ BitVec 32) (_ BitVec 64))) (size!24627 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50312)

(declare-fun minValue!654 () V!27825)

(declare-fun zeroValue!654 () V!27825)

(declare-fun getCurrentListMapNoExtraKeys!3075 (array!50312 array!50310 (_ BitVec 32) (_ BitVec 32) V!27825 V!27825 (_ BitVec 32) Int) ListLongMap!10181)

(assert (=> b!870701 (= lt!395222 (getCurrentListMapNoExtraKeys!3075 _keys!868 lt!395221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27825)

(declare-fun _values!688 () array!50310)

(assert (=> b!870701 (= lt!395221 (array!50311 (store (arr!24186 _values!688) i!612 (ValueCellFull!8102 v!557)) (size!24626 _values!688)))))

(declare-fun lt!395223 () ListLongMap!10181)

(assert (=> b!870701 (= lt!395223 (getCurrentListMapNoExtraKeys!3075 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870702 () Bool)

(declare-fun e!484821 () Bool)

(declare-fun tp_is_empty!17083 () Bool)

(assert (=> b!870702 (= e!484821 tp_is_empty!17083)))

(declare-fun b!870703 () Bool)

(declare-fun res!591799 () Bool)

(assert (=> b!870703 (=> (not res!591799) (not e!484824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50312 (_ BitVec 32)) Bool)

(assert (=> b!870703 (= res!591799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870704 () Bool)

(declare-fun res!591803 () Bool)

(assert (=> b!870704 (=> (not res!591803) (not e!484824))))

(assert (=> b!870704 (= res!591803 (and (= (size!24626 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24627 _keys!868) (size!24626 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27224 () Bool)

(declare-fun mapRes!27224 () Bool)

(assert (=> mapIsEmpty!27224 mapRes!27224))

(declare-fun b!870705 () Bool)

(assert (=> b!870705 (= e!484825 (not true))))

(declare-fun +!2443 (ListLongMap!10181 tuple2!11412) ListLongMap!10181)

(assert (=> b!870705 (= (getCurrentListMapNoExtraKeys!3075 _keys!868 lt!395221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2443 (getCurrentListMapNoExtraKeys!3075 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11413 k!854 v!557)))))

(declare-datatypes ((Unit!29884 0))(
  ( (Unit!29885) )
))
(declare-fun lt!395224 () Unit!29884)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!637 (array!50312 array!50310 (_ BitVec 32) (_ BitVec 32) V!27825 V!27825 (_ BitVec 32) (_ BitVec 64) V!27825 (_ BitVec 32) Int) Unit!29884)

(assert (=> b!870705 (= lt!395224 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!637 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870706 () Bool)

(declare-fun e!484820 () Bool)

(assert (=> b!870706 (= e!484820 (and e!484821 mapRes!27224))))

(declare-fun condMapEmpty!27224 () Bool)

(declare-fun mapDefault!27224 () ValueCell!8102)

