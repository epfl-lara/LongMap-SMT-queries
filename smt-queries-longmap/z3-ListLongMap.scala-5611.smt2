; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73618 () Bool)

(assert start!73618)

(declare-fun b_free!14365 () Bool)

(declare-fun b_next!14365 () Bool)

(assert (=> start!73618 (= b_free!14365 (not b_next!14365))))

(declare-fun tp!50599 () Bool)

(declare-fun b_and!23731 () Bool)

(assert (=> start!73618 (= tp!50599 b_and!23731)))

(declare-fun b!858597 () Bool)

(declare-fun res!582987 () Bool)

(declare-fun e!478608 () Bool)

(assert (=> b!858597 (=> (not res!582987) (not e!478608))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49233 0))(
  ( (array!49234 (arr!23643 (Array (_ BitVec 32) (_ BitVec 64))) (size!24084 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49233)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858597 (= res!582987 (and (= (select (arr!23643 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26351 () Bool)

(declare-fun mapRes!26351 () Bool)

(declare-fun tp!50600 () Bool)

(declare-fun e!478611 () Bool)

(assert (=> mapNonEmpty!26351 (= mapRes!26351 (and tp!50600 e!478611))))

(declare-fun mapKey!26351 () (_ BitVec 32))

(declare-datatypes ((V!27049 0))(
  ( (V!27050 (val!8298 Int)) )
))
(declare-datatypes ((ValueCell!7811 0))(
  ( (ValueCellFull!7811 (v!10723 V!27049)) (EmptyCell!7811) )
))
(declare-fun mapValue!26351 () ValueCell!7811)

(declare-fun mapRest!26351 () (Array (_ BitVec 32) ValueCell!7811))

(declare-datatypes ((array!49235 0))(
  ( (array!49236 (arr!23644 (Array (_ BitVec 32) ValueCell!7811)) (size!24085 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49235)

(assert (=> mapNonEmpty!26351 (= (arr!23644 _values!688) (store mapRest!26351 mapKey!26351 mapValue!26351))))

(declare-fun b!858598 () Bool)

(declare-fun res!582982 () Bool)

(assert (=> b!858598 (=> (not res!582982) (not e!478608))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!858598 (= res!582982 (and (= (size!24085 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24084 _keys!868) (size!24085 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!582988 () Bool)

(assert (=> start!73618 (=> (not res!582988) (not e!478608))))

(assert (=> start!73618 (= res!582988 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24084 _keys!868))))))

(assert (=> start!73618 e!478608))

(declare-fun tp_is_empty!16501 () Bool)

(assert (=> start!73618 tp_is_empty!16501))

(assert (=> start!73618 true))

(assert (=> start!73618 tp!50599))

(declare-fun array_inv!18776 (array!49233) Bool)

(assert (=> start!73618 (array_inv!18776 _keys!868)))

(declare-fun e!478612 () Bool)

(declare-fun array_inv!18777 (array!49235) Bool)

(assert (=> start!73618 (and (array_inv!18777 _values!688) e!478612)))

(declare-fun b!858599 () Bool)

(declare-fun e!478609 () Bool)

(assert (=> b!858599 (= e!478608 e!478609)))

(declare-fun res!582985 () Bool)

(assert (=> b!858599 (=> (not res!582985) (not e!478609))))

(assert (=> b!858599 (= res!582985 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10868 0))(
  ( (tuple2!10869 (_1!5445 (_ BitVec 64)) (_2!5445 V!27049)) )
))
(declare-datatypes ((List!16711 0))(
  ( (Nil!16708) (Cons!16707 (h!17844 tuple2!10868) (t!23344 List!16711)) )
))
(declare-datatypes ((ListLongMap!9639 0))(
  ( (ListLongMap!9640 (toList!4835 List!16711)) )
))
(declare-fun lt!386738 () ListLongMap!9639)

(declare-fun minValue!654 () V!27049)

(declare-fun zeroValue!654 () V!27049)

(declare-fun lt!386735 () array!49235)

(declare-fun getCurrentListMapNoExtraKeys!2891 (array!49233 array!49235 (_ BitVec 32) (_ BitVec 32) V!27049 V!27049 (_ BitVec 32) Int) ListLongMap!9639)

(assert (=> b!858599 (= lt!386738 (getCurrentListMapNoExtraKeys!2891 _keys!868 lt!386735 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27049)

(assert (=> b!858599 (= lt!386735 (array!49236 (store (arr!23644 _values!688) i!612 (ValueCellFull!7811 v!557)) (size!24085 _values!688)))))

(declare-fun lt!386736 () ListLongMap!9639)

(assert (=> b!858599 (= lt!386736 (getCurrentListMapNoExtraKeys!2891 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858600 () Bool)

(declare-fun res!582983 () Bool)

(assert (=> b!858600 (=> (not res!582983) (not e!478608))))

(assert (=> b!858600 (= res!582983 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24084 _keys!868))))))

(declare-fun b!858601 () Bool)

(declare-fun e!478610 () Bool)

(assert (=> b!858601 (= e!478610 tp_is_empty!16501)))

(declare-fun b!858602 () Bool)

(assert (=> b!858602 (= e!478609 (not true))))

(declare-fun +!2243 (ListLongMap!9639 tuple2!10868) ListLongMap!9639)

(assert (=> b!858602 (= (getCurrentListMapNoExtraKeys!2891 _keys!868 lt!386735 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2243 (getCurrentListMapNoExtraKeys!2891 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10869 k0!854 v!557)))))

(declare-datatypes ((Unit!29242 0))(
  ( (Unit!29243) )
))
(declare-fun lt!386737 () Unit!29242)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!441 (array!49233 array!49235 (_ BitVec 32) (_ BitVec 32) V!27049 V!27049 (_ BitVec 32) (_ BitVec 64) V!27049 (_ BitVec 32) Int) Unit!29242)

(assert (=> b!858602 (= lt!386737 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!441 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858603 () Bool)

(assert (=> b!858603 (= e!478611 tp_is_empty!16501)))

(declare-fun b!858604 () Bool)

(declare-fun res!582981 () Bool)

(assert (=> b!858604 (=> (not res!582981) (not e!478608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49233 (_ BitVec 32)) Bool)

(assert (=> b!858604 (= res!582981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858605 () Bool)

(declare-fun res!582986 () Bool)

(assert (=> b!858605 (=> (not res!582986) (not e!478608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858605 (= res!582986 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26351 () Bool)

(assert (=> mapIsEmpty!26351 mapRes!26351))

(declare-fun b!858606 () Bool)

(declare-fun res!582984 () Bool)

(assert (=> b!858606 (=> (not res!582984) (not e!478608))))

(declare-datatypes ((List!16712 0))(
  ( (Nil!16709) (Cons!16708 (h!17845 (_ BitVec 64)) (t!23345 List!16712)) )
))
(declare-fun arrayNoDuplicates!0 (array!49233 (_ BitVec 32) List!16712) Bool)

(assert (=> b!858606 (= res!582984 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16709))))

(declare-fun b!858607 () Bool)

(declare-fun res!582980 () Bool)

(assert (=> b!858607 (=> (not res!582980) (not e!478608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858607 (= res!582980 (validKeyInArray!0 k0!854))))

(declare-fun b!858608 () Bool)

(assert (=> b!858608 (= e!478612 (and e!478610 mapRes!26351))))

(declare-fun condMapEmpty!26351 () Bool)

(declare-fun mapDefault!26351 () ValueCell!7811)

(assert (=> b!858608 (= condMapEmpty!26351 (= (arr!23644 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7811)) mapDefault!26351)))))

(assert (= (and start!73618 res!582988) b!858605))

(assert (= (and b!858605 res!582986) b!858598))

(assert (= (and b!858598 res!582982) b!858604))

(assert (= (and b!858604 res!582981) b!858606))

(assert (= (and b!858606 res!582984) b!858600))

(assert (= (and b!858600 res!582983) b!858607))

(assert (= (and b!858607 res!582980) b!858597))

(assert (= (and b!858597 res!582987) b!858599))

(assert (= (and b!858599 res!582985) b!858602))

(assert (= (and b!858608 condMapEmpty!26351) mapIsEmpty!26351))

(assert (= (and b!858608 (not condMapEmpty!26351)) mapNonEmpty!26351))

(get-info :version)

(assert (= (and mapNonEmpty!26351 ((_ is ValueCellFull!7811) mapValue!26351)) b!858603))

(assert (= (and b!858608 ((_ is ValueCellFull!7811) mapDefault!26351)) b!858601))

(assert (= start!73618 b!858608))

(declare-fun m!799721 () Bool)

(assert (=> b!858606 m!799721))

(declare-fun m!799723 () Bool)

(assert (=> start!73618 m!799723))

(declare-fun m!799725 () Bool)

(assert (=> start!73618 m!799725))

(declare-fun m!799727 () Bool)

(assert (=> b!858605 m!799727))

(declare-fun m!799729 () Bool)

(assert (=> mapNonEmpty!26351 m!799729))

(declare-fun m!799731 () Bool)

(assert (=> b!858602 m!799731))

(declare-fun m!799733 () Bool)

(assert (=> b!858602 m!799733))

(assert (=> b!858602 m!799733))

(declare-fun m!799735 () Bool)

(assert (=> b!858602 m!799735))

(declare-fun m!799737 () Bool)

(assert (=> b!858602 m!799737))

(declare-fun m!799739 () Bool)

(assert (=> b!858597 m!799739))

(declare-fun m!799741 () Bool)

(assert (=> b!858604 m!799741))

(declare-fun m!799743 () Bool)

(assert (=> b!858607 m!799743))

(declare-fun m!799745 () Bool)

(assert (=> b!858599 m!799745))

(declare-fun m!799747 () Bool)

(assert (=> b!858599 m!799747))

(declare-fun m!799749 () Bool)

(assert (=> b!858599 m!799749))

(check-sat tp_is_empty!16501 (not b!858602) (not b!858606) (not b!858607) (not b_next!14365) (not b!858605) b_and!23731 (not mapNonEmpty!26351) (not start!73618) (not b!858604) (not b!858599))
(check-sat b_and!23731 (not b_next!14365))
