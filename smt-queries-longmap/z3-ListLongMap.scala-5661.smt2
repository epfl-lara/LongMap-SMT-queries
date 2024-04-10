; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73752 () Bool)

(assert start!73752)

(declare-fun b_free!14667 () Bool)

(declare-fun b_next!14667 () Bool)

(assert (=> start!73752 (= b_free!14667 (not b_next!14667))))

(declare-fun tp!51504 () Bool)

(declare-fun b_and!24313 () Bool)

(assert (=> start!73752 (= tp!51504 b_and!24313)))

(declare-fun b!864925 () Bool)

(declare-fun e!481831 () Bool)

(declare-fun e!481830 () Bool)

(assert (=> b!864925 (= e!481831 e!481830)))

(declare-fun res!587705 () Bool)

(assert (=> b!864925 (=> (not res!587705) (not e!481830))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864925 (= res!587705 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27451 0))(
  ( (V!27452 (val!8449 Int)) )
))
(declare-datatypes ((tuple2!11194 0))(
  ( (tuple2!11195 (_1!5608 (_ BitVec 64)) (_2!5608 V!27451)) )
))
(declare-datatypes ((List!16997 0))(
  ( (Nil!16994) (Cons!16993 (h!18124 tuple2!11194) (t!23930 List!16997)) )
))
(declare-datatypes ((ListLongMap!9963 0))(
  ( (ListLongMap!9964 (toList!4997 List!16997)) )
))
(declare-fun lt!391661 () ListLongMap!9963)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49766 0))(
  ( (array!49767 (arr!23914 (Array (_ BitVec 32) (_ BitVec 64))) (size!24354 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49766)

(declare-fun minValue!654 () V!27451)

(declare-fun zeroValue!654 () V!27451)

(declare-datatypes ((ValueCell!7962 0))(
  ( (ValueCellFull!7962 (v!10874 V!27451)) (EmptyCell!7962) )
))
(declare-datatypes ((array!49768 0))(
  ( (array!49769 (arr!23915 (Array (_ BitVec 32) ValueCell!7962)) (size!24355 (_ BitVec 32))) )
))
(declare-fun lt!391669 () array!49768)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2968 (array!49766 array!49768 (_ BitVec 32) (_ BitVec 32) V!27451 V!27451 (_ BitVec 32) Int) ListLongMap!9963)

(assert (=> b!864925 (= lt!391661 (getCurrentListMapNoExtraKeys!2968 _keys!868 lt!391669 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27451)

(declare-fun _values!688 () array!49768)

(assert (=> b!864925 (= lt!391669 (array!49769 (store (arr!23915 _values!688) i!612 (ValueCellFull!7962 v!557)) (size!24355 _values!688)))))

(declare-fun lt!391667 () ListLongMap!9963)

(assert (=> b!864925 (= lt!391667 (getCurrentListMapNoExtraKeys!2968 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26804 () Bool)

(declare-fun mapRes!26804 () Bool)

(declare-fun tp!51505 () Bool)

(declare-fun e!481837 () Bool)

(assert (=> mapNonEmpty!26804 (= mapRes!26804 (and tp!51505 e!481837))))

(declare-fun mapKey!26804 () (_ BitVec 32))

(declare-fun mapValue!26804 () ValueCell!7962)

(declare-fun mapRest!26804 () (Array (_ BitVec 32) ValueCell!7962))

(assert (=> mapNonEmpty!26804 (= (arr!23915 _values!688) (store mapRest!26804 mapKey!26804 mapValue!26804))))

(declare-fun b!864926 () Bool)

(declare-fun e!481834 () Bool)

(declare-fun e!481832 () Bool)

(assert (=> b!864926 (= e!481834 (and e!481832 mapRes!26804))))

(declare-fun condMapEmpty!26804 () Bool)

(declare-fun mapDefault!26804 () ValueCell!7962)

(assert (=> b!864926 (= condMapEmpty!26804 (= (arr!23915 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7962)) mapDefault!26804)))))

(declare-fun b!864927 () Bool)

(declare-datatypes ((Unit!29606 0))(
  ( (Unit!29607) )
))
(declare-fun e!481836 () Unit!29606)

(declare-fun Unit!29608 () Unit!29606)

(assert (=> b!864927 (= e!481836 Unit!29608)))

(declare-fun lt!391658 () Unit!29606)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49766 (_ BitVec 32) (_ BitVec 32)) Unit!29606)

(assert (=> b!864927 (= lt!391658 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16998 0))(
  ( (Nil!16995) (Cons!16994 (h!18125 (_ BitVec 64)) (t!23931 List!16998)) )
))
(declare-fun arrayNoDuplicates!0 (array!49766 (_ BitVec 32) List!16998) Bool)

(assert (=> b!864927 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16995)))

(declare-fun lt!391671 () Unit!29606)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29606)

(assert (=> b!864927 (= lt!391671 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864927 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391660 () Unit!29606)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49766 (_ BitVec 64) (_ BitVec 32) List!16998) Unit!29606)

(assert (=> b!864927 (= lt!391660 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16995))))

(assert (=> b!864927 false))

(declare-fun b!864928 () Bool)

(declare-fun res!587707 () Bool)

(assert (=> b!864928 (=> (not res!587707) (not e!481831))))

(assert (=> b!864928 (= res!587707 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24354 _keys!868))))))

