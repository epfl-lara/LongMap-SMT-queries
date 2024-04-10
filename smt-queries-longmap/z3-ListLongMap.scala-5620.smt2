; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73506 () Bool)

(assert start!73506)

(declare-fun b_free!14421 () Bool)

(declare-fun b_next!14421 () Bool)

(assert (=> start!73506 (= b_free!14421 (not b_next!14421))))

(declare-fun tp!50766 () Bool)

(declare-fun b_and!23821 () Bool)

(assert (=> start!73506 (= tp!50766 b_and!23821)))

(declare-fun b!858846 () Bool)

(declare-fun res!583502 () Bool)

(declare-fun e!478632 () Bool)

(assert (=> b!858846 (=> (not res!583502) (not e!478632))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49298 0))(
  ( (array!49299 (arr!23680 (Array (_ BitVec 32) (_ BitVec 64))) (size!24120 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49298)

(assert (=> b!858846 (= res!583502 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24120 _keys!868))))))

(declare-fun b!858847 () Bool)

(declare-fun res!583496 () Bool)

(assert (=> b!858847 (=> (not res!583496) (not e!478632))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27123 0))(
  ( (V!27124 (val!8326 Int)) )
))
(declare-datatypes ((ValueCell!7839 0))(
  ( (ValueCellFull!7839 (v!10751 V!27123)) (EmptyCell!7839) )
))
(declare-datatypes ((array!49300 0))(
  ( (array!49301 (arr!23681 (Array (_ BitVec 32) ValueCell!7839)) (size!24121 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49300)

(assert (=> b!858847 (= res!583496 (and (= (size!24121 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24120 _keys!868) (size!24121 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858848 () Bool)

(declare-fun e!478634 () Bool)

(assert (=> b!858848 (= e!478632 e!478634)))

(declare-fun res!583492 () Bool)

(assert (=> b!858848 (=> (not res!583492) (not e!478634))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858848 (= res!583492 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10992 0))(
  ( (tuple2!10993 (_1!5507 (_ BitVec 64)) (_2!5507 V!27123)) )
))
(declare-datatypes ((List!16801 0))(
  ( (Nil!16798) (Cons!16797 (h!17928 tuple2!10992) (t!23488 List!16801)) )
))
(declare-datatypes ((ListLongMap!9761 0))(
  ( (ListLongMap!9762 (toList!4896 List!16801)) )
))
(declare-fun lt!386938 () ListLongMap!9761)

(declare-fun lt!386937 () array!49300)

(declare-fun minValue!654 () V!27123)

(declare-fun zeroValue!654 () V!27123)

(declare-fun getCurrentListMapNoExtraKeys!2876 (array!49298 array!49300 (_ BitVec 32) (_ BitVec 32) V!27123 V!27123 (_ BitVec 32) Int) ListLongMap!9761)

(assert (=> b!858848 (= lt!386938 (getCurrentListMapNoExtraKeys!2876 _keys!868 lt!386937 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27123)

(assert (=> b!858848 (= lt!386937 (array!49301 (store (arr!23681 _values!688) i!612 (ValueCellFull!7839 v!557)) (size!24121 _values!688)))))

(declare-fun lt!386941 () ListLongMap!9761)

(assert (=> b!858848 (= lt!386941 (getCurrentListMapNoExtraKeys!2876 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858849 () Bool)

(declare-fun res!583493 () Bool)

(assert (=> b!858849 (=> (not res!583493) (not e!478632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858849 (= res!583493 (validMask!0 mask!1196))))

(declare-fun b!858850 () Bool)

(declare-fun e!478633 () Bool)

(declare-fun e!478630 () Bool)

(declare-fun mapRes!26435 () Bool)

(assert (=> b!858850 (= e!478633 (and e!478630 mapRes!26435))))

(declare-fun condMapEmpty!26435 () Bool)

(declare-fun mapDefault!26435 () ValueCell!7839)

(assert (=> b!858850 (= condMapEmpty!26435 (= (arr!23681 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7839)) mapDefault!26435)))))

(declare-fun mapIsEmpty!26435 () Bool)

(assert (=> mapIsEmpty!26435 mapRes!26435))

(declare-fun b!858851 () Bool)

(declare-fun e!478631 () Bool)

(declare-fun tp_is_empty!16557 () Bool)

(assert (=> b!858851 (= e!478631 tp_is_empty!16557)))

(declare-fun b!858852 () Bool)

(declare-fun res!583501 () Bool)

(assert (=> b!858852 (=> (not res!583501) (not e!478632))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!858852 (= res!583501 (and (= (select (arr!23680 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26435 () Bool)

(declare-fun tp!50767 () Bool)

(assert (=> mapNonEmpty!26435 (= mapRes!26435 (and tp!50767 e!478631))))

(declare-fun mapRest!26435 () (Array (_ BitVec 32) ValueCell!7839))

(declare-fun mapValue!26435 () ValueCell!7839)

(declare-fun mapKey!26435 () (_ BitVec 32))

(assert (=> mapNonEmpty!26435 (= (arr!23681 _values!688) (store mapRest!26435 mapKey!26435 mapValue!26435))))

(declare-fun b!858853 () Bool)

(declare-fun res!583495 () Bool)

(assert (=> b!858853 (=> (not res!583495) (not e!478632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49298 (_ BitVec 32)) Bool)

(assert (=> b!858853 (= res!583495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858854 () Bool)

(declare-fun res!583497 () Bool)

(assert (=> b!858854 (=> (not res!583497) (not e!478632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858854 (= res!583497 (validKeyInArray!0 k0!854))))

(declare-fun b!858855 () Bool)

(declare-fun e!478629 () Bool)

(assert (=> b!858855 (= e!478629 true)))

(declare-datatypes ((List!16802 0))(
  ( (Nil!16799) (Cons!16798 (h!17929 (_ BitVec 64)) (t!23489 List!16802)) )
))
(declare-fun arrayNoDuplicates!0 (array!49298 (_ BitVec 32) List!16802) Bool)

(assert (=> b!858855 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16799)))

(declare-datatypes ((Unit!29283 0))(
  ( (Unit!29284) )
))
(declare-fun lt!386944 () Unit!29283)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49298 (_ BitVec 32) (_ BitVec 32)) Unit!29283)

(assert (=> b!858855 (= lt!386944 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun res!583499 () Bool)

(assert (=> start!73506 (=> (not res!583499) (not e!478632))))

(assert (=> start!73506 (= res!583499 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24120 _keys!868))))))

(assert (=> start!73506 e!478632))

(assert (=> start!73506 tp_is_empty!16557))

(assert (=> start!73506 true))

(assert (=> start!73506 tp!50766))

(declare-fun array_inv!18754 (array!49298) Bool)

(assert (=> start!73506 (array_inv!18754 _keys!868)))

(declare-fun array_inv!18755 (array!49300) Bool)

(assert (=> start!73506 (and (array_inv!18755 _values!688) e!478633)))

(declare-fun b!858856 () Bool)

(declare-fun e!478635 () Bool)

(assert (=> b!858856 (= e!478635 e!478629)))

(declare-fun res!583500 () Bool)

(assert (=> b!858856 (=> res!583500 e!478629)))

(assert (=> b!858856 (= res!583500 (not (= (select (arr!23680 _keys!868) from!1053) k0!854)))))

(declare-fun lt!386943 () ListLongMap!9761)

(declare-fun +!2249 (ListLongMap!9761 tuple2!10992) ListLongMap!9761)

(declare-fun get!12473 (ValueCell!7839 V!27123) V!27123)

(declare-fun dynLambda!1089 (Int (_ BitVec 64)) V!27123)

(assert (=> b!858856 (= lt!386938 (+!2249 lt!386943 (tuple2!10993 (select (arr!23680 _keys!868) from!1053) (get!12473 (select (arr!23681 _values!688) from!1053) (dynLambda!1089 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858857 () Bool)

(assert (=> b!858857 (= e!478634 (not e!478635))))

(declare-fun res!583498 () Bool)

(assert (=> b!858857 (=> res!583498 e!478635)))

(assert (=> b!858857 (= res!583498 (not (validKeyInArray!0 (select (arr!23680 _keys!868) from!1053))))))

(declare-fun lt!386939 () ListLongMap!9761)

(assert (=> b!858857 (= lt!386939 lt!386943)))

(declare-fun lt!386940 () ListLongMap!9761)

(assert (=> b!858857 (= lt!386943 (+!2249 lt!386940 (tuple2!10993 k0!854 v!557)))))

(assert (=> b!858857 (= lt!386939 (getCurrentListMapNoExtraKeys!2876 _keys!868 lt!386937 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858857 (= lt!386940 (getCurrentListMapNoExtraKeys!2876 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386942 () Unit!29283)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!466 (array!49298 array!49300 (_ BitVec 32) (_ BitVec 32) V!27123 V!27123 (_ BitVec 32) (_ BitVec 64) V!27123 (_ BitVec 32) Int) Unit!29283)

(assert (=> b!858857 (= lt!386942 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!466 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858858 () Bool)

(declare-fun res!583494 () Bool)

(assert (=> b!858858 (=> (not res!583494) (not e!478632))))

(assert (=> b!858858 (= res!583494 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16799))))

(declare-fun b!858859 () Bool)

(assert (=> b!858859 (= e!478630 tp_is_empty!16557)))

(assert (= (and start!73506 res!583499) b!858849))

(assert (= (and b!858849 res!583493) b!858847))

(assert (= (and b!858847 res!583496) b!858853))

(assert (= (and b!858853 res!583495) b!858858))

(assert (= (and b!858858 res!583494) b!858846))

(assert (= (and b!858846 res!583502) b!858854))

(assert (= (and b!858854 res!583497) b!858852))

(assert (= (and b!858852 res!583501) b!858848))

(assert (= (and b!858848 res!583492) b!858857))

(assert (= (and b!858857 (not res!583498)) b!858856))

(assert (= (and b!858856 (not res!583500)) b!858855))

(assert (= (and b!858850 condMapEmpty!26435) mapIsEmpty!26435))

(assert (= (and b!858850 (not condMapEmpty!26435)) mapNonEmpty!26435))

(get-info :version)

(assert (= (and mapNonEmpty!26435 ((_ is ValueCellFull!7839) mapValue!26435)) b!858851))

(assert (= (and b!858850 ((_ is ValueCellFull!7839) mapDefault!26435)) b!858859))

(assert (= start!73506 b!858850))

(declare-fun b_lambda!11773 () Bool)

(assert (=> (not b_lambda!11773) (not b!858856)))

(declare-fun t!23487 () Bool)

(declare-fun tb!4543 () Bool)

(assert (=> (and start!73506 (= defaultEntry!696 defaultEntry!696) t!23487) tb!4543))

(declare-fun result!8697 () Bool)

(assert (=> tb!4543 (= result!8697 tp_is_empty!16557)))

(assert (=> b!858856 t!23487))

(declare-fun b_and!23823 () Bool)

(assert (= b_and!23821 (and (=> t!23487 result!8697) b_and!23823)))

(declare-fun m!799575 () Bool)

(assert (=> b!858858 m!799575))

(declare-fun m!799577 () Bool)

(assert (=> b!858856 m!799577))

(declare-fun m!799579 () Bool)

(assert (=> b!858856 m!799579))

(declare-fun m!799581 () Bool)

(assert (=> b!858856 m!799581))

(declare-fun m!799583 () Bool)

(assert (=> b!858856 m!799583))

(assert (=> b!858856 m!799579))

(declare-fun m!799585 () Bool)

(assert (=> b!858856 m!799585))

(assert (=> b!858856 m!799581))

(declare-fun m!799587 () Bool)

(assert (=> b!858854 m!799587))

(declare-fun m!799589 () Bool)

(assert (=> b!858857 m!799589))

(declare-fun m!799591 () Bool)

(assert (=> b!858857 m!799591))

(assert (=> b!858857 m!799585))

(declare-fun m!799593 () Bool)

(assert (=> b!858857 m!799593))

(assert (=> b!858857 m!799585))

(declare-fun m!799595 () Bool)

(assert (=> b!858857 m!799595))

(declare-fun m!799597 () Bool)

(assert (=> b!858857 m!799597))

(declare-fun m!799599 () Bool)

(assert (=> start!73506 m!799599))

(declare-fun m!799601 () Bool)

(assert (=> start!73506 m!799601))

(declare-fun m!799603 () Bool)

(assert (=> mapNonEmpty!26435 m!799603))

(declare-fun m!799605 () Bool)

(assert (=> b!858848 m!799605))

(declare-fun m!799607 () Bool)

(assert (=> b!858848 m!799607))

(declare-fun m!799609 () Bool)

(assert (=> b!858848 m!799609))

(declare-fun m!799611 () Bool)

(assert (=> b!858849 m!799611))

(declare-fun m!799613 () Bool)

(assert (=> b!858855 m!799613))

(declare-fun m!799615 () Bool)

(assert (=> b!858855 m!799615))

(declare-fun m!799617 () Bool)

(assert (=> b!858853 m!799617))

(declare-fun m!799619 () Bool)

(assert (=> b!858852 m!799619))

(check-sat (not b_next!14421) (not b!858853) (not start!73506) (not b_lambda!11773) b_and!23823 tp_is_empty!16557 (not b!858858) (not b!858855) (not b!858848) (not b!858856) (not b!858849) (not b!858854) (not b!858857) (not mapNonEmpty!26435))
(check-sat b_and!23823 (not b_next!14421))
