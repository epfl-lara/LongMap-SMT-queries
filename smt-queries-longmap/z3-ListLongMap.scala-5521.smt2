; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72892 () Bool)

(assert start!72892)

(declare-fun b_free!13825 () Bool)

(declare-fun b_next!13825 () Bool)

(assert (=> start!72892 (= b_free!13825 (not b_next!13825))))

(declare-fun tp!48979 () Bool)

(declare-fun b_and!22885 () Bool)

(assert (=> start!72892 (= tp!48979 b_and!22885)))

(declare-fun mapNonEmpty!25541 () Bool)

(declare-fun mapRes!25541 () Bool)

(declare-fun tp!48980 () Bool)

(declare-fun e!472299 () Bool)

(assert (=> mapNonEmpty!25541 (= mapRes!25541 (and tp!48980 e!472299))))

(declare-datatypes ((V!26329 0))(
  ( (V!26330 (val!8028 Int)) )
))
(declare-datatypes ((ValueCell!7541 0))(
  ( (ValueCellFull!7541 (v!10447 V!26329)) (EmptyCell!7541) )
))
(declare-fun mapRest!25541 () (Array (_ BitVec 32) ValueCell!7541))

(declare-fun mapValue!25541 () ValueCell!7541)

(declare-fun mapKey!25541 () (_ BitVec 32))

