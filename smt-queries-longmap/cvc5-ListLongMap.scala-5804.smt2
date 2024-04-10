; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74896 () Bool)

(assert start!74896)

(declare-fun b_free!15415 () Bool)

(declare-fun b_next!15415 () Bool)

(assert (=> start!74896 (= b_free!15415 (not b_next!15415))))

(declare-fun tp!53948 () Bool)

(declare-fun b_and!25529 () Bool)

(assert (=> start!74896 (= tp!53948 b_and!25529)))

(declare-fun b!882940 () Bool)

(declare-fun res!599843 () Bool)

(declare-fun e!491409 () Bool)

(assert (=> b!882940 (=> (not res!599843) (not e!491409))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882940 (= res!599843 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!28125 () Bool)

(declare-fun mapRes!28125 () Bool)

(declare-fun tp!53947 () Bool)

(declare-fun e!491407 () Bool)

(assert (=> mapNonEmpty!28125 (= mapRes!28125 (and tp!53947 e!491407))))

(declare-datatypes ((V!28593 0))(
  ( (V!28594 (val!8877 Int)) )
))
(declare-datatypes ((ValueCell!8390 0))(
  ( (ValueCellFull!8390 (v!11346 V!28593)) (EmptyCell!8390) )
))
(declare-fun mapRest!28125 () (Array (_ BitVec 32) ValueCell!8390))

(declare-datatypes ((array!51444 0))(
  ( (array!51445 (arr!24741 (Array (_ BitVec 32) ValueCell!8390)) (size!25181 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51444)

(declare-fun mapKey!28125 () (_ BitVec 32))

(declare-fun mapValue!28125 () ValueCell!8390)

(assert (=> mapNonEmpty!28125 (= (arr!24741 _values!688) (store mapRest!28125 mapKey!28125 mapValue!28125))))

(declare-fun b!882941 () Bool)

(declare-fun e!491406 () Bool)

(assert (=> b!882941 (= e!491409 e!491406)))

(declare-fun res!599840 () Bool)

(assert (=> b!882941 (=> (not res!599840) (not e!491406))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882941 (= res!599840 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11756 0))(
  ( (tuple2!11757 (_1!5889 (_ BitVec 64)) (_2!5889 V!28593)) )
))
(declare-datatypes ((List!17566 0))(
  ( (Nil!17563) (Cons!17562 (h!18693 tuple2!11756) (t!24783 List!17566)) )
))
(declare-datatypes ((ListLongMap!10525 0))(
  ( (ListLongMap!10526 (toList!5278 List!17566)) )
))
(declare-fun lt!399519 () ListLongMap!10525)

(declare-fun lt!399518 () array!51444)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51446 0))(
  ( (array!51447 (arr!24742 (Array (_ BitVec 32) (_ BitVec 64))) (size!25182 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51446)

(declare-fun minValue!654 () V!28593)

(declare-fun zeroValue!654 () V!28593)

(declare-fun getCurrentListMapNoExtraKeys!3239 (array!51446 array!51444 (_ BitVec 32) (_ BitVec 32) V!28593 V!28593 (_ BitVec 32) Int) ListLongMap!10525)

(assert (=> b!882941 (= lt!399519 (getCurrentListMapNoExtraKeys!3239 _keys!868 lt!399518 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28593)

(assert (=> b!882941 (= lt!399518 (array!51445 (store (arr!24741 _values!688) i!612 (ValueCellFull!8390 v!557)) (size!25181 _values!688)))))

(declare-fun lt!399517 () ListLongMap!10525)

(assert (=> b!882941 (= lt!399517 (getCurrentListMapNoExtraKeys!3239 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882942 () Bool)

(declare-fun res!599844 () Bool)

(assert (=> b!882942 (=> (not res!599844) (not e!491409))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882942 (= res!599844 (validKeyInArray!0 k!854))))

(declare-fun b!882943 () Bool)

(declare-fun e!491412 () Bool)

(declare-fun e!491405 () Bool)

(assert (=> b!882943 (= e!491412 (and e!491405 mapRes!28125))))

(declare-fun condMapEmpty!28125 () Bool)

(declare-fun mapDefault!28125 () ValueCell!8390)

