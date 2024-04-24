; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74690 () Bool)

(assert start!74690)

(declare-fun b_free!15211 () Bool)

(declare-fun b_next!15211 () Bool)

(assert (=> start!74690 (= b_free!15211 (not b_next!15211))))

(declare-fun tp!53316 () Bool)

(declare-fun b_and!25097 () Bool)

(assert (=> start!74690 (= tp!53316 b_and!25097)))

(declare-fun b!878720 () Bool)

(declare-fun e!489198 () Bool)

(declare-fun e!489199 () Bool)

(declare-fun mapRes!27798 () Bool)

(assert (=> b!878720 (= e!489198 (and e!489199 mapRes!27798))))

(declare-fun condMapEmpty!27798 () Bool)

(declare-datatypes ((V!28321 0))(
  ( (V!28322 (val!8775 Int)) )
))
(declare-datatypes ((ValueCell!8288 0))(
  ( (ValueCellFull!8288 (v!11215 V!28321)) (EmptyCell!8288) )
))
(declare-datatypes ((array!51081 0))(
  ( (array!51082 (arr!24562 (Array (_ BitVec 32) ValueCell!8288)) (size!25003 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51081)

(declare-fun mapDefault!27798 () ValueCell!8288)

(assert (=> b!878720 (= condMapEmpty!27798 (= (arr!24562 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8288)) mapDefault!27798)))))

(declare-fun b!878721 () Bool)

(declare-fun res!596674 () Bool)

(declare-fun e!489201 () Bool)

(assert (=> b!878721 (=> (not res!596674) (not e!489201))))

(declare-datatypes ((array!51083 0))(
  ( (array!51084 (arr!24563 (Array (_ BitVec 32) (_ BitVec 64))) (size!25004 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51083)

(declare-datatypes ((List!17374 0))(
  ( (Nil!17371) (Cons!17370 (h!18507 (_ BitVec 64)) (t!24455 List!17374)) )
))
(declare-fun arrayNoDuplicates!0 (array!51083 (_ BitVec 32) List!17374) Bool)

(assert (=> b!878721 (= res!596674 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17371))))

(declare-fun b!878722 () Bool)

(declare-fun res!596673 () Bool)

(assert (=> b!878722 (=> (not res!596673) (not e!489201))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878722 (= res!596673 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25004 _keys!868))))))

(declare-fun b!878723 () Bool)

(declare-fun tp_is_empty!17455 () Bool)

(assert (=> b!878723 (= e!489199 tp_is_empty!17455)))

(declare-fun res!596679 () Bool)

(assert (=> start!74690 (=> (not res!596679) (not e!489201))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74690 (= res!596679 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25004 _keys!868))))))

(assert (=> start!74690 e!489201))

(assert (=> start!74690 tp_is_empty!17455))

(assert (=> start!74690 true))

(assert (=> start!74690 tp!53316))

(declare-fun array_inv!19406 (array!51083) Bool)

(assert (=> start!74690 (array_inv!19406 _keys!868)))

(declare-fun array_inv!19407 (array!51081) Bool)

(assert (=> start!74690 (and (array_inv!19407 _values!688) e!489198)))

(declare-fun mapNonEmpty!27798 () Bool)

(declare-fun tp!53315 () Bool)

(declare-fun e!489200 () Bool)

(assert (=> mapNonEmpty!27798 (= mapRes!27798 (and tp!53315 e!489200))))

(declare-fun mapValue!27798 () ValueCell!8288)

(declare-fun mapKey!27798 () (_ BitVec 32))

(declare-fun mapRest!27798 () (Array (_ BitVec 32) ValueCell!8288))

(assert (=> mapNonEmpty!27798 (= (arr!24562 _values!688) (store mapRest!27798 mapKey!27798 mapValue!27798))))

(declare-fun b!878724 () Bool)

(declare-fun res!596675 () Bool)

