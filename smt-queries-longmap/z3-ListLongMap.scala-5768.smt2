; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74512 () Bool)

(assert start!74512)

(declare-fun b_free!15201 () Bool)

(declare-fun b_next!15201 () Bool)

(assert (=> start!74512 (= b_free!15201 (not b_next!15201))))

(declare-fun tp!53285 () Bool)

(declare-fun b_and!25077 () Bool)

(assert (=> start!74512 (= tp!53285 b_and!25077)))

(declare-fun b!877652 () Bool)

(declare-fun res!596214 () Bool)

(declare-fun e!488545 () Bool)

(assert (=> b!877652 (=> (not res!596214) (not e!488545))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877652 (= res!596214 (validMask!0 mask!1196))))

(declare-fun b!877653 () Bool)

(declare-fun e!488541 () Bool)

(declare-fun tp_is_empty!17445 () Bool)

(assert (=> b!877653 (= e!488541 tp_is_empty!17445)))

(declare-fun b!877654 () Bool)

(declare-fun e!488542 () Bool)

(declare-fun mapRes!27783 () Bool)

(assert (=> b!877654 (= e!488542 (and e!488541 mapRes!27783))))

(declare-fun condMapEmpty!27783 () Bool)

(declare-datatypes ((V!28307 0))(
  ( (V!28308 (val!8770 Int)) )
))
(declare-datatypes ((ValueCell!8283 0))(
  ( (ValueCellFull!8283 (v!11210 V!28307)) (EmptyCell!8283) )
))
(declare-datatypes ((array!51018 0))(
  ( (array!51019 (arr!24535 (Array (_ BitVec 32) ValueCell!8283)) (size!24975 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51018)

(declare-fun mapDefault!27783 () ValueCell!8283)

(assert (=> b!877654 (= condMapEmpty!27783 (= (arr!24535 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8283)) mapDefault!27783)))))

(declare-fun b!877655 () Bool)

(declare-fun res!596209 () Bool)

(assert (=> b!877655 (=> (not res!596209) (not e!488545))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51020 0))(
  ( (array!51021 (arr!24536 (Array (_ BitVec 32) (_ BitVec 64))) (size!24976 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51020)

(assert (=> b!877655 (= res!596209 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24976 _keys!868))))))

(declare-fun b!877656 () Bool)

(assert (=> b!877656 (= e!488545 false)))

(declare-fun v!557 () V!28307)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28307)

(declare-fun zeroValue!654 () V!28307)

(declare-datatypes ((tuple2!11596 0))(
  ( (tuple2!11597 (_1!5809 (_ BitVec 64)) (_2!5809 V!28307)) )
))
(declare-datatypes ((List!17411 0))(
  ( (Nil!17408) (Cons!17407 (h!18538 tuple2!11596) (t!24500 List!17411)) )
))
(declare-datatypes ((ListLongMap!10365 0))(
  ( (ListLongMap!10366 (toList!5198 List!17411)) )
))
(declare-fun lt!397112 () ListLongMap!10365)

(declare-fun getCurrentListMapNoExtraKeys!3165 (array!51020 array!51018 (_ BitVec 32) (_ BitVec 32) V!28307 V!28307 (_ BitVec 32) Int) ListLongMap!10365)

(assert (=> b!877656 (= lt!397112 (getCurrentListMapNoExtraKeys!3165 _keys!868 (array!51019 (store (arr!24535 _values!688) i!612 (ValueCellFull!8283 v!557)) (size!24975 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397113 () ListLongMap!10365)

(assert (=> b!877656 (= lt!397113 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!596215 () Bool)

(assert (=> start!74512 (=> (not res!596215) (not e!488545))))

(assert (=> start!74512 (= res!596215 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24976 _keys!868))))))

(assert (=> start!74512 e!488545))

(assert (=> start!74512 tp_is_empty!17445))

(assert (=> start!74512 true))

(assert (=> start!74512 tp!53285))

(declare-fun array_inv!19340 (array!51020) Bool)

(assert (=> start!74512 (array_inv!19340 _keys!868)))

(declare-fun array_inv!19341 (array!51018) Bool)

(assert (=> start!74512 (and (array_inv!19341 _values!688) e!488542)))

(declare-fun b!877657 () Bool)

(declare-fun e!488543 () Bool)

(assert (=> b!877657 (= e!488543 tp_is_empty!17445)))

(declare-fun mapNonEmpty!27783 () Bool)

(declare-fun tp!53284 () Bool)

(assert (=> mapNonEmpty!27783 (= mapRes!27783 (and tp!53284 e!488543))))

(declare-fun mapValue!27783 () ValueCell!8283)

(declare-fun mapRest!27783 () (Array (_ BitVec 32) ValueCell!8283))

(declare-fun mapKey!27783 () (_ BitVec 32))

(assert (=> mapNonEmpty!27783 (= (arr!24535 _values!688) (store mapRest!27783 mapKey!27783 mapValue!27783))))

(declare-fun b!877658 () Bool)

(declare-fun res!596216 () Bool)

(assert (=> b!877658 (=> (not res!596216) (not e!488545))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877658 (= res!596216 (and (= (select (arr!24536 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877659 () Bool)

(declare-fun res!596210 () Bool)

(assert (=> b!877659 (=> (not res!596210) (not e!488545))))

(assert (=> b!877659 (= res!596210 (and (= (size!24975 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24976 _keys!868) (size!24975 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877660 () Bool)

(declare-fun res!596212 () Bool)

(assert (=> b!877660 (=> (not res!596212) (not e!488545))))

(declare-datatypes ((List!17412 0))(
  ( (Nil!17409) (Cons!17408 (h!18539 (_ BitVec 64)) (t!24501 List!17412)) )
))
(declare-fun arrayNoDuplicates!0 (array!51020 (_ BitVec 32) List!17412) Bool)

(assert (=> b!877660 (= res!596212 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17409))))

(declare-fun mapIsEmpty!27783 () Bool)

(assert (=> mapIsEmpty!27783 mapRes!27783))

(declare-fun b!877661 () Bool)

(declare-fun res!596211 () Bool)

(assert (=> b!877661 (=> (not res!596211) (not e!488545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877661 (= res!596211 (validKeyInArray!0 k0!854))))

(declare-fun b!877662 () Bool)

(declare-fun res!596213 () Bool)

(assert (=> b!877662 (=> (not res!596213) (not e!488545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51020 (_ BitVec 32)) Bool)

(assert (=> b!877662 (= res!596213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74512 res!596215) b!877652))

(assert (= (and b!877652 res!596214) b!877659))

(assert (= (and b!877659 res!596210) b!877662))

(assert (= (and b!877662 res!596213) b!877660))

(assert (= (and b!877660 res!596212) b!877655))

(assert (= (and b!877655 res!596209) b!877661))

(assert (= (and b!877661 res!596211) b!877658))

(assert (= (and b!877658 res!596216) b!877656))

(assert (= (and b!877654 condMapEmpty!27783) mapIsEmpty!27783))

(assert (= (and b!877654 (not condMapEmpty!27783)) mapNonEmpty!27783))

(get-info :version)

(assert (= (and mapNonEmpty!27783 ((_ is ValueCellFull!8283) mapValue!27783)) b!877657))

(assert (= (and b!877654 ((_ is ValueCellFull!8283) mapDefault!27783)) b!877653))

(assert (= start!74512 b!877654))

(declare-fun m!817785 () Bool)

(assert (=> mapNonEmpty!27783 m!817785))

(declare-fun m!817787 () Bool)

(assert (=> b!877652 m!817787))

(declare-fun m!817789 () Bool)

(assert (=> b!877662 m!817789))

(declare-fun m!817791 () Bool)

(assert (=> b!877661 m!817791))

(declare-fun m!817793 () Bool)

(assert (=> start!74512 m!817793))

(declare-fun m!817795 () Bool)

(assert (=> start!74512 m!817795))

(declare-fun m!817797 () Bool)

(assert (=> b!877656 m!817797))

(declare-fun m!817799 () Bool)

(assert (=> b!877656 m!817799))

(declare-fun m!817801 () Bool)

(assert (=> b!877656 m!817801))

(declare-fun m!817803 () Bool)

(assert (=> b!877660 m!817803))

(declare-fun m!817805 () Bool)

(assert (=> b!877658 m!817805))

(check-sat (not b_next!15201) (not b!877661) (not b!877656) (not mapNonEmpty!27783) b_and!25077 tp_is_empty!17445 (not b!877662) (not b!877660) (not b!877652) (not start!74512))
(check-sat b_and!25077 (not b_next!15201))
