; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74936 () Bool)

(assert start!74936)

(declare-fun b_free!15455 () Bool)

(declare-fun b_next!15455 () Bool)

(assert (=> start!74936 (= b_free!15455 (not b_next!15455))))

(declare-fun tp!54067 () Bool)

(declare-fun b_and!25609 () Bool)

(assert (=> start!74936 (= tp!54067 b_and!25609)))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun e!491892 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51524 0))(
  ( (array!51525 (arr!24781 (Array (_ BitVec 32) (_ BitVec 64))) (size!25221 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51524)

(declare-fun b!883884 () Bool)

(assert (=> b!883884 (= e!491892 (not (= k!854 (select (arr!24781 _keys!868) from!1053))))))

(assert (=> b!883884 (not (= (select (arr!24781 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!30171 0))(
  ( (Unit!30172) )
))
(declare-fun lt!400158 () Unit!30171)

(declare-fun e!491898 () Unit!30171)

(assert (=> b!883884 (= lt!400158 e!491898)))

(declare-fun c!93088 () Bool)

(assert (=> b!883884 (= c!93088 (= (select (arr!24781 _keys!868) from!1053) k!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28645 0))(
  ( (V!28646 (val!8897 Int)) )
))
(declare-datatypes ((tuple2!11794 0))(
  ( (tuple2!11795 (_1!5908 (_ BitVec 64)) (_2!5908 V!28645)) )
))
(declare-datatypes ((List!17601 0))(
  ( (Nil!17598) (Cons!17597 (h!18728 tuple2!11794) (t!24858 List!17601)) )
))
(declare-datatypes ((ListLongMap!10563 0))(
  ( (ListLongMap!10564 (toList!5297 List!17601)) )
))
(declare-fun lt!400163 () ListLongMap!10563)

(declare-fun lt!400161 () ListLongMap!10563)

(declare-datatypes ((ValueCell!8410 0))(
  ( (ValueCellFull!8410 (v!11366 V!28645)) (EmptyCell!8410) )
))
(declare-datatypes ((array!51526 0))(
  ( (array!51527 (arr!24782 (Array (_ BitVec 32) ValueCell!8410)) (size!25222 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51526)

(declare-fun +!2566 (ListLongMap!10563 tuple2!11794) ListLongMap!10563)

(declare-fun get!13060 (ValueCell!8410 V!28645) V!28645)

(declare-fun dynLambda!1277 (Int (_ BitVec 64)) V!28645)

(assert (=> b!883884 (= lt!400161 (+!2566 lt!400163 (tuple2!11795 (select (arr!24781 _keys!868) from!1053) (get!13060 (select (arr!24782 _values!688) from!1053) (dynLambda!1277 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883885 () Bool)

(declare-fun res!600482 () Bool)

(declare-fun e!491894 () Bool)

(assert (=> b!883885 (=> (not res!600482) (not e!491894))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51524 (_ BitVec 32)) Bool)

(assert (=> b!883885 (= res!600482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883886 () Bool)

(declare-fun e!491891 () Bool)

(declare-fun tp_is_empty!17699 () Bool)

(assert (=> b!883886 (= e!491891 tp_is_empty!17699)))

(declare-fun res!600480 () Bool)

(assert (=> start!74936 (=> (not res!600480) (not e!491894))))

(assert (=> start!74936 (= res!600480 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25221 _keys!868))))))

(assert (=> start!74936 e!491894))

(assert (=> start!74936 tp_is_empty!17699))

(assert (=> start!74936 true))

(assert (=> start!74936 tp!54067))

(declare-fun array_inv!19510 (array!51524) Bool)

(assert (=> start!74936 (array_inv!19510 _keys!868)))

(declare-fun e!491895 () Bool)

(declare-fun array_inv!19511 (array!51526) Bool)

(assert (=> start!74936 (and (array_inv!19511 _values!688) e!491895)))

(declare-fun b!883887 () Bool)

(declare-fun e!491896 () Bool)

(assert (=> b!883887 (= e!491894 e!491896)))

(declare-fun res!600477 () Bool)

(assert (=> b!883887 (=> (not res!600477) (not e!491896))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883887 (= res!600477 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400156 () array!51526)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28645)

(declare-fun zeroValue!654 () V!28645)

(declare-fun getCurrentListMapNoExtraKeys!3256 (array!51524 array!51526 (_ BitVec 32) (_ BitVec 32) V!28645 V!28645 (_ BitVec 32) Int) ListLongMap!10563)

(assert (=> b!883887 (= lt!400161 (getCurrentListMapNoExtraKeys!3256 _keys!868 lt!400156 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28645)

(assert (=> b!883887 (= lt!400156 (array!51527 (store (arr!24782 _values!688) i!612 (ValueCellFull!8410 v!557)) (size!25222 _values!688)))))

(declare-fun lt!400165 () ListLongMap!10563)

(assert (=> b!883887 (= lt!400165 (getCurrentListMapNoExtraKeys!3256 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883888 () Bool)

(declare-fun res!600478 () Bool)

(assert (=> b!883888 (=> (not res!600478) (not e!491894))))

(assert (=> b!883888 (= res!600478 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25221 _keys!868))))))

(declare-fun b!883889 () Bool)

(declare-fun e!491893 () Bool)

(declare-fun mapRes!28185 () Bool)

(assert (=> b!883889 (= e!491895 (and e!491893 mapRes!28185))))

(declare-fun condMapEmpty!28185 () Bool)

(declare-fun mapDefault!28185 () ValueCell!8410)