(assert (=> b!878724 (=> (not res!596675) (not e!489201))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!878724 (= res!596675 (and (= (size!25003 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25004 _keys!868) (size!25003 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878725 () Bool)

(declare-fun res!596676 () Bool)

(assert (=> b!878725 (=> (not res!596676) (not e!489201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878725 (= res!596676 (validMask!0 mask!1196))))

(declare-fun b!878726 () Bool)

(assert (=> b!878726 (= e!489201 false)))

(declare-fun v!557 () V!28321)

(declare-datatypes ((tuple2!11540 0))(
  ( (tuple2!11541 (_1!5781 (_ BitVec 64)) (_2!5781 V!28321)) )
))
(declare-datatypes ((List!17375 0))(
  ( (Nil!17372) (Cons!17371 (h!18508 tuple2!11540) (t!24456 List!17375)) )
))
(declare-datatypes ((ListLongMap!10311 0))(
  ( (ListLongMap!10312 (toList!5171 List!17375)) )
))
(declare-fun lt!397504 () ListLongMap!10311)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28321)

(declare-fun zeroValue!654 () V!28321)

(declare-fun getCurrentListMapNoExtraKeys!3213 (array!51083 array!51081 (_ BitVec 32) (_ BitVec 32) V!28321 V!28321 (_ BitVec 32) Int) ListLongMap!10311)

(assert (=> b!878726 (= lt!397504 (getCurrentListMapNoExtraKeys!3213 _keys!868 (array!51082 (store (arr!24562 _values!688) i!612 (ValueCellFull!8288 v!557)) (size!25003 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397503 () ListLongMap!10311)

(assert (=> b!878726 (= lt!397503 (getCurrentListMapNoExtraKeys!3213 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27798 () Bool)

(assert (=> mapIsEmpty!27798 mapRes!27798))

(declare-fun b!878727 () Bool)

(declare-fun res!596677 () Bool)

(assert (=> b!878727 (=> (not res!596677) (not e!489201))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!878727 (= res!596677 (and (= (select (arr!24563 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878728 () Bool)

(assert (=> b!878728 (= e!489200 tp_is_empty!17455)))

(declare-fun b!878729 () Bool)

(declare-fun res!596678 () Bool)

(assert (=> b!878729 (=> (not res!596678) (not e!489201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51083 (_ BitVec 32)) Bool)

(assert (=> b!878729 (= res!596678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878730 () Bool)

(declare-fun res!596680 () Bool)

(assert (=> b!878730 (=> (not res!596680) (not e!489201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878730 (= res!596680 (validKeyInArray!0 k0!854))))

(assert (= (and start!74690 res!596679) b!878725))

(assert (= (and b!878725 res!596676) b!878724))

(assert (= (and b!878724 res!596675) b!878729))

(assert (= (and b!878729 res!596678) b!878721))

(assert (= (and b!878721 res!596674) b!878722))

(assert (= (and b!878722 res!596673) b!878730))

(assert (= (and b!878730 res!596680) b!878727))

(assert (= (and b!878727 res!596677) b!878726))

(assert (= (and b!878720 condMapEmpty!27798) mapIsEmpty!27798))

(assert (= (and b!878720 (not condMapEmpty!27798)) mapNonEmpty!27798))

(get-info :version)

(assert (= (and mapNonEmpty!27798 ((_ is ValueCellFull!8288) mapValue!27798)) b!878728))

(assert (= (and b!878720 ((_ is ValueCellFull!8288) mapDefault!27798)) b!878723))

(assert (= start!74690 b!878720))

(declare-fun m!819189 () Bool)

(assert (=> b!878721 m!819189))

(declare-fun m!819191 () Bool)

(assert (=> b!878725 m!819191))

(declare-fun m!819193 () Bool)

(assert (=> mapNonEmpty!27798 m!819193))

(declare-fun m!819195 () Bool)

(assert (=> b!878730 m!819195))

(declare-fun m!819197 () Bool)

(assert (=> start!74690 m!819197))

(declare-fun m!819199 () Bool)

(assert (=> start!74690 m!819199))

(declare-fun m!819201 () Bool)

(assert (=> b!878729 m!819201))

(declare-fun m!819203 () Bool)

(assert (=> b!878727 m!819203))

(declare-fun m!819205 () Bool)

(assert (=> b!878726 m!819205))

(declare-fun m!819207 () Bool)

(assert (=> b!878726 m!819207))

(declare-fun m!819209 () Bool)

(assert (=> b!878726 m!819209))

(check-sat (not b!878726) (not start!74690) (not b!878721) (not mapNonEmpty!27798) (not b!878730) b_and!25097 (not b!878725) tp_is_empty!17455 (not b_next!15211) (not b!878729))
(check-sat b_and!25097 (not b_next!15211))
