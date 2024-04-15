; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73972 () Bool)

(assert start!73972)

(declare-fun b_free!14905 () Bool)

(declare-fun b_next!14905 () Bool)

(assert (=> start!73972 (= b_free!14905 (not b_next!14905))))

(declare-fun tp!52219 () Bool)

(declare-fun b_and!24631 () Bool)

(assert (=> start!73972 (= tp!52219 b_and!24631)))

(declare-fun b!869704 () Bool)

(declare-fun res!591125 () Bool)

(declare-fun e!484295 () Bool)

(assert (=> b!869704 (=> (not res!591125) (not e!484295))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50217 0))(
  ( (array!50218 (arr!24140 (Array (_ BitVec 32) (_ BitVec 64))) (size!24582 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50217)

(assert (=> b!869704 (= res!591125 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24582 _keys!868))))))

(declare-fun b!869705 () Bool)

(declare-fun res!591129 () Bool)

(assert (=> b!869705 (=> (not res!591129) (not e!484295))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869705 (= res!591129 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27161 () Bool)

(declare-fun mapRes!27161 () Bool)

(declare-fun tp!52220 () Bool)

(declare-fun e!484299 () Bool)

(assert (=> mapNonEmpty!27161 (= mapRes!27161 (and tp!52220 e!484299))))

(declare-fun mapKey!27161 () (_ BitVec 32))

(declare-datatypes ((V!27769 0))(
  ( (V!27770 (val!8568 Int)) )
))
(declare-datatypes ((ValueCell!8081 0))(
  ( (ValueCellFull!8081 (v!10987 V!27769)) (EmptyCell!8081) )
))
(declare-fun mapValue!27161 () ValueCell!8081)

(declare-fun mapRest!27161 () (Array (_ BitVec 32) ValueCell!8081))

(declare-datatypes ((array!50219 0))(
  ( (array!50220 (arr!24141 (Array (_ BitVec 32) ValueCell!8081)) (size!24583 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50219)

(assert (=> mapNonEmpty!27161 (= (arr!24141 _values!688) (store mapRest!27161 mapKey!27161 mapValue!27161))))

(declare-fun b!869706 () Bool)

(declare-fun e!484296 () Bool)

(declare-fun e!484294 () Bool)

(assert (=> b!869706 (= e!484296 (and e!484294 mapRes!27161))))

(declare-fun condMapEmpty!27161 () Bool)

(declare-fun mapDefault!27161 () ValueCell!8081)

(assert (=> b!869706 (= condMapEmpty!27161 (= (arr!24141 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8081)) mapDefault!27161)))))

(declare-fun res!591122 () Bool)

(assert (=> start!73972 (=> (not res!591122) (not e!484295))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73972 (= res!591122 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24582 _keys!868))))))

(assert (=> start!73972 e!484295))

(declare-fun tp_is_empty!17041 () Bool)

(assert (=> start!73972 tp_is_empty!17041))

(assert (=> start!73972 true))

(assert (=> start!73972 tp!52219))

(declare-fun array_inv!19126 (array!50217) Bool)

(assert (=> start!73972 (array_inv!19126 _keys!868)))

(declare-fun array_inv!19127 (array!50219) Bool)

(assert (=> start!73972 (and (array_inv!19127 _values!688) e!484296)))

(declare-fun b!869707 () Bool)

(assert (=> b!869707 (= e!484294 tp_is_empty!17041)))

(declare-fun mapIsEmpty!27161 () Bool)

(assert (=> mapIsEmpty!27161 mapRes!27161))

(declare-fun b!869708 () Bool)

(declare-fun e!484298 () Bool)

(assert (=> b!869708 (= e!484295 e!484298)))

(declare-fun res!591128 () Bool)

(assert (=> b!869708 (=> (not res!591128) (not e!484298))))

(assert (=> b!869708 (= res!591128 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394734 () array!50219)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11396 0))(
  ( (tuple2!11397 (_1!5709 (_ BitVec 64)) (_2!5709 V!27769)) )
))
(declare-datatypes ((List!17178 0))(
  ( (Nil!17175) (Cons!17174 (h!18305 tuple2!11396) (t!24206 List!17178)) )
))
(declare-datatypes ((ListLongMap!10155 0))(
  ( (ListLongMap!10156 (toList!5093 List!17178)) )
))
(declare-fun lt!394735 () ListLongMap!10155)

(declare-fun minValue!654 () V!27769)

(declare-fun zeroValue!654 () V!27769)

(declare-fun getCurrentListMapNoExtraKeys!3086 (array!50217 array!50219 (_ BitVec 32) (_ BitVec 32) V!27769 V!27769 (_ BitVec 32) Int) ListLongMap!10155)

