; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74276 () Bool)

(assert start!74276)

(declare-fun b_free!15039 () Bool)

(declare-fun b_next!15039 () Bool)

(assert (=> start!74276 (= b_free!15039 (not b_next!15039))))

(declare-fun tp!52791 () Bool)

(declare-fun b_and!24815 () Bool)

(assert (=> start!74276 (= tp!52791 b_and!24815)))

(declare-fun mapNonEmpty!27533 () Bool)

(declare-fun mapRes!27533 () Bool)

(declare-fun tp!52792 () Bool)

(declare-fun e!486587 () Bool)

(assert (=> mapNonEmpty!27533 (= mapRes!27533 (and tp!52792 e!486587))))

(declare-fun mapKey!27533 () (_ BitVec 32))

(declare-datatypes ((V!28091 0))(
  ( (V!28092 (val!8689 Int)) )
))
(declare-datatypes ((ValueCell!8202 0))(
  ( (ValueCellFull!8202 (v!11118 V!28091)) (EmptyCell!8202) )
))
(declare-fun mapRest!27533 () (Array (_ BitVec 32) ValueCell!8202))

(declare-fun mapValue!27533 () ValueCell!8202)

(declare-datatypes ((array!50694 0))(
  ( (array!50695 (arr!24375 (Array (_ BitVec 32) ValueCell!8202)) (size!24815 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50694)

(assert (=> mapNonEmpty!27533 (= (arr!24375 _values!688) (store mapRest!27533 mapKey!27533 mapValue!27533))))

(declare-fun b!873818 () Bool)

(declare-fun tp_is_empty!17283 () Bool)

(assert (=> b!873818 (= e!486587 tp_is_empty!17283)))

(declare-fun b!873819 () Bool)

(declare-fun e!486586 () Bool)

(declare-fun e!486590 () Bool)

(assert (=> b!873819 (= e!486586 (and e!486590 mapRes!27533))))

(declare-fun condMapEmpty!27533 () Bool)

(declare-fun mapDefault!27533 () ValueCell!8202)

(assert (=> b!873819 (= condMapEmpty!27533 (= (arr!24375 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8202)) mapDefault!27533)))))

(declare-fun mapIsEmpty!27533 () Bool)

(assert (=> mapIsEmpty!27533 mapRes!27533))

(declare-fun b!873820 () Bool)

(declare-fun e!486588 () Bool)

(assert (=> b!873820 (= e!486588 false)))

(declare-fun v!557 () V!28091)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50696 0))(
  ( (array!50697 (arr!24376 (Array (_ BitVec 32) (_ BitVec 64))) (size!24816 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50696)

(declare-datatypes ((tuple2!11484 0))(
  ( (tuple2!11485 (_1!5753 (_ BitVec 64)) (_2!5753 V!28091)) )
))
(declare-datatypes ((List!17302 0))(
  ( (Nil!17299) (Cons!17298 (h!18429 tuple2!11484) (t!24343 List!17302)) )
))
(declare-datatypes ((ListLongMap!10253 0))(
  ( (ListLongMap!10254 (toList!5142 List!17302)) )
))
(declare-fun lt!395831 () ListLongMap!10253)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28091)

(declare-fun zeroValue!654 () V!28091)

(declare-fun getCurrentListMapNoExtraKeys!3109 (array!50696 array!50694 (_ BitVec 32) (_ BitVec 32) V!28091 V!28091 (_ BitVec 32) Int) ListLongMap!10253)

(assert (=> b!873820 (= lt!395831 (getCurrentListMapNoExtraKeys!3109 _keys!868 (array!50695 (store (arr!24375 _values!688) i!612 (ValueCellFull!8202 v!557)) (size!24815 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395830 () ListLongMap!10253)

(assert (=> b!873820 (= lt!395830 (getCurrentListMapNoExtraKeys!3109 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873821 () Bool)

(declare-fun res!593802 () Bool)

(assert (=> b!873821 (=> (not res!593802) (not e!486588))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873821 (= res!593802 (validKeyInArray!0 k0!854))))

(declare-fun res!593799 () Bool)

(assert (=> start!74276 (=> (not res!593799) (not e!486588))))

(assert (=> start!74276 (= res!593799 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24816 _keys!868))))))

(assert (=> start!74276 e!486588))

(assert (=> start!74276 tp_is_empty!17283))

(assert (=> start!74276 true))

(assert (=> start!74276 tp!52791))

(declare-fun array_inv!19230 (array!50696) Bool)

(assert (=> start!74276 (array_inv!19230 _keys!868)))

(declare-fun array_inv!19231 (array!50694) Bool)

(assert (=> start!74276 (and (array_inv!19231 _values!688) e!486586)))

(declare-fun b!873822 () Bool)

(declare-fun res!593801 () Bool)

(assert (=> b!873822 (=> (not res!593801) (not e!486588))))

(assert (=> b!873822 (= res!593801 (and (= (select (arr!24376 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873823 () Bool)

(declare-fun res!593797 () Bool)

(assert (=> b!873823 (=> (not res!593797) (not e!486588))))

(assert (=> b!873823 (= res!593797 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24816 _keys!868))))))

(declare-fun b!873824 () Bool)

(declare-fun res!593796 () Bool)

(assert (=> b!873824 (=> (not res!593796) (not e!486588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50696 (_ BitVec 32)) Bool)

(assert (=> b!873824 (= res!593796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873825 () Bool)

(declare-fun res!593800 () Bool)

(assert (=> b!873825 (=> (not res!593800) (not e!486588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873825 (= res!593800 (validMask!0 mask!1196))))

(declare-fun b!873826 () Bool)

(declare-fun res!593795 () Bool)

(assert (=> b!873826 (=> (not res!593795) (not e!486588))))

(assert (=> b!873826 (= res!593795 (and (= (size!24815 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24816 _keys!868) (size!24815 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873827 () Bool)

(declare-fun res!593798 () Bool)

(assert (=> b!873827 (=> (not res!593798) (not e!486588))))

(declare-datatypes ((List!17303 0))(
  ( (Nil!17300) (Cons!17299 (h!18430 (_ BitVec 64)) (t!24344 List!17303)) )
))
(declare-fun arrayNoDuplicates!0 (array!50696 (_ BitVec 32) List!17303) Bool)

(assert (=> b!873827 (= res!593798 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17300))))

(declare-fun b!873828 () Bool)

(assert (=> b!873828 (= e!486590 tp_is_empty!17283)))

(assert (= (and start!74276 res!593799) b!873825))

(assert (= (and b!873825 res!593800) b!873826))

(assert (= (and b!873826 res!593795) b!873824))

(assert (= (and b!873824 res!593796) b!873827))

(assert (= (and b!873827 res!593798) b!873823))

(assert (= (and b!873823 res!593797) b!873821))

(assert (= (and b!873821 res!593802) b!873822))

(assert (= (and b!873822 res!593801) b!873820))

(assert (= (and b!873819 condMapEmpty!27533) mapIsEmpty!27533))

(assert (= (and b!873819 (not condMapEmpty!27533)) mapNonEmpty!27533))

(get-info :version)

(assert (= (and mapNonEmpty!27533 ((_ is ValueCellFull!8202) mapValue!27533)) b!873818))

(assert (= (and b!873819 ((_ is ValueCellFull!8202) mapDefault!27533)) b!873828))

(assert (= start!74276 b!873819))

(declare-fun m!814193 () Bool)

(assert (=> start!74276 m!814193))

(declare-fun m!814195 () Bool)

(assert (=> start!74276 m!814195))

(declare-fun m!814197 () Bool)

(assert (=> b!873822 m!814197))

(declare-fun m!814199 () Bool)

(assert (=> b!873820 m!814199))

(declare-fun m!814201 () Bool)

(assert (=> b!873820 m!814201))

(declare-fun m!814203 () Bool)

(assert (=> b!873820 m!814203))

(declare-fun m!814205 () Bool)

(assert (=> b!873821 m!814205))

(declare-fun m!814207 () Bool)

(assert (=> b!873827 m!814207))

(declare-fun m!814209 () Bool)

(assert (=> b!873825 m!814209))

(declare-fun m!814211 () Bool)

(assert (=> b!873824 m!814211))

(declare-fun m!814213 () Bool)

(assert (=> mapNonEmpty!27533 m!814213))

(check-sat (not b_next!15039) (not start!74276) tp_is_empty!17283 (not b!873820) (not b!873821) (not mapNonEmpty!27533) (not b!873825) (not b!873827) (not b!873824) b_and!24815)
(check-sat b_and!24815 (not b_next!15039))
