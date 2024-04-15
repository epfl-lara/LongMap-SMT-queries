; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73522 () Bool)

(assert start!73522)

(declare-fun b_free!14455 () Bool)

(declare-fun b_next!14455 () Bool)

(assert (=> start!73522 (= b_free!14455 (not b_next!14455))))

(declare-fun tp!50869 () Bool)

(declare-fun b_and!23863 () Bool)

(assert (=> start!73522 (= tp!50869 b_and!23863)))

(declare-fun b!859415 () Bool)

(declare-fun res!584012 () Bool)

(declare-fun e!478910 () Bool)

(assert (=> b!859415 (=> (not res!584012) (not e!478910))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859415 (= res!584012 (validKeyInArray!0 k0!854))))

(declare-fun b!859416 () Bool)

(declare-fun res!584005 () Bool)

(assert (=> b!859416 (=> (not res!584005) (not e!478910))))

(declare-datatypes ((array!49347 0))(
  ( (array!49348 (arr!23705 (Array (_ BitVec 32) (_ BitVec 64))) (size!24147 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49347)

(declare-datatypes ((List!16829 0))(
  ( (Nil!16826) (Cons!16825 (h!17956 (_ BitVec 64)) (t!23541 List!16829)) )
))
(declare-fun arrayNoDuplicates!0 (array!49347 (_ BitVec 32) List!16829) Bool)

(assert (=> b!859416 (= res!584005 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16826))))

(declare-fun mapIsEmpty!26486 () Bool)

(declare-fun mapRes!26486 () Bool)

(assert (=> mapIsEmpty!26486 mapRes!26486))

(declare-fun b!859418 () Bool)

(declare-fun e!478909 () Bool)

(declare-fun tp_is_empty!16591 () Bool)

(assert (=> b!859418 (= e!478909 tp_is_empty!16591)))

(declare-fun b!859419 () Bool)

(declare-fun e!478917 () Bool)

(assert (=> b!859419 (= e!478917 tp_is_empty!16591)))

(declare-fun b!859420 () Bool)

(declare-fun res!584011 () Bool)

(assert (=> b!859420 (=> (not res!584011) (not e!478910))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859420 (= res!584011 (validMask!0 mask!1196))))

(declare-fun b!859421 () Bool)

(declare-fun e!478911 () Bool)

(declare-fun e!478916 () Bool)

(assert (=> b!859421 (= e!478911 e!478916)))

(declare-fun res!584013 () Bool)

(assert (=> b!859421 (=> res!584013 e!478916)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859421 (= res!584013 (not (= (select (arr!23705 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27169 0))(
  ( (V!27170 (val!8343 Int)) )
))
(declare-datatypes ((tuple2!11028 0))(
  ( (tuple2!11029 (_1!5525 (_ BitVec 64)) (_2!5525 V!27169)) )
))
(declare-datatypes ((List!16830 0))(
  ( (Nil!16827) (Cons!16826 (h!17957 tuple2!11028) (t!23542 List!16830)) )
))
(declare-datatypes ((ListLongMap!9787 0))(
  ( (ListLongMap!9788 (toList!4909 List!16830)) )
))
(declare-fun lt!387150 () ListLongMap!9787)

(declare-fun lt!387157 () ListLongMap!9787)

(declare-datatypes ((ValueCell!7856 0))(
  ( (ValueCellFull!7856 (v!10762 V!27169)) (EmptyCell!7856) )
))
(declare-datatypes ((array!49349 0))(
  ( (array!49350 (arr!23706 (Array (_ BitVec 32) ValueCell!7856)) (size!24148 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49349)

(declare-fun +!2283 (ListLongMap!9787 tuple2!11028) ListLongMap!9787)

(declare-fun get!12498 (ValueCell!7856 V!27169) V!27169)

(declare-fun dynLambda!1099 (Int (_ BitVec 64)) V!27169)

(assert (=> b!859421 (= lt!387150 (+!2283 lt!387157 (tuple2!11029 (select (arr!23705 _keys!868) from!1053) (get!12498 (select (arr!23706 _values!688) from!1053) (dynLambda!1099 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859422 () Bool)

(declare-fun e!478914 () Bool)

(assert (=> b!859422 (= e!478910 e!478914)))

(declare-fun res!584003 () Bool)

(assert (=> b!859422 (=> (not res!584003) (not e!478914))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859422 (= res!584003 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!387153 () array!49349)

(declare-fun minValue!654 () V!27169)

(declare-fun zeroValue!654 () V!27169)

(declare-fun getCurrentListMapNoExtraKeys!2913 (array!49347 array!49349 (_ BitVec 32) (_ BitVec 32) V!27169 V!27169 (_ BitVec 32) Int) ListLongMap!9787)

(assert (=> b!859422 (= lt!387150 (getCurrentListMapNoExtraKeys!2913 _keys!868 lt!387153 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27169)

(assert (=> b!859422 (= lt!387153 (array!49350 (store (arr!23706 _values!688) i!612 (ValueCellFull!7856 v!557)) (size!24148 _values!688)))))

(declare-fun lt!387156 () ListLongMap!9787)

(assert (=> b!859422 (= lt!387156 (getCurrentListMapNoExtraKeys!2913 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859423 () Bool)

(declare-fun e!478913 () Bool)

(assert (=> b!859423 (= e!478913 true)))

(declare-fun lt!387158 () Bool)

(declare-fun contains!4202 (List!16829 (_ BitVec 64)) Bool)

(assert (=> b!859423 (= lt!387158 (contains!4202 Nil!16826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859424 () Bool)

(declare-fun res!584008 () Bool)

(assert (=> b!859424 (=> (not res!584008) (not e!478910))))

(assert (=> b!859424 (= res!584008 (and (= (select (arr!23705 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26486 () Bool)

(declare-fun tp!50870 () Bool)

(assert (=> mapNonEmpty!26486 (= mapRes!26486 (and tp!50870 e!478917))))

(declare-fun mapValue!26486 () ValueCell!7856)

(declare-fun mapKey!26486 () (_ BitVec 32))

(declare-fun mapRest!26486 () (Array (_ BitVec 32) ValueCell!7856))

(assert (=> mapNonEmpty!26486 (= (arr!23706 _values!688) (store mapRest!26486 mapKey!26486 mapValue!26486))))

(declare-fun b!859417 () Bool)

(assert (=> b!859417 (= e!478914 (not e!478911))))

(declare-fun res!584010 () Bool)

(assert (=> b!859417 (=> res!584010 e!478911)))

(assert (=> b!859417 (= res!584010 (not (validKeyInArray!0 (select (arr!23705 _keys!868) from!1053))))))

(declare-fun lt!387155 () ListLongMap!9787)

(assert (=> b!859417 (= lt!387155 lt!387157)))

(declare-fun lt!387151 () ListLongMap!9787)

(assert (=> b!859417 (= lt!387157 (+!2283 lt!387151 (tuple2!11029 k0!854 v!557)))))

(assert (=> b!859417 (= lt!387155 (getCurrentListMapNoExtraKeys!2913 _keys!868 lt!387153 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859417 (= lt!387151 (getCurrentListMapNoExtraKeys!2913 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29235 0))(
  ( (Unit!29236) )
))
(declare-fun lt!387152 () Unit!29235)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!475 (array!49347 array!49349 (_ BitVec 32) (_ BitVec 32) V!27169 V!27169 (_ BitVec 32) (_ BitVec 64) V!27169 (_ BitVec 32) Int) Unit!29235)

(assert (=> b!859417 (= lt!387152 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!475 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!584007 () Bool)

(assert (=> start!73522 (=> (not res!584007) (not e!478910))))

(assert (=> start!73522 (= res!584007 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24147 _keys!868))))))

(assert (=> start!73522 e!478910))

(assert (=> start!73522 tp_is_empty!16591))

(assert (=> start!73522 true))

(assert (=> start!73522 tp!50869))

(declare-fun array_inv!18832 (array!49347) Bool)

(assert (=> start!73522 (array_inv!18832 _keys!868)))

(declare-fun e!478915 () Bool)

(declare-fun array_inv!18833 (array!49349) Bool)

(assert (=> start!73522 (and (array_inv!18833 _values!688) e!478915)))

(declare-fun b!859425 () Bool)

(assert (=> b!859425 (= e!478915 (and e!478909 mapRes!26486))))

(declare-fun condMapEmpty!26486 () Bool)

(declare-fun mapDefault!26486 () ValueCell!7856)

(assert (=> b!859425 (= condMapEmpty!26486 (= (arr!23706 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7856)) mapDefault!26486)))))

(declare-fun b!859426 () Bool)

(declare-fun res!584015 () Bool)

(assert (=> b!859426 (=> (not res!584015) (not e!478910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49347 (_ BitVec 32)) Bool)

(assert (=> b!859426 (= res!584015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859427 () Bool)

(assert (=> b!859427 (= e!478916 e!478913)))

(declare-fun res!584004 () Bool)

(assert (=> b!859427 (=> res!584004 e!478913)))

(assert (=> b!859427 (= res!584004 (or (bvsge (size!24147 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24147 _keys!868)) (bvsge from!1053 (size!24147 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859427 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387149 () Unit!29235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29235)

(assert (=> b!859427 (= lt!387149 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859427 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16826)))

(declare-fun lt!387154 () Unit!29235)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49347 (_ BitVec 32) (_ BitVec 32)) Unit!29235)

(assert (=> b!859427 (= lt!387154 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859428 () Bool)

(declare-fun res!584016 () Bool)

(assert (=> b!859428 (=> res!584016 e!478913)))

(assert (=> b!859428 (= res!584016 (contains!4202 Nil!16826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859429 () Bool)

(declare-fun res!584014 () Bool)

(assert (=> b!859429 (=> res!584014 e!478913)))

(declare-fun noDuplicate!1311 (List!16829) Bool)

(assert (=> b!859429 (= res!584014 (not (noDuplicate!1311 Nil!16826)))))

(declare-fun b!859430 () Bool)

(declare-fun res!584006 () Bool)

(assert (=> b!859430 (=> (not res!584006) (not e!478910))))

(assert (=> b!859430 (= res!584006 (and (= (size!24148 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24147 _keys!868) (size!24148 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859431 () Bool)

(declare-fun res!584009 () Bool)

(assert (=> b!859431 (=> (not res!584009) (not e!478910))))

(assert (=> b!859431 (= res!584009 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24147 _keys!868))))))

(assert (= (and start!73522 res!584007) b!859420))

(assert (= (and b!859420 res!584011) b!859430))

(assert (= (and b!859430 res!584006) b!859426))

(assert (= (and b!859426 res!584015) b!859416))

(assert (= (and b!859416 res!584005) b!859431))

(assert (= (and b!859431 res!584009) b!859415))

(assert (= (and b!859415 res!584012) b!859424))

(assert (= (and b!859424 res!584008) b!859422))

(assert (= (and b!859422 res!584003) b!859417))

(assert (= (and b!859417 (not res!584010)) b!859421))

(assert (= (and b!859421 (not res!584013)) b!859427))

(assert (= (and b!859427 (not res!584004)) b!859429))

(assert (= (and b!859429 (not res!584014)) b!859428))

(assert (= (and b!859428 (not res!584016)) b!859423))

(assert (= (and b!859425 condMapEmpty!26486) mapIsEmpty!26486))

(assert (= (and b!859425 (not condMapEmpty!26486)) mapNonEmpty!26486))

(get-info :version)

(assert (= (and mapNonEmpty!26486 ((_ is ValueCellFull!7856) mapValue!26486)) b!859419))

(assert (= (and b!859425 ((_ is ValueCellFull!7856) mapDefault!26486)) b!859418))

(assert (= start!73522 b!859425))

(declare-fun b_lambda!11789 () Bool)

(assert (=> (not b_lambda!11789) (not b!859421)))

(declare-fun t!23540 () Bool)

(declare-fun tb!4569 () Bool)

(assert (=> (and start!73522 (= defaultEntry!696 defaultEntry!696) t!23540) tb!4569))

(declare-fun result!8757 () Bool)

(assert (=> tb!4569 (= result!8757 tp_is_empty!16591)))

(assert (=> b!859421 t!23540))

(declare-fun b_and!23865 () Bool)

(assert (= b_and!23863 (and (=> t!23540 result!8757) b_and!23865)))

(declare-fun m!799659 () Bool)

(assert (=> b!859424 m!799659))

(declare-fun m!799661 () Bool)

(assert (=> b!859423 m!799661))

(declare-fun m!799663 () Bool)

(assert (=> start!73522 m!799663))

(declare-fun m!799665 () Bool)

(assert (=> start!73522 m!799665))

(declare-fun m!799667 () Bool)

(assert (=> b!859416 m!799667))

(declare-fun m!799669 () Bool)

(assert (=> b!859420 m!799669))

(declare-fun m!799671 () Bool)

(assert (=> b!859421 m!799671))

(declare-fun m!799673 () Bool)

(assert (=> b!859421 m!799673))

(declare-fun m!799675 () Bool)

(assert (=> b!859421 m!799675))

(assert (=> b!859421 m!799671))

(declare-fun m!799677 () Bool)

(assert (=> b!859421 m!799677))

(declare-fun m!799679 () Bool)

(assert (=> b!859421 m!799679))

(assert (=> b!859421 m!799673))

(declare-fun m!799681 () Bool)

(assert (=> mapNonEmpty!26486 m!799681))

(declare-fun m!799683 () Bool)

(assert (=> b!859422 m!799683))

(declare-fun m!799685 () Bool)

(assert (=> b!859422 m!799685))

(declare-fun m!799687 () Bool)

(assert (=> b!859422 m!799687))

(declare-fun m!799689 () Bool)

(assert (=> b!859428 m!799689))

(declare-fun m!799691 () Bool)

(assert (=> b!859415 m!799691))

(declare-fun m!799693 () Bool)

(assert (=> b!859417 m!799693))

(declare-fun m!799695 () Bool)

(assert (=> b!859417 m!799695))

(declare-fun m!799697 () Bool)

(assert (=> b!859417 m!799697))

(assert (=> b!859417 m!799679))

(declare-fun m!799699 () Bool)

(assert (=> b!859417 m!799699))

(assert (=> b!859417 m!799679))

(declare-fun m!799701 () Bool)

(assert (=> b!859417 m!799701))

(declare-fun m!799703 () Bool)

(assert (=> b!859429 m!799703))

(declare-fun m!799705 () Bool)

(assert (=> b!859426 m!799705))

(declare-fun m!799707 () Bool)

(assert (=> b!859427 m!799707))

(declare-fun m!799709 () Bool)

(assert (=> b!859427 m!799709))

(declare-fun m!799711 () Bool)

(assert (=> b!859427 m!799711))

(declare-fun m!799713 () Bool)

(assert (=> b!859427 m!799713))

(check-sat (not start!73522) (not b!859421) (not b!859416) (not b!859426) (not mapNonEmpty!26486) (not b!859420) (not b_next!14455) (not b!859415) (not b!859423) (not b!859428) tp_is_empty!16591 (not b!859422) (not b!859417) (not b!859427) (not b!859429) (not b_lambda!11789) b_and!23865)
(check-sat b_and!23865 (not b_next!14455))
