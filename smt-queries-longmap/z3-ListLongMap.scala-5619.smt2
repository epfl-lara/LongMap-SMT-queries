; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73666 () Bool)

(assert start!73666)

(declare-fun b_free!14413 () Bool)

(declare-fun b_next!14413 () Bool)

(assert (=> start!73666 (= b_free!14413 (not b_next!14413))))

(declare-fun tp!50743 () Bool)

(declare-fun b_and!23815 () Bool)

(assert (=> start!73666 (= tp!50743 b_and!23815)))

(declare-fun res!583706 () Bool)

(declare-fun e!479120 () Bool)

(assert (=> start!73666 (=> (not res!583706) (not e!479120))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49327 0))(
  ( (array!49328 (arr!23690 (Array (_ BitVec 32) (_ BitVec 64))) (size!24131 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49327)

(assert (=> start!73666 (= res!583706 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24131 _keys!868))))))

(assert (=> start!73666 e!479120))

(declare-fun tp_is_empty!16549 () Bool)

(assert (=> start!73666 tp_is_empty!16549))

(assert (=> start!73666 true))

(assert (=> start!73666 tp!50743))

(declare-fun array_inv!18808 (array!49327) Bool)

(assert (=> start!73666 (array_inv!18808 _keys!868)))

(declare-datatypes ((V!27113 0))(
  ( (V!27114 (val!8322 Int)) )
))
(declare-datatypes ((ValueCell!7835 0))(
  ( (ValueCellFull!7835 (v!10747 V!27113)) (EmptyCell!7835) )
))
(declare-datatypes ((array!49329 0))(
  ( (array!49330 (arr!23691 (Array (_ BitVec 32) ValueCell!7835)) (size!24132 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49329)

(declare-fun e!479118 () Bool)

(declare-fun array_inv!18809 (array!49329) Bool)

(assert (=> start!73666 (and (array_inv!18809 _values!688) e!479118)))

(declare-fun b!859573 () Bool)

(declare-fun e!479117 () Bool)

(declare-fun e!479115 () Bool)

(assert (=> b!859573 (= e!479117 (not e!479115))))

(declare-fun res!583705 () Bool)

(assert (=> b!859573 (=> res!583705 e!479115)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859573 (= res!583705 (not (validKeyInArray!0 (select (arr!23690 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10910 0))(
  ( (tuple2!10911 (_1!5466 (_ BitVec 64)) (_2!5466 V!27113)) )
))
(declare-datatypes ((List!16749 0))(
  ( (Nil!16746) (Cons!16745 (h!17882 tuple2!10910) (t!23420 List!16749)) )
))
(declare-datatypes ((ListLongMap!9681 0))(
  ( (ListLongMap!9682 (toList!4856 List!16749)) )
))
(declare-fun lt!387205 () ListLongMap!9681)

(declare-fun lt!387208 () ListLongMap!9681)

(assert (=> b!859573 (= lt!387205 lt!387208)))

(declare-fun v!557 () V!27113)

(declare-fun lt!387204 () ListLongMap!9681)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2262 (ListLongMap!9681 tuple2!10910) ListLongMap!9681)

(assert (=> b!859573 (= lt!387208 (+!2262 lt!387204 (tuple2!10911 k0!854 v!557)))))

(declare-fun lt!387203 () array!49329)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27113)

(declare-fun zeroValue!654 () V!27113)

(declare-fun getCurrentListMapNoExtraKeys!2912 (array!49327 array!49329 (_ BitVec 32) (_ BitVec 32) V!27113 V!27113 (_ BitVec 32) Int) ListLongMap!9681)

(assert (=> b!859573 (= lt!387205 (getCurrentListMapNoExtraKeys!2912 _keys!868 lt!387203 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859573 (= lt!387204 (getCurrentListMapNoExtraKeys!2912 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29276 0))(
  ( (Unit!29277) )
))
(declare-fun lt!387202 () Unit!29276)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!458 (array!49327 array!49329 (_ BitVec 32) (_ BitVec 32) V!27113 V!27113 (_ BitVec 32) (_ BitVec 64) V!27113 (_ BitVec 32) Int) Unit!29276)

(assert (=> b!859573 (= lt!387202 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!458 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859574 () Bool)

(declare-fun e!479119 () Bool)

(declare-fun mapRes!26423 () Bool)

(assert (=> b!859574 (= e!479118 (and e!479119 mapRes!26423))))

(declare-fun condMapEmpty!26423 () Bool)

(declare-fun mapDefault!26423 () ValueCell!7835)

(assert (=> b!859574 (= condMapEmpty!26423 (= (arr!23691 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7835)) mapDefault!26423)))))

(declare-fun mapNonEmpty!26423 () Bool)

(declare-fun tp!50744 () Bool)

(declare-fun e!479122 () Bool)

(assert (=> mapNonEmpty!26423 (= mapRes!26423 (and tp!50744 e!479122))))

(declare-fun mapRest!26423 () (Array (_ BitVec 32) ValueCell!7835))

(declare-fun mapKey!26423 () (_ BitVec 32))

(declare-fun mapValue!26423 () ValueCell!7835)

(assert (=> mapNonEmpty!26423 (= (arr!23691 _values!688) (store mapRest!26423 mapKey!26423 mapValue!26423))))

(declare-fun b!859575 () Bool)

(assert (=> b!859575 (= e!479120 e!479117)))

(declare-fun res!583709 () Bool)

(assert (=> b!859575 (=> (not res!583709) (not e!479117))))

(assert (=> b!859575 (= res!583709 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387207 () ListLongMap!9681)

(assert (=> b!859575 (= lt!387207 (getCurrentListMapNoExtraKeys!2912 _keys!868 lt!387203 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859575 (= lt!387203 (array!49330 (store (arr!23691 _values!688) i!612 (ValueCellFull!7835 v!557)) (size!24132 _values!688)))))

(declare-fun lt!387206 () ListLongMap!9681)

(assert (=> b!859575 (= lt!387206 (getCurrentListMapNoExtraKeys!2912 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859576 () Bool)

(assert (=> b!859576 (= e!479122 tp_is_empty!16549)))

(declare-fun b!859577 () Bool)

(declare-fun res!583708 () Bool)

(assert (=> b!859577 (=> (not res!583708) (not e!479120))))

(assert (=> b!859577 (= res!583708 (and (= (size!24132 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24131 _keys!868) (size!24132 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859578 () Bool)

(declare-fun res!583713 () Bool)

(assert (=> b!859578 (=> (not res!583713) (not e!479120))))

(declare-datatypes ((List!16750 0))(
  ( (Nil!16747) (Cons!16746 (h!17883 (_ BitVec 64)) (t!23421 List!16750)) )
))
(declare-fun arrayNoDuplicates!0 (array!49327 (_ BitVec 32) List!16750) Bool)

(assert (=> b!859578 (= res!583713 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16747))))

(declare-fun b!859579 () Bool)

(declare-fun res!583712 () Bool)

(assert (=> b!859579 (=> (not res!583712) (not e!479120))))

(assert (=> b!859579 (= res!583712 (validKeyInArray!0 k0!854))))

(declare-fun b!859580 () Bool)

(declare-fun res!583711 () Bool)

(assert (=> b!859580 (=> (not res!583711) (not e!479120))))

(assert (=> b!859580 (= res!583711 (and (= (select (arr!23690 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859581 () Bool)

(declare-fun e!479121 () Bool)

(assert (=> b!859581 (= e!479115 e!479121)))

(declare-fun res!583707 () Bool)

(assert (=> b!859581 (=> res!583707 e!479121)))

(assert (=> b!859581 (= res!583707 (not (= (select (arr!23690 _keys!868) from!1053) k0!854)))))

(declare-fun get!12484 (ValueCell!7835 V!27113) V!27113)

(declare-fun dynLambda!1096 (Int (_ BitVec 64)) V!27113)

(assert (=> b!859581 (= lt!387207 (+!2262 lt!387208 (tuple2!10911 (select (arr!23690 _keys!868) from!1053) (get!12484 (select (arr!23691 _values!688) from!1053) (dynLambda!1096 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859582 () Bool)

(declare-fun res!583704 () Bool)

(assert (=> b!859582 (=> (not res!583704) (not e!479120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49327 (_ BitVec 32)) Bool)

(assert (=> b!859582 (= res!583704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859583 () Bool)

(declare-fun res!583714 () Bool)

(assert (=> b!859583 (=> (not res!583714) (not e!479120))))

(assert (=> b!859583 (= res!583714 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24131 _keys!868))))))

(declare-fun mapIsEmpty!26423 () Bool)

(assert (=> mapIsEmpty!26423 mapRes!26423))

(declare-fun b!859584 () Bool)

(assert (=> b!859584 (= e!479119 tp_is_empty!16549)))

(declare-fun b!859585 () Bool)

(assert (=> b!859585 (= e!479121 true)))

(assert (=> b!859585 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16747)))

(declare-fun lt!387209 () Unit!29276)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49327 (_ BitVec 32) (_ BitVec 32)) Unit!29276)

(assert (=> b!859585 (= lt!387209 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859586 () Bool)

(declare-fun res!583710 () Bool)

(assert (=> b!859586 (=> (not res!583710) (not e!479120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859586 (= res!583710 (validMask!0 mask!1196))))

(assert (= (and start!73666 res!583706) b!859586))

(assert (= (and b!859586 res!583710) b!859577))

(assert (= (and b!859577 res!583708) b!859582))

(assert (= (and b!859582 res!583704) b!859578))

(assert (= (and b!859578 res!583713) b!859583))

(assert (= (and b!859583 res!583714) b!859579))

(assert (= (and b!859579 res!583712) b!859580))

(assert (= (and b!859580 res!583711) b!859575))

(assert (= (and b!859575 res!583709) b!859573))

(assert (= (and b!859573 (not res!583705)) b!859581))

(assert (= (and b!859581 (not res!583707)) b!859585))

(assert (= (and b!859574 condMapEmpty!26423) mapIsEmpty!26423))

(assert (= (and b!859574 (not condMapEmpty!26423)) mapNonEmpty!26423))

(get-info :version)

(assert (= (and mapNonEmpty!26423 ((_ is ValueCellFull!7835) mapValue!26423)) b!859576))

(assert (= (and b!859574 ((_ is ValueCellFull!7835) mapDefault!26423)) b!859584))

(assert (= start!73666 b!859574))

(declare-fun b_lambda!11779 () Bool)

(assert (=> (not b_lambda!11779) (not b!859581)))

(declare-fun t!23419 () Bool)

(declare-fun tb!4527 () Bool)

(assert (=> (and start!73666 (= defaultEntry!696 defaultEntry!696) t!23419) tb!4527))

(declare-fun result!8673 () Bool)

(assert (=> tb!4527 (= result!8673 tp_is_empty!16549)))

(assert (=> b!859581 t!23419))

(declare-fun b_and!23817 () Bool)

(assert (= b_and!23815 (and (=> t!23419 result!8673) b_and!23817)))

(declare-fun m!800681 () Bool)

(assert (=> b!859582 m!800681))

(declare-fun m!800683 () Bool)

(assert (=> b!859573 m!800683))

(declare-fun m!800685 () Bool)

(assert (=> b!859573 m!800685))

(declare-fun m!800687 () Bool)

(assert (=> b!859573 m!800687))

(declare-fun m!800689 () Bool)

(assert (=> b!859573 m!800689))

(declare-fun m!800691 () Bool)

(assert (=> b!859573 m!800691))

(assert (=> b!859573 m!800685))

(declare-fun m!800693 () Bool)

(assert (=> b!859573 m!800693))

(declare-fun m!800695 () Bool)

(assert (=> start!73666 m!800695))

(declare-fun m!800697 () Bool)

(assert (=> start!73666 m!800697))

(declare-fun m!800699 () Bool)

(assert (=> mapNonEmpty!26423 m!800699))

(declare-fun m!800701 () Bool)

(assert (=> b!859585 m!800701))

(declare-fun m!800703 () Bool)

(assert (=> b!859585 m!800703))

(declare-fun m!800705 () Bool)

(assert (=> b!859575 m!800705))

(declare-fun m!800707 () Bool)

(assert (=> b!859575 m!800707))

(declare-fun m!800709 () Bool)

(assert (=> b!859575 m!800709))

(declare-fun m!800711 () Bool)

(assert (=> b!859586 m!800711))

(declare-fun m!800713 () Bool)

(assert (=> b!859579 m!800713))

(declare-fun m!800715 () Bool)

(assert (=> b!859581 m!800715))

(declare-fun m!800717 () Bool)

(assert (=> b!859581 m!800717))

(declare-fun m!800719 () Bool)

(assert (=> b!859581 m!800719))

(declare-fun m!800721 () Bool)

(assert (=> b!859581 m!800721))

(assert (=> b!859581 m!800717))

(assert (=> b!859581 m!800685))

(assert (=> b!859581 m!800719))

(declare-fun m!800723 () Bool)

(assert (=> b!859580 m!800723))

(declare-fun m!800725 () Bool)

(assert (=> b!859578 m!800725))

(check-sat (not b_lambda!11779) (not start!73666) (not b_next!14413) (not b!859581) b_and!23817 (not b!859579) (not b!859586) (not b!859585) (not mapNonEmpty!26423) (not b!859582) (not b!859575) tp_is_empty!16549 (not b!859573) (not b!859578))
(check-sat b_and!23817 (not b_next!14413))
