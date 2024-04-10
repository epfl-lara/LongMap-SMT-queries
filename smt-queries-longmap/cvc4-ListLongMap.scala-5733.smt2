; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74198 () Bool)

(assert start!74198)

(declare-fun b_free!15005 () Bool)

(declare-fun b_next!15005 () Bool)

(assert (=> start!74198 (= b_free!15005 (not b_next!15005))))

(declare-fun tp!52666 () Bool)

(declare-fun b_and!24757 () Bool)

(assert (=> start!74198 (= tp!52666 b_and!24757)))

(declare-fun b!872857 () Bool)

(declare-fun e!486090 () Bool)

(assert (=> b!872857 (= e!486090 (not true))))

(declare-fun e!486091 () Bool)

(assert (=> b!872857 e!486091))

(declare-fun c!92401 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!872857 (= c!92401 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28029 0))(
  ( (V!28030 (val!8666 Int)) )
))
(declare-fun v!557 () V!28029)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50602 0))(
  ( (array!50603 (arr!24331 (Array (_ BitVec 32) (_ BitVec 64))) (size!24771 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50602)

(declare-datatypes ((ValueCell!8179 0))(
  ( (ValueCellFull!8179 (v!11091 V!28029)) (EmptyCell!8179) )
))
(declare-datatypes ((array!50604 0))(
  ( (array!50605 (arr!24332 (Array (_ BitVec 32) ValueCell!8179)) (size!24772 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50604)

(declare-fun minValue!654 () V!28029)

(declare-fun zeroValue!654 () V!28029)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29918 0))(
  ( (Unit!29919) )
))
(declare-fun lt!395662 () Unit!29918)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!653 (array!50602 array!50604 (_ BitVec 32) (_ BitVec 32) V!28029 V!28029 (_ BitVec 32) (_ BitVec 64) V!28029 (_ BitVec 32) Int) Unit!29918)

(assert (=> b!872857 (= lt!395662 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!653 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!593209 () Bool)

(assert (=> start!74198 (=> (not res!593209) (not e!486090))))

(assert (=> start!74198 (= res!593209 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24771 _keys!868))))))

(assert (=> start!74198 e!486090))

(declare-fun tp_is_empty!17237 () Bool)

(assert (=> start!74198 tp_is_empty!17237))

(assert (=> start!74198 true))

(assert (=> start!74198 tp!52666))

(declare-fun array_inv!19200 (array!50602) Bool)

(assert (=> start!74198 (array_inv!19200 _keys!868)))

(declare-fun e!486089 () Bool)

(declare-fun array_inv!19201 (array!50604) Bool)

(assert (=> start!74198 (and (array_inv!19201 _values!688) e!486089)))

(declare-fun b!872858 () Bool)

(declare-fun res!593212 () Bool)

(assert (=> b!872858 (=> (not res!593212) (not e!486090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50602 (_ BitVec 32)) Bool)

(assert (=> b!872858 (= res!593212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27458 () Bool)

(declare-fun mapRes!27458 () Bool)

(declare-fun tp!52665 () Bool)

(declare-fun e!486094 () Bool)

(assert (=> mapNonEmpty!27458 (= mapRes!27458 (and tp!52665 e!486094))))

(declare-fun mapRest!27458 () (Array (_ BitVec 32) ValueCell!8179))

(declare-fun mapValue!27458 () ValueCell!8179)

(declare-fun mapKey!27458 () (_ BitVec 32))

(assert (=> mapNonEmpty!27458 (= (arr!24332 _values!688) (store mapRest!27458 mapKey!27458 mapValue!27458))))

(declare-fun b!872859 () Bool)

(declare-fun e!486093 () Bool)

(assert (=> b!872859 (= e!486093 tp_is_empty!17237)))

(declare-datatypes ((tuple2!11458 0))(
  ( (tuple2!11459 (_1!5740 (_ BitVec 64)) (_2!5740 V!28029)) )
))
(declare-datatypes ((List!17276 0))(
  ( (Nil!17273) (Cons!17272 (h!18403 tuple2!11458) (t!24313 List!17276)) )
))
(declare-datatypes ((ListLongMap!10227 0))(
  ( (ListLongMap!10228 (toList!5129 List!17276)) )
))
(declare-fun call!38483 () ListLongMap!10227)

(declare-fun call!38482 () ListLongMap!10227)

(declare-fun b!872860 () Bool)

(declare-fun +!2459 (ListLongMap!10227 tuple2!11458) ListLongMap!10227)

(assert (=> b!872860 (= e!486091 (= call!38483 (+!2459 call!38482 (tuple2!11459 k!854 v!557))))))

(declare-fun bm!38479 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3098 (array!50602 array!50604 (_ BitVec 32) (_ BitVec 32) V!28029 V!28029 (_ BitVec 32) Int) ListLongMap!10227)

(assert (=> bm!38479 (= call!38482 (getCurrentListMapNoExtraKeys!3098 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872861 () Bool)

(declare-fun res!593210 () Bool)

(assert (=> b!872861 (=> (not res!593210) (not e!486090))))

(declare-datatypes ((List!17277 0))(
  ( (Nil!17274) (Cons!17273 (h!18404 (_ BitVec 64)) (t!24314 List!17277)) )
))
(declare-fun arrayNoDuplicates!0 (array!50602 (_ BitVec 32) List!17277) Bool)

(assert (=> b!872861 (= res!593210 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17274))))

(declare-fun b!872862 () Bool)

(assert (=> b!872862 (= e!486091 (= call!38483 call!38482))))

(declare-fun b!872863 () Bool)

(assert (=> b!872863 (= e!486089 (and e!486093 mapRes!27458))))

(declare-fun condMapEmpty!27458 () Bool)

(declare-fun mapDefault!27458 () ValueCell!8179)