(declare-datatypes ((array!48135 0))(
  ( (array!48136 (arr!23099 (Array (_ BitVec 32) ValueCell!7541)) (size!23541 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48135)

(assert (=> mapNonEmpty!25541 (= (arr!23099 _values!688) (store mapRest!25541 mapKey!25541 mapValue!25541))))

(declare-fun b!846258 () Bool)

(declare-fun e!472297 () Bool)

(declare-fun e!472298 () Bool)

(assert (=> b!846258 (= e!472297 (and e!472298 mapRes!25541))))

(declare-fun condMapEmpty!25541 () Bool)

(declare-fun mapDefault!25541 () ValueCell!7541)

(assert (=> b!846258 (= condMapEmpty!25541 (= (arr!23099 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7541)) mapDefault!25541)))))

(declare-fun b!846259 () Bool)

(declare-fun res!575004 () Bool)

(declare-fun e!472295 () Bool)

(assert (=> b!846259 (=> (not res!575004) (not e!472295))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48137 0))(
  ( (array!48138 (arr!23100 (Array (_ BitVec 32) (_ BitVec 64))) (size!23542 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48137)

(assert (=> b!846259 (= res!575004 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23542 _keys!868))))))

(declare-fun b!846260 () Bool)

(declare-fun res!575007 () Bool)

(assert (=> b!846260 (=> (not res!575007) (not e!472295))))

(declare-datatypes ((List!16372 0))(
  ( (Nil!16369) (Cons!16368 (h!17499 (_ BitVec 64)) (t!22734 List!16372)) )
))
(declare-fun arrayNoDuplicates!0 (array!48137 (_ BitVec 32) List!16372) Bool)

(assert (=> b!846260 (= res!575007 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16369))))

(declare-fun mapIsEmpty!25541 () Bool)

(assert (=> mapIsEmpty!25541 mapRes!25541))

(declare-fun b!846261 () Bool)

(declare-fun tp_is_empty!15961 () Bool)

(assert (=> b!846261 (= e!472298 tp_is_empty!15961)))

(declare-fun b!846262 () Bool)

(declare-fun res!575005 () Bool)

(assert (=> b!846262 (=> (not res!575005) (not e!472295))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846262 (= res!575005 (and (= (size!23541 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23542 _keys!868) (size!23541 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846263 () Bool)

(declare-fun res!575000 () Bool)

(assert (=> b!846263 (=> (not res!575000) (not e!472295))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846263 (= res!575000 (validKeyInArray!0 k0!854))))

(declare-fun b!846264 () Bool)

(declare-fun res!575002 () Bool)

(assert (=> b!846264 (=> (not res!575002) (not e!472295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48137 (_ BitVec 32)) Bool)

(assert (=> b!846264 (= res!575002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846265 () Bool)

(assert (=> b!846265 (= e!472295 false)))

(declare-datatypes ((tuple2!10514 0))(
  ( (tuple2!10515 (_1!5268 (_ BitVec 64)) (_2!5268 V!26329)) )
))
(declare-datatypes ((List!16373 0))(
  ( (Nil!16370) (Cons!16369 (h!17500 tuple2!10514) (t!22735 List!16373)) )
))
(declare-datatypes ((ListLongMap!9273 0))(
  ( (ListLongMap!9274 (toList!4652 List!16373)) )
))
(declare-fun lt!381310 () ListLongMap!9273)

(declare-fun v!557 () V!26329)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26329)

(declare-fun zeroValue!654 () V!26329)

(declare-fun getCurrentListMapNoExtraKeys!2666 (array!48137 array!48135 (_ BitVec 32) (_ BitVec 32) V!26329 V!26329 (_ BitVec 32) Int) ListLongMap!9273)

(assert (=> b!846265 (= lt!381310 (getCurrentListMapNoExtraKeys!2666 _keys!868 (array!48136 (store (arr!23099 _values!688) i!612 (ValueCellFull!7541 v!557)) (size!23541 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381311 () ListLongMap!9273)

(assert (=> b!846265 (= lt!381311 (getCurrentListMapNoExtraKeys!2666 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846257 () Bool)

(declare-fun res!575001 () Bool)

(assert (=> b!846257 (=> (not res!575001) (not e!472295))))

(assert (=> b!846257 (= res!575001 (and (= (select (arr!23100 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!575003 () Bool)

(assert (=> start!72892 (=> (not res!575003) (not e!472295))))

(assert (=> start!72892 (= res!575003 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23542 _keys!868))))))

(assert (=> start!72892 e!472295))

(assert (=> start!72892 tp_is_empty!15961))

(assert (=> start!72892 true))

(assert (=> start!72892 tp!48979))

(declare-fun array_inv!18426 (array!48137) Bool)

(assert (=> start!72892 (array_inv!18426 _keys!868)))

(declare-fun array_inv!18427 (array!48135) Bool)

(assert (=> start!72892 (and (array_inv!18427 _values!688) e!472297)))

(declare-fun b!846266 () Bool)

(assert (=> b!846266 (= e!472299 tp_is_empty!15961)))

(declare-fun b!846267 () Bool)

(declare-fun res!575006 () Bool)

(assert (=> b!846267 (=> (not res!575006) (not e!472295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846267 (= res!575006 (validMask!0 mask!1196))))

(assert (= (and start!72892 res!575003) b!846267))

(assert (= (and b!846267 res!575006) b!846262))

(assert (= (and b!846262 res!575005) b!846264))

(assert (= (and b!846264 res!575002) b!846260))

(assert (= (and b!846260 res!575007) b!846259))

(assert (= (and b!846259 res!575004) b!846263))

(assert (= (and b!846263 res!575000) b!846257))

(assert (= (and b!846257 res!575001) b!846265))

(assert (= (and b!846258 condMapEmpty!25541) mapIsEmpty!25541))

(assert (= (and b!846258 (not condMapEmpty!25541)) mapNonEmpty!25541))

(get-info :version)

(assert (= (and mapNonEmpty!25541 ((_ is ValueCellFull!7541) mapValue!25541)) b!846266))

(assert (= (and b!846258 ((_ is ValueCellFull!7541) mapDefault!25541)) b!846261))

(assert (= start!72892 b!846258))

(declare-fun m!787121 () Bool)

(assert (=> b!846263 m!787121))

(declare-fun m!787123 () Bool)

(assert (=> start!72892 m!787123))

(declare-fun m!787125 () Bool)

(assert (=> start!72892 m!787125))

(declare-fun m!787127 () Bool)

(assert (=> b!846257 m!787127))

(declare-fun m!787129 () Bool)

(assert (=> b!846264 m!787129))

(declare-fun m!787131 () Bool)

(assert (=> b!846265 m!787131))

(declare-fun m!787133 () Bool)

(assert (=> b!846265 m!787133))

(declare-fun m!787135 () Bool)

(assert (=> b!846265 m!787135))

(declare-fun m!787137 () Bool)

(assert (=> b!846267 m!787137))

(declare-fun m!787139 () Bool)

(assert (=> mapNonEmpty!25541 m!787139))

(declare-fun m!787141 () Bool)

(assert (=> b!846260 m!787141))

(check-sat b_and!22885 tp_is_empty!15961 (not start!72892) (not b!846267) (not b!846260) (not b_next!13825) (not b!846265) (not mapNonEmpty!25541) (not b!846263) (not b!846264))
(check-sat b_and!22885 (not b_next!13825))
