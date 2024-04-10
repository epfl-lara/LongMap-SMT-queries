; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72978 () Bool)

(assert start!72978)

(declare-fun b_free!13893 () Bool)

(declare-fun b_next!13893 () Bool)

(assert (=> start!72978 (= b_free!13893 (not b_next!13893))))

(declare-fun tp!49183 () Bool)

(declare-fun b_and!22979 () Bool)

(assert (=> start!72978 (= tp!49183 b_and!22979)))

(declare-fun b!847714 () Bool)

(declare-fun e!473022 () Bool)

(declare-fun e!473023 () Bool)

(assert (=> b!847714 (= e!473022 e!473023)))

(declare-fun res!575963 () Bool)

(assert (=> b!847714 (=> (not res!575963) (not e!473023))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847714 (= res!575963 (= from!1053 i!612))))

(declare-datatypes ((V!26419 0))(
  ( (V!26420 (val!8062 Int)) )
))
(declare-datatypes ((tuple2!10534 0))(
  ( (tuple2!10535 (_1!5278 (_ BitVec 64)) (_2!5278 V!26419)) )
))
(declare-datatypes ((List!16392 0))(
  ( (Nil!16389) (Cons!16388 (h!17519 tuple2!10534) (t!22763 List!16392)) )
))
(declare-datatypes ((ListLongMap!9303 0))(
  ( (ListLongMap!9304 (toList!4667 List!16392)) )
))
(declare-fun lt!381817 () ListLongMap!9303)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7575 0))(
  ( (ValueCellFull!7575 (v!10487 V!26419)) (EmptyCell!7575) )
))
(declare-datatypes ((array!48268 0))(
  ( (array!48269 (arr!23165 (Array (_ BitVec 32) ValueCell!7575)) (size!23605 (_ BitVec 32))) )
))
(declare-fun lt!381815 () array!48268)

