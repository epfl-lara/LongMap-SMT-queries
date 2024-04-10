; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74530 () Bool)

(assert start!74530)

(declare-fun b_free!15219 () Bool)

(declare-fun b_next!15219 () Bool)

(assert (=> start!74530 (= b_free!15219 (not b_next!15219))))

(declare-fun tp!53339 () Bool)

(declare-fun b_and!25095 () Bool)

(assert (=> start!74530 (= tp!53339 b_and!25095)))

(declare-fun res!596429 () Bool)

(declare-fun e!488676 () Bool)

(assert (=> start!74530 (=> (not res!596429) (not e!488676))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51054 0))(
  ( (array!51055 (arr!24553 (Array (_ BitVec 32) (_ BitVec 64))) (size!24993 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51054)

(assert (=> start!74530 (= res!596429 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24993 _keys!868))))))

(assert (=> start!74530 e!488676))

(declare-fun tp_is_empty!17463 () Bool)

(assert (=> start!74530 tp_is_empty!17463))

(assert (=> start!74530 true))

(assert (=> start!74530 tp!53339))

(declare-fun array_inv!19352 (array!51054) Bool)

(assert (=> start!74530 (array_inv!19352 _keys!868)))

(declare-datatypes ((V!28331 0))(
  ( (V!28332 (val!8779 Int)) )
))
(declare-datatypes ((ValueCell!8292 0))(
  ( (ValueCellFull!8292 (v!11219 V!28331)) (EmptyCell!8292) )
))
(declare-datatypes ((array!51056 0))(
  ( (array!51057 (arr!24554 (Array (_ BitVec 32) ValueCell!8292)) (size!24994 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51056)

(declare-fun e!488679 () Bool)

(declare-fun array_inv!19353 (array!51056) Bool)

(assert (=> start!74530 (and (array_inv!19353 _values!688) e!488679)))

(declare-fun b!877949 () Bool)

(declare-fun res!596432 () Bool)

(assert (=> b!877949 (=> (not res!596432) (not e!488676))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!877949 (= res!596432 (and (= (size!24994 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24993 _keys!868) (size!24994 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877950 () Bool)

(declare-fun res!596426 () Bool)

(assert (=> b!877950 (=> (not res!596426) (not e!488676))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877950 (= res!596426 (validKeyInArray!0 k0!854))))

(declare-fun b!877951 () Bool)

(declare-fun res!596425 () Bool)

(assert (=> b!877951 (=> (not res!596425) (not e!488676))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!877951 (= res!596425 (and (= (select (arr!24553 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877952 () Bool)

(declare-fun res!596427 () Bool)

(assert (=> b!877952 (=> (not res!596427) (not e!488676))))

(declare-datatypes ((List!17424 0))(
  ( (Nil!17421) (Cons!17420 (h!18551 (_ BitVec 64)) (t!24513 List!17424)) )
))
(declare-fun arrayNoDuplicates!0 (array!51054 (_ BitVec 32) List!17424) Bool)

(assert (=> b!877952 (= res!596427 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17421))))

(declare-fun mapNonEmpty!27810 () Bool)

(declare-fun mapRes!27810 () Bool)

(declare-fun tp!53338 () Bool)

(declare-fun e!488677 () Bool)

(assert (=> mapNonEmpty!27810 (= mapRes!27810 (and tp!53338 e!488677))))

(declare-fun mapKey!27810 () (_ BitVec 32))

(declare-fun mapRest!27810 () (Array (_ BitVec 32) ValueCell!8292))

(declare-fun mapValue!27810 () ValueCell!8292)

(assert (=> mapNonEmpty!27810 (= (arr!24554 _values!688) (store mapRest!27810 mapKey!27810 mapValue!27810))))

(declare-fun mapIsEmpty!27810 () Bool)

(assert (=> mapIsEmpty!27810 mapRes!27810))

(declare-fun b!877953 () Bool)

(assert (=> b!877953 (= e!488676 false)))

(declare-fun v!557 () V!28331)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28331)

(declare-fun zeroValue!654 () V!28331)

(declare-datatypes ((tuple2!11608 0))(
  ( (tuple2!11609 (_1!5815 (_ BitVec 64)) (_2!5815 V!28331)) )
))
(declare-datatypes ((List!17425 0))(
  ( (Nil!17422) (Cons!17421 (h!18552 tuple2!11608) (t!24514 List!17425)) )
))
(declare-datatypes ((ListLongMap!10377 0))(
  ( (ListLongMap!10378 (toList!5204 List!17425)) )
))
(declare-fun lt!397166 () ListLongMap!10377)

(declare-fun getCurrentListMapNoExtraKeys!3171 (array!51054 array!51056 (_ BitVec 32) (_ BitVec 32) V!28331 V!28331 (_ BitVec 32) Int) ListLongMap!10377)

(assert (=> b!877953 (= lt!397166 (getCurrentListMapNoExtraKeys!3171 _keys!868 (array!51057 (store (arr!24554 _values!688) i!612 (ValueCellFull!8292 v!557)) (size!24994 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397167 () ListLongMap!10377)

(assert (=> b!877953 (= lt!397167 (getCurrentListMapNoExtraKeys!3171 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877954 () Bool)

(declare-fun res!596431 () Bool)

(assert (=> b!877954 (=> (not res!596431) (not e!488676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877954 (= res!596431 (validMask!0 mask!1196))))

(declare-fun b!877955 () Bool)

(declare-fun e!488678 () Bool)

(assert (=> b!877955 (= e!488679 (and e!488678 mapRes!27810))))

(declare-fun condMapEmpty!27810 () Bool)

(declare-fun mapDefault!27810 () ValueCell!8292)

(assert (=> b!877955 (= condMapEmpty!27810 (= (arr!24554 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8292)) mapDefault!27810)))))

(declare-fun b!877956 () Bool)

(assert (=> b!877956 (= e!488677 tp_is_empty!17463)))

(declare-fun b!877957 () Bool)

(declare-fun res!596430 () Bool)

(assert (=> b!877957 (=> (not res!596430) (not e!488676))))

(assert (=> b!877957 (= res!596430 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24993 _keys!868))))))

(declare-fun b!877958 () Bool)

(assert (=> b!877958 (= e!488678 tp_is_empty!17463)))

(declare-fun b!877959 () Bool)

(declare-fun res!596428 () Bool)

(assert (=> b!877959 (=> (not res!596428) (not e!488676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51054 (_ BitVec 32)) Bool)

(assert (=> b!877959 (= res!596428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74530 res!596429) b!877954))

(assert (= (and b!877954 res!596431) b!877949))

(assert (= (and b!877949 res!596432) b!877959))

(assert (= (and b!877959 res!596428) b!877952))

(assert (= (and b!877952 res!596427) b!877957))

(assert (= (and b!877957 res!596430) b!877950))

(assert (= (and b!877950 res!596426) b!877951))

(assert (= (and b!877951 res!596425) b!877953))

(assert (= (and b!877955 condMapEmpty!27810) mapIsEmpty!27810))

(assert (= (and b!877955 (not condMapEmpty!27810)) mapNonEmpty!27810))

(get-info :version)

(assert (= (and mapNonEmpty!27810 ((_ is ValueCellFull!8292) mapValue!27810)) b!877956))

(assert (= (and b!877955 ((_ is ValueCellFull!8292) mapDefault!27810)) b!877958))

(assert (= start!74530 b!877955))

(declare-fun m!817983 () Bool)

(assert (=> b!877952 m!817983))

(declare-fun m!817985 () Bool)

(assert (=> b!877950 m!817985))

(declare-fun m!817987 () Bool)

(assert (=> b!877959 m!817987))

(declare-fun m!817989 () Bool)

(assert (=> b!877954 m!817989))

(declare-fun m!817991 () Bool)

(assert (=> mapNonEmpty!27810 m!817991))

(declare-fun m!817993 () Bool)

(assert (=> b!877951 m!817993))

(declare-fun m!817995 () Bool)

(assert (=> b!877953 m!817995))

(declare-fun m!817997 () Bool)

(assert (=> b!877953 m!817997))

(declare-fun m!817999 () Bool)

(assert (=> b!877953 m!817999))

(declare-fun m!818001 () Bool)

(assert (=> start!74530 m!818001))

(declare-fun m!818003 () Bool)

(assert (=> start!74530 m!818003))

(check-sat (not b!877953) (not b_next!15219) (not b!877952) (not b!877950) (not mapNonEmpty!27810) (not b!877959) tp_is_empty!17463 (not b!877954) (not start!74530) b_and!25095)
(check-sat b_and!25095 (not b_next!15219))
