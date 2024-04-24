; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74750 () Bool)

(assert start!74750)

(declare-fun b_free!15271 () Bool)

(declare-fun b_next!15271 () Bool)

(assert (=> start!74750 (= b_free!15271 (not b_next!15271))))

(declare-fun tp!53496 () Bool)

(declare-fun b_and!25157 () Bool)

(assert (=> start!74750 (= tp!53496 b_and!25157)))

(declare-fun b!879723 () Bool)

(declare-fun res!597406 () Bool)

(declare-fun e!489667 () Bool)

(assert (=> b!879723 (=> (not res!597406) (not e!489667))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51193 0))(
  ( (array!51194 (arr!24618 (Array (_ BitVec 32) (_ BitVec 64))) (size!25059 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51193)

(declare-datatypes ((V!28401 0))(
  ( (V!28402 (val!8805 Int)) )
))
(declare-datatypes ((ValueCell!8318 0))(
  ( (ValueCellFull!8318 (v!11245 V!28401)) (EmptyCell!8318) )
))
(declare-datatypes ((array!51195 0))(
  ( (array!51196 (arr!24619 (Array (_ BitVec 32) ValueCell!8318)) (size!25060 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51195)

(assert (=> b!879723 (= res!597406 (and (= (size!25060 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25059 _keys!868) (size!25060 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27888 () Bool)

(declare-fun mapRes!27888 () Bool)

(assert (=> mapIsEmpty!27888 mapRes!27888))

(declare-fun b!879724 () Bool)

(declare-fun e!489663 () Bool)

(declare-fun tp_is_empty!17515 () Bool)

(assert (=> b!879724 (= e!489663 tp_is_empty!17515)))

(declare-fun b!879725 () Bool)

(declare-fun e!489661 () Bool)

(declare-fun e!489666 () Bool)

(assert (=> b!879725 (= e!489661 (not e!489666))))

(declare-fun res!597412 () Bool)

(assert (=> b!879725 (=> res!597412 e!489666)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879725 (= res!597412 (not (validKeyInArray!0 (select (arr!24618 _keys!868) from!1053))))))

(declare-fun lt!397705 () array!51195)

(declare-fun v!557 () V!28401)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28401)

(declare-fun zeroValue!654 () V!28401)

(declare-datatypes ((tuple2!11580 0))(
  ( (tuple2!11581 (_1!5801 (_ BitVec 64)) (_2!5801 V!28401)) )
))
(declare-datatypes ((List!17415 0))(
  ( (Nil!17412) (Cons!17411 (h!18548 tuple2!11580) (t!24496 List!17415)) )
))
(declare-datatypes ((ListLongMap!10351 0))(
  ( (ListLongMap!10352 (toList!5191 List!17415)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3233 (array!51193 array!51195 (_ BitVec 32) (_ BitVec 32) V!28401 V!28401 (_ BitVec 32) Int) ListLongMap!10351)

(declare-fun +!2509 (ListLongMap!10351 tuple2!11580) ListLongMap!10351)

(assert (=> b!879725 (= (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!397705 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2509 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11581 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29990 0))(
  ( (Unit!29991) )
))
(declare-fun lt!397708 () Unit!29990)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!677 (array!51193 array!51195 (_ BitVec 32) (_ BitVec 32) V!28401 V!28401 (_ BitVec 32) (_ BitVec 64) V!28401 (_ BitVec 32) Int) Unit!29990)

(assert (=> b!879725 (= lt!397708 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!677 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879726 () Bool)

(declare-fun res!597411 () Bool)

(assert (=> b!879726 (=> (not res!597411) (not e!489667))))

(assert (=> b!879726 (= res!597411 (validKeyInArray!0 k0!854))))

(declare-fun b!879727 () Bool)

(declare-fun res!597408 () Bool)

(assert (=> b!879727 (=> (not res!597408) (not e!489667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51193 (_ BitVec 32)) Bool)

(assert (=> b!879727 (= res!597408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879728 () Bool)

(declare-fun e!489665 () Bool)

(assert (=> b!879728 (= e!489665 tp_is_empty!17515)))

(declare-fun b!879729 () Bool)

(assert (=> b!879729 (= e!489666 (bvslt i!612 (size!25060 _values!688)))))

(declare-fun b!879730 () Bool)

(declare-fun res!597415 () Bool)

(assert (=> b!879730 (=> (not res!597415) (not e!489667))))

(assert (=> b!879730 (= res!597415 (and (= (select (arr!24618 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879731 () Bool)

(declare-fun res!597413 () Bool)

(assert (=> b!879731 (=> (not res!597413) (not e!489667))))

(declare-datatypes ((List!17416 0))(
  ( (Nil!17413) (Cons!17412 (h!18549 (_ BitVec 64)) (t!24497 List!17416)) )
))
(declare-fun arrayNoDuplicates!0 (array!51193 (_ BitVec 32) List!17416) Bool)

(assert (=> b!879731 (= res!597413 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17413))))

(declare-fun b!879732 () Bool)

(declare-fun res!597409 () Bool)

(assert (=> b!879732 (=> (not res!597409) (not e!489667))))

(assert (=> b!879732 (= res!597409 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25059 _keys!868))))))

(declare-fun res!597407 () Bool)

(assert (=> start!74750 (=> (not res!597407) (not e!489667))))

(assert (=> start!74750 (= res!597407 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25059 _keys!868))))))

(assert (=> start!74750 e!489667))

(assert (=> start!74750 tp_is_empty!17515))

(assert (=> start!74750 true))

(assert (=> start!74750 tp!53496))

(declare-fun array_inv!19436 (array!51193) Bool)

(assert (=> start!74750 (array_inv!19436 _keys!868)))

(declare-fun e!489662 () Bool)

(declare-fun array_inv!19437 (array!51195) Bool)

(assert (=> start!74750 (and (array_inv!19437 _values!688) e!489662)))

(declare-fun mapNonEmpty!27888 () Bool)

(declare-fun tp!53495 () Bool)

(assert (=> mapNonEmpty!27888 (= mapRes!27888 (and tp!53495 e!489663))))

(declare-fun mapKey!27888 () (_ BitVec 32))

(declare-fun mapRest!27888 () (Array (_ BitVec 32) ValueCell!8318))

(declare-fun mapValue!27888 () ValueCell!8318)

(assert (=> mapNonEmpty!27888 (= (arr!24619 _values!688) (store mapRest!27888 mapKey!27888 mapValue!27888))))

(declare-fun b!879733 () Bool)

(assert (=> b!879733 (= e!489667 e!489661)))

(declare-fun res!597414 () Bool)

(assert (=> b!879733 (=> (not res!597414) (not e!489661))))

(assert (=> b!879733 (= res!597414 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397706 () ListLongMap!10351)

(assert (=> b!879733 (= lt!397706 (getCurrentListMapNoExtraKeys!3233 _keys!868 lt!397705 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879733 (= lt!397705 (array!51196 (store (arr!24619 _values!688) i!612 (ValueCellFull!8318 v!557)) (size!25060 _values!688)))))

(declare-fun lt!397707 () ListLongMap!10351)

(assert (=> b!879733 (= lt!397707 (getCurrentListMapNoExtraKeys!3233 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879734 () Bool)

(declare-fun res!597410 () Bool)

(assert (=> b!879734 (=> (not res!597410) (not e!489667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879734 (= res!597410 (validMask!0 mask!1196))))

(declare-fun b!879735 () Bool)

(assert (=> b!879735 (= e!489662 (and e!489665 mapRes!27888))))

(declare-fun condMapEmpty!27888 () Bool)

(declare-fun mapDefault!27888 () ValueCell!8318)

(assert (=> b!879735 (= condMapEmpty!27888 (= (arr!24619 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8318)) mapDefault!27888)))))

(assert (= (and start!74750 res!597407) b!879734))

(assert (= (and b!879734 res!597410) b!879723))

(assert (= (and b!879723 res!597406) b!879727))

(assert (= (and b!879727 res!597408) b!879731))

(assert (= (and b!879731 res!597413) b!879732))

(assert (= (and b!879732 res!597409) b!879726))

(assert (= (and b!879726 res!597411) b!879730))

(assert (= (and b!879730 res!597415) b!879733))

(assert (= (and b!879733 res!597414) b!879725))

(assert (= (and b!879725 (not res!597412)) b!879729))

(assert (= (and b!879735 condMapEmpty!27888) mapIsEmpty!27888))

(assert (= (and b!879735 (not condMapEmpty!27888)) mapNonEmpty!27888))

(get-info :version)

(assert (= (and mapNonEmpty!27888 ((_ is ValueCellFull!8318) mapValue!27888)) b!879724))

(assert (= (and b!879735 ((_ is ValueCellFull!8318) mapDefault!27888)) b!879728))

(assert (= start!74750 b!879735))

(declare-fun m!819873 () Bool)

(assert (=> b!879731 m!819873))

(declare-fun m!819875 () Bool)

(assert (=> b!879725 m!819875))

(declare-fun m!819877 () Bool)

(assert (=> b!879725 m!819877))

(assert (=> b!879725 m!819875))

(declare-fun m!819879 () Bool)

(assert (=> b!879725 m!819879))

(declare-fun m!819881 () Bool)

(assert (=> b!879725 m!819881))

(declare-fun m!819883 () Bool)

(assert (=> b!879725 m!819883))

(assert (=> b!879725 m!819881))

(declare-fun m!819885 () Bool)

(assert (=> b!879725 m!819885))

(declare-fun m!819887 () Bool)

(assert (=> b!879726 m!819887))

(declare-fun m!819889 () Bool)

(assert (=> b!879734 m!819889))

(declare-fun m!819891 () Bool)

(assert (=> b!879733 m!819891))

(declare-fun m!819893 () Bool)

(assert (=> b!879733 m!819893))

(declare-fun m!819895 () Bool)

(assert (=> b!879733 m!819895))

(declare-fun m!819897 () Bool)

(assert (=> start!74750 m!819897))

(declare-fun m!819899 () Bool)

(assert (=> start!74750 m!819899))

(declare-fun m!819901 () Bool)

(assert (=> mapNonEmpty!27888 m!819901))

(declare-fun m!819903 () Bool)

(assert (=> b!879727 m!819903))

(declare-fun m!819905 () Bool)

(assert (=> b!879730 m!819905))

(check-sat (not b!879725) (not start!74750) tp_is_empty!17515 (not b!879734) (not b!879731) (not mapNonEmpty!27888) (not b!879733) (not b!879727) (not b_next!15271) (not b!879726) b_and!25157)
(check-sat b_and!25157 (not b_next!15271))