(declare-fun b!864929 () Bool)

(declare-fun res!587711 () Bool)

(assert (=> b!864929 (=> (not res!587711) (not e!481831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864929 (= res!587711 (validKeyInArray!0 k0!854))))

(declare-fun b!864930 () Bool)

(declare-fun tp_is_empty!16803 () Bool)

(assert (=> b!864930 (= e!481837 tp_is_empty!16803)))

(declare-fun b!864931 () Bool)

(declare-fun res!587714 () Bool)

(assert (=> b!864931 (=> (not res!587714) (not e!481831))))

(assert (=> b!864931 (= res!587714 (and (= (size!24355 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24354 _keys!868) (size!24355 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!587708 () Bool)

(assert (=> start!73752 (=> (not res!587708) (not e!481831))))

(assert (=> start!73752 (= res!587708 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24354 _keys!868))))))

(assert (=> start!73752 e!481831))

(assert (=> start!73752 tp_is_empty!16803))

(assert (=> start!73752 true))

(assert (=> start!73752 tp!51504))

(declare-fun array_inv!18908 (array!49766) Bool)

(assert (=> start!73752 (array_inv!18908 _keys!868)))

(declare-fun array_inv!18909 (array!49768) Bool)

(assert (=> start!73752 (and (array_inv!18909 _values!688) e!481834)))

(declare-fun b!864932 () Bool)

(declare-fun Unit!29609 () Unit!29606)

(assert (=> b!864932 (= e!481836 Unit!29609)))

(declare-fun b!864933 () Bool)

(declare-fun res!587704 () Bool)

(assert (=> b!864933 (=> (not res!587704) (not e!481831))))

(assert (=> b!864933 (= res!587704 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16995))))

(declare-fun b!864934 () Bool)

(assert (=> b!864934 (= e!481832 tp_is_empty!16803)))

(declare-fun b!864935 () Bool)

(declare-fun e!481829 () Bool)

(declare-fun e!481833 () Bool)

(assert (=> b!864935 (= e!481829 e!481833)))

(declare-fun res!587709 () Bool)

(assert (=> b!864935 (=> res!587709 e!481833)))

(assert (=> b!864935 (= res!587709 (= k0!854 (select (arr!23914 _keys!868) from!1053)))))

(assert (=> b!864935 (not (= (select (arr!23914 _keys!868) from!1053) k0!854))))

(declare-fun lt!391670 () Unit!29606)

(assert (=> b!864935 (= lt!391670 e!481836)))

(declare-fun c!92221 () Bool)

(assert (=> b!864935 (= c!92221 (= (select (arr!23914 _keys!868) from!1053) k0!854))))

(declare-fun lt!391662 () ListLongMap!9963)

(assert (=> b!864935 (= lt!391661 lt!391662)))

(declare-fun lt!391668 () ListLongMap!9963)

(declare-fun lt!391664 () tuple2!11194)

(declare-fun +!2346 (ListLongMap!9963 tuple2!11194) ListLongMap!9963)

(assert (=> b!864935 (= lt!391662 (+!2346 lt!391668 lt!391664))))

(declare-fun lt!391666 () V!27451)

(assert (=> b!864935 (= lt!391664 (tuple2!11195 (select (arr!23914 _keys!868) from!1053) lt!391666))))

(declare-fun get!12636 (ValueCell!7962 V!27451) V!27451)

(declare-fun dynLambda!1170 (Int (_ BitVec 64)) V!27451)

(assert (=> b!864935 (= lt!391666 (get!12636 (select (arr!23915 _values!688) from!1053) (dynLambda!1170 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!26804 () Bool)

(assert (=> mapIsEmpty!26804 mapRes!26804))

(declare-fun b!864936 () Bool)

(assert (=> b!864936 (= e!481830 (not e!481829))))

(declare-fun res!587712 () Bool)

(assert (=> b!864936 (=> res!587712 e!481829)))

(assert (=> b!864936 (= res!587712 (not (validKeyInArray!0 (select (arr!23914 _keys!868) from!1053))))))

(declare-fun lt!391659 () ListLongMap!9963)

(assert (=> b!864936 (= lt!391659 lt!391668)))

(declare-fun lt!391672 () ListLongMap!9963)

(declare-fun lt!391663 () tuple2!11194)

(assert (=> b!864936 (= lt!391668 (+!2346 lt!391672 lt!391663))))

(assert (=> b!864936 (= lt!391659 (getCurrentListMapNoExtraKeys!2968 _keys!868 lt!391669 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864936 (= lt!391663 (tuple2!11195 k0!854 v!557))))

(assert (=> b!864936 (= lt!391672 (getCurrentListMapNoExtraKeys!2968 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391665 () Unit!29606)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!548 (array!49766 array!49768 (_ BitVec 32) (_ BitVec 32) V!27451 V!27451 (_ BitVec 32) (_ BitVec 64) V!27451 (_ BitVec 32) Int) Unit!29606)

(assert (=> b!864936 (= lt!391665 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!548 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864937 () Bool)

(declare-fun res!587710 () Bool)

(assert (=> b!864937 (=> (not res!587710) (not e!481831))))

(assert (=> b!864937 (= res!587710 (and (= (select (arr!23914 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864938 () Bool)

(assert (=> b!864938 (= e!481833 true)))

(assert (=> b!864938 (= lt!391662 (+!2346 (+!2346 lt!391672 lt!391664) lt!391663))))

(declare-fun lt!391657 () Unit!29606)

(declare-fun addCommutativeForDiffKeys!516 (ListLongMap!9963 (_ BitVec 64) V!27451 (_ BitVec 64) V!27451) Unit!29606)

(assert (=> b!864938 (= lt!391657 (addCommutativeForDiffKeys!516 lt!391672 k0!854 v!557 (select (arr!23914 _keys!868) from!1053) lt!391666))))

(declare-fun b!864939 () Bool)

(declare-fun res!587706 () Bool)

(assert (=> b!864939 (=> (not res!587706) (not e!481831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864939 (= res!587706 (validMask!0 mask!1196))))

(declare-fun b!864940 () Bool)

(declare-fun res!587713 () Bool)

(assert (=> b!864940 (=> (not res!587713) (not e!481831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49766 (_ BitVec 32)) Bool)

(assert (=> b!864940 (= res!587713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73752 res!587708) b!864939))

(assert (= (and b!864939 res!587706) b!864931))

(assert (= (and b!864931 res!587714) b!864940))

(assert (= (and b!864940 res!587713) b!864933))

(assert (= (and b!864933 res!587704) b!864928))

(assert (= (and b!864928 res!587707) b!864929))

(assert (= (and b!864929 res!587711) b!864937))

(assert (= (and b!864937 res!587710) b!864925))

(assert (= (and b!864925 res!587705) b!864936))

(assert (= (and b!864936 (not res!587712)) b!864935))

(assert (= (and b!864935 c!92221) b!864927))

(assert (= (and b!864935 (not c!92221)) b!864932))

(assert (= (and b!864935 (not res!587709)) b!864938))

(assert (= (and b!864926 condMapEmpty!26804) mapIsEmpty!26804))

(assert (= (and b!864926 (not condMapEmpty!26804)) mapNonEmpty!26804))

(get-info :version)

(assert (= (and mapNonEmpty!26804 ((_ is ValueCellFull!7962) mapValue!26804)) b!864930))

(assert (= (and b!864926 ((_ is ValueCellFull!7962) mapDefault!26804)) b!864934))

(assert (= start!73752 b!864926))

(declare-fun b_lambda!12019 () Bool)

(assert (=> (not b_lambda!12019) (not b!864935)))

(declare-fun t!23929 () Bool)

(declare-fun tb!4789 () Bool)

(assert (=> (and start!73752 (= defaultEntry!696 defaultEntry!696) t!23929) tb!4789))

(declare-fun result!9189 () Bool)

(assert (=> tb!4789 (= result!9189 tp_is_empty!16803)))

(assert (=> b!864935 t!23929))

(declare-fun b_and!24315 () Bool)

(assert (= b_and!24313 (and (=> t!23929 result!9189) b_and!24315)))

(declare-fun m!806343 () Bool)

(assert (=> b!864939 m!806343))

(declare-fun m!806345 () Bool)

(assert (=> mapNonEmpty!26804 m!806345))

(declare-fun m!806347 () Bool)

(assert (=> start!73752 m!806347))

(declare-fun m!806349 () Bool)

(assert (=> start!73752 m!806349))

(declare-fun m!806351 () Bool)

(assert (=> b!864935 m!806351))

(declare-fun m!806353 () Bool)

(assert (=> b!864935 m!806353))

(declare-fun m!806355 () Bool)

(assert (=> b!864935 m!806355))

(assert (=> b!864935 m!806351))

(declare-fun m!806357 () Bool)

(assert (=> b!864935 m!806357))

(declare-fun m!806359 () Bool)

(assert (=> b!864935 m!806359))

(assert (=> b!864935 m!806353))

(declare-fun m!806361 () Bool)

(assert (=> b!864925 m!806361))

(declare-fun m!806363 () Bool)

(assert (=> b!864925 m!806363))

(declare-fun m!806365 () Bool)

(assert (=> b!864925 m!806365))

(declare-fun m!806367 () Bool)

(assert (=> b!864937 m!806367))

(declare-fun m!806369 () Bool)

(assert (=> b!864936 m!806369))

(assert (=> b!864936 m!806359))

(declare-fun m!806371 () Bool)

(assert (=> b!864936 m!806371))

(assert (=> b!864936 m!806359))

(declare-fun m!806373 () Bool)

(assert (=> b!864936 m!806373))

(declare-fun m!806375 () Bool)

(assert (=> b!864936 m!806375))

(declare-fun m!806377 () Bool)

(assert (=> b!864936 m!806377))

(declare-fun m!806379 () Bool)

(assert (=> b!864933 m!806379))

(declare-fun m!806381 () Bool)

(assert (=> b!864929 m!806381))

(declare-fun m!806383 () Bool)

(assert (=> b!864927 m!806383))

(declare-fun m!806385 () Bool)

(assert (=> b!864927 m!806385))

(declare-fun m!806387 () Bool)

(assert (=> b!864927 m!806387))

(declare-fun m!806389 () Bool)

(assert (=> b!864927 m!806389))

(declare-fun m!806391 () Bool)

(assert (=> b!864927 m!806391))

(declare-fun m!806393 () Bool)

(assert (=> b!864938 m!806393))

(assert (=> b!864938 m!806393))

(declare-fun m!806395 () Bool)

(assert (=> b!864938 m!806395))

(assert (=> b!864938 m!806359))

(assert (=> b!864938 m!806359))

(declare-fun m!806397 () Bool)

(assert (=> b!864938 m!806397))

(declare-fun m!806399 () Bool)

(assert (=> b!864940 m!806399))

(check-sat tp_is_empty!16803 (not b!864925) (not b_lambda!12019) (not b!864939) (not b!864927) (not mapNonEmpty!26804) (not b!864938) (not b_next!14667) (not b!864933) (not b!864935) (not start!73752) (not b!864929) (not b!864940) (not b!864936) b_and!24315)
(check-sat b_and!24315 (not b_next!14667))
