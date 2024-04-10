; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74994 () Bool)

(assert start!74994)

(declare-fun b_free!15483 () Bool)

(declare-fun b_next!15483 () Bool)

(assert (=> start!74994 (= b_free!15483 (not b_next!15483))))

(declare-fun tp!54155 () Bool)

(declare-fun b_and!25673 () Bool)

(assert (=> start!74994 (= tp!54155 b_and!25673)))

(declare-fun b!884675 () Bool)

(declare-fun res!600989 () Bool)

(declare-fun e!492330 () Bool)

(assert (=> b!884675 (=> (not res!600989) (not e!492330))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884675 (= res!600989 (validMask!0 mask!1196))))

(declare-fun b!884676 () Bool)

(declare-fun e!492334 () Bool)

(declare-fun tp_is_empty!17727 () Bool)

(assert (=> b!884676 (= e!492334 tp_is_empty!17727)))

(declare-fun b!884677 () Bool)

(declare-fun e!492335 () Bool)

(assert (=> b!884677 (= e!492335 tp_is_empty!17727)))

(declare-fun b!884678 () Bool)

(declare-fun res!600983 () Bool)

(assert (=> b!884678 (=> (not res!600983) (not e!492330))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51578 0))(
  ( (array!51579 (arr!24807 (Array (_ BitVec 32) (_ BitVec 64))) (size!25247 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51578)

(declare-datatypes ((V!28683 0))(
  ( (V!28684 (val!8911 Int)) )
))
(declare-datatypes ((ValueCell!8424 0))(
  ( (ValueCellFull!8424 (v!11384 V!28683)) (EmptyCell!8424) )
))
(declare-datatypes ((array!51580 0))(
  ( (array!51581 (arr!24808 (Array (_ BitVec 32) ValueCell!8424)) (size!25248 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51580)

(assert (=> b!884678 (= res!600983 (and (= (size!25248 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25247 _keys!868) (size!25248 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!600986 () Bool)

(assert (=> start!74994 (=> (not res!600986) (not e!492330))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74994 (= res!600986 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25247 _keys!868))))))

(assert (=> start!74994 e!492330))

(assert (=> start!74994 tp_is_empty!17727))

(assert (=> start!74994 true))

(assert (=> start!74994 tp!54155))

(declare-fun array_inv!19530 (array!51578) Bool)

(assert (=> start!74994 (array_inv!19530 _keys!868)))

(declare-fun e!492331 () Bool)

(declare-fun array_inv!19531 (array!51580) Bool)

(assert (=> start!74994 (and (array_inv!19531 _values!688) e!492331)))

(declare-fun b!884679 () Bool)

(declare-fun mapRes!28230 () Bool)

(assert (=> b!884679 (= e!492331 (and e!492335 mapRes!28230))))

(declare-fun condMapEmpty!28230 () Bool)

(declare-fun mapDefault!28230 () ValueCell!8424)

(assert (=> b!884679 (= condMapEmpty!28230 (= (arr!24808 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8424)) mapDefault!28230)))))

(declare-fun b!884680 () Bool)

(declare-fun res!600985 () Bool)

(assert (=> b!884680 (=> (not res!600985) (not e!492330))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884680 (= res!600985 (validKeyInArray!0 k0!854))))

(declare-fun b!884681 () Bool)

(declare-fun res!600984 () Bool)

(assert (=> b!884681 (=> (not res!600984) (not e!492330))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!884681 (= res!600984 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25247 _keys!868))))))

(declare-fun b!884682 () Bool)

(declare-fun res!600987 () Bool)

(assert (=> b!884682 (=> (not res!600987) (not e!492330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51578 (_ BitVec 32)) Bool)

(assert (=> b!884682 (= res!600987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884683 () Bool)

(declare-fun res!600988 () Bool)

(assert (=> b!884683 (=> (not res!600988) (not e!492330))))

(declare-datatypes ((List!17623 0))(
  ( (Nil!17620) (Cons!17619 (h!18750 (_ BitVec 64)) (t!24898 List!17623)) )
))
(declare-fun arrayNoDuplicates!0 (array!51578 (_ BitVec 32) List!17623) Bool)

(assert (=> b!884683 (= res!600988 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17620))))

(declare-fun mapIsEmpty!28230 () Bool)

(assert (=> mapIsEmpty!28230 mapRes!28230))

(declare-fun mapNonEmpty!28230 () Bool)

(declare-fun tp!54154 () Bool)

(assert (=> mapNonEmpty!28230 (= mapRes!28230 (and tp!54154 e!492334))))

(declare-fun mapRest!28230 () (Array (_ BitVec 32) ValueCell!8424))

(declare-fun mapValue!28230 () ValueCell!8424)

(declare-fun mapKey!28230 () (_ BitVec 32))

(assert (=> mapNonEmpty!28230 (= (arr!24808 _values!688) (store mapRest!28230 mapKey!28230 mapValue!28230))))

(declare-fun b!884684 () Bool)

(declare-fun e!492332 () Bool)

(assert (=> b!884684 (= e!492332 (not true))))

(declare-fun v!557 () V!28683)

(declare-fun lt!400749 () array!51580)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28683)

(declare-fun zeroValue!654 () V!28683)

(declare-datatypes ((tuple2!11816 0))(
  ( (tuple2!11817 (_1!5919 (_ BitVec 64)) (_2!5919 V!28683)) )
))
(declare-datatypes ((List!17624 0))(
  ( (Nil!17621) (Cons!17620 (h!18751 tuple2!11816) (t!24899 List!17624)) )
))
(declare-datatypes ((ListLongMap!10585 0))(
  ( (ListLongMap!10586 (toList!5308 List!17624)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3267 (array!51578 array!51580 (_ BitVec 32) (_ BitVec 32) V!28683 V!28683 (_ BitVec 32) Int) ListLongMap!10585)

(declare-fun +!2577 (ListLongMap!10585 tuple2!11816) ListLongMap!10585)

(assert (=> b!884684 (= (getCurrentListMapNoExtraKeys!3267 _keys!868 lt!400749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2577 (getCurrentListMapNoExtraKeys!3267 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11817 k0!854 v!557)))))

(declare-datatypes ((Unit!30210 0))(
  ( (Unit!30211) )
))
(declare-fun lt!400750 () Unit!30210)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!760 (array!51578 array!51580 (_ BitVec 32) (_ BitVec 32) V!28683 V!28683 (_ BitVec 32) (_ BitVec 64) V!28683 (_ BitVec 32) Int) Unit!30210)

(assert (=> b!884684 (= lt!400750 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!760 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884685 () Bool)

(declare-fun res!600982 () Bool)

(assert (=> b!884685 (=> (not res!600982) (not e!492330))))

(assert (=> b!884685 (= res!600982 (and (= (select (arr!24807 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884686 () Bool)

(assert (=> b!884686 (= e!492330 e!492332)))

(declare-fun res!600981 () Bool)

(assert (=> b!884686 (=> (not res!600981) (not e!492332))))

(assert (=> b!884686 (= res!600981 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400751 () ListLongMap!10585)

(assert (=> b!884686 (= lt!400751 (getCurrentListMapNoExtraKeys!3267 _keys!868 lt!400749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884686 (= lt!400749 (array!51581 (store (arr!24808 _values!688) i!612 (ValueCellFull!8424 v!557)) (size!25248 _values!688)))))

(declare-fun lt!400752 () ListLongMap!10585)

(assert (=> b!884686 (= lt!400752 (getCurrentListMapNoExtraKeys!3267 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74994 res!600986) b!884675))

(assert (= (and b!884675 res!600989) b!884678))

(assert (= (and b!884678 res!600983) b!884682))

(assert (= (and b!884682 res!600987) b!884683))

(assert (= (and b!884683 res!600988) b!884681))

(assert (= (and b!884681 res!600984) b!884680))

(assert (= (and b!884680 res!600985) b!884685))

(assert (= (and b!884685 res!600982) b!884686))

(assert (= (and b!884686 res!600981) b!884684))

(assert (= (and b!884679 condMapEmpty!28230) mapIsEmpty!28230))

(assert (= (and b!884679 (not condMapEmpty!28230)) mapNonEmpty!28230))

(get-info :version)

(assert (= (and mapNonEmpty!28230 ((_ is ValueCellFull!8424) mapValue!28230)) b!884676))

(assert (= (and b!884679 ((_ is ValueCellFull!8424) mapDefault!28230)) b!884677))

(assert (= start!74994 b!884679))

(declare-fun m!824911 () Bool)

(assert (=> b!884683 m!824911))

(declare-fun m!824913 () Bool)

(assert (=> b!884680 m!824913))

(declare-fun m!824915 () Bool)

(assert (=> b!884686 m!824915))

(declare-fun m!824917 () Bool)

(assert (=> b!884686 m!824917))

(declare-fun m!824919 () Bool)

(assert (=> b!884686 m!824919))

(declare-fun m!824921 () Bool)

(assert (=> b!884682 m!824921))

(declare-fun m!824923 () Bool)

(assert (=> mapNonEmpty!28230 m!824923))

(declare-fun m!824925 () Bool)

(assert (=> b!884675 m!824925))

(declare-fun m!824927 () Bool)

(assert (=> b!884685 m!824927))

(declare-fun m!824929 () Bool)

(assert (=> start!74994 m!824929))

(declare-fun m!824931 () Bool)

(assert (=> start!74994 m!824931))

(declare-fun m!824933 () Bool)

(assert (=> b!884684 m!824933))

(declare-fun m!824935 () Bool)

(assert (=> b!884684 m!824935))

(assert (=> b!884684 m!824935))

(declare-fun m!824937 () Bool)

(assert (=> b!884684 m!824937))

(declare-fun m!824939 () Bool)

(assert (=> b!884684 m!824939))

(check-sat b_and!25673 (not b_next!15483) tp_is_empty!17727 (not b!884684) (not b!884686) (not b!884675) (not mapNonEmpty!28230) (not b!884683) (not b!884680) (not start!74994) (not b!884682))
(check-sat b_and!25673 (not b_next!15483))
