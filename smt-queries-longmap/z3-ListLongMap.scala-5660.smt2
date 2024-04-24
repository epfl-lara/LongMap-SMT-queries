; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73912 () Bool)

(assert start!73912)

(declare-fun b_free!14659 () Bool)

(declare-fun b_next!14659 () Bool)

(assert (=> start!73912 (= b_free!14659 (not b_next!14659))))

(declare-fun tp!51481 () Bool)

(declare-fun b_and!24307 () Bool)

(assert (=> start!73912 (= tp!51481 b_and!24307)))

(declare-fun mapNonEmpty!26792 () Bool)

(declare-fun mapRes!26792 () Bool)

(declare-fun tp!51482 () Bool)

(declare-fun e!482307 () Bool)

(assert (=> mapNonEmpty!26792 (= mapRes!26792 (and tp!51482 e!482307))))

(declare-datatypes ((V!27441 0))(
  ( (V!27442 (val!8445 Int)) )
))
(declare-datatypes ((ValueCell!7958 0))(
  ( (ValueCellFull!7958 (v!10870 V!27441)) (EmptyCell!7958) )
))
(declare-fun mapRest!26792 () (Array (_ BitVec 32) ValueCell!7958))

(declare-fun mapValue!26792 () ValueCell!7958)

(declare-datatypes ((array!49801 0))(
  ( (array!49802 (arr!23927 (Array (_ BitVec 32) ValueCell!7958)) (size!24368 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49801)

(declare-fun mapKey!26792 () (_ BitVec 32))

(assert (=> mapNonEmpty!26792 (= (arr!23927 _values!688) (store mapRest!26792 mapKey!26792 mapValue!26792))))

(declare-fun b!865628 () Bool)

(declare-datatypes ((Unit!29581 0))(
  ( (Unit!29582) )
))
(declare-fun e!482305 () Unit!29581)

(declare-fun Unit!29583 () Unit!29581)

(assert (=> b!865628 (= e!482305 Unit!29583)))

(declare-fun b!865629 () Bool)

(declare-fun e!482310 () Bool)

(declare-fun tp_is_empty!16795 () Bool)

(assert (=> b!865629 (= e!482310 tp_is_empty!16795)))

(declare-fun b!865630 () Bool)

(declare-fun res!587922 () Bool)

(declare-fun e!482311 () Bool)

(assert (=> b!865630 (=> (not res!587922) (not e!482311))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865630 (= res!587922 (validKeyInArray!0 k0!854))))

(declare-fun b!865631 () Bool)

(declare-fun res!587923 () Bool)

(assert (=> b!865631 (=> (not res!587923) (not e!482311))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49803 0))(
  ( (array!49804 (arr!23928 (Array (_ BitVec 32) (_ BitVec 64))) (size!24369 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49803)

(assert (=> b!865631 (= res!587923 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24369 _keys!868))))))

(declare-fun b!865632 () Bool)

(declare-fun e!482309 () Bool)

(declare-fun e!482306 () Bool)

(assert (=> b!865632 (= e!482309 (not e!482306))))

(declare-fun res!587921 () Bool)

(assert (=> b!865632 (=> res!587921 e!482306)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865632 (= res!587921 (not (validKeyInArray!0 (select (arr!23928 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11108 0))(
  ( (tuple2!11109 (_1!5565 (_ BitVec 64)) (_2!5565 V!27441)) )
))
(declare-datatypes ((List!16938 0))(
  ( (Nil!16935) (Cons!16934 (h!18071 tuple2!11108) (t!23855 List!16938)) )
))
(declare-datatypes ((ListLongMap!9879 0))(
  ( (ListLongMap!9880 (toList!4955 List!16938)) )
))
(declare-fun lt!391839 () ListLongMap!9879)

(declare-fun lt!391838 () ListLongMap!9879)

(assert (=> b!865632 (= lt!391839 lt!391838)))

(declare-fun lt!391827 () ListLongMap!9879)

(declare-fun lt!391832 () tuple2!11108)

(declare-fun +!2358 (ListLongMap!9879 tuple2!11108) ListLongMap!9879)

(assert (=> b!865632 (= lt!391838 (+!2358 lt!391827 lt!391832))))

(declare-fun lt!391829 () array!49801)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27441)

(declare-fun zeroValue!654 () V!27441)

(declare-fun getCurrentListMapNoExtraKeys!3005 (array!49803 array!49801 (_ BitVec 32) (_ BitVec 32) V!27441 V!27441 (_ BitVec 32) Int) ListLongMap!9879)

(assert (=> b!865632 (= lt!391839 (getCurrentListMapNoExtraKeys!3005 _keys!868 lt!391829 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27441)

(assert (=> b!865632 (= lt!391832 (tuple2!11109 k0!854 v!557))))

(assert (=> b!865632 (= lt!391827 (getCurrentListMapNoExtraKeys!3005 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391828 () Unit!29581)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!541 (array!49803 array!49801 (_ BitVec 32) (_ BitVec 32) V!27441 V!27441 (_ BitVec 32) (_ BitVec 64) V!27441 (_ BitVec 32) Int) Unit!29581)

(assert (=> b!865632 (= lt!391828 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!541 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865633 () Bool)

(assert (=> b!865633 (= e!482307 tp_is_empty!16795)))

(declare-fun mapIsEmpty!26792 () Bool)

(assert (=> mapIsEmpty!26792 mapRes!26792))

(declare-fun b!865634 () Bool)

(declare-fun res!587926 () Bool)

(assert (=> b!865634 (=> (not res!587926) (not e!482311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865634 (= res!587926 (validMask!0 mask!1196))))

(declare-fun b!865635 () Bool)

(declare-fun res!587925 () Bool)

(assert (=> b!865635 (=> (not res!587925) (not e!482311))))

(assert (=> b!865635 (= res!587925 (and (= (select (arr!23928 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865636 () Bool)

(declare-fun e!482308 () Bool)

(assert (=> b!865636 (= e!482306 e!482308)))

(declare-fun res!587916 () Bool)

(assert (=> b!865636 (=> res!587916 e!482308)))

(assert (=> b!865636 (= res!587916 (= k0!854 (select (arr!23928 _keys!868) from!1053)))))

(assert (=> b!865636 (not (= (select (arr!23928 _keys!868) from!1053) k0!854))))

(declare-fun lt!391841 () Unit!29581)

(assert (=> b!865636 (= lt!391841 e!482305)))

(declare-fun c!92491 () Bool)

(assert (=> b!865636 (= c!92491 (= (select (arr!23928 _keys!868) from!1053) k0!854))))

(declare-fun lt!391830 () ListLongMap!9879)

(declare-fun lt!391836 () ListLongMap!9879)

(assert (=> b!865636 (= lt!391830 lt!391836)))

(declare-fun lt!391835 () tuple2!11108)

(assert (=> b!865636 (= lt!391836 (+!2358 lt!391838 lt!391835))))

(declare-fun lt!391833 () V!27441)

(assert (=> b!865636 (= lt!391835 (tuple2!11109 (select (arr!23928 _keys!868) from!1053) lt!391833))))

(declare-fun get!12651 (ValueCell!7958 V!27441) V!27441)

(declare-fun dynLambda!1181 (Int (_ BitVec 64)) V!27441)

(assert (=> b!865636 (= lt!391833 (get!12651 (select (arr!23927 _values!688) from!1053) (dynLambda!1181 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865637 () Bool)

(assert (=> b!865637 (= e!482308 true)))

(assert (=> b!865637 (= lt!391836 (+!2358 (+!2358 lt!391827 lt!391835) lt!391832))))

(declare-fun lt!391831 () Unit!29581)

(declare-fun addCommutativeForDiffKeys!508 (ListLongMap!9879 (_ BitVec 64) V!27441 (_ BitVec 64) V!27441) Unit!29581)

(assert (=> b!865637 (= lt!391831 (addCommutativeForDiffKeys!508 lt!391827 k0!854 v!557 (select (arr!23928 _keys!868) from!1053) lt!391833))))

(declare-fun b!865638 () Bool)

(declare-fun res!587919 () Bool)

(assert (=> b!865638 (=> (not res!587919) (not e!482311))))

(assert (=> b!865638 (= res!587919 (and (= (size!24368 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24369 _keys!868) (size!24368 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865639 () Bool)

(declare-fun res!587924 () Bool)

(assert (=> b!865639 (=> (not res!587924) (not e!482311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49803 (_ BitVec 32)) Bool)

(assert (=> b!865639 (= res!587924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865640 () Bool)

(declare-fun Unit!29584 () Unit!29581)

(assert (=> b!865640 (= e!482305 Unit!29584)))

(declare-fun lt!391834 () Unit!29581)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49803 (_ BitVec 32) (_ BitVec 32)) Unit!29581)

(assert (=> b!865640 (= lt!391834 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16939 0))(
  ( (Nil!16936) (Cons!16935 (h!18072 (_ BitVec 64)) (t!23856 List!16939)) )
))
(declare-fun arrayNoDuplicates!0 (array!49803 (_ BitVec 32) List!16939) Bool)

(assert (=> b!865640 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16936)))

(declare-fun lt!391840 () Unit!29581)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49803 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29581)

(assert (=> b!865640 (= lt!391840 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865640 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391837 () Unit!29581)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49803 (_ BitVec 64) (_ BitVec 32) List!16939) Unit!29581)

(assert (=> b!865640 (= lt!391837 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16936))))

(assert (=> b!865640 false))

(declare-fun res!587920 () Bool)

(assert (=> start!73912 (=> (not res!587920) (not e!482311))))

(assert (=> start!73912 (= res!587920 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24369 _keys!868))))))

(assert (=> start!73912 e!482311))

(assert (=> start!73912 tp_is_empty!16795))

(assert (=> start!73912 true))

(assert (=> start!73912 tp!51481))

(declare-fun array_inv!18972 (array!49803) Bool)

(assert (=> start!73912 (array_inv!18972 _keys!868)))

(declare-fun e!482304 () Bool)

(declare-fun array_inv!18973 (array!49801) Bool)

(assert (=> start!73912 (and (array_inv!18973 _values!688) e!482304)))

(declare-fun b!865641 () Bool)

(assert (=> b!865641 (= e!482311 e!482309)))

(declare-fun res!587917 () Bool)

(assert (=> b!865641 (=> (not res!587917) (not e!482309))))

(assert (=> b!865641 (= res!587917 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865641 (= lt!391830 (getCurrentListMapNoExtraKeys!3005 _keys!868 lt!391829 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865641 (= lt!391829 (array!49802 (store (arr!23927 _values!688) i!612 (ValueCellFull!7958 v!557)) (size!24368 _values!688)))))

(declare-fun lt!391826 () ListLongMap!9879)

(assert (=> b!865641 (= lt!391826 (getCurrentListMapNoExtraKeys!3005 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865642 () Bool)

(declare-fun res!587918 () Bool)

(assert (=> b!865642 (=> (not res!587918) (not e!482311))))

(assert (=> b!865642 (= res!587918 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16936))))

(declare-fun b!865643 () Bool)

(assert (=> b!865643 (= e!482304 (and e!482310 mapRes!26792))))

(declare-fun condMapEmpty!26792 () Bool)

(declare-fun mapDefault!26792 () ValueCell!7958)

(assert (=> b!865643 (= condMapEmpty!26792 (= (arr!23927 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7958)) mapDefault!26792)))))

(assert (= (and start!73912 res!587920) b!865634))

(assert (= (and b!865634 res!587926) b!865638))

(assert (= (and b!865638 res!587919) b!865639))

(assert (= (and b!865639 res!587924) b!865642))

(assert (= (and b!865642 res!587918) b!865631))

(assert (= (and b!865631 res!587923) b!865630))

(assert (= (and b!865630 res!587922) b!865635))

(assert (= (and b!865635 res!587925) b!865641))

(assert (= (and b!865641 res!587917) b!865632))

(assert (= (and b!865632 (not res!587921)) b!865636))

(assert (= (and b!865636 c!92491) b!865640))

(assert (= (and b!865636 (not c!92491)) b!865628))

(assert (= (and b!865636 (not res!587916)) b!865637))

(assert (= (and b!865643 condMapEmpty!26792) mapIsEmpty!26792))

(assert (= (and b!865643 (not condMapEmpty!26792)) mapNonEmpty!26792))

(get-info :version)

(assert (= (and mapNonEmpty!26792 ((_ is ValueCellFull!7958) mapValue!26792)) b!865633))

(assert (= (and b!865643 ((_ is ValueCellFull!7958) mapDefault!26792)) b!865629))

(assert (= start!73912 b!865643))

(declare-fun b_lambda!12025 () Bool)

(assert (=> (not b_lambda!12025) (not b!865636)))

(declare-fun t!23854 () Bool)

(declare-fun tb!4773 () Bool)

(assert (=> (and start!73912 (= defaultEntry!696 defaultEntry!696) t!23854) tb!4773))

(declare-fun result!9165 () Bool)

(assert (=> tb!4773 (= result!9165 tp_is_empty!16795)))

(assert (=> b!865636 t!23854))

(declare-fun b_and!24309 () Bool)

(assert (= b_and!24307 (and (=> t!23854 result!9165) b_and!24309)))

(declare-fun m!807401 () Bool)

(assert (=> b!865642 m!807401))

(declare-fun m!807403 () Bool)

(assert (=> b!865637 m!807403))

(assert (=> b!865637 m!807403))

(declare-fun m!807405 () Bool)

(assert (=> b!865637 m!807405))

(declare-fun m!807407 () Bool)

(assert (=> b!865637 m!807407))

(assert (=> b!865637 m!807407))

(declare-fun m!807409 () Bool)

(assert (=> b!865637 m!807409))

(declare-fun m!807411 () Bool)

(assert (=> b!865641 m!807411))

(declare-fun m!807413 () Bool)

(assert (=> b!865641 m!807413))

(declare-fun m!807415 () Bool)

(assert (=> b!865641 m!807415))

(declare-fun m!807417 () Bool)

(assert (=> start!73912 m!807417))

(declare-fun m!807419 () Bool)

(assert (=> start!73912 m!807419))

(declare-fun m!807421 () Bool)

(assert (=> b!865636 m!807421))

(declare-fun m!807423 () Bool)

(assert (=> b!865636 m!807423))

(declare-fun m!807425 () Bool)

(assert (=> b!865636 m!807425))

(assert (=> b!865636 m!807421))

(declare-fun m!807427 () Bool)

(assert (=> b!865636 m!807427))

(assert (=> b!865636 m!807407))

(assert (=> b!865636 m!807423))

(declare-fun m!807429 () Bool)

(assert (=> b!865635 m!807429))

(declare-fun m!807431 () Bool)

(assert (=> mapNonEmpty!26792 m!807431))

(declare-fun m!807433 () Bool)

(assert (=> b!865632 m!807433))

(declare-fun m!807435 () Bool)

(assert (=> b!865632 m!807435))

(assert (=> b!865632 m!807407))

(declare-fun m!807437 () Bool)

(assert (=> b!865632 m!807437))

(assert (=> b!865632 m!807407))

(declare-fun m!807439 () Bool)

(assert (=> b!865632 m!807439))

(declare-fun m!807441 () Bool)

(assert (=> b!865632 m!807441))

(declare-fun m!807443 () Bool)

(assert (=> b!865639 m!807443))

(declare-fun m!807445 () Bool)

(assert (=> b!865640 m!807445))

(declare-fun m!807447 () Bool)

(assert (=> b!865640 m!807447))

(declare-fun m!807449 () Bool)

(assert (=> b!865640 m!807449))

(declare-fun m!807451 () Bool)

(assert (=> b!865640 m!807451))

(declare-fun m!807453 () Bool)

(assert (=> b!865640 m!807453))

(declare-fun m!807455 () Bool)

(assert (=> b!865630 m!807455))

(declare-fun m!807457 () Bool)

(assert (=> b!865634 m!807457))

(check-sat (not b!865640) b_and!24309 (not start!73912) (not b!865634) (not b!865636) (not b_next!14659) (not b_lambda!12025) (not mapNonEmpty!26792) (not b!865641) (not b!865639) (not b!865637) (not b!865630) tp_is_empty!16795 (not b!865642) (not b!865632))
(check-sat b_and!24309 (not b_next!14659))
