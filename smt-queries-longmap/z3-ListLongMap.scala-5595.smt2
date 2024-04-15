; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73336 () Bool)

(assert start!73336)

(declare-fun b_free!14269 () Bool)

(declare-fun b_next!14269 () Bool)

(assert (=> start!73336 (= b_free!14269 (not b_next!14269))))

(declare-fun tp!50312 () Bool)

(declare-fun b_and!23599 () Bool)

(assert (=> start!73336 (= tp!50312 b_and!23599)))

(declare-fun b!855727 () Bool)

(declare-fun e!477014 () Bool)

(assert (=> b!855727 (= e!477014 (not true))))

(declare-datatypes ((V!26921 0))(
  ( (V!26922 (val!8250 Int)) )
))
(declare-fun v!557 () V!26921)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7763 0))(
  ( (ValueCellFull!7763 (v!10669 V!26921)) (EmptyCell!7763) )
))
(declare-datatypes ((array!48991 0))(
  ( (array!48992 (arr!23527 (Array (_ BitVec 32) ValueCell!7763)) (size!23969 (_ BitVec 32))) )
))
(declare-fun lt!385563 () array!48991)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48993 0))(
  ( (array!48994 (arr!23528 (Array (_ BitVec 32) (_ BitVec 64))) (size!23970 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48993)

(declare-fun _values!688 () array!48991)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26921)

(declare-fun zeroValue!654 () V!26921)

(declare-datatypes ((tuple2!10884 0))(
  ( (tuple2!10885 (_1!5453 (_ BitVec 64)) (_2!5453 V!26921)) )
))
(declare-datatypes ((List!16693 0))(
  ( (Nil!16690) (Cons!16689 (h!17820 tuple2!10884) (t!23325 List!16693)) )
))
(declare-datatypes ((ListLongMap!9643 0))(
  ( (ListLongMap!9644 (toList!4837 List!16693)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2844 (array!48993 array!48991 (_ BitVec 32) (_ BitVec 32) V!26921 V!26921 (_ BitVec 32) Int) ListLongMap!9643)

(declare-fun +!2218 (ListLongMap!9643 tuple2!10884) ListLongMap!9643)

(assert (=> b!855727 (= (getCurrentListMapNoExtraKeys!2844 _keys!868 lt!385563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2218 (getCurrentListMapNoExtraKeys!2844 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10885 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29105 0))(
  ( (Unit!29106) )
))
(declare-fun lt!385565 () Unit!29105)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!415 (array!48993 array!48991 (_ BitVec 32) (_ BitVec 32) V!26921 V!26921 (_ BitVec 32) (_ BitVec 64) V!26921 (_ BitVec 32) Int) Unit!29105)

(assert (=> b!855727 (= lt!385565 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!415 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855728 () Bool)

(declare-fun res!581230 () Bool)

(declare-fun e!477016 () Bool)

(assert (=> b!855728 (=> (not res!581230) (not e!477016))))

(declare-datatypes ((List!16694 0))(
  ( (Nil!16691) (Cons!16690 (h!17821 (_ BitVec 64)) (t!23326 List!16694)) )
))
(declare-fun arrayNoDuplicates!0 (array!48993 (_ BitVec 32) List!16694) Bool)

(assert (=> b!855728 (= res!581230 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16691))))

(declare-fun b!855729 () Bool)

(declare-fun res!581236 () Bool)

(assert (=> b!855729 (=> (not res!581236) (not e!477016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855729 (= res!581236 (validKeyInArray!0 k0!854))))

(declare-fun b!855730 () Bool)

(declare-fun res!581231 () Bool)

(assert (=> b!855730 (=> (not res!581231) (not e!477016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855730 (= res!581231 (validMask!0 mask!1196))))

(declare-fun b!855731 () Bool)

(declare-fun res!581237 () Bool)

(assert (=> b!855731 (=> (not res!581237) (not e!477016))))

(assert (=> b!855731 (= res!581237 (and (= (select (arr!23528 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!581233 () Bool)

(assert (=> start!73336 (=> (not res!581233) (not e!477016))))

(assert (=> start!73336 (= res!581233 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23970 _keys!868))))))

(assert (=> start!73336 e!477016))

(declare-fun tp_is_empty!16405 () Bool)

(assert (=> start!73336 tp_is_empty!16405))

(assert (=> start!73336 true))

(assert (=> start!73336 tp!50312))

(declare-fun array_inv!18708 (array!48993) Bool)

(assert (=> start!73336 (array_inv!18708 _keys!868)))

(declare-fun e!477013 () Bool)

(declare-fun array_inv!18709 (array!48991) Bool)

(assert (=> start!73336 (and (array_inv!18709 _values!688) e!477013)))

(declare-fun mapNonEmpty!26207 () Bool)

(declare-fun mapRes!26207 () Bool)

(declare-fun tp!50311 () Bool)

(declare-fun e!477017 () Bool)

(assert (=> mapNonEmpty!26207 (= mapRes!26207 (and tp!50311 e!477017))))

(declare-fun mapValue!26207 () ValueCell!7763)

(declare-fun mapRest!26207 () (Array (_ BitVec 32) ValueCell!7763))

(declare-fun mapKey!26207 () (_ BitVec 32))

(assert (=> mapNonEmpty!26207 (= (arr!23527 _values!688) (store mapRest!26207 mapKey!26207 mapValue!26207))))

(declare-fun b!855732 () Bool)

(declare-fun e!477018 () Bool)

(assert (=> b!855732 (= e!477013 (and e!477018 mapRes!26207))))

(declare-fun condMapEmpty!26207 () Bool)

(declare-fun mapDefault!26207 () ValueCell!7763)

(assert (=> b!855732 (= condMapEmpty!26207 (= (arr!23527 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7763)) mapDefault!26207)))))

(declare-fun b!855733 () Bool)

(assert (=> b!855733 (= e!477018 tp_is_empty!16405)))

(declare-fun b!855734 () Bool)

(assert (=> b!855734 (= e!477016 e!477014)))

(declare-fun res!581235 () Bool)

(assert (=> b!855734 (=> (not res!581235) (not e!477014))))

(assert (=> b!855734 (= res!581235 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385564 () ListLongMap!9643)

(assert (=> b!855734 (= lt!385564 (getCurrentListMapNoExtraKeys!2844 _keys!868 lt!385563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!855734 (= lt!385563 (array!48992 (store (arr!23527 _values!688) i!612 (ValueCellFull!7763 v!557)) (size!23969 _values!688)))))

(declare-fun lt!385562 () ListLongMap!9643)

(assert (=> b!855734 (= lt!385562 (getCurrentListMapNoExtraKeys!2844 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855735 () Bool)

(declare-fun res!581232 () Bool)

(assert (=> b!855735 (=> (not res!581232) (not e!477016))))

(assert (=> b!855735 (= res!581232 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23970 _keys!868))))))

(declare-fun b!855736 () Bool)

(declare-fun res!581238 () Bool)

(assert (=> b!855736 (=> (not res!581238) (not e!477016))))

(assert (=> b!855736 (= res!581238 (and (= (size!23969 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23970 _keys!868) (size!23969 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855737 () Bool)

(assert (=> b!855737 (= e!477017 tp_is_empty!16405)))

(declare-fun mapIsEmpty!26207 () Bool)

(assert (=> mapIsEmpty!26207 mapRes!26207))

(declare-fun b!855738 () Bool)

(declare-fun res!581234 () Bool)

(assert (=> b!855738 (=> (not res!581234) (not e!477016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48993 (_ BitVec 32)) Bool)

(assert (=> b!855738 (= res!581234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73336 res!581233) b!855730))

(assert (= (and b!855730 res!581231) b!855736))

(assert (= (and b!855736 res!581238) b!855738))

(assert (= (and b!855738 res!581234) b!855728))

(assert (= (and b!855728 res!581230) b!855735))

(assert (= (and b!855735 res!581232) b!855729))

(assert (= (and b!855729 res!581236) b!855731))

(assert (= (and b!855731 res!581237) b!855734))

(assert (= (and b!855734 res!581235) b!855727))

(assert (= (and b!855732 condMapEmpty!26207) mapIsEmpty!26207))

(assert (= (and b!855732 (not condMapEmpty!26207)) mapNonEmpty!26207))

(get-info :version)

(assert (= (and mapNonEmpty!26207 ((_ is ValueCellFull!7763) mapValue!26207)) b!855737))

(assert (= (and b!855732 ((_ is ValueCellFull!7763) mapDefault!26207)) b!855733))

(assert (= start!73336 b!855732))

(declare-fun m!796233 () Bool)

(assert (=> mapNonEmpty!26207 m!796233))

(declare-fun m!796235 () Bool)

(assert (=> b!855728 m!796235))

(declare-fun m!796237 () Bool)

(assert (=> b!855727 m!796237))

(declare-fun m!796239 () Bool)

(assert (=> b!855727 m!796239))

(assert (=> b!855727 m!796239))

(declare-fun m!796241 () Bool)

(assert (=> b!855727 m!796241))

(declare-fun m!796243 () Bool)

(assert (=> b!855727 m!796243))

(declare-fun m!796245 () Bool)

(assert (=> b!855730 m!796245))

(declare-fun m!796247 () Bool)

(assert (=> b!855729 m!796247))

(declare-fun m!796249 () Bool)

(assert (=> b!855734 m!796249))

(declare-fun m!796251 () Bool)

(assert (=> b!855734 m!796251))

(declare-fun m!796253 () Bool)

(assert (=> b!855734 m!796253))

(declare-fun m!796255 () Bool)

(assert (=> b!855738 m!796255))

(declare-fun m!796257 () Bool)

(assert (=> start!73336 m!796257))

(declare-fun m!796259 () Bool)

(assert (=> start!73336 m!796259))

(declare-fun m!796261 () Bool)

(assert (=> b!855731 m!796261))

(check-sat (not b!855729) (not start!73336) (not b!855734) (not b_next!14269) (not mapNonEmpty!26207) (not b!855728) tp_is_empty!16405 (not b!855727) b_and!23599 (not b!855738) (not b!855730))
(check-sat b_and!23599 (not b_next!14269))
