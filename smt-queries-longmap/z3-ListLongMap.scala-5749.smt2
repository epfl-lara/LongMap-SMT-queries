; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74324 () Bool)

(assert start!74324)

(declare-fun b_free!15087 () Bool)

(declare-fun b_next!15087 () Bool)

(assert (=> start!74324 (= b_free!15087 (not b_next!15087))))

(declare-fun tp!52936 () Bool)

(declare-fun b_and!24863 () Bool)

(assert (=> start!74324 (= tp!52936 b_and!24863)))

(declare-fun res!594374 () Bool)

(declare-fun e!486946 () Bool)

(assert (=> start!74324 (=> (not res!594374) (not e!486946))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50790 0))(
  ( (array!50791 (arr!24423 (Array (_ BitVec 32) (_ BitVec 64))) (size!24863 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50790)

(assert (=> start!74324 (= res!594374 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24863 _keys!868))))))

(assert (=> start!74324 e!486946))

(declare-fun tp_is_empty!17331 () Bool)

(assert (=> start!74324 tp_is_empty!17331))

(assert (=> start!74324 true))

(assert (=> start!74324 tp!52936))

(declare-fun array_inv!19260 (array!50790) Bool)

(assert (=> start!74324 (array_inv!19260 _keys!868)))

(declare-datatypes ((V!28155 0))(
  ( (V!28156 (val!8713 Int)) )
))
(declare-datatypes ((ValueCell!8226 0))(
  ( (ValueCellFull!8226 (v!11142 V!28155)) (EmptyCell!8226) )
))
(declare-datatypes ((array!50792 0))(
  ( (array!50793 (arr!24424 (Array (_ BitVec 32) ValueCell!8226)) (size!24864 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50792)

(declare-fun e!486949 () Bool)

(declare-fun array_inv!19261 (array!50792) Bool)

(assert (=> start!74324 (and (array_inv!19261 _values!688) e!486949)))

(declare-fun b!874610 () Bool)

(declare-fun res!594376 () Bool)

(assert (=> b!874610 (=> (not res!594376) (not e!486946))))

(declare-datatypes ((List!17336 0))(
  ( (Nil!17333) (Cons!17332 (h!18463 (_ BitVec 64)) (t!24377 List!17336)) )
))
(declare-fun arrayNoDuplicates!0 (array!50790 (_ BitVec 32) List!17336) Bool)

(assert (=> b!874610 (= res!594376 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17333))))

(declare-fun b!874611 () Bool)

(assert (=> b!874611 (= e!486946 false)))

(declare-fun v!557 () V!28155)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11514 0))(
  ( (tuple2!11515 (_1!5768 (_ BitVec 64)) (_2!5768 V!28155)) )
))
(declare-datatypes ((List!17337 0))(
  ( (Nil!17334) (Cons!17333 (h!18464 tuple2!11514) (t!24378 List!17337)) )
))
(declare-datatypes ((ListLongMap!10283 0))(
  ( (ListLongMap!10284 (toList!5157 List!17337)) )
))
(declare-fun lt!395974 () ListLongMap!10283)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28155)

(declare-fun zeroValue!654 () V!28155)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3124 (array!50790 array!50792 (_ BitVec 32) (_ BitVec 32) V!28155 V!28155 (_ BitVec 32) Int) ListLongMap!10283)

