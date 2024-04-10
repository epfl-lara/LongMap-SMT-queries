; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74566 () Bool)

(assert start!74566)

(declare-fun b_free!15255 () Bool)

(declare-fun b_next!15255 () Bool)

(assert (=> start!74566 (= b_free!15255 (not b_next!15255))))

(declare-fun tp!53446 () Bool)

(declare-fun b_and!25131 () Bool)

(assert (=> start!74566 (= tp!53446 b_and!25131)))

(declare-fun b!878543 () Bool)

(declare-fun res!596862 () Bool)

(declare-fun e!488946 () Bool)

(assert (=> b!878543 (=> (not res!596862) (not e!488946))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51124 0))(
  ( (array!51125 (arr!24588 (Array (_ BitVec 32) (_ BitVec 64))) (size!25028 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51124)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878543 (= res!596862 (and (= (select (arr!24588 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27864 () Bool)

(declare-fun mapRes!27864 () Bool)

(declare-fun tp!53447 () Bool)

(declare-fun e!488947 () Bool)

(assert (=> mapNonEmpty!27864 (= mapRes!27864 (and tp!53447 e!488947))))

(declare-datatypes ((V!28379 0))(
  ( (V!28380 (val!8797 Int)) )
))
(declare-datatypes ((ValueCell!8310 0))(
  ( (ValueCellFull!8310 (v!11237 V!28379)) (EmptyCell!8310) )
))
(declare-fun mapRest!27864 () (Array (_ BitVec 32) ValueCell!8310))

(declare-fun mapKey!27864 () (_ BitVec 32))

(declare-datatypes ((array!51126 0))(
  ( (array!51127 (arr!24589 (Array (_ BitVec 32) ValueCell!8310)) (size!25029 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51126)

(declare-fun mapValue!27864 () ValueCell!8310)

(assert (=> mapNonEmpty!27864 (= (arr!24589 _values!688) (store mapRest!27864 mapKey!27864 mapValue!27864))))

(declare-fun res!596857 () Bool)

(assert (=> start!74566 (=> (not res!596857) (not e!488946))))

(assert (=> start!74566 (= res!596857 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25028 _keys!868))))))

(assert (=> start!74566 e!488946))

(declare-fun tp_is_empty!17499 () Bool)

(assert (=> start!74566 tp_is_empty!17499))

(assert (=> start!74566 true))

(assert (=> start!74566 tp!53446))

(declare-fun array_inv!19378 (array!51124) Bool)

(assert (=> start!74566 (array_inv!19378 _keys!868)))

(declare-fun e!488950 () Bool)

(declare-fun array_inv!19379 (array!51126) Bool)

(assert (=> start!74566 (and (array_inv!19379 _values!688) e!488950)))

(declare-fun b!878544 () Bool)

(declare-fun e!488948 () Bool)

(assert (=> b!878544 (= e!488950 (and e!488948 mapRes!27864))))

(declare-fun condMapEmpty!27864 () Bool)

(declare-fun mapDefault!27864 () ValueCell!8310)

(assert (=> b!878544 (= condMapEmpty!27864 (= (arr!24589 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8310)) mapDefault!27864)))))

(declare-fun b!878545 () Bool)

(declare-fun res!596859 () Bool)

(assert (=> b!878545 (=> (not res!596859) (not e!488946))))

(declare-datatypes ((List!17448 0))(
  ( (Nil!17445) (Cons!17444 (h!18575 (_ BitVec 64)) (t!24537 List!17448)) )
))
(declare-fun arrayNoDuplicates!0 (array!51124 (_ BitVec 32) List!17448) Bool)

(assert (=> b!878545 (= res!596859 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17445))))

(declare-fun b!878546 () Bool)

(assert (=> b!878546 (= e!488947 tp_is_empty!17499)))

(declare-fun b!878547 () Bool)

(declare-fun res!596863 () Bool)

(assert (=> b!878547 (=> (not res!596863) (not e!488946))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51124 (_ BitVec 32)) Bool)

(assert (=> b!878547 (= res!596863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878548 () Bool)

(declare-fun res!596864 () Bool)

(assert (=> b!878548 (=> (not res!596864) (not e!488946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878548 (= res!596864 (validKeyInArray!0 k0!854))))

(declare-fun b!878549 () Bool)

(declare-fun res!596860 () Bool)

(assert (=> b!878549 (=> (not res!596860) (not e!488946))))

(assert (=> b!878549 (= res!596860 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25028 _keys!868))))))

(declare-fun b!878550 () Bool)

(declare-fun res!596861 () Bool)

(assert (=> b!878550 (=> (not res!596861) (not e!488946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878550 (= res!596861 (validMask!0 mask!1196))))

(declare-fun b!878551 () Bool)

(assert (=> b!878551 (= e!488948 tp_is_empty!17499)))

(declare-fun mapIsEmpty!27864 () Bool)

(assert (=> mapIsEmpty!27864 mapRes!27864))

(declare-fun b!878552 () Bool)

(declare-fun res!596858 () Bool)

(assert (=> b!878552 (=> (not res!596858) (not e!488946))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878552 (= res!596858 (and (= (size!25029 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25028 _keys!868) (size!25029 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878553 () Bool)

(assert (=> b!878553 (= e!488946 false)))

(declare-fun v!557 () V!28379)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11632 0))(
  ( (tuple2!11633 (_1!5827 (_ BitVec 64)) (_2!5827 V!28379)) )
))
(declare-datatypes ((List!17449 0))(
  ( (Nil!17446) (Cons!17445 (h!18576 tuple2!11632) (t!24538 List!17449)) )
))
(declare-datatypes ((ListLongMap!10401 0))(
  ( (ListLongMap!10402 (toList!5216 List!17449)) )
))
(declare-fun lt!397275 () ListLongMap!10401)

(declare-fun minValue!654 () V!28379)

(declare-fun zeroValue!654 () V!28379)

(declare-fun getCurrentListMapNoExtraKeys!3183 (array!51124 array!51126 (_ BitVec 32) (_ BitVec 32) V!28379 V!28379 (_ BitVec 32) Int) ListLongMap!10401)

(assert (=> b!878553 (= lt!397275 (getCurrentListMapNoExtraKeys!3183 _keys!868 (array!51127 (store (arr!24589 _values!688) i!612 (ValueCellFull!8310 v!557)) (size!25029 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397274 () ListLongMap!10401)

(assert (=> b!878553 (= lt!397274 (getCurrentListMapNoExtraKeys!3183 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74566 res!596857) b!878550))

(assert (= (and b!878550 res!596861) b!878552))

(assert (= (and b!878552 res!596858) b!878547))

(assert (= (and b!878547 res!596863) b!878545))

(assert (= (and b!878545 res!596859) b!878549))

(assert (= (and b!878549 res!596860) b!878548))

(assert (= (and b!878548 res!596864) b!878543))

(assert (= (and b!878543 res!596862) b!878553))

(assert (= (and b!878544 condMapEmpty!27864) mapIsEmpty!27864))

(assert (= (and b!878544 (not condMapEmpty!27864)) mapNonEmpty!27864))

(get-info :version)

(assert (= (and mapNonEmpty!27864 ((_ is ValueCellFull!8310) mapValue!27864)) b!878546))

(assert (= (and b!878544 ((_ is ValueCellFull!8310) mapDefault!27864)) b!878551))

(assert (= start!74566 b!878544))

(declare-fun m!818379 () Bool)

(assert (=> b!878553 m!818379))

(declare-fun m!818381 () Bool)

(assert (=> b!878553 m!818381))

(declare-fun m!818383 () Bool)

(assert (=> b!878553 m!818383))

(declare-fun m!818385 () Bool)

(assert (=> b!878543 m!818385))

(declare-fun m!818387 () Bool)

(assert (=> b!878548 m!818387))

(declare-fun m!818389 () Bool)

(assert (=> b!878547 m!818389))

(declare-fun m!818391 () Bool)

(assert (=> mapNonEmpty!27864 m!818391))

(declare-fun m!818393 () Bool)

(assert (=> b!878550 m!818393))

(declare-fun m!818395 () Bool)

(assert (=> b!878545 m!818395))

(declare-fun m!818397 () Bool)

(assert (=> start!74566 m!818397))

(declare-fun m!818399 () Bool)

(assert (=> start!74566 m!818399))

(check-sat tp_is_empty!17499 (not b!878548) (not b!878547) (not mapNonEmpty!27864) (not b!878545) (not start!74566) (not b!878550) (not b!878553) (not b_next!15255) b_and!25131)
(check-sat b_and!25131 (not b_next!15255))