(declare-datatypes ((array!48270 0))(
  ( (array!48271 (arr!23166 (Array (_ BitVec 32) (_ BitVec 64))) (size!23606 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48270)

(declare-fun minValue!654 () V!26419)

(declare-fun zeroValue!654 () V!26419)

(declare-fun getCurrentListMapNoExtraKeys!2651 (array!48270 array!48268 (_ BitVec 32) (_ BitVec 32) V!26419 V!26419 (_ BitVec 32) Int) ListLongMap!9303)

(assert (=> b!847714 (= lt!381817 (getCurrentListMapNoExtraKeys!2651 _keys!868 lt!381815 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26419)

(declare-fun _values!688 () array!48268)

(assert (=> b!847714 (= lt!381815 (array!48269 (store (arr!23165 _values!688) i!612 (ValueCellFull!7575 v!557)) (size!23605 _values!688)))))

(declare-fun lt!381814 () ListLongMap!9303)

(assert (=> b!847714 (= lt!381814 (getCurrentListMapNoExtraKeys!2651 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847715 () Bool)

(declare-fun res!575958 () Bool)

(assert (=> b!847715 (=> (not res!575958) (not e!473022))))

(assert (=> b!847715 (= res!575958 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23606 _keys!868))))))

(declare-fun b!847716 () Bool)

(declare-fun res!575960 () Bool)

(assert (=> b!847716 (=> (not res!575960) (not e!473022))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!847716 (= res!575960 (and (= (select (arr!23166 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!575962 () Bool)

(assert (=> start!72978 (=> (not res!575962) (not e!473022))))

(assert (=> start!72978 (= res!575962 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23606 _keys!868))))))

(assert (=> start!72978 e!473022))

(declare-fun tp_is_empty!16029 () Bool)

(assert (=> start!72978 tp_is_empty!16029))

(assert (=> start!72978 true))

(assert (=> start!72978 tp!49183))

(declare-fun array_inv!18396 (array!48270) Bool)

(assert (=> start!72978 (array_inv!18396 _keys!868)))

(declare-fun e!473018 () Bool)

(declare-fun array_inv!18397 (array!48268) Bool)

(assert (=> start!72978 (and (array_inv!18397 _values!688) e!473018)))

(declare-fun call!37534 () ListLongMap!9303)

(declare-fun e!473021 () Bool)

(declare-fun b!847717 () Bool)

(declare-fun call!37535 () ListLongMap!9303)

(declare-fun +!2083 (ListLongMap!9303 tuple2!10534) ListLongMap!9303)

(assert (=> b!847717 (= e!473021 (= call!37534 (+!2083 call!37535 (tuple2!10535 k0!854 v!557))))))

(declare-fun b!847718 () Bool)

(declare-fun e!473020 () Bool)

(assert (=> b!847718 (= e!473020 tp_is_empty!16029)))

(declare-fun b!847719 () Bool)

(assert (=> b!847719 (= e!473021 (= call!37534 call!37535))))

(declare-fun b!847720 () Bool)

(declare-fun res!575964 () Bool)

(assert (=> b!847720 (=> (not res!575964) (not e!473022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847720 (= res!575964 (validKeyInArray!0 k0!854))))

(declare-fun bm!37531 () Bool)

(assert (=> bm!37531 (= call!37534 (getCurrentListMapNoExtraKeys!2651 _keys!868 lt!381815 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37532 () Bool)

(assert (=> bm!37532 (= call!37535 (getCurrentListMapNoExtraKeys!2651 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25643 () Bool)

(declare-fun mapRes!25643 () Bool)

(declare-fun tp!49182 () Bool)

(assert (=> mapNonEmpty!25643 (= mapRes!25643 (and tp!49182 e!473020))))

(declare-fun mapValue!25643 () ValueCell!7575)

(declare-fun mapKey!25643 () (_ BitVec 32))

(declare-fun mapRest!25643 () (Array (_ BitVec 32) ValueCell!7575))

(assert (=> mapNonEmpty!25643 (= (arr!23165 _values!688) (store mapRest!25643 mapKey!25643 mapValue!25643))))

(declare-fun b!847721 () Bool)

(declare-fun res!575959 () Bool)

(assert (=> b!847721 (=> (not res!575959) (not e!473022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48270 (_ BitVec 32)) Bool)

(assert (=> b!847721 (= res!575959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847722 () Bool)

(declare-fun res!575965 () Bool)

(assert (=> b!847722 (=> (not res!575965) (not e!473022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847722 (= res!575965 (validMask!0 mask!1196))))

(declare-fun b!847723 () Bool)

(declare-fun e!473017 () Bool)

(assert (=> b!847723 (= e!473017 tp_is_empty!16029)))

(declare-fun b!847724 () Bool)

(declare-fun res!575966 () Bool)

(assert (=> b!847724 (=> (not res!575966) (not e!473022))))

(assert (=> b!847724 (= res!575966 (and (= (size!23605 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23606 _keys!868) (size!23605 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847725 () Bool)

(assert (=> b!847725 (= e!473018 (and e!473017 mapRes!25643))))

(declare-fun condMapEmpty!25643 () Bool)

(declare-fun mapDefault!25643 () ValueCell!7575)

(assert (=> b!847725 (= condMapEmpty!25643 (= (arr!23165 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7575)) mapDefault!25643)))))

(declare-fun mapIsEmpty!25643 () Bool)

(assert (=> mapIsEmpty!25643 mapRes!25643))

(declare-fun b!847726 () Bool)

(assert (=> b!847726 (= e!473023 (not true))))

(assert (=> b!847726 e!473021))

(declare-fun c!91510 () Bool)

(assert (=> b!847726 (= c!91510 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28949 0))(
  ( (Unit!28950) )
))
(declare-fun lt!381816 () Unit!28949)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!320 (array!48270 array!48268 (_ BitVec 32) (_ BitVec 32) V!26419 V!26419 (_ BitVec 32) (_ BitVec 64) V!26419 (_ BitVec 32) Int) Unit!28949)

(assert (=> b!847726 (= lt!381816 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!320 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847727 () Bool)

(declare-fun res!575961 () Bool)

(assert (=> b!847727 (=> (not res!575961) (not e!473022))))

(declare-datatypes ((List!16393 0))(
  ( (Nil!16390) (Cons!16389 (h!17520 (_ BitVec 64)) (t!22764 List!16393)) )
))
(declare-fun arrayNoDuplicates!0 (array!48270 (_ BitVec 32) List!16393) Bool)

(assert (=> b!847727 (= res!575961 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16390))))

(assert (= (and start!72978 res!575962) b!847722))

(assert (= (and b!847722 res!575965) b!847724))

(assert (= (and b!847724 res!575966) b!847721))

(assert (= (and b!847721 res!575959) b!847727))

(assert (= (and b!847727 res!575961) b!847715))

(assert (= (and b!847715 res!575958) b!847720))

(assert (= (and b!847720 res!575964) b!847716))

(assert (= (and b!847716 res!575960) b!847714))

(assert (= (and b!847714 res!575963) b!847726))

(assert (= (and b!847726 c!91510) b!847717))

(assert (= (and b!847726 (not c!91510)) b!847719))

(assert (= (or b!847717 b!847719) bm!37531))

(assert (= (or b!847717 b!847719) bm!37532))

(assert (= (and b!847725 condMapEmpty!25643) mapIsEmpty!25643))

(assert (= (and b!847725 (not condMapEmpty!25643)) mapNonEmpty!25643))

(get-info :version)

(assert (= (and mapNonEmpty!25643 ((_ is ValueCellFull!7575) mapValue!25643)) b!847718))

(assert (= (and b!847725 ((_ is ValueCellFull!7575) mapDefault!25643)) b!847723))

(assert (= start!72978 b!847725))

(declare-fun m!788703 () Bool)

(assert (=> mapNonEmpty!25643 m!788703))

(declare-fun m!788705 () Bool)

(assert (=> b!847721 m!788705))

(declare-fun m!788707 () Bool)

(assert (=> b!847714 m!788707))

(declare-fun m!788709 () Bool)

(assert (=> b!847714 m!788709))

(declare-fun m!788711 () Bool)

(assert (=> b!847714 m!788711))

(declare-fun m!788713 () Bool)

(assert (=> b!847727 m!788713))

(declare-fun m!788715 () Bool)

(assert (=> bm!37531 m!788715))

(declare-fun m!788717 () Bool)

(assert (=> b!847717 m!788717))

(declare-fun m!788719 () Bool)

(assert (=> b!847720 m!788719))

(declare-fun m!788721 () Bool)

(assert (=> b!847716 m!788721))

(declare-fun m!788723 () Bool)

(assert (=> b!847722 m!788723))

(declare-fun m!788725 () Bool)

(assert (=> b!847726 m!788725))

(declare-fun m!788727 () Bool)

(assert (=> start!72978 m!788727))

(declare-fun m!788729 () Bool)

(assert (=> start!72978 m!788729))

(declare-fun m!788731 () Bool)

(assert (=> bm!37532 m!788731))

(check-sat (not b!847726) (not bm!37531) (not b!847717) (not b!847720) (not b!847722) (not b!847727) (not start!72978) (not b!847714) (not b_next!13893) tp_is_empty!16029 (not bm!37532) (not mapNonEmpty!25643) b_and!22979 (not b!847721))
(check-sat b_and!22979 (not b_next!13893))
