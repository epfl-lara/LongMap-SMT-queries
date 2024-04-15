; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74244 () Bool)

(assert start!74244)

(declare-fun b_free!15025 () Bool)

(declare-fun b_next!15025 () Bool)

(assert (=> start!74244 (= b_free!15025 (not b_next!15025))))

(declare-fun tp!52750 () Bool)

(declare-fun b_and!24775 () Bool)

(assert (=> start!74244 (= tp!52750 b_and!24775)))

(declare-fun b!873348 () Bool)

(declare-fun res!593521 () Bool)

(declare-fun e!486336 () Bool)

(assert (=> b!873348 (=> (not res!593521) (not e!486336))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28073 0))(
  ( (V!28074 (val!8682 Int)) )
))
(declare-datatypes ((ValueCell!8195 0))(
  ( (ValueCellFull!8195 (v!11105 V!28073)) (EmptyCell!8195) )
))
(declare-datatypes ((array!50653 0))(
  ( (array!50654 (arr!24355 (Array (_ BitVec 32) ValueCell!8195)) (size!24797 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50653)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50655 0))(
  ( (array!50656 (arr!24356 (Array (_ BitVec 32) (_ BitVec 64))) (size!24798 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50655)

(assert (=> b!873348 (= res!593521 (and (= (size!24797 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24798 _keys!868) (size!24797 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873349 () Bool)

(declare-fun res!593522 () Bool)

(assert (=> b!873349 (=> (not res!593522) (not e!486336))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873349 (= res!593522 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24798 _keys!868))))))

(declare-fun mapNonEmpty!27512 () Bool)

(declare-fun mapRes!27512 () Bool)

(declare-fun tp!52751 () Bool)

(declare-fun e!486334 () Bool)

(assert (=> mapNonEmpty!27512 (= mapRes!27512 (and tp!52751 e!486334))))

(declare-fun mapKey!27512 () (_ BitVec 32))

(declare-fun mapValue!27512 () ValueCell!8195)

(declare-fun mapRest!27512 () (Array (_ BitVec 32) ValueCell!8195))

(assert (=> mapNonEmpty!27512 (= (arr!24355 _values!688) (store mapRest!27512 mapKey!27512 mapValue!27512))))

(declare-fun b!873350 () Bool)

(declare-fun e!486337 () Bool)

(declare-fun tp_is_empty!17269 () Bool)

(assert (=> b!873350 (= e!486337 tp_is_empty!17269)))

(declare-fun b!873351 () Bool)

(declare-fun res!593517 () Bool)

(assert (=> b!873351 (=> (not res!593517) (not e!486336))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873351 (= res!593517 (validKeyInArray!0 k0!854))))

(declare-fun b!873352 () Bool)

(declare-fun res!593518 () Bool)

(assert (=> b!873352 (=> (not res!593518) (not e!486336))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873352 (= res!593518 (and (= (select (arr!24356 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873354 () Bool)

(declare-fun e!486335 () Bool)

(assert (=> b!873354 (= e!486335 (and e!486337 mapRes!27512))))

(declare-fun condMapEmpty!27512 () Bool)

(declare-fun mapDefault!27512 () ValueCell!8195)

(assert (=> b!873354 (= condMapEmpty!27512 (= (arr!24355 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8195)) mapDefault!27512)))))

(declare-fun mapIsEmpty!27512 () Bool)

(assert (=> mapIsEmpty!27512 mapRes!27512))

(declare-fun b!873355 () Bool)

(declare-fun res!593523 () Bool)

(assert (=> b!873355 (=> (not res!593523) (not e!486336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873355 (= res!593523 (validMask!0 mask!1196))))

(declare-fun b!873353 () Bool)

(declare-fun res!593524 () Bool)

(assert (=> b!873353 (=> (not res!593524) (not e!486336))))

(declare-datatypes ((List!17299 0))(
  ( (Nil!17296) (Cons!17295 (h!18426 (_ BitVec 64)) (t!24331 List!17299)) )
))
(declare-fun arrayNoDuplicates!0 (array!50655 (_ BitVec 32) List!17299) Bool)

(assert (=> b!873353 (= res!593524 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17296))))

(declare-fun res!593520 () Bool)

(assert (=> start!74244 (=> (not res!593520) (not e!486336))))

(assert (=> start!74244 (= res!593520 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24798 _keys!868))))))

(assert (=> start!74244 e!486336))

(assert (=> start!74244 true))

(assert (=> start!74244 tp!52750))

(declare-fun array_inv!19272 (array!50655) Bool)

(assert (=> start!74244 (array_inv!19272 _keys!868)))

(declare-fun array_inv!19273 (array!50653) Bool)

(assert (=> start!74244 (and (array_inv!19273 _values!688) e!486335)))

(assert (=> start!74244 tp_is_empty!17269))

(declare-fun b!873356 () Bool)

(assert (=> b!873356 (= e!486336 (bvsge i!612 (size!24797 _values!688)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28073)

(declare-fun zeroValue!654 () V!28073)

(declare-datatypes ((tuple2!11488 0))(
  ( (tuple2!11489 (_1!5755 (_ BitVec 64)) (_2!5755 V!28073)) )
))
(declare-datatypes ((List!17300 0))(
  ( (Nil!17297) (Cons!17296 (h!18427 tuple2!11488) (t!24332 List!17300)) )
))
(declare-datatypes ((ListLongMap!10247 0))(
  ( (ListLongMap!10248 (toList!5139 List!17300)) )
))
(declare-fun lt!395559 () ListLongMap!10247)

(declare-fun getCurrentListMapNoExtraKeys!3132 (array!50655 array!50653 (_ BitVec 32) (_ BitVec 32) V!28073 V!28073 (_ BitVec 32) Int) ListLongMap!10247)

(assert (=> b!873356 (= lt!395559 (getCurrentListMapNoExtraKeys!3132 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873357 () Bool)

(declare-fun res!593519 () Bool)

(assert (=> b!873357 (=> (not res!593519) (not e!486336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50655 (_ BitVec 32)) Bool)

(assert (=> b!873357 (= res!593519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873358 () Bool)

(assert (=> b!873358 (= e!486334 tp_is_empty!17269)))

(assert (= (and start!74244 res!593520) b!873355))

(assert (= (and b!873355 res!593523) b!873348))

(assert (= (and b!873348 res!593521) b!873357))

(assert (= (and b!873357 res!593519) b!873353))

(assert (= (and b!873353 res!593524) b!873349))

(assert (= (and b!873349 res!593522) b!873351))

(assert (= (and b!873351 res!593517) b!873352))

(assert (= (and b!873352 res!593518) b!873356))

(assert (= (and b!873354 condMapEmpty!27512) mapIsEmpty!27512))

(assert (= (and b!873354 (not condMapEmpty!27512)) mapNonEmpty!27512))

(get-info :version)

(assert (= (and mapNonEmpty!27512 ((_ is ValueCellFull!8195) mapValue!27512)) b!873358))

(assert (= (and b!873354 ((_ is ValueCellFull!8195) mapDefault!27512)) b!873350))

(assert (= start!74244 b!873354))

(declare-fun m!813293 () Bool)

(assert (=> b!873355 m!813293))

(declare-fun m!813295 () Bool)

(assert (=> b!873351 m!813295))

(declare-fun m!813297 () Bool)

(assert (=> b!873352 m!813297))

(declare-fun m!813299 () Bool)

(assert (=> b!873357 m!813299))

(declare-fun m!813301 () Bool)

(assert (=> b!873356 m!813301))

(declare-fun m!813303 () Bool)

(assert (=> start!74244 m!813303))

(declare-fun m!813305 () Bool)

(assert (=> start!74244 m!813305))

(declare-fun m!813307 () Bool)

(assert (=> mapNonEmpty!27512 m!813307))

(declare-fun m!813309 () Bool)

(assert (=> b!873353 m!813309))

(check-sat (not mapNonEmpty!27512) b_and!24775 (not b_next!15025) (not start!74244) (not b!873353) (not b!873356) (not b!873357) tp_is_empty!17269 (not b!873351) (not b!873355))
(check-sat b_and!24775 (not b_next!15025))