(assert (=> b!874611 (= lt!395974 (getCurrentListMapNoExtraKeys!3124 _keys!868 (array!50793 (store (arr!24424 _values!688) i!612 (ValueCellFull!8226 v!557)) (size!24864 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395975 () ListLongMap!10283)

(assert (=> b!874611 (= lt!395975 (getCurrentListMapNoExtraKeys!3124 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27605 () Bool)

(declare-fun mapRes!27605 () Bool)

(assert (=> mapIsEmpty!27605 mapRes!27605))

(declare-fun b!874612 () Bool)

(declare-fun res!594372 () Bool)

(assert (=> b!874612 (=> (not res!594372) (not e!486946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874612 (= res!594372 (validMask!0 mask!1196))))

(declare-fun b!874613 () Bool)

(declare-fun res!594373 () Bool)

(assert (=> b!874613 (=> (not res!594373) (not e!486946))))

(assert (=> b!874613 (= res!594373 (and (= (size!24864 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24863 _keys!868) (size!24864 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874614 () Bool)

(declare-fun res!594377 () Bool)

(assert (=> b!874614 (=> (not res!594377) (not e!486946))))

(assert (=> b!874614 (= res!594377 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24863 _keys!868))))))

(declare-fun b!874615 () Bool)

(declare-fun res!594378 () Bool)

(assert (=> b!874615 (=> (not res!594378) (not e!486946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50790 (_ BitVec 32)) Bool)

(assert (=> b!874615 (= res!594378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874616 () Bool)

(declare-fun res!594371 () Bool)

(assert (=> b!874616 (=> (not res!594371) (not e!486946))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!874616 (= res!594371 (and (= (select (arr!24423 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27605 () Bool)

(declare-fun tp!52935 () Bool)

(declare-fun e!486948 () Bool)

(assert (=> mapNonEmpty!27605 (= mapRes!27605 (and tp!52935 e!486948))))

(declare-fun mapKey!27605 () (_ BitVec 32))

(declare-fun mapValue!27605 () ValueCell!8226)

(declare-fun mapRest!27605 () (Array (_ BitVec 32) ValueCell!8226))

(assert (=> mapNonEmpty!27605 (= (arr!24424 _values!688) (store mapRest!27605 mapKey!27605 mapValue!27605))))

(declare-fun b!874617 () Bool)

(declare-fun e!486947 () Bool)

(assert (=> b!874617 (= e!486949 (and e!486947 mapRes!27605))))

(declare-fun condMapEmpty!27605 () Bool)

(declare-fun mapDefault!27605 () ValueCell!8226)

(assert (=> b!874617 (= condMapEmpty!27605 (= (arr!24424 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8226)) mapDefault!27605)))))

(declare-fun b!874618 () Bool)

(assert (=> b!874618 (= e!486948 tp_is_empty!17331)))

(declare-fun b!874619 () Bool)

(declare-fun res!594375 () Bool)

(assert (=> b!874619 (=> (not res!594375) (not e!486946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874619 (= res!594375 (validKeyInArray!0 k0!854))))

(declare-fun b!874620 () Bool)

(assert (=> b!874620 (= e!486947 tp_is_empty!17331)))

(assert (= (and start!74324 res!594374) b!874612))

(assert (= (and b!874612 res!594372) b!874613))

(assert (= (and b!874613 res!594373) b!874615))

(assert (= (and b!874615 res!594378) b!874610))

(assert (= (and b!874610 res!594376) b!874614))

(assert (= (and b!874614 res!594377) b!874619))

(assert (= (and b!874619 res!594375) b!874616))

(assert (= (and b!874616 res!594371) b!874611))

(assert (= (and b!874617 condMapEmpty!27605) mapIsEmpty!27605))

(assert (= (and b!874617 (not condMapEmpty!27605)) mapNonEmpty!27605))

(get-info :version)

(assert (= (and mapNonEmpty!27605 ((_ is ValueCellFull!8226) mapValue!27605)) b!874618))

(assert (= (and b!874617 ((_ is ValueCellFull!8226) mapDefault!27605)) b!874620))

(assert (= start!74324 b!874617))

(declare-fun m!814721 () Bool)

(assert (=> start!74324 m!814721))

(declare-fun m!814723 () Bool)

(assert (=> start!74324 m!814723))

(declare-fun m!814725 () Bool)

(assert (=> b!874610 m!814725))

(declare-fun m!814727 () Bool)

(assert (=> b!874616 m!814727))

(declare-fun m!814729 () Bool)

(assert (=> b!874611 m!814729))

(declare-fun m!814731 () Bool)

(assert (=> b!874611 m!814731))

(declare-fun m!814733 () Bool)

(assert (=> b!874611 m!814733))

(declare-fun m!814735 () Bool)

(assert (=> mapNonEmpty!27605 m!814735))

(declare-fun m!814737 () Bool)

(assert (=> b!874615 m!814737))

(declare-fun m!814739 () Bool)

(assert (=> b!874619 m!814739))

(declare-fun m!814741 () Bool)

(assert (=> b!874612 m!814741))

(check-sat (not mapNonEmpty!27605) tp_is_empty!17331 (not b!874615) (not b_next!15087) (not b!874612) (not b!874610) (not start!74324) (not b!874611) b_and!24863 (not b!874619))
(check-sat b_and!24863 (not b_next!15087))
