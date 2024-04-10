; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74282 () Bool)

(assert start!74282)

(declare-fun b_free!15045 () Bool)

(declare-fun b_next!15045 () Bool)

(assert (=> start!74282 (= b_free!15045 (not b_next!15045))))

(declare-fun tp!52810 () Bool)

(declare-fun b_and!24821 () Bool)

(assert (=> start!74282 (= tp!52810 b_and!24821)))

(declare-fun mapNonEmpty!27542 () Bool)

(declare-fun mapRes!27542 () Bool)

(declare-fun tp!52809 () Bool)

(declare-fun e!486631 () Bool)

(assert (=> mapNonEmpty!27542 (= mapRes!27542 (and tp!52809 e!486631))))

(declare-datatypes ((V!28099 0))(
  ( (V!28100 (val!8692 Int)) )
))
(declare-datatypes ((ValueCell!8205 0))(
  ( (ValueCellFull!8205 (v!11121 V!28099)) (EmptyCell!8205) )
))
(declare-fun mapValue!27542 () ValueCell!8205)

(declare-fun mapKey!27542 () (_ BitVec 32))

(declare-fun mapRest!27542 () (Array (_ BitVec 32) ValueCell!8205))

(declare-datatypes ((array!50706 0))(
  ( (array!50707 (arr!24381 (Array (_ BitVec 32) ValueCell!8205)) (size!24821 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50706)

(assert (=> mapNonEmpty!27542 (= (arr!24381 _values!688) (store mapRest!27542 mapKey!27542 mapValue!27542))))

(declare-fun b!873917 () Bool)

(declare-fun res!593872 () Bool)

(declare-fun e!486635 () Bool)

(assert (=> b!873917 (=> (not res!593872) (not e!486635))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50708 0))(
  ( (array!50709 (arr!24382 (Array (_ BitVec 32) (_ BitVec 64))) (size!24822 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50708)

(assert (=> b!873917 (= res!593872 (and (= (size!24821 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24822 _keys!868) (size!24821 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873918 () Bool)

(declare-fun res!593873 () Bool)

(assert (=> b!873918 (=> (not res!593873) (not e!486635))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873918 (= res!593873 (and (= (select (arr!24382 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873919 () Bool)

(declare-fun e!486634 () Bool)

(declare-fun e!486633 () Bool)

(assert (=> b!873919 (= e!486634 (and e!486633 mapRes!27542))))

(declare-fun condMapEmpty!27542 () Bool)

(declare-fun mapDefault!27542 () ValueCell!8205)

(assert (=> b!873919 (= condMapEmpty!27542 (= (arr!24381 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8205)) mapDefault!27542)))))

(declare-fun b!873920 () Bool)

(declare-fun res!593869 () Bool)

(assert (=> b!873920 (=> (not res!593869) (not e!486635))))

(assert (=> b!873920 (= res!593869 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24822 _keys!868))))))

(declare-fun b!873921 () Bool)

(declare-fun res!593868 () Bool)

(assert (=> b!873921 (=> (not res!593868) (not e!486635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873921 (= res!593868 (validMask!0 mask!1196))))

(declare-fun b!873923 () Bool)

(assert (=> b!873923 (= e!486635 false)))

(declare-fun v!557 () V!28099)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28099)

(declare-fun zeroValue!654 () V!28099)

(declare-datatypes ((tuple2!11486 0))(
  ( (tuple2!11487 (_1!5754 (_ BitVec 64)) (_2!5754 V!28099)) )
))
(declare-datatypes ((List!17305 0))(
  ( (Nil!17302) (Cons!17301 (h!18432 tuple2!11486) (t!24346 List!17305)) )
))
(declare-datatypes ((ListLongMap!10255 0))(
  ( (ListLongMap!10256 (toList!5143 List!17305)) )
))
(declare-fun lt!395849 () ListLongMap!10255)

(declare-fun getCurrentListMapNoExtraKeys!3110 (array!50708 array!50706 (_ BitVec 32) (_ BitVec 32) V!28099 V!28099 (_ BitVec 32) Int) ListLongMap!10255)

(assert (=> b!873923 (= lt!395849 (getCurrentListMapNoExtraKeys!3110 _keys!868 (array!50707 (store (arr!24381 _values!688) i!612 (ValueCellFull!8205 v!557)) (size!24821 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395848 () ListLongMap!10255)

(assert (=> b!873923 (= lt!395848 (getCurrentListMapNoExtraKeys!3110 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873924 () Bool)

(declare-fun res!593874 () Bool)

(assert (=> b!873924 (=> (not res!593874) (not e!486635))))

(declare-datatypes ((List!17306 0))(
  ( (Nil!17303) (Cons!17302 (h!18433 (_ BitVec 64)) (t!24347 List!17306)) )
))
(declare-fun arrayNoDuplicates!0 (array!50708 (_ BitVec 32) List!17306) Bool)

(assert (=> b!873924 (= res!593874 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17303))))

(declare-fun mapIsEmpty!27542 () Bool)

(assert (=> mapIsEmpty!27542 mapRes!27542))

(declare-fun b!873922 () Bool)

(declare-fun tp_is_empty!17289 () Bool)

(assert (=> b!873922 (= e!486631 tp_is_empty!17289)))

(declare-fun res!593867 () Bool)

(assert (=> start!74282 (=> (not res!593867) (not e!486635))))

(assert (=> start!74282 (= res!593867 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24822 _keys!868))))))

(assert (=> start!74282 e!486635))

(assert (=> start!74282 tp_is_empty!17289))

(assert (=> start!74282 true))

(assert (=> start!74282 tp!52810))

(declare-fun array_inv!19234 (array!50708) Bool)

(assert (=> start!74282 (array_inv!19234 _keys!868)))

(declare-fun array_inv!19235 (array!50706) Bool)

(assert (=> start!74282 (and (array_inv!19235 _values!688) e!486634)))

(declare-fun b!873925 () Bool)

(declare-fun res!593870 () Bool)

(assert (=> b!873925 (=> (not res!593870) (not e!486635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50708 (_ BitVec 32)) Bool)

(assert (=> b!873925 (= res!593870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873926 () Bool)

(declare-fun res!593871 () Bool)

(assert (=> b!873926 (=> (not res!593871) (not e!486635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873926 (= res!593871 (validKeyInArray!0 k0!854))))

(declare-fun b!873927 () Bool)

(assert (=> b!873927 (= e!486633 tp_is_empty!17289)))

(assert (= (and start!74282 res!593867) b!873921))

(assert (= (and b!873921 res!593868) b!873917))

(assert (= (and b!873917 res!593872) b!873925))

(assert (= (and b!873925 res!593870) b!873924))

(assert (= (and b!873924 res!593874) b!873920))

(assert (= (and b!873920 res!593869) b!873926))

(assert (= (and b!873926 res!593871) b!873918))

(assert (= (and b!873918 res!593873) b!873923))

(assert (= (and b!873919 condMapEmpty!27542) mapIsEmpty!27542))

(assert (= (and b!873919 (not condMapEmpty!27542)) mapNonEmpty!27542))

(get-info :version)

(assert (= (and mapNonEmpty!27542 ((_ is ValueCellFull!8205) mapValue!27542)) b!873922))

(assert (= (and b!873919 ((_ is ValueCellFull!8205) mapDefault!27542)) b!873927))

(assert (= start!74282 b!873919))

(declare-fun m!814259 () Bool)

(assert (=> b!873918 m!814259))

(declare-fun m!814261 () Bool)

(assert (=> mapNonEmpty!27542 m!814261))

(declare-fun m!814263 () Bool)

(assert (=> b!873923 m!814263))

(declare-fun m!814265 () Bool)

(assert (=> b!873923 m!814265))

(declare-fun m!814267 () Bool)

(assert (=> b!873923 m!814267))

(declare-fun m!814269 () Bool)

(assert (=> b!873924 m!814269))

(declare-fun m!814271 () Bool)

(assert (=> b!873921 m!814271))

(declare-fun m!814273 () Bool)

(assert (=> start!74282 m!814273))

(declare-fun m!814275 () Bool)

(assert (=> start!74282 m!814275))

(declare-fun m!814277 () Bool)

(assert (=> b!873926 m!814277))

(declare-fun m!814279 () Bool)

(assert (=> b!873925 m!814279))

(check-sat (not start!74282) b_and!24821 (not b!873926) tp_is_empty!17289 (not b!873925) (not b!873921) (not b_next!15045) (not b!873924) (not mapNonEmpty!27542) (not b!873923))
(check-sat b_and!24821 (not b_next!15045))
