; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73352 () Bool)

(assert start!73352)

(declare-fun b_free!14267 () Bool)

(declare-fun b_next!14267 () Bool)

(assert (=> start!73352 (= b_free!14267 (not b_next!14267))))

(declare-fun tp!50305 () Bool)

(declare-fun b_and!23623 () Bool)

(assert (=> start!73352 (= tp!50305 b_and!23623)))

(declare-fun b!855931 () Bool)

(declare-fun e!477144 () Bool)

(assert (=> b!855931 (= e!477144 false)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49002 0))(
  ( (array!49003 (arr!23532 (Array (_ BitVec 32) (_ BitVec 64))) (size!23972 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49002)

(declare-datatypes ((V!26917 0))(
  ( (V!26918 (val!8249 Int)) )
))
(declare-datatypes ((ValueCell!7762 0))(
  ( (ValueCellFull!7762 (v!10674 V!26917)) (EmptyCell!7762) )
))
(declare-datatypes ((array!49004 0))(
  ( (array!49005 (arr!23533 (Array (_ BitVec 32) ValueCell!7762)) (size!23973 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49004)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26917)

(declare-fun zeroValue!654 () V!26917)

(declare-datatypes ((tuple2!10872 0))(
  ( (tuple2!10873 (_1!5447 (_ BitVec 64)) (_2!5447 V!26917)) )
))
(declare-datatypes ((List!16685 0))(
  ( (Nil!16682) (Cons!16681 (h!17812 tuple2!10872) (t!23326 List!16685)) )
))
(declare-datatypes ((ListLongMap!9641 0))(
  ( (ListLongMap!9642 (toList!4836 List!16685)) )
))
(declare-fun lt!385789 () ListLongMap!9641)

(declare-fun v!557 () V!26917)

(declare-fun getCurrentListMapNoExtraKeys!2817 (array!49002 array!49004 (_ BitVec 32) (_ BitVec 32) V!26917 V!26917 (_ BitVec 32) Int) ListLongMap!9641)

(assert (=> b!855931 (= lt!385789 (getCurrentListMapNoExtraKeys!2817 _keys!868 (array!49005 (store (arr!23533 _values!688) i!612 (ValueCellFull!7762 v!557)) (size!23973 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385788 () ListLongMap!9641)

(assert (=> b!855931 (= lt!385788 (getCurrentListMapNoExtraKeys!2817 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26204 () Bool)

(declare-fun mapRes!26204 () Bool)

(declare-fun tp!50304 () Bool)

(declare-fun e!477147 () Bool)

(assert (=> mapNonEmpty!26204 (= mapRes!26204 (and tp!50304 e!477147))))

(declare-fun mapValue!26204 () ValueCell!7762)

(declare-fun mapRest!26204 () (Array (_ BitVec 32) ValueCell!7762))

(declare-fun mapKey!26204 () (_ BitVec 32))

(assert (=> mapNonEmpty!26204 (= (arr!23533 _values!688) (store mapRest!26204 mapKey!26204 mapValue!26204))))

(declare-fun b!855933 () Bool)

(declare-fun res!581315 () Bool)

(assert (=> b!855933 (=> (not res!581315) (not e!477144))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855933 (= res!581315 (validKeyInArray!0 k!854))))

(declare-fun b!855934 () Bool)

(declare-fun res!581316 () Bool)

(assert (=> b!855934 (=> (not res!581316) (not e!477144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855934 (= res!581316 (validMask!0 mask!1196))))

(declare-fun b!855935 () Bool)

(declare-fun e!477145 () Bool)

(declare-fun tp_is_empty!16403 () Bool)

(assert (=> b!855935 (= e!477145 tp_is_empty!16403)))

(declare-fun b!855932 () Bool)

(declare-fun res!581321 () Bool)

(assert (=> b!855932 (=> (not res!581321) (not e!477144))))

(assert (=> b!855932 (= res!581321 (and (= (size!23973 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23972 _keys!868) (size!23973 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!581318 () Bool)

(assert (=> start!73352 (=> (not res!581318) (not e!477144))))

(assert (=> start!73352 (= res!581318 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23972 _keys!868))))))

(assert (=> start!73352 e!477144))

(assert (=> start!73352 tp_is_empty!16403))

(assert (=> start!73352 true))

(assert (=> start!73352 tp!50305))

(declare-fun array_inv!18646 (array!49002) Bool)

(assert (=> start!73352 (array_inv!18646 _keys!868)))

(declare-fun e!477146 () Bool)

(declare-fun array_inv!18647 (array!49004) Bool)

(assert (=> start!73352 (and (array_inv!18647 _values!688) e!477146)))

(declare-fun b!855936 () Bool)

(declare-fun res!581320 () Bool)

(assert (=> b!855936 (=> (not res!581320) (not e!477144))))

(assert (=> b!855936 (= res!581320 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23972 _keys!868))))))

(declare-fun mapIsEmpty!26204 () Bool)

(assert (=> mapIsEmpty!26204 mapRes!26204))

(declare-fun b!855937 () Bool)

(declare-fun res!581314 () Bool)

(assert (=> b!855937 (=> (not res!581314) (not e!477144))))

(assert (=> b!855937 (= res!581314 (and (= (select (arr!23532 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855938 () Bool)

(assert (=> b!855938 (= e!477146 (and e!477145 mapRes!26204))))

(declare-fun condMapEmpty!26204 () Bool)

(declare-fun mapDefault!26204 () ValueCell!7762)

