; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73486 () Bool)

(assert start!73486)

(declare-fun b_free!14233 () Bool)

(declare-fun b_next!14233 () Bool)

(assert (=> start!73486 (= b_free!14233 (not b_next!14233))))

(declare-fun tp!50204 () Bool)

(declare-fun b_and!23599 () Bool)

(assert (=> start!73486 (= tp!50204 b_and!23599)))

(declare-fun b!856273 () Bool)

(declare-fun res!581250 () Bool)

(declare-fun e!477475 () Bool)

(assert (=> b!856273 (=> (not res!581250) (not e!477475))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48981 0))(
  ( (array!48982 (arr!23517 (Array (_ BitVec 32) (_ BitVec 64))) (size!23958 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48981)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856273 (= res!581250 (and (= (select (arr!23517 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856274 () Bool)

(declare-fun res!581252 () Bool)

(assert (=> b!856274 (=> (not res!581252) (not e!477475))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48981 (_ BitVec 32)) Bool)

(assert (=> b!856274 (= res!581252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856275 () Bool)

(assert (=> b!856275 (= e!477475 false)))

(declare-datatypes ((V!26873 0))(
  ( (V!26874 (val!8232 Int)) )
))
(declare-fun v!557 () V!26873)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7745 0))(
  ( (ValueCellFull!7745 (v!10657 V!26873)) (EmptyCell!7745) )
))
(declare-datatypes ((array!48983 0))(
  ( (array!48984 (arr!23518 (Array (_ BitVec 32) ValueCell!7745)) (size!23959 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48983)

(declare-fun minValue!654 () V!26873)

(declare-fun zeroValue!654 () V!26873)

(declare-datatypes ((tuple2!10770 0))(
  ( (tuple2!10771 (_1!5396 (_ BitVec 64)) (_2!5396 V!26873)) )
))
(declare-datatypes ((List!16615 0))(
  ( (Nil!16612) (Cons!16611 (h!17748 tuple2!10770) (t!23248 List!16615)) )
))
(declare-datatypes ((ListLongMap!9541 0))(
  ( (ListLongMap!9542 (toList!4786 List!16615)) )
))
(declare-fun lt!386048 () ListLongMap!9541)

(declare-fun getCurrentListMapNoExtraKeys!2842 (array!48981 array!48983 (_ BitVec 32) (_ BitVec 32) V!26873 V!26873 (_ BitVec 32) Int) ListLongMap!9541)

(assert (=> b!856275 (= lt!386048 (getCurrentListMapNoExtraKeys!2842 _keys!868 (array!48984 (store (arr!23518 _values!688) i!612 (ValueCellFull!7745 v!557)) (size!23959 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386047 () ListLongMap!9541)

(assert (=> b!856275 (= lt!386047 (getCurrentListMapNoExtraKeys!2842 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856276 () Bool)

(declare-fun res!581254 () Bool)

(assert (=> b!856276 (=> (not res!581254) (not e!477475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856276 (= res!581254 (validMask!0 mask!1196))))

(declare-fun b!856277 () Bool)

(declare-fun res!581253 () Bool)

(assert (=> b!856277 (=> (not res!581253) (not e!477475))))

(declare-datatypes ((List!16616 0))(
  ( (Nil!16613) (Cons!16612 (h!17749 (_ BitVec 64)) (t!23249 List!16616)) )
))
(declare-fun arrayNoDuplicates!0 (array!48981 (_ BitVec 32) List!16616) Bool)

(assert (=> b!856277 (= res!581253 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16613))))

(declare-fun b!856278 () Bool)

(declare-fun e!477474 () Bool)

(declare-fun tp_is_empty!16369 () Bool)

(assert (=> b!856278 (= e!477474 tp_is_empty!16369)))

(declare-fun res!581255 () Bool)

(assert (=> start!73486 (=> (not res!581255) (not e!477475))))

(assert (=> start!73486 (= res!581255 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23958 _keys!868))))))

(assert (=> start!73486 e!477475))

(assert (=> start!73486 tp_is_empty!16369))

(assert (=> start!73486 true))

(assert (=> start!73486 tp!50204))

(declare-fun array_inv!18686 (array!48981) Bool)

(assert (=> start!73486 (array_inv!18686 _keys!868)))

(declare-fun e!477471 () Bool)

(declare-fun array_inv!18687 (array!48983) Bool)

(assert (=> start!73486 (and (array_inv!18687 _values!688) e!477471)))

(declare-fun b!856279 () Bool)

(declare-fun e!477472 () Bool)

(assert (=> b!856279 (= e!477472 tp_is_empty!16369)))

(declare-fun b!856280 () Bool)

(declare-fun res!581251 () Bool)

(assert (=> b!856280 (=> (not res!581251) (not e!477475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856280 (= res!581251 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26153 () Bool)

(declare-fun mapRes!26153 () Bool)

(declare-fun tp!50203 () Bool)

(assert (=> mapNonEmpty!26153 (= mapRes!26153 (and tp!50203 e!477474))))

(declare-fun mapRest!26153 () (Array (_ BitVec 32) ValueCell!7745))

(declare-fun mapValue!26153 () ValueCell!7745)

(declare-fun mapKey!26153 () (_ BitVec 32))

(assert (=> mapNonEmpty!26153 (= (arr!23518 _values!688) (store mapRest!26153 mapKey!26153 mapValue!26153))))

(declare-fun mapIsEmpty!26153 () Bool)

(assert (=> mapIsEmpty!26153 mapRes!26153))

(declare-fun b!856281 () Bool)

(declare-fun res!581257 () Bool)

(assert (=> b!856281 (=> (not res!581257) (not e!477475))))

(assert (=> b!856281 (= res!581257 (and (= (size!23959 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23958 _keys!868) (size!23959 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856282 () Bool)

(assert (=> b!856282 (= e!477471 (and e!477472 mapRes!26153))))

(declare-fun condMapEmpty!26153 () Bool)

(declare-fun mapDefault!26153 () ValueCell!7745)

(assert (=> b!856282 (= condMapEmpty!26153 (= (arr!23518 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7745)) mapDefault!26153)))))

(declare-fun b!856283 () Bool)

(declare-fun res!581256 () Bool)

(assert (=> b!856283 (=> (not res!581256) (not e!477475))))

(assert (=> b!856283 (= res!581256 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23958 _keys!868))))))

(assert (= (and start!73486 res!581255) b!856276))

(assert (= (and b!856276 res!581254) b!856281))

(assert (= (and b!856281 res!581257) b!856274))

(assert (= (and b!856274 res!581252) b!856277))

(assert (= (and b!856277 res!581253) b!856283))

(assert (= (and b!856283 res!581256) b!856280))

(assert (= (and b!856280 res!581251) b!856273))

(assert (= (and b!856273 res!581250) b!856275))

(assert (= (and b!856282 condMapEmpty!26153) mapIsEmpty!26153))

(assert (= (and b!856282 (not condMapEmpty!26153)) mapNonEmpty!26153))

(get-info :version)

(assert (= (and mapNonEmpty!26153 ((_ is ValueCellFull!7745) mapValue!26153)) b!856278))

(assert (= (and b!856282 ((_ is ValueCellFull!7745) mapDefault!26153)) b!856279))

(assert (= start!73486 b!856282))

(declare-fun m!797885 () Bool)

(assert (=> b!856275 m!797885))

(declare-fun m!797887 () Bool)

(assert (=> b!856275 m!797887))

(declare-fun m!797889 () Bool)

(assert (=> b!856275 m!797889))

(declare-fun m!797891 () Bool)

(assert (=> b!856273 m!797891))

(declare-fun m!797893 () Bool)

(assert (=> start!73486 m!797893))

(declare-fun m!797895 () Bool)

(assert (=> start!73486 m!797895))

(declare-fun m!797897 () Bool)

(assert (=> b!856280 m!797897))

(declare-fun m!797899 () Bool)

(assert (=> b!856274 m!797899))

(declare-fun m!797901 () Bool)

(assert (=> b!856277 m!797901))

(declare-fun m!797903 () Bool)

(assert (=> mapNonEmpty!26153 m!797903))

(declare-fun m!797905 () Bool)

(assert (=> b!856276 m!797905))

(check-sat (not b!856275) (not b!856280) (not b!856274) (not start!73486) (not b_next!14233) (not mapNonEmpty!26153) b_and!23599 (not b!856277) (not b!856276) tp_is_empty!16369)
(check-sat b_and!23599 (not b_next!14233))
