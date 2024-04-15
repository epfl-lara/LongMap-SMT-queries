; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74552 () Bool)

(assert start!74552)

(declare-fun b_free!15259 () Bool)

(declare-fun b_next!15259 () Bool)

(assert (=> start!74552 (= b_free!15259 (not b_next!15259))))

(declare-fun tp!53460 () Bool)

(declare-fun b_and!25109 () Bool)

(assert (=> start!74552 (= tp!53460 b_and!25109)))

(declare-fun b!878370 () Bool)

(declare-fun e!488830 () Bool)

(declare-fun e!488829 () Bool)

(declare-fun mapRes!27870 () Bool)

(assert (=> b!878370 (= e!488830 (and e!488829 mapRes!27870))))

(declare-fun condMapEmpty!27870 () Bool)

(declare-datatypes ((V!28385 0))(
  ( (V!28386 (val!8799 Int)) )
))
(declare-datatypes ((ValueCell!8312 0))(
  ( (ValueCellFull!8312 (v!11233 V!28385)) (EmptyCell!8312) )
))
(declare-datatypes ((array!51113 0))(
  ( (array!51114 (arr!24583 (Array (_ BitVec 32) ValueCell!8312)) (size!25025 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51113)

(declare-fun mapDefault!27870 () ValueCell!8312)

(assert (=> b!878370 (= condMapEmpty!27870 (= (arr!24583 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8312)) mapDefault!27870)))))

(declare-fun b!878371 () Bool)

(declare-fun e!488828 () Bool)

(declare-fun tp_is_empty!17503 () Bool)

(assert (=> b!878371 (= e!488828 tp_is_empty!17503)))

(declare-fun b!878372 () Bool)

(declare-fun res!596801 () Bool)

(declare-fun e!488832 () Bool)

(assert (=> b!878372 (=> (not res!596801) (not e!488832))))

(declare-datatypes ((array!51115 0))(
  ( (array!51116 (arr!24584 (Array (_ BitVec 32) (_ BitVec 64))) (size!25026 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51115)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51115 (_ BitVec 32)) Bool)

(assert (=> b!878372 (= res!596801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!596800 () Bool)

(assert (=> start!74552 (=> (not res!596800) (not e!488832))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74552 (= res!596800 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25026 _keys!868))))))

(assert (=> start!74552 e!488832))

(assert (=> start!74552 tp_is_empty!17503))

(assert (=> start!74552 true))

(assert (=> start!74552 tp!53460))

(declare-fun array_inv!19416 (array!51115) Bool)

(assert (=> start!74552 (array_inv!19416 _keys!868)))

(declare-fun array_inv!19417 (array!51113) Bool)

(assert (=> start!74552 (and (array_inv!19417 _values!688) e!488830)))

(declare-fun b!878373 () Bool)

(declare-fun res!596796 () Bool)

(assert (=> b!878373 (=> (not res!596796) (not e!488832))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878373 (= res!596796 (validKeyInArray!0 k0!854))))

(declare-fun b!878374 () Bool)

(declare-fun res!596795 () Bool)

(assert (=> b!878374 (=> (not res!596795) (not e!488832))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878374 (= res!596795 (and (= (select (arr!24584 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878375 () Bool)

(declare-fun res!596798 () Bool)

(assert (=> b!878375 (=> (not res!596798) (not e!488832))))

(assert (=> b!878375 (= res!596798 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25026 _keys!868))))))

(declare-fun b!878376 () Bool)

(assert (=> b!878376 (= e!488829 tp_is_empty!17503)))

(declare-fun b!878377 () Bool)

(declare-fun res!596797 () Bool)

(assert (=> b!878377 (=> (not res!596797) (not e!488832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878377 (= res!596797 (validMask!0 mask!1196))))

(declare-fun b!878378 () Bool)

(declare-fun res!596802 () Bool)

(assert (=> b!878378 (=> (not res!596802) (not e!488832))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878378 (= res!596802 (and (= (size!25025 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25026 _keys!868) (size!25025 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878379 () Bool)

(declare-fun res!596799 () Bool)

(assert (=> b!878379 (=> (not res!596799) (not e!488832))))

(declare-datatypes ((List!17455 0))(
  ( (Nil!17452) (Cons!17451 (h!18582 (_ BitVec 64)) (t!24535 List!17455)) )
))
(declare-fun arrayNoDuplicates!0 (array!51115 (_ BitVec 32) List!17455) Bool)

(assert (=> b!878379 (= res!596799 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17452))))

(declare-fun mapIsEmpty!27870 () Bool)

(assert (=> mapIsEmpty!27870 mapRes!27870))

(declare-fun mapNonEmpty!27870 () Bool)

(declare-fun tp!53459 () Bool)

(assert (=> mapNonEmpty!27870 (= mapRes!27870 (and tp!53459 e!488828))))

(declare-fun mapRest!27870 () (Array (_ BitVec 32) ValueCell!8312))

(declare-fun mapKey!27870 () (_ BitVec 32))

(declare-fun mapValue!27870 () ValueCell!8312)

(assert (=> mapNonEmpty!27870 (= (arr!24583 _values!688) (store mapRest!27870 mapKey!27870 mapValue!27870))))

(declare-fun b!878380 () Bool)

(assert (=> b!878380 (= e!488832 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25026 _keys!868)) (bvsge (bvsub (size!25026 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!25026 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11654 0))(
  ( (tuple2!11655 (_1!5838 (_ BitVec 64)) (_2!5838 V!28385)) )
))
(declare-datatypes ((List!17456 0))(
  ( (Nil!17453) (Cons!17452 (h!18583 tuple2!11654) (t!24536 List!17456)) )
))
(declare-datatypes ((ListLongMap!10413 0))(
  ( (ListLongMap!10414 (toList!5222 List!17456)) )
))
(declare-fun lt!397050 () ListLongMap!10413)

(declare-fun v!557 () V!28385)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28385)

(declare-fun zeroValue!654 () V!28385)

(declare-fun getCurrentListMapNoExtraKeys!3215 (array!51115 array!51113 (_ BitVec 32) (_ BitVec 32) V!28385 V!28385 (_ BitVec 32) Int) ListLongMap!10413)

(assert (=> b!878380 (= lt!397050 (getCurrentListMapNoExtraKeys!3215 _keys!868 (array!51114 (store (arr!24583 _values!688) i!612 (ValueCellFull!8312 v!557)) (size!25025 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397051 () ListLongMap!10413)

(assert (=> b!878380 (= lt!397051 (getCurrentListMapNoExtraKeys!3215 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74552 res!596800) b!878377))

(assert (= (and b!878377 res!596797) b!878378))

(assert (= (and b!878378 res!596802) b!878372))

(assert (= (and b!878372 res!596801) b!878379))

(assert (= (and b!878379 res!596799) b!878375))

(assert (= (and b!878375 res!596798) b!878373))

(assert (= (and b!878373 res!596796) b!878374))

(assert (= (and b!878374 res!596795) b!878380))

(assert (= (and b!878370 condMapEmpty!27870) mapIsEmpty!27870))

(assert (= (and b!878370 (not condMapEmpty!27870)) mapNonEmpty!27870))

(get-info :version)

(assert (= (and mapNonEmpty!27870 ((_ is ValueCellFull!8312) mapValue!27870)) b!878371))

(assert (= (and b!878370 ((_ is ValueCellFull!8312) mapDefault!27870)) b!878376))

(assert (= start!74552 b!878370))

(declare-fun m!817665 () Bool)

(assert (=> start!74552 m!817665))

(declare-fun m!817667 () Bool)

(assert (=> start!74552 m!817667))

(declare-fun m!817669 () Bool)

(assert (=> b!878374 m!817669))

(declare-fun m!817671 () Bool)

(assert (=> b!878373 m!817671))

(declare-fun m!817673 () Bool)

(assert (=> mapNonEmpty!27870 m!817673))

(declare-fun m!817675 () Bool)

(assert (=> b!878377 m!817675))

(declare-fun m!817677 () Bool)

(assert (=> b!878379 m!817677))

(declare-fun m!817679 () Bool)

(assert (=> b!878380 m!817679))

(declare-fun m!817681 () Bool)

(assert (=> b!878380 m!817681))

(declare-fun m!817683 () Bool)

(assert (=> b!878380 m!817683))

(declare-fun m!817685 () Bool)

(assert (=> b!878372 m!817685))

(check-sat tp_is_empty!17503 (not b!878379) (not mapNonEmpty!27870) (not b_next!15259) (not b!878380) (not b!878377) (not start!74552) (not b!878373) b_and!25109 (not b!878372))
(check-sat b_and!25109 (not b_next!15259))
