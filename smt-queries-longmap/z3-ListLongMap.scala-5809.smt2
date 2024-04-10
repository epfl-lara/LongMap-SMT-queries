; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74928 () Bool)

(assert start!74928)

(declare-fun b_free!15447 () Bool)

(declare-fun b_next!15447 () Bool)

(assert (=> start!74928 (= b_free!15447 (not b_next!15447))))

(declare-fun tp!54044 () Bool)

(declare-fun b_and!25593 () Bool)

(assert (=> start!74928 (= tp!54044 b_and!25593)))

(declare-fun b!883696 () Bool)

(declare-datatypes ((Unit!30158 0))(
  ( (Unit!30159) )
))
(declare-fun e!491796 () Unit!30158)

(declare-fun Unit!30160 () Unit!30158)

(assert (=> b!883696 (= e!491796 Unit!30160)))

(declare-fun lt!400024 () Unit!30158)

(declare-datatypes ((array!51508 0))(
  ( (array!51509 (arr!24773 (Array (_ BitVec 32) (_ BitVec 64))) (size!25213 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51508)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51508 (_ BitVec 32) (_ BitVec 32)) Unit!30158)

(assert (=> b!883696 (= lt!400024 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17594 0))(
  ( (Nil!17591) (Cons!17590 (h!18721 (_ BitVec 64)) (t!24843 List!17594)) )
))
(declare-fun arrayNoDuplicates!0 (array!51508 (_ BitVec 32) List!17594) Bool)

(assert (=> b!883696 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17591)))

(declare-fun lt!400027 () Unit!30158)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51508 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30158)

(assert (=> b!883696 (= lt!400027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883696 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400033 () Unit!30158)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51508 (_ BitVec 64) (_ BitVec 32) List!17594) Unit!30158)

(assert (=> b!883696 (= lt!400033 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17591))))

(assert (=> b!883696 false))

(declare-fun b!883697 () Bool)

(declare-fun res!600360 () Bool)

(declare-fun e!491798 () Bool)

(assert (=> b!883697 (=> (not res!600360) (not e!491798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883697 (= res!600360 (validKeyInArray!0 k0!854))))

(declare-fun b!883698 () Bool)

(declare-fun res!600363 () Bool)

(assert (=> b!883698 (=> (not res!600363) (not e!491798))))

(assert (=> b!883698 (= res!600363 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25213 _keys!868))))))

(declare-fun b!883699 () Bool)

(declare-fun e!491801 () Bool)

(declare-fun tp_is_empty!17691 () Bool)

(assert (=> b!883699 (= e!491801 tp_is_empty!17691)))

(declare-fun b!883700 () Bool)

(declare-fun e!491802 () Bool)

(declare-fun mapRes!28173 () Bool)

(assert (=> b!883700 (= e!491802 (and e!491801 mapRes!28173))))

(declare-fun condMapEmpty!28173 () Bool)

(declare-datatypes ((V!28635 0))(
  ( (V!28636 (val!8893 Int)) )
))
(declare-datatypes ((ValueCell!8406 0))(
  ( (ValueCellFull!8406 (v!11362 V!28635)) (EmptyCell!8406) )
))
(declare-datatypes ((array!51510 0))(
  ( (array!51511 (arr!24774 (Array (_ BitVec 32) ValueCell!8406)) (size!25214 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51510)

(declare-fun mapDefault!28173 () ValueCell!8406)

(assert (=> b!883700 (= condMapEmpty!28173 (= (arr!24774 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8406)) mapDefault!28173)))))

(declare-fun mapNonEmpty!28173 () Bool)

(declare-fun tp!54043 () Bool)

(declare-fun e!491797 () Bool)

(assert (=> mapNonEmpty!28173 (= mapRes!28173 (and tp!54043 e!491797))))

(declare-fun mapRest!28173 () (Array (_ BitVec 32) ValueCell!8406))

(declare-fun mapValue!28173 () ValueCell!8406)

(declare-fun mapKey!28173 () (_ BitVec 32))

(assert (=> mapNonEmpty!28173 (= (arr!24774 _values!688) (store mapRest!28173 mapKey!28173 mapValue!28173))))

(declare-fun res!600362 () Bool)

(assert (=> start!74928 (=> (not res!600362) (not e!491798))))

(assert (=> start!74928 (= res!600362 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25213 _keys!868))))))

(assert (=> start!74928 e!491798))

(assert (=> start!74928 tp_is_empty!17691))

(assert (=> start!74928 true))

(assert (=> start!74928 tp!54044))

(declare-fun array_inv!19506 (array!51508) Bool)

(assert (=> start!74928 (array_inv!19506 _keys!868)))

(declare-fun array_inv!19507 (array!51510) Bool)

(assert (=> start!74928 (and (array_inv!19507 _values!688) e!491802)))

(declare-fun b!883701 () Bool)

