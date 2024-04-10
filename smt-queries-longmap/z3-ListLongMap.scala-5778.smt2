; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74572 () Bool)

(assert start!74572)

(declare-fun b_free!15261 () Bool)

(declare-fun b_next!15261 () Bool)

(assert (=> start!74572 (= b_free!15261 (not b_next!15261))))

(declare-fun tp!53465 () Bool)

(declare-fun b_and!25137 () Bool)

(assert (=> start!74572 (= tp!53465 b_and!25137)))

(declare-fun b!878642 () Bool)

(declare-fun res!596932 () Bool)

(declare-fun e!488994 () Bool)

(assert (=> b!878642 (=> (not res!596932) (not e!488994))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51136 0))(
  ( (array!51137 (arr!24594 (Array (_ BitVec 32) (_ BitVec 64))) (size!25034 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51136)

(assert (=> b!878642 (= res!596932 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25034 _keys!868))))))

(declare-fun b!878643 () Bool)

(declare-fun e!488993 () Bool)

(declare-fun e!488995 () Bool)

(declare-fun mapRes!27873 () Bool)

(assert (=> b!878643 (= e!488993 (and e!488995 mapRes!27873))))

(declare-fun condMapEmpty!27873 () Bool)

(declare-datatypes ((V!28387 0))(
  ( (V!28388 (val!8800 Int)) )
))
(declare-datatypes ((ValueCell!8313 0))(
  ( (ValueCellFull!8313 (v!11240 V!28387)) (EmptyCell!8313) )
))
(declare-datatypes ((array!51138 0))(
  ( (array!51139 (arr!24595 (Array (_ BitVec 32) ValueCell!8313)) (size!25035 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51138)

(declare-fun mapDefault!27873 () ValueCell!8313)

(assert (=> b!878643 (= condMapEmpty!27873 (= (arr!24595 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8313)) mapDefault!27873)))))

(declare-fun b!878644 () Bool)

(declare-fun res!596933 () Bool)

(assert (=> b!878644 (=> (not res!596933) (not e!488994))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51136 (_ BitVec 32)) Bool)

(assert (=> b!878644 (= res!596933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878646 () Bool)

(declare-fun res!596930 () Bool)

(assert (=> b!878646 (=> (not res!596930) (not e!488994))))

(declare-datatypes ((List!17451 0))(
  ( (Nil!17448) (Cons!17447 (h!18578 (_ BitVec 64)) (t!24540 List!17451)) )
))
(declare-fun arrayNoDuplicates!0 (array!51136 (_ BitVec 32) List!17451) Bool)

(assert (=> b!878646 (= res!596930 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17448))))

(declare-fun mapIsEmpty!27873 () Bool)

(assert (=> mapIsEmpty!27873 mapRes!27873))

(declare-fun b!878647 () Bool)

(declare-fun res!596934 () Bool)

(assert (=> b!878647 (=> (not res!596934) (not e!488994))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878647 (= res!596934 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27873 () Bool)

(declare-fun tp!53464 () Bool)

(declare-fun e!488991 () Bool)

(assert (=> mapNonEmpty!27873 (= mapRes!27873 (and tp!53464 e!488991))))

(declare-fun mapRest!27873 () (Array (_ BitVec 32) ValueCell!8313))

(declare-fun mapKey!27873 () (_ BitVec 32))

(declare-fun mapValue!27873 () ValueCell!8313)

(assert (=> mapNonEmpty!27873 (= (arr!24595 _values!688) (store mapRest!27873 mapKey!27873 mapValue!27873))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!878648 () Bool)

(assert (=> b!878648 (= e!488994 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25034 _keys!868)) (bvsge (bvsub (size!25034 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!25034 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11634 0))(
  ( (tuple2!11635 (_1!5828 (_ BitVec 64)) (_2!5828 V!28387)) )
))
(declare-datatypes ((List!17452 0))(
  ( (Nil!17449) (Cons!17448 (h!18579 tuple2!11634) (t!24541 List!17452)) )
))
(declare-datatypes ((ListLongMap!10403 0))(
  ( (ListLongMap!10404 (toList!5217 List!17452)) )
))
(declare-fun lt!397292 () ListLongMap!10403)

(declare-fun v!557 () V!28387)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28387)

(declare-fun zeroValue!654 () V!28387)

(declare-fun getCurrentListMapNoExtraKeys!3184 (array!51136 array!51138 (_ BitVec 32) (_ BitVec 32) V!28387 V!28387 (_ BitVec 32) Int) ListLongMap!10403)

(assert (=> b!878648 (= lt!397292 (getCurrentListMapNoExtraKeys!3184 _keys!868 (array!51139 (store (arr!24595 _values!688) i!612 (ValueCellFull!8313 v!557)) (size!25035 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397293 () ListLongMap!10403)

(assert (=> b!878648 (= lt!397293 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878649 () Bool)

(declare-fun tp_is_empty!17505 () Bool)

(assert (=> b!878649 (= e!488991 tp_is_empty!17505)))

(declare-fun b!878650 () Bool)

(declare-fun res!596935 () Bool)

(assert (=> b!878650 (=> (not res!596935) (not e!488994))))

(assert (=> b!878650 (= res!596935 (and (= (select (arr!24594 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878645 () Bool)

(assert (=> b!878645 (= e!488995 tp_is_empty!17505)))

(declare-fun res!596931 () Bool)

(assert (=> start!74572 (=> (not res!596931) (not e!488994))))

(assert (=> start!74572 (= res!596931 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25034 _keys!868))))))

(assert (=> start!74572 e!488994))

(assert (=> start!74572 tp_is_empty!17505))

(assert (=> start!74572 true))

(assert (=> start!74572 tp!53465))

(declare-fun array_inv!19382 (array!51136) Bool)

(assert (=> start!74572 (array_inv!19382 _keys!868)))

(declare-fun array_inv!19383 (array!51138) Bool)

(assert (=> start!74572 (and (array_inv!19383 _values!688) e!488993)))

(declare-fun b!878651 () Bool)

(declare-fun res!596929 () Bool)

(assert (=> b!878651 (=> (not res!596929) (not e!488994))))

(assert (=> b!878651 (= res!596929 (and (= (size!25035 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25034 _keys!868) (size!25035 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878652 () Bool)

(declare-fun res!596936 () Bool)

(assert (=> b!878652 (=> (not res!596936) (not e!488994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878652 (= res!596936 (validMask!0 mask!1196))))

(assert (= (and start!74572 res!596931) b!878652))

(assert (= (and b!878652 res!596936) b!878651))

(assert (= (and b!878651 res!596929) b!878644))

(assert (= (and b!878644 res!596933) b!878646))

(assert (= (and b!878646 res!596930) b!878642))

(assert (= (and b!878642 res!596932) b!878647))

(assert (= (and b!878647 res!596934) b!878650))

(assert (= (and b!878650 res!596935) b!878648))

(assert (= (and b!878643 condMapEmpty!27873) mapIsEmpty!27873))

(assert (= (and b!878643 (not condMapEmpty!27873)) mapNonEmpty!27873))

(get-info :version)

(assert (= (and mapNonEmpty!27873 ((_ is ValueCellFull!8313) mapValue!27873)) b!878649))

(assert (= (and b!878643 ((_ is ValueCellFull!8313) mapDefault!27873)) b!878645))

(assert (= start!74572 b!878643))

(declare-fun m!818445 () Bool)

(assert (=> b!878644 m!818445))

(declare-fun m!818447 () Bool)

(assert (=> mapNonEmpty!27873 m!818447))

(declare-fun m!818449 () Bool)

(assert (=> start!74572 m!818449))

(declare-fun m!818451 () Bool)

(assert (=> start!74572 m!818451))

(declare-fun m!818453 () Bool)

(assert (=> b!878650 m!818453))

(declare-fun m!818455 () Bool)

(assert (=> b!878652 m!818455))

(declare-fun m!818457 () Bool)

(assert (=> b!878646 m!818457))

(declare-fun m!818459 () Bool)

(assert (=> b!878647 m!818459))

(declare-fun m!818461 () Bool)

(assert (=> b!878648 m!818461))

(declare-fun m!818463 () Bool)

(assert (=> b!878648 m!818463))

(declare-fun m!818465 () Bool)

(assert (=> b!878648 m!818465))

(check-sat (not mapNonEmpty!27873) (not b_next!15261) (not b!878647) (not b!878652) (not b!878644) (not start!74572) tp_is_empty!17505 b_and!25137 (not b!878648) (not b!878646))
(check-sat b_and!25137 (not b_next!15261))
