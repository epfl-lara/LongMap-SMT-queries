; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73036 () Bool)

(assert start!73036)

(declare-fun b_free!13783 () Bool)

(declare-fun b_next!13783 () Bool)

(assert (=> start!73036 (= b_free!13783 (not b_next!13783))))

(declare-fun tp!48854 () Bool)

(declare-fun b_and!22879 () Bool)

(assert (=> start!73036 (= tp!48854 b_and!22879)))

(declare-fun mapIsEmpty!25478 () Bool)

(declare-fun mapRes!25478 () Bool)

(assert (=> mapIsEmpty!25478 mapRes!25478))

(declare-fun b!846706 () Bool)

(declare-fun e!472711 () Bool)

(declare-fun e!472712 () Bool)

(assert (=> b!846706 (= e!472711 (and e!472712 mapRes!25478))))

(declare-fun condMapEmpty!25478 () Bool)

(declare-datatypes ((V!26273 0))(
  ( (V!26274 (val!8007 Int)) )
))
(declare-datatypes ((ValueCell!7520 0))(
  ( (ValueCellFull!7520 (v!10432 V!26273)) (EmptyCell!7520) )
))
(declare-datatypes ((array!48101 0))(
  ( (array!48102 (arr!23077 (Array (_ BitVec 32) ValueCell!7520)) (size!23518 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48101)

(declare-fun mapDefault!25478 () ValueCell!7520)

(assert (=> b!846706 (= condMapEmpty!25478 (= (arr!23077 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7520)) mapDefault!25478)))))

(declare-fun res!574952 () Bool)

(declare-fun e!472710 () Bool)

(assert (=> start!73036 (=> (not res!574952) (not e!472710))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48103 0))(
  ( (array!48104 (arr!23078 (Array (_ BitVec 32) (_ BitVec 64))) (size!23519 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48103)

(assert (=> start!73036 (= res!574952 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23519 _keys!868))))))

(assert (=> start!73036 e!472710))

(assert (=> start!73036 true))

(assert (=> start!73036 tp!48854))

(declare-fun array_inv!18390 (array!48103) Bool)

(assert (=> start!73036 (array_inv!18390 _keys!868)))

(declare-fun array_inv!18391 (array!48101) Bool)

(assert (=> start!73036 (and (array_inv!18391 _values!688) e!472711)))

(declare-fun tp_is_empty!15919 () Bool)

(assert (=> start!73036 tp_is_empty!15919))

(declare-fun b!846707 () Bool)

(declare-fun res!574953 () Bool)

(assert (=> b!846707 (=> (not res!574953) (not e!472710))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846707 (= res!574953 (and (= (size!23518 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23519 _keys!868) (size!23518 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846708 () Bool)

(declare-fun res!574950 () Bool)

(assert (=> b!846708 (=> (not res!574950) (not e!472710))))

(declare-datatypes ((List!16254 0))(
  ( (Nil!16251) (Cons!16250 (h!17387 (_ BitVec 64)) (t!22617 List!16254)) )
))
(declare-fun arrayNoDuplicates!0 (array!48103 (_ BitVec 32) List!16254) Bool)

(assert (=> b!846708 (= res!574950 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16251))))

(declare-fun b!846709 () Bool)

(declare-fun e!472713 () Bool)

(assert (=> b!846709 (= e!472713 tp_is_empty!15919)))

(declare-fun b!846710 () Bool)

(assert (=> b!846710 (= e!472712 tp_is_empty!15919)))

(declare-fun b!846711 () Bool)

(declare-fun res!574951 () Bool)

(assert (=> b!846711 (=> (not res!574951) (not e!472710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48103 (_ BitVec 32)) Bool)

(assert (=> b!846711 (= res!574951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846712 () Bool)

(declare-fun res!574956 () Bool)

(assert (=> b!846712 (=> (not res!574956) (not e!472710))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846712 (= res!574956 (validKeyInArray!0 k0!854))))

(declare-fun b!846713 () Bool)

(assert (=> b!846713 (= e!472710 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10388 0))(
  ( (tuple2!10389 (_1!5205 (_ BitVec 64)) (_2!5205 V!26273)) )
))
(declare-datatypes ((List!16255 0))(
  ( (Nil!16252) (Cons!16251 (h!17388 tuple2!10388) (t!22618 List!16255)) )
))
(declare-datatypes ((ListLongMap!9159 0))(
  ( (ListLongMap!9160 (toList!4595 List!16255)) )
))
(declare-fun lt!381806 () ListLongMap!9159)

(declare-fun minValue!654 () V!26273)

(declare-fun zeroValue!654 () V!26273)

(declare-fun getCurrentListMapNoExtraKeys!2653 (array!48103 array!48101 (_ BitVec 32) (_ BitVec 32) V!26273 V!26273 (_ BitVec 32) Int) ListLongMap!9159)

(assert (=> b!846713 (= lt!381806 (getCurrentListMapNoExtraKeys!2653 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846714 () Bool)

(declare-fun res!574955 () Bool)

(assert (=> b!846714 (=> (not res!574955) (not e!472710))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846714 (= res!574955 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23519 _keys!868))))))

(declare-fun mapNonEmpty!25478 () Bool)

(declare-fun tp!48853 () Bool)

(assert (=> mapNonEmpty!25478 (= mapRes!25478 (and tp!48853 e!472713))))

(declare-fun mapValue!25478 () ValueCell!7520)

(declare-fun mapKey!25478 () (_ BitVec 32))

(declare-fun mapRest!25478 () (Array (_ BitVec 32) ValueCell!7520))

(assert (=> mapNonEmpty!25478 (= (arr!23077 _values!688) (store mapRest!25478 mapKey!25478 mapValue!25478))))

(declare-fun b!846715 () Bool)

(declare-fun res!574957 () Bool)

(assert (=> b!846715 (=> (not res!574957) (not e!472710))))

(assert (=> b!846715 (= res!574957 (and (= (select (arr!23078 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846716 () Bool)

(declare-fun res!574954 () Bool)

(assert (=> b!846716 (=> (not res!574954) (not e!472710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846716 (= res!574954 (validMask!0 mask!1196))))

(assert (= (and start!73036 res!574952) b!846716))

(assert (= (and b!846716 res!574954) b!846707))

(assert (= (and b!846707 res!574953) b!846711))

(assert (= (and b!846711 res!574951) b!846708))

(assert (= (and b!846708 res!574950) b!846714))

(assert (= (and b!846714 res!574955) b!846712))

(assert (= (and b!846712 res!574956) b!846715))

(assert (= (and b!846715 res!574957) b!846713))

(assert (= (and b!846706 condMapEmpty!25478) mapIsEmpty!25478))

(assert (= (and b!846706 (not condMapEmpty!25478)) mapNonEmpty!25478))

(get-info :version)

(assert (= (and mapNonEmpty!25478 ((_ is ValueCellFull!7520) mapValue!25478)) b!846709))

(assert (= (and b!846706 ((_ is ValueCellFull!7520) mapDefault!25478)) b!846710))

(assert (= start!73036 b!846706))

(declare-fun m!788741 () Bool)

(assert (=> b!846716 m!788741))

(declare-fun m!788743 () Bool)

(assert (=> start!73036 m!788743))

(declare-fun m!788745 () Bool)

(assert (=> start!73036 m!788745))

(declare-fun m!788747 () Bool)

(assert (=> b!846713 m!788747))

(declare-fun m!788749 () Bool)

(assert (=> b!846711 m!788749))

(declare-fun m!788751 () Bool)

(assert (=> mapNonEmpty!25478 m!788751))

(declare-fun m!788753 () Bool)

(assert (=> b!846712 m!788753))

(declare-fun m!788755 () Bool)

(assert (=> b!846708 m!788755))

(declare-fun m!788757 () Bool)

(assert (=> b!846715 m!788757))

(check-sat (not mapNonEmpty!25478) (not b!846708) b_and!22879 (not b!846711) (not b!846716) (not b!846713) (not b!846712) (not b_next!13783) (not start!73036) tp_is_empty!15919)
(check-sat b_and!22879 (not b_next!13783))