(declare-fun res!600359 () Bool)

(assert (=> b!883701 (=> (not res!600359) (not e!491798))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883701 (= res!600359 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28173 () Bool)

(assert (=> mapIsEmpty!28173 mapRes!28173))

(declare-fun b!883702 () Bool)

(declare-fun e!491795 () Bool)

(declare-fun e!491800 () Bool)

(assert (=> b!883702 (= e!491795 (not e!491800))))

(declare-fun res!600357 () Bool)

(assert (=> b!883702 (=> res!600357 e!491800)))

(assert (=> b!883702 (= res!600357 (not (validKeyInArray!0 (select (arr!24773 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11786 0))(
  ( (tuple2!11787 (_1!5904 (_ BitVec 64)) (_2!5904 V!28635)) )
))
(declare-datatypes ((List!17595 0))(
  ( (Nil!17592) (Cons!17591 (h!18722 tuple2!11786) (t!24844 List!17595)) )
))
(declare-datatypes ((ListLongMap!10555 0))(
  ( (ListLongMap!10556 (toList!5293 List!17595)) )
))
(declare-fun lt!400025 () ListLongMap!10555)

(declare-fun lt!400026 () ListLongMap!10555)

(assert (=> b!883702 (= lt!400025 lt!400026)))

(declare-fun v!557 () V!28635)

(declare-fun lt!400028 () ListLongMap!10555)

(declare-fun +!2562 (ListLongMap!10555 tuple2!11786) ListLongMap!10555)

(assert (=> b!883702 (= lt!400026 (+!2562 lt!400028 (tuple2!11787 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!400029 () array!51510)

(declare-fun minValue!654 () V!28635)

(declare-fun zeroValue!654 () V!28635)

(declare-fun getCurrentListMapNoExtraKeys!3252 (array!51508 array!51510 (_ BitVec 32) (_ BitVec 32) V!28635 V!28635 (_ BitVec 32) Int) ListLongMap!10555)

(assert (=> b!883702 (= lt!400025 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!400029 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883702 (= lt!400028 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400034 () Unit!30158)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!746 (array!51508 array!51510 (_ BitVec 32) (_ BitVec 32) V!28635 V!28635 (_ BitVec 32) (_ BitVec 64) V!28635 (_ BitVec 32) Int) Unit!30158)

(assert (=> b!883702 (= lt!400034 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!746 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883703 () Bool)

(assert (=> b!883703 (= e!491798 e!491795)))

(declare-fun res!600355 () Bool)

(assert (=> b!883703 (=> (not res!600355) (not e!491795))))

(assert (=> b!883703 (= res!600355 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400032 () ListLongMap!10555)

(assert (=> b!883703 (= lt!400032 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!400029 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883703 (= lt!400029 (array!51511 (store (arr!24774 _values!688) i!612 (ValueCellFull!8406 v!557)) (size!25214 _values!688)))))

(declare-fun lt!400031 () ListLongMap!10555)

(assert (=> b!883703 (= lt!400031 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883704 () Bool)

(declare-fun res!600354 () Bool)

(assert (=> b!883704 (=> (not res!600354) (not e!491798))))

(assert (=> b!883704 (= res!600354 (and (= (select (arr!24773 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883705 () Bool)

(assert (=> b!883705 (= e!491797 tp_is_empty!17691)))

(declare-fun b!883706 () Bool)

(declare-fun res!600358 () Bool)

(assert (=> b!883706 (=> (not res!600358) (not e!491798))))

(assert (=> b!883706 (= res!600358 (and (= (size!25214 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25213 _keys!868) (size!25214 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883707 () Bool)

(declare-fun Unit!30161 () Unit!30158)

(assert (=> b!883707 (= e!491796 Unit!30161)))

(declare-fun b!883708 () Bool)

(declare-fun res!600361 () Bool)

(assert (=> b!883708 (=> (not res!600361) (not e!491798))))

(assert (=> b!883708 (= res!600361 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17591))))

(declare-fun b!883709 () Bool)

(assert (=> b!883709 (= e!491800 (bvslt from!1053 (size!25214 _values!688)))))

(assert (=> b!883709 (not (= (select (arr!24773 _keys!868) from!1053) k0!854))))

(declare-fun lt!400030 () Unit!30158)

(assert (=> b!883709 (= lt!400030 e!491796)))

(declare-fun c!93076 () Bool)

(assert (=> b!883709 (= c!93076 (= (select (arr!24773 _keys!868) from!1053) k0!854))))

(declare-fun get!13055 (ValueCell!8406 V!28635) V!28635)

(declare-fun dynLambda!1274 (Int (_ BitVec 64)) V!28635)

(assert (=> b!883709 (= lt!400032 (+!2562 lt!400026 (tuple2!11787 (select (arr!24773 _keys!868) from!1053) (get!13055 (select (arr!24774 _values!688) from!1053) (dynLambda!1274 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883710 () Bool)

(declare-fun res!600356 () Bool)

(assert (=> b!883710 (=> (not res!600356) (not e!491798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51508 (_ BitVec 32)) Bool)

(assert (=> b!883710 (= res!600356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74928 res!600362) b!883701))

(assert (= (and b!883701 res!600359) b!883706))

(assert (= (and b!883706 res!600358) b!883710))

(assert (= (and b!883710 res!600356) b!883708))

(assert (= (and b!883708 res!600361) b!883698))

(assert (= (and b!883698 res!600363) b!883697))

(assert (= (and b!883697 res!600360) b!883704))

(assert (= (and b!883704 res!600354) b!883703))

(assert (= (and b!883703 res!600355) b!883702))

(assert (= (and b!883702 (not res!600357)) b!883709))

(assert (= (and b!883709 c!93076) b!883696))

(assert (= (and b!883709 (not c!93076)) b!883707))

(assert (= (and b!883700 condMapEmpty!28173) mapIsEmpty!28173))

(assert (= (and b!883700 (not condMapEmpty!28173)) mapNonEmpty!28173))

(get-info :version)

(assert (= (and mapNonEmpty!28173 ((_ is ValueCellFull!8406) mapValue!28173)) b!883705))

(assert (= (and b!883700 ((_ is ValueCellFull!8406) mapDefault!28173)) b!883699))

(assert (= start!74928 b!883700))

(declare-fun b_lambda!12725 () Bool)

(assert (=> (not b_lambda!12725) (not b!883709)))

(declare-fun t!24842 () Bool)

(declare-fun tb!5105 () Bool)

(assert (=> (and start!74928 (= defaultEntry!696 defaultEntry!696) t!24842) tb!5105))

(declare-fun result!9845 () Bool)

(assert (=> tb!5105 (= result!9845 tp_is_empty!17691)))

(assert (=> b!883709 t!24842))

(declare-fun b_and!25595 () Bool)

(assert (= b_and!25593 (and (=> t!24842 result!9845) b_and!25595)))

(declare-fun m!823785 () Bool)

(assert (=> start!74928 m!823785))

(declare-fun m!823787 () Bool)

(assert (=> start!74928 m!823787))

(declare-fun m!823789 () Bool)

(assert (=> b!883702 m!823789))

(declare-fun m!823791 () Bool)

(assert (=> b!883702 m!823791))

(declare-fun m!823793 () Bool)

(assert (=> b!883702 m!823793))

(declare-fun m!823795 () Bool)

(assert (=> b!883702 m!823795))

(declare-fun m!823797 () Bool)

(assert (=> b!883702 m!823797))

(assert (=> b!883702 m!823795))

(declare-fun m!823799 () Bool)

(assert (=> b!883702 m!823799))

(declare-fun m!823801 () Bool)

(assert (=> b!883701 m!823801))

(declare-fun m!823803 () Bool)

(assert (=> b!883709 m!823803))

(declare-fun m!823805 () Bool)

(assert (=> b!883709 m!823805))

(declare-fun m!823807 () Bool)

(assert (=> b!883709 m!823807))

(declare-fun m!823809 () Bool)

(assert (=> b!883709 m!823809))

(assert (=> b!883709 m!823805))

(assert (=> b!883709 m!823795))

(assert (=> b!883709 m!823807))

(declare-fun m!823811 () Bool)

(assert (=> b!883710 m!823811))

(declare-fun m!823813 () Bool)

(assert (=> b!883703 m!823813))

(declare-fun m!823815 () Bool)

(assert (=> b!883703 m!823815))

(declare-fun m!823817 () Bool)

(assert (=> b!883703 m!823817))

(declare-fun m!823819 () Bool)

(assert (=> b!883697 m!823819))

(declare-fun m!823821 () Bool)

(assert (=> mapNonEmpty!28173 m!823821))

(declare-fun m!823823 () Bool)

(assert (=> b!883696 m!823823))

(declare-fun m!823825 () Bool)

(assert (=> b!883696 m!823825))

(declare-fun m!823827 () Bool)

(assert (=> b!883696 m!823827))

(declare-fun m!823829 () Bool)

(assert (=> b!883696 m!823829))

(declare-fun m!823831 () Bool)

(assert (=> b!883696 m!823831))

(declare-fun m!823833 () Bool)

(assert (=> b!883708 m!823833))

(declare-fun m!823835 () Bool)

(assert (=> b!883704 m!823835))

(check-sat (not b_lambda!12725) (not b!883702) (not b!883703) b_and!25595 (not b_next!15447) (not b!883701) (not b!883708) (not mapNonEmpty!28173) (not b!883709) tp_is_empty!17691 (not b!883697) (not b!883696) (not b!883710) (not start!74928))
(check-sat b_and!25595 (not b_next!15447))
