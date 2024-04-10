; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74194 () Bool)

(assert start!74194)

(declare-fun b_free!15001 () Bool)

(declare-fun b_next!15001 () Bool)

(assert (=> start!74194 (= b_free!15001 (not b_next!15001))))

(declare-fun tp!52653 () Bool)

(declare-fun b_and!24753 () Bool)

(assert (=> start!74194 (= tp!52653 b_and!24753)))

(declare-fun b!872779 () Bool)

(declare-fun res!593164 () Bool)

(declare-fun e!486053 () Bool)

(assert (=> b!872779 (=> (not res!593164) (not e!486053))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872779 (= res!593164 (validKeyInArray!0 k!854))))

(declare-fun b!872780 () Bool)

(declare-fun res!593168 () Bool)

(assert (=> b!872780 (=> (not res!593168) (not e!486053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50594 0))(
  ( (array!50595 (arr!24327 (Array (_ BitVec 32) (_ BitVec 64))) (size!24767 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50594)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!872780 (= res!593168 (and (= (select (arr!24327 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24767 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!872781 () Bool)

(declare-fun res!593165 () Bool)

(assert (=> b!872781 (=> (not res!593165) (not e!486053))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872781 (= res!593165 (validMask!0 mask!1196))))

(declare-fun b!872782 () Bool)

(declare-fun res!593167 () Bool)

(assert (=> b!872782 (=> (not res!593167) (not e!486053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50594 (_ BitVec 32)) Bool)

(assert (=> b!872782 (= res!593167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872783 () Bool)

(declare-fun res!593161 () Bool)

(assert (=> b!872783 (=> (not res!593161) (not e!486053))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28025 0))(
  ( (V!28026 (val!8664 Int)) )
))
(declare-datatypes ((ValueCell!8177 0))(
  ( (ValueCellFull!8177 (v!11089 V!28025)) (EmptyCell!8177) )
))
(declare-datatypes ((array!50596 0))(
  ( (array!50597 (arr!24328 (Array (_ BitVec 32) ValueCell!8177)) (size!24768 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50596)

(assert (=> b!872783 (= res!593161 (and (= (size!24768 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24767 _keys!868) (size!24768 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872784 () Bool)

(declare-fun res!593166 () Bool)

(assert (=> b!872784 (=> (not res!593166) (not e!486053))))

(assert (=> b!872784 (= res!593166 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24767 _keys!868))))))

(declare-fun res!593162 () Bool)

(assert (=> start!74194 (=> (not res!593162) (not e!486053))))

(assert (=> start!74194 (= res!593162 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24767 _keys!868))))))

(assert (=> start!74194 e!486053))

(declare-fun tp_is_empty!17233 () Bool)

(assert (=> start!74194 tp_is_empty!17233))

(assert (=> start!74194 true))

(assert (=> start!74194 tp!52653))

(declare-fun array_inv!19196 (array!50594) Bool)

(assert (=> start!74194 (array_inv!19196 _keys!868)))

(declare-fun e!486054 () Bool)

(declare-fun array_inv!19197 (array!50596) Bool)

(assert (=> start!74194 (and (array_inv!19197 _values!688) e!486054)))

(declare-fun b!872785 () Bool)

(declare-fun e!486055 () Bool)

(assert (=> b!872785 (= e!486055 tp_is_empty!17233)))

(declare-fun mapNonEmpty!27452 () Bool)

(declare-fun mapRes!27452 () Bool)

(declare-fun tp!52654 () Bool)

(assert (=> mapNonEmpty!27452 (= mapRes!27452 (and tp!52654 e!486055))))

(declare-fun mapValue!27452 () ValueCell!8177)

(declare-fun mapKey!27452 () (_ BitVec 32))

(declare-fun mapRest!27452 () (Array (_ BitVec 32) ValueCell!8177))

(assert (=> mapNonEmpty!27452 (= (arr!24328 _values!688) (store mapRest!27452 mapKey!27452 mapValue!27452))))

(declare-fun mapIsEmpty!27452 () Bool)

(assert (=> mapIsEmpty!27452 mapRes!27452))

(declare-fun b!872786 () Bool)

(declare-fun res!593163 () Bool)

(assert (=> b!872786 (=> (not res!593163) (not e!486053))))

(declare-datatypes ((List!17272 0))(
  ( (Nil!17269) (Cons!17268 (h!18399 (_ BitVec 64)) (t!24309 List!17272)) )
))
(declare-fun arrayNoDuplicates!0 (array!50594 (_ BitVec 32) List!17272) Bool)

(assert (=> b!872786 (= res!593163 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17269))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11454 0))(
  ( (tuple2!11455 (_1!5738 (_ BitVec 64)) (_2!5738 V!28025)) )
))
(declare-datatypes ((List!17273 0))(
  ( (Nil!17270) (Cons!17269 (h!18400 tuple2!11454) (t!24310 List!17273)) )
))
(declare-datatypes ((ListLongMap!10223 0))(
  ( (ListLongMap!10224 (toList!5127 List!17273)) )
))
(declare-fun call!38470 () ListLongMap!10223)

(declare-fun minValue!654 () V!28025)

(declare-fun zeroValue!654 () V!28025)

(declare-fun bm!38467 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3096 (array!50594 array!50596 (_ BitVec 32) (_ BitVec 32) V!28025 V!28025 (_ BitVec 32) Int) ListLongMap!10223)

(assert (=> bm!38467 (= call!38470 (getCurrentListMapNoExtraKeys!3096 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872787 () Bool)

(declare-fun e!486058 () Bool)

(assert (=> b!872787 (= e!486054 (and e!486058 mapRes!27452))))

(declare-fun condMapEmpty!27452 () Bool)

(declare-fun mapDefault!27452 () ValueCell!8177)

