; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74990 () Bool)

(assert start!74990)

(declare-fun b_free!15479 () Bool)

(declare-fun b_next!15479 () Bool)

(assert (=> start!74990 (= b_free!15479 (not b_next!15479))))

(declare-fun tp!54143 () Bool)

(declare-fun b_and!25669 () Bool)

(assert (=> start!74990 (= tp!54143 b_and!25669)))

(declare-fun b!884602 () Bool)

(declare-fun e!492296 () Bool)

(declare-fun e!492299 () Bool)

(assert (=> b!884602 (= e!492296 (not e!492299))))

(declare-fun res!600933 () Bool)

(assert (=> b!884602 (=> res!600933 e!492299)))

(declare-datatypes ((array!51572 0))(
  ( (array!51573 (arr!24804 (Array (_ BitVec 32) (_ BitVec 64))) (size!25244 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51572)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884602 (= res!600933 (validKeyInArray!0 (select (arr!24804 _keys!868) from!1053)))))

(declare-datatypes ((V!28677 0))(
  ( (V!28678 (val!8909 Int)) )
))
(declare-fun v!557 () V!28677)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8422 0))(
  ( (ValueCellFull!8422 (v!11382 V!28677)) (EmptyCell!8422) )
))
(declare-datatypes ((array!51574 0))(
  ( (array!51575 (arr!24805 (Array (_ BitVec 32) ValueCell!8422)) (size!25245 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51574)

(declare-fun minValue!654 () V!28677)

(declare-fun zeroValue!654 () V!28677)

(declare-fun lt!400727 () array!51574)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11814 0))(
  ( (tuple2!11815 (_1!5918 (_ BitVec 64)) (_2!5918 V!28677)) )
))
(declare-datatypes ((List!17621 0))(
  ( (Nil!17618) (Cons!17617 (h!18748 tuple2!11814) (t!24896 List!17621)) )
))
(declare-datatypes ((ListLongMap!10583 0))(
  ( (ListLongMap!10584 (toList!5307 List!17621)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3266 (array!51572 array!51574 (_ BitVec 32) (_ BitVec 32) V!28677 V!28677 (_ BitVec 32) Int) ListLongMap!10583)

(declare-fun +!2576 (ListLongMap!10583 tuple2!11814) ListLongMap!10583)

(assert (=> b!884602 (= (getCurrentListMapNoExtraKeys!3266 _keys!868 lt!400727 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2576 (getCurrentListMapNoExtraKeys!3266 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11815 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30208 0))(
  ( (Unit!30209) )
))
(declare-fun lt!400726 () Unit!30208)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!759 (array!51572 array!51574 (_ BitVec 32) (_ BitVec 32) V!28677 V!28677 (_ BitVec 32) (_ BitVec 64) V!28677 (_ BitVec 32) Int) Unit!30208)

(assert (=> b!884602 (= lt!400726 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28224 () Bool)

(declare-fun mapRes!28224 () Bool)

(declare-fun tp!54142 () Bool)

(declare-fun e!492298 () Bool)

(assert (=> mapNonEmpty!28224 (= mapRes!28224 (and tp!54142 e!492298))))

(declare-fun mapRest!28224 () (Array (_ BitVec 32) ValueCell!8422))

(declare-fun mapValue!28224 () ValueCell!8422)

(declare-fun mapKey!28224 () (_ BitVec 32))

(assert (=> mapNonEmpty!28224 (= (arr!24805 _values!688) (store mapRest!28224 mapKey!28224 mapValue!28224))))

(declare-fun b!884603 () Bool)

(declare-fun res!600930 () Bool)

(declare-fun e!492294 () Bool)

(assert (=> b!884603 (=> (not res!600930) (not e!492294))))

(assert (=> b!884603 (= res!600930 (and (= (size!25245 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25244 _keys!868) (size!25245 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884604 () Bool)

(declare-fun tp_is_empty!17723 () Bool)

(assert (=> b!884604 (= e!492298 tp_is_empty!17723)))

(declare-fun res!600928 () Bool)

(assert (=> start!74990 (=> (not res!600928) (not e!492294))))

(assert (=> start!74990 (= res!600928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25244 _keys!868))))))

(assert (=> start!74990 e!492294))

(assert (=> start!74990 tp_is_empty!17723))

(assert (=> start!74990 true))

(assert (=> start!74990 tp!54143))

(declare-fun array_inv!19528 (array!51572) Bool)

(assert (=> start!74990 (array_inv!19528 _keys!868)))

(declare-fun e!492293 () Bool)

(declare-fun array_inv!19529 (array!51574) Bool)

(assert (=> start!74990 (and (array_inv!19529 _values!688) e!492293)))

(declare-fun b!884605 () Bool)

(declare-fun res!600934 () Bool)

(assert (=> b!884605 (=> (not res!600934) (not e!492294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51572 (_ BitVec 32)) Bool)

(assert (=> b!884605 (= res!600934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884606 () Bool)

(declare-fun res!600929 () Bool)

(assert (=> b!884606 (=> (not res!600929) (not e!492294))))

(assert (=> b!884606 (= res!600929 (and (= (select (arr!24804 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!884607 () Bool)

(declare-fun res!600935 () Bool)

(assert (=> b!884607 (=> (not res!600935) (not e!492294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884607 (= res!600935 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28224 () Bool)

(assert (=> mapIsEmpty!28224 mapRes!28224))

(declare-fun b!884608 () Bool)

(declare-fun res!600926 () Bool)

(assert (=> b!884608 (=> (not res!600926) (not e!492294))))

(declare-datatypes ((List!17622 0))(
  ( (Nil!17619) (Cons!17618 (h!18749 (_ BitVec 64)) (t!24897 List!17622)) )
))
(declare-fun arrayNoDuplicates!0 (array!51572 (_ BitVec 32) List!17622) Bool)

(assert (=> b!884608 (= res!600926 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17619))))

(declare-fun b!884609 () Bool)

(declare-fun res!600932 () Bool)

(assert (=> b!884609 (=> (not res!600932) (not e!492294))))

(assert (=> b!884609 (= res!600932 (validKeyInArray!0 k!854))))

(declare-fun b!884610 () Bool)

(assert (=> b!884610 (= e!492299 (bvslt i!612 (size!25245 _values!688)))))

(declare-fun b!884611 () Bool)

(declare-fun res!600927 () Bool)

(assert (=> b!884611 (=> (not res!600927) (not e!492294))))

(assert (=> b!884611 (= res!600927 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25244 _keys!868))))))

(declare-fun b!884612 () Bool)

(assert (=> b!884612 (= e!492294 e!492296)))

(declare-fun res!600931 () Bool)

(assert (=> b!884612 (=> (not res!600931) (not e!492296))))

(assert (=> b!884612 (= res!600931 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400728 () ListLongMap!10583)

(assert (=> b!884612 (= lt!400728 (getCurrentListMapNoExtraKeys!3266 _keys!868 lt!400727 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884612 (= lt!400727 (array!51575 (store (arr!24805 _values!688) i!612 (ValueCellFull!8422 v!557)) (size!25245 _values!688)))))

(declare-fun lt!400725 () ListLongMap!10583)

(assert (=> b!884612 (= lt!400725 (getCurrentListMapNoExtraKeys!3266 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884613 () Bool)

(declare-fun e!492297 () Bool)

(assert (=> b!884613 (= e!492293 (and e!492297 mapRes!28224))))

(declare-fun condMapEmpty!28224 () Bool)

(declare-fun mapDefault!28224 () ValueCell!8422)

