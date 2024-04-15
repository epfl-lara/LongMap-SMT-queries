; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72832 () Bool)

(assert start!72832)

(declare-fun b_free!13765 () Bool)

(declare-fun b_next!13765 () Bool)

(assert (=> start!72832 (= b_free!13765 (not b_next!13765))))

(declare-fun tp!48799 () Bool)

(declare-fun b_and!22825 () Bool)

(assert (=> start!72832 (= tp!48799 b_and!22825)))

(declare-fun b!845267 () Bool)

(declare-fun res!574287 () Bool)

(declare-fun e!471848 () Bool)

(assert (=> b!845267 (=> (not res!574287) (not e!471848))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48023 0))(
  ( (array!48024 (arr!23043 (Array (_ BitVec 32) (_ BitVec 64))) (size!23485 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48023)

(declare-datatypes ((V!26249 0))(
  ( (V!26250 (val!7998 Int)) )
))
(declare-datatypes ((ValueCell!7511 0))(
  ( (ValueCellFull!7511 (v!10417 V!26249)) (EmptyCell!7511) )
))
(declare-datatypes ((array!48025 0))(
  ( (array!48026 (arr!23044 (Array (_ BitVec 32) ValueCell!7511)) (size!23486 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48025)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845267 (= res!574287 (and (= (size!23486 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23485 _keys!868) (size!23486 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845268 () Bool)

(declare-fun e!471845 () Bool)

(declare-fun e!471849 () Bool)

(declare-fun mapRes!25451 () Bool)

(assert (=> b!845268 (= e!471845 (and e!471849 mapRes!25451))))

(declare-fun condMapEmpty!25451 () Bool)

(declare-fun mapDefault!25451 () ValueCell!7511)

(assert (=> b!845268 (= condMapEmpty!25451 (= (arr!23044 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7511)) mapDefault!25451)))))

(declare-fun b!845269 () Bool)

(declare-fun res!574281 () Bool)

(assert (=> b!845269 (=> (not res!574281) (not e!471848))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845269 (= res!574281 (validKeyInArray!0 k0!854))))

(declare-fun b!845270 () Bool)

(declare-fun res!574283 () Bool)

(assert (=> b!845270 (=> (not res!574283) (not e!471848))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845270 (= res!574283 (and (= (select (arr!23043 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25451 () Bool)

(assert (=> mapIsEmpty!25451 mapRes!25451))

(declare-fun mapNonEmpty!25451 () Bool)

(declare-fun tp!48800 () Bool)

(declare-fun e!471846 () Bool)

(assert (=> mapNonEmpty!25451 (= mapRes!25451 (and tp!48800 e!471846))))

(declare-fun mapKey!25451 () (_ BitVec 32))

(declare-fun mapRest!25451 () (Array (_ BitVec 32) ValueCell!7511))

(declare-fun mapValue!25451 () ValueCell!7511)

(assert (=> mapNonEmpty!25451 (= (arr!23044 _values!688) (store mapRest!25451 mapKey!25451 mapValue!25451))))

(declare-fun b!845271 () Bool)

(declare-fun res!574280 () Bool)

(assert (=> b!845271 (=> (not res!574280) (not e!471848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48023 (_ BitVec 32)) Bool)

(assert (=> b!845271 (= res!574280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845272 () Bool)

(declare-fun res!574282 () Bool)

(assert (=> b!845272 (=> (not res!574282) (not e!471848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845272 (= res!574282 (validMask!0 mask!1196))))

(declare-fun res!574284 () Bool)

(assert (=> start!72832 (=> (not res!574284) (not e!471848))))

(assert (=> start!72832 (= res!574284 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23485 _keys!868))))))

(assert (=> start!72832 e!471848))

(assert (=> start!72832 true))

(assert (=> start!72832 tp!48799))

(declare-fun array_inv!18382 (array!48023) Bool)

(assert (=> start!72832 (array_inv!18382 _keys!868)))

(declare-fun array_inv!18383 (array!48025) Bool)

(assert (=> start!72832 (and (array_inv!18383 _values!688) e!471845)))

(declare-fun tp_is_empty!15901 () Bool)

(assert (=> start!72832 tp_is_empty!15901))

(declare-fun b!845273 () Bool)

(assert (=> b!845273 (= e!471846 tp_is_empty!15901)))

(declare-fun b!845274 () Bool)

(declare-fun res!574286 () Bool)

(assert (=> b!845274 (=> (not res!574286) (not e!471848))))

(assert (=> b!845274 (= res!574286 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23485 _keys!868))))))

(declare-fun b!845275 () Bool)

(declare-fun res!574285 () Bool)

(assert (=> b!845275 (=> (not res!574285) (not e!471848))))

(declare-datatypes ((List!16326 0))(
  ( (Nil!16323) (Cons!16322 (h!17453 (_ BitVec 64)) (t!22688 List!16326)) )
))
(declare-fun arrayNoDuplicates!0 (array!48023 (_ BitVec 32) List!16326) Bool)

(assert (=> b!845275 (= res!574285 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16323))))

(declare-fun b!845276 () Bool)

(assert (=> b!845276 (= e!471849 tp_is_empty!15901)))

(declare-fun b!845277 () Bool)

(assert (=> b!845277 (= e!471848 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26249)

(declare-fun zeroValue!654 () V!26249)

(declare-datatypes ((tuple2!10466 0))(
  ( (tuple2!10467 (_1!5244 (_ BitVec 64)) (_2!5244 V!26249)) )
))
(declare-datatypes ((List!16327 0))(
  ( (Nil!16324) (Cons!16323 (h!17454 tuple2!10466) (t!22689 List!16327)) )
))
(declare-datatypes ((ListLongMap!9225 0))(
  ( (ListLongMap!9226 (toList!4628 List!16327)) )
))
(declare-fun lt!381182 () ListLongMap!9225)

(declare-fun getCurrentListMapNoExtraKeys!2642 (array!48023 array!48025 (_ BitVec 32) (_ BitVec 32) V!26249 V!26249 (_ BitVec 32) Int) ListLongMap!9225)

(assert (=> b!845277 (= lt!381182 (getCurrentListMapNoExtraKeys!2642 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!72832 res!574284) b!845272))

(assert (= (and b!845272 res!574282) b!845267))

(assert (= (and b!845267 res!574287) b!845271))

(assert (= (and b!845271 res!574280) b!845275))

(assert (= (and b!845275 res!574285) b!845274))

(assert (= (and b!845274 res!574286) b!845269))

(assert (= (and b!845269 res!574281) b!845270))

(assert (= (and b!845270 res!574283) b!845277))

(assert (= (and b!845268 condMapEmpty!25451) mapIsEmpty!25451))

(assert (= (and b!845268 (not condMapEmpty!25451)) mapNonEmpty!25451))

(get-info :version)

(assert (= (and mapNonEmpty!25451 ((_ is ValueCellFull!7511) mapValue!25451)) b!845273))

(assert (= (and b!845268 ((_ is ValueCellFull!7511) mapDefault!25451)) b!845276))

(assert (= start!72832 b!845268))

(declare-fun m!786533 () Bool)

(assert (=> b!845270 m!786533))

(declare-fun m!786535 () Bool)

(assert (=> b!845271 m!786535))

(declare-fun m!786537 () Bool)

(assert (=> b!845269 m!786537))

(declare-fun m!786539 () Bool)

(assert (=> start!72832 m!786539))

(declare-fun m!786541 () Bool)

(assert (=> start!72832 m!786541))

(declare-fun m!786543 () Bool)

(assert (=> mapNonEmpty!25451 m!786543))

(declare-fun m!786545 () Bool)

(assert (=> b!845277 m!786545))

(declare-fun m!786547 () Bool)

(assert (=> b!845275 m!786547))

(declare-fun m!786549 () Bool)

(assert (=> b!845272 m!786549))

(check-sat (not b!845272) (not b_next!13765) (not b!845277) (not mapNonEmpty!25451) (not b!845271) (not b!845275) tp_is_empty!15901 (not start!72832) (not b!845269) b_and!22825)
(check-sat b_and!22825 (not b_next!13765))
