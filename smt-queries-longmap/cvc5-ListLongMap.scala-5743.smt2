; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74286 () Bool)

(assert start!74286)

(declare-fun b_free!15049 () Bool)

(declare-fun b_next!15049 () Bool)

(assert (=> start!74286 (= b_free!15049 (not b_next!15049))))

(declare-fun tp!52822 () Bool)

(declare-fun b_and!24825 () Bool)

(assert (=> start!74286 (= tp!52822 b_and!24825)))

(declare-fun mapIsEmpty!27548 () Bool)

(declare-fun mapRes!27548 () Bool)

(assert (=> mapIsEmpty!27548 mapRes!27548))

(declare-fun res!593917 () Bool)

(declare-fun e!486664 () Bool)

(assert (=> start!74286 (=> (not res!593917) (not e!486664))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50714 0))(
  ( (array!50715 (arr!24385 (Array (_ BitVec 32) (_ BitVec 64))) (size!24825 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50714)

(assert (=> start!74286 (= res!593917 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24825 _keys!868))))))

(assert (=> start!74286 e!486664))

(declare-fun tp_is_empty!17293 () Bool)

(assert (=> start!74286 tp_is_empty!17293))

(assert (=> start!74286 true))

(assert (=> start!74286 tp!52822))

(declare-fun array_inv!19236 (array!50714) Bool)

(assert (=> start!74286 (array_inv!19236 _keys!868)))

(declare-datatypes ((V!28105 0))(
  ( (V!28106 (val!8694 Int)) )
))
(declare-datatypes ((ValueCell!8207 0))(
  ( (ValueCellFull!8207 (v!11123 V!28105)) (EmptyCell!8207) )
))
(declare-datatypes ((array!50716 0))(
  ( (array!50717 (arr!24386 (Array (_ BitVec 32) ValueCell!8207)) (size!24826 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50716)

(declare-fun e!486662 () Bool)

(declare-fun array_inv!19237 (array!50716) Bool)

(assert (=> start!74286 (and (array_inv!19237 _values!688) e!486662)))

(declare-fun b!873983 () Bool)

(assert (=> b!873983 (= e!486664 false)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11490 0))(
  ( (tuple2!11491 (_1!5756 (_ BitVec 64)) (_2!5756 V!28105)) )
))
(declare-datatypes ((List!17309 0))(
  ( (Nil!17306) (Cons!17305 (h!18436 tuple2!11490) (t!24350 List!17309)) )
))
(declare-datatypes ((ListLongMap!10259 0))(
  ( (ListLongMap!10260 (toList!5145 List!17309)) )
))
(declare-fun lt!395860 () ListLongMap!10259)

(declare-fun minValue!654 () V!28105)

(declare-fun zeroValue!654 () V!28105)

(declare-fun v!557 () V!28105)

(declare-fun getCurrentListMapNoExtraKeys!3112 (array!50714 array!50716 (_ BitVec 32) (_ BitVec 32) V!28105 V!28105 (_ BitVec 32) Int) ListLongMap!10259)

(assert (=> b!873983 (= lt!395860 (getCurrentListMapNoExtraKeys!3112 _keys!868 (array!50717 (store (arr!24386 _values!688) i!612 (ValueCellFull!8207 v!557)) (size!24826 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395861 () ListLongMap!10259)

(assert (=> b!873983 (= lt!395861 (getCurrentListMapNoExtraKeys!3112 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27548 () Bool)

(declare-fun tp!52821 () Bool)

(declare-fun e!486661 () Bool)

(assert (=> mapNonEmpty!27548 (= mapRes!27548 (and tp!52821 e!486661))))

(declare-fun mapKey!27548 () (_ BitVec 32))

(declare-fun mapRest!27548 () (Array (_ BitVec 32) ValueCell!8207))

(declare-fun mapValue!27548 () ValueCell!8207)

(assert (=> mapNonEmpty!27548 (= (arr!24386 _values!688) (store mapRest!27548 mapKey!27548 mapValue!27548))))

(declare-fun b!873984 () Bool)

(declare-fun res!593916 () Bool)

(assert (=> b!873984 (=> (not res!593916) (not e!486664))))

(assert (=> b!873984 (= res!593916 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24825 _keys!868))))))

(declare-fun b!873985 () Bool)

(declare-fun res!593915 () Bool)

(assert (=> b!873985 (=> (not res!593915) (not e!486664))))

(assert (=> b!873985 (= res!593915 (and (= (size!24826 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24825 _keys!868) (size!24826 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873986 () Bool)

(declare-fun res!593919 () Bool)

(assert (=> b!873986 (=> (not res!593919) (not e!486664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50714 (_ BitVec 32)) Bool)

(assert (=> b!873986 (= res!593919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873987 () Bool)

(declare-fun res!593921 () Bool)

(assert (=> b!873987 (=> (not res!593921) (not e!486664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873987 (= res!593921 (validMask!0 mask!1196))))

(declare-fun b!873988 () Bool)

(assert (=> b!873988 (= e!486661 tp_is_empty!17293)))

(declare-fun b!873989 () Bool)

(declare-fun res!593920 () Bool)

(assert (=> b!873989 (=> (not res!593920) (not e!486664))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!873989 (= res!593920 (and (= (select (arr!24385 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!873990 () Bool)

(declare-fun res!593922 () Bool)

(assert (=> b!873990 (=> (not res!593922) (not e!486664))))

(declare-datatypes ((List!17310 0))(
  ( (Nil!17307) (Cons!17306 (h!18437 (_ BitVec 64)) (t!24351 List!17310)) )
))
(declare-fun arrayNoDuplicates!0 (array!50714 (_ BitVec 32) List!17310) Bool)

(assert (=> b!873990 (= res!593922 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17307))))

(declare-fun b!873991 () Bool)

(declare-fun res!593918 () Bool)

(assert (=> b!873991 (=> (not res!593918) (not e!486664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873991 (= res!593918 (validKeyInArray!0 k!854))))

(declare-fun b!873992 () Bool)

(declare-fun e!486663 () Bool)

(assert (=> b!873992 (= e!486662 (and e!486663 mapRes!27548))))

(declare-fun condMapEmpty!27548 () Bool)

(declare-fun mapDefault!27548 () ValueCell!8207)