(assert (=> b!869708 (= lt!394735 (getCurrentListMapNoExtraKeys!3086 _keys!868 lt!394734 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27769)

(assert (=> b!869708 (= lt!394734 (array!50220 (store (arr!24141 _values!688) i!612 (ValueCellFull!8081 v!557)) (size!24583 _values!688)))))

(declare-fun lt!394733 () ListLongMap!10155)

(assert (=> b!869708 (= lt!394733 (getCurrentListMapNoExtraKeys!3086 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869709 () Bool)

(declare-fun res!591123 () Bool)

(assert (=> b!869709 (=> (not res!591123) (not e!484295))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!869709 (= res!591123 (and (= (select (arr!24140 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869710 () Bool)

(declare-fun res!591126 () Bool)

(assert (=> b!869710 (=> (not res!591126) (not e!484295))))

(assert (=> b!869710 (= res!591126 (and (= (size!24583 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24582 _keys!868) (size!24583 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869711 () Bool)

(declare-fun res!591124 () Bool)

(assert (=> b!869711 (=> (not res!591124) (not e!484295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50217 (_ BitVec 32)) Bool)

(assert (=> b!869711 (= res!591124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869712 () Bool)

(assert (=> b!869712 (= e!484298 (not true))))

(declare-fun +!2454 (ListLongMap!10155 tuple2!11396) ListLongMap!10155)

(assert (=> b!869712 (= (getCurrentListMapNoExtraKeys!3086 _keys!868 lt!394734 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2454 (getCurrentListMapNoExtraKeys!3086 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11397 k0!854 v!557)))))

(declare-datatypes ((Unit!29795 0))(
  ( (Unit!29796) )
))
(declare-fun lt!394736 () Unit!29795)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!622 (array!50217 array!50219 (_ BitVec 32) (_ BitVec 32) V!27769 V!27769 (_ BitVec 32) (_ BitVec 64) V!27769 (_ BitVec 32) Int) Unit!29795)

(assert (=> b!869712 (= lt!394736 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!622 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869713 () Bool)

(declare-fun res!591121 () Bool)

(assert (=> b!869713 (=> (not res!591121) (not e!484295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869713 (= res!591121 (validKeyInArray!0 k0!854))))

(declare-fun b!869714 () Bool)

(assert (=> b!869714 (= e!484299 tp_is_empty!17041)))

(declare-fun b!869715 () Bool)

(declare-fun res!591127 () Bool)

(assert (=> b!869715 (=> (not res!591127) (not e!484295))))

(declare-datatypes ((List!17179 0))(
  ( (Nil!17176) (Cons!17175 (h!18306 (_ BitVec 64)) (t!24207 List!17179)) )
))
(declare-fun arrayNoDuplicates!0 (array!50217 (_ BitVec 32) List!17179) Bool)

(assert (=> b!869715 (= res!591127 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17176))))

(assert (= (and start!73972 res!591122) b!869705))

(assert (= (and b!869705 res!591129) b!869710))

(assert (= (and b!869710 res!591126) b!869711))

(assert (= (and b!869711 res!591124) b!869715))

(assert (= (and b!869715 res!591127) b!869704))

(assert (= (and b!869704 res!591125) b!869713))

(assert (= (and b!869713 res!591121) b!869709))

(assert (= (and b!869709 res!591123) b!869708))

(assert (= (and b!869708 res!591128) b!869712))

(assert (= (and b!869706 condMapEmpty!27161) mapIsEmpty!27161))

(assert (= (and b!869706 (not condMapEmpty!27161)) mapNonEmpty!27161))

(get-info :version)

(assert (= (and mapNonEmpty!27161 ((_ is ValueCellFull!8081) mapValue!27161)) b!869714))

(assert (= (and b!869706 ((_ is ValueCellFull!8081) mapDefault!27161)) b!869707))

(assert (= start!73972 b!869706))

(declare-fun m!810639 () Bool)

(assert (=> mapNonEmpty!27161 m!810639))

(declare-fun m!810641 () Bool)

(assert (=> b!869708 m!810641))

(declare-fun m!810643 () Bool)

(assert (=> b!869708 m!810643))

(declare-fun m!810645 () Bool)

(assert (=> b!869708 m!810645))

(declare-fun m!810647 () Bool)

(assert (=> start!73972 m!810647))

(declare-fun m!810649 () Bool)

(assert (=> start!73972 m!810649))

(declare-fun m!810651 () Bool)

(assert (=> b!869713 m!810651))

(declare-fun m!810653 () Bool)

(assert (=> b!869712 m!810653))

(declare-fun m!810655 () Bool)

(assert (=> b!869712 m!810655))

(assert (=> b!869712 m!810655))

(declare-fun m!810657 () Bool)

(assert (=> b!869712 m!810657))

(declare-fun m!810659 () Bool)

(assert (=> b!869712 m!810659))

(declare-fun m!810661 () Bool)

(assert (=> b!869711 m!810661))

(declare-fun m!810663 () Bool)

(assert (=> b!869715 m!810663))

(declare-fun m!810665 () Bool)

(assert (=> b!869709 m!810665))

(declare-fun m!810667 () Bool)

(assert (=> b!869705 m!810667))

(check-sat (not mapNonEmpty!27161) (not b!869713) (not b!869708) (not b!869705) b_and!24631 (not b!869715) (not start!73972) tp_is_empty!17041 (not b!869712) (not b_next!14905) (not b!869711))
(check-sat b_and!24631 (not b_next!14905))
