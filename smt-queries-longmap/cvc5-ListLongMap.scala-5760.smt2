; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74408 () Bool)

(assert start!74408)

(declare-fun b_free!15151 () Bool)

(declare-fun b_next!15151 () Bool)

(assert (=> start!74408 (= b_free!15151 (not b_next!15151))))

(declare-fun tp!53130 () Bool)

(declare-fun b_and!24955 () Bool)

(assert (=> start!74408 (= tp!53130 b_and!24955)))

(declare-datatypes ((V!28241 0))(
  ( (V!28242 (val!8745 Int)) )
))
(declare-datatypes ((tuple2!11558 0))(
  ( (tuple2!11559 (_1!5790 (_ BitVec 64)) (_2!5790 V!28241)) )
))
(declare-datatypes ((List!17378 0))(
  ( (Nil!17375) (Cons!17374 (h!18505 tuple2!11558) (t!24433 List!17378)) )
))
(declare-datatypes ((ListLongMap!10327 0))(
  ( (ListLongMap!10328 (toList!5179 List!17378)) )
))
(declare-fun call!38696 () ListLongMap!10327)

(declare-fun bm!38693 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8258 0))(
  ( (ValueCellFull!8258 (v!11178 V!28241)) (EmptyCell!8258) )
))
(declare-datatypes ((array!50916 0))(
  ( (array!50917 (arr!24485 (Array (_ BitVec 32) ValueCell!8258)) (size!24925 (_ BitVec 32))) )
))
(declare-fun lt!396386 () array!50916)

(declare-datatypes ((array!50918 0))(
  ( (array!50919 (arr!24486 (Array (_ BitVec 32) (_ BitVec 64))) (size!24926 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50918)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28241)

(declare-fun zeroValue!654 () V!28241)

(declare-fun getCurrentListMapNoExtraKeys!3146 (array!50918 array!50916 (_ BitVec 32) (_ BitVec 32) V!28241 V!28241 (_ BitVec 32) Int) ListLongMap!10327)

(assert (=> bm!38693 (= call!38696 (getCurrentListMapNoExtraKeys!3146 _keys!868 lt!396386 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27704 () Bool)

(declare-fun mapRes!27704 () Bool)

(declare-fun tp!53131 () Bool)

(declare-fun e!487696 () Bool)

(assert (=> mapNonEmpty!27704 (= mapRes!27704 (and tp!53131 e!487696))))

(declare-fun mapKey!27704 () (_ BitVec 32))

(declare-fun mapValue!27704 () ValueCell!8258)

(declare-fun mapRest!27704 () (Array (_ BitVec 32) ValueCell!8258))

(declare-fun _values!688 () array!50916)

(assert (=> mapNonEmpty!27704 (= (arr!24485 _values!688) (store mapRest!27704 mapKey!27704 mapValue!27704))))

(declare-fun mapIsEmpty!27704 () Bool)

(assert (=> mapIsEmpty!27704 mapRes!27704))

(declare-fun b!876059 () Bool)

(declare-fun e!487700 () Bool)

(declare-fun e!487694 () Bool)

(assert (=> b!876059 (= e!487700 e!487694)))

(declare-fun res!595310 () Bool)

(assert (=> b!876059 (=> (not res!595310) (not e!487694))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876059 (= res!595310 (= from!1053 i!612))))

(declare-fun lt!396384 () ListLongMap!10327)

(assert (=> b!876059 (= lt!396384 (getCurrentListMapNoExtraKeys!3146 _keys!868 lt!396386 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28241)

(assert (=> b!876059 (= lt!396386 (array!50917 (store (arr!24485 _values!688) i!612 (ValueCellFull!8258 v!557)) (size!24925 _values!688)))))

(declare-fun lt!396385 () ListLongMap!10327)

(assert (=> b!876059 (= lt!396385 (getCurrentListMapNoExtraKeys!3146 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876060 () Bool)

(declare-fun res!595311 () Bool)

(assert (=> b!876060 (=> (not res!595311) (not e!487700))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!876060 (= res!595311 (and (= (select (arr!24486 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!876061 () Bool)

(declare-fun res!595319 () Bool)

(assert (=> b!876061 (=> (not res!595319) (not e!487700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876061 (= res!595319 (validMask!0 mask!1196))))

(declare-fun b!876062 () Bool)

(declare-fun tp_is_empty!17395 () Bool)

(assert (=> b!876062 (= e!487696 tp_is_empty!17395)))

(declare-fun b!876063 () Bool)

(declare-fun e!487695 () Bool)

(declare-fun e!487699 () Bool)

(assert (=> b!876063 (= e!487695 (and e!487699 mapRes!27704))))

(declare-fun condMapEmpty!27704 () Bool)

(declare-fun mapDefault!27704 () ValueCell!8258)

