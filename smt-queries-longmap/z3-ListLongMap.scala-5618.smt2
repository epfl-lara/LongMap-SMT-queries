; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73494 () Bool)

(assert start!73494)

(declare-fun b_free!14409 () Bool)

(declare-fun b_next!14409 () Bool)

(assert (=> start!73494 (= b_free!14409 (not b_next!14409))))

(declare-fun tp!50731 () Bool)

(declare-fun b_and!23797 () Bool)

(assert (=> start!73494 (= tp!50731 b_and!23797)))

(declare-fun b!858582 () Bool)

(declare-fun res!583302 () Bool)

(declare-fun e!478485 () Bool)

(assert (=> b!858582 (=> (not res!583302) (not e!478485))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49274 0))(
  ( (array!49275 (arr!23668 (Array (_ BitVec 32) (_ BitVec 64))) (size!24108 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49274)

(assert (=> b!858582 (= res!583302 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24108 _keys!868))))))

(declare-fun b!858583 () Bool)

(declare-fun res!583296 () Bool)

(assert (=> b!858583 (=> (not res!583296) (not e!478485))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858583 (= res!583296 (validMask!0 mask!1196))))

(declare-fun b!858584 () Bool)

(declare-fun res!583301 () Bool)

(assert (=> b!858584 (=> (not res!583301) (not e!478485))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27107 0))(
  ( (V!27108 (val!8320 Int)) )
))
(declare-datatypes ((ValueCell!7833 0))(
  ( (ValueCellFull!7833 (v!10745 V!27107)) (EmptyCell!7833) )
))
(declare-datatypes ((array!49276 0))(
  ( (array!49277 (arr!23669 (Array (_ BitVec 32) ValueCell!7833)) (size!24109 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49276)

(assert (=> b!858584 (= res!583301 (and (= (size!24109 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24108 _keys!868) (size!24109 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858585 () Bool)

(declare-fun e!478492 () Bool)

(assert (=> b!858585 (= e!478492 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16790 0))(
  ( (Nil!16787) (Cons!16786 (h!17917 (_ BitVec 64)) (t!23465 List!16790)) )
))
(declare-fun arrayNoDuplicates!0 (array!49274 (_ BitVec 32) List!16790) Bool)

(assert (=> b!858585 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16787)))

(declare-datatypes ((Unit!29273 0))(
  ( (Unit!29274) )
))
(declare-fun lt!386800 () Unit!29273)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49274 (_ BitVec 32) (_ BitVec 32)) Unit!29273)

(assert (=> b!858585 (= lt!386800 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858586 () Bool)

(declare-fun e!478490 () Bool)

(assert (=> b!858586 (= e!478485 e!478490)))

(declare-fun res!583297 () Bool)

(assert (=> b!858586 (=> (not res!583297) (not e!478490))))

(assert (=> b!858586 (= res!583297 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27107)

(declare-fun zeroValue!654 () V!27107)

(declare-fun lt!386799 () array!49276)

(declare-datatypes ((tuple2!10982 0))(
  ( (tuple2!10983 (_1!5502 (_ BitVec 64)) (_2!5502 V!27107)) )
))
(declare-datatypes ((List!16791 0))(
  ( (Nil!16788) (Cons!16787 (h!17918 tuple2!10982) (t!23466 List!16791)) )
))
(declare-datatypes ((ListLongMap!9751 0))(
  ( (ListLongMap!9752 (toList!4891 List!16791)) )
))
(declare-fun lt!386797 () ListLongMap!9751)

(declare-fun getCurrentListMapNoExtraKeys!2871 (array!49274 array!49276 (_ BitVec 32) (_ BitVec 32) V!27107 V!27107 (_ BitVec 32) Int) ListLongMap!9751)

(assert (=> b!858586 (= lt!386797 (getCurrentListMapNoExtraKeys!2871 _keys!868 lt!386799 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27107)

(assert (=> b!858586 (= lt!386799 (array!49277 (store (arr!23669 _values!688) i!612 (ValueCellFull!7833 v!557)) (size!24109 _values!688)))))

(declare-fun lt!386795 () ListLongMap!9751)

(assert (=> b!858586 (= lt!386795 (getCurrentListMapNoExtraKeys!2871 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26417 () Bool)

(declare-fun mapRes!26417 () Bool)

(assert (=> mapIsEmpty!26417 mapRes!26417))

(declare-fun b!858587 () Bool)

(declare-fun e!478488 () Bool)

(declare-fun tp_is_empty!16545 () Bool)

(assert (=> b!858587 (= e!478488 tp_is_empty!16545)))

(declare-fun b!858588 () Bool)

(declare-fun res!583298 () Bool)

(assert (=> b!858588 (=> (not res!583298) (not e!478485))))

(assert (=> b!858588 (= res!583298 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16787))))

(declare-fun b!858589 () Bool)

(declare-fun res!583303 () Bool)

(assert (=> b!858589 (=> (not res!583303) (not e!478485))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!858589 (= res!583303 (and (= (select (arr!23668 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858591 () Bool)

(declare-fun e!478486 () Bool)

(assert (=> b!858591 (= e!478486 e!478492)))

(declare-fun res!583304 () Bool)

(assert (=> b!858591 (=> res!583304 e!478492)))

(assert (=> b!858591 (= res!583304 (not (= (select (arr!23668 _keys!868) from!1053) k0!854)))))

(declare-fun lt!386796 () ListLongMap!9751)

(declare-fun +!2244 (ListLongMap!9751 tuple2!10982) ListLongMap!9751)

(declare-fun get!12464 (ValueCell!7833 V!27107) V!27107)

(declare-fun dynLambda!1084 (Int (_ BitVec 64)) V!27107)

(assert (=> b!858591 (= lt!386797 (+!2244 lt!386796 (tuple2!10983 (select (arr!23668 _keys!868) from!1053) (get!12464 (select (arr!23669 _values!688) from!1053) (dynLambda!1084 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858592 () Bool)

(declare-fun res!583294 () Bool)

(assert (=> b!858592 (=> (not res!583294) (not e!478485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858592 (= res!583294 (validKeyInArray!0 k0!854))))

(declare-fun b!858593 () Bool)

(declare-fun e!478491 () Bool)

(assert (=> b!858593 (= e!478491 tp_is_empty!16545)))

(declare-fun b!858594 () Bool)

(declare-fun res!583299 () Bool)

(assert (=> b!858594 (=> (not res!583299) (not e!478485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49274 (_ BitVec 32)) Bool)

(assert (=> b!858594 (= res!583299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!583300 () Bool)

(assert (=> start!73494 (=> (not res!583300) (not e!478485))))

(assert (=> start!73494 (= res!583300 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24108 _keys!868))))))

(assert (=> start!73494 e!478485))

(assert (=> start!73494 tp_is_empty!16545))

(assert (=> start!73494 true))

(assert (=> start!73494 tp!50731))

(declare-fun array_inv!18746 (array!49274) Bool)

(assert (=> start!73494 (array_inv!18746 _keys!868)))

(declare-fun e!478487 () Bool)

(declare-fun array_inv!18747 (array!49276) Bool)

(assert (=> start!73494 (and (array_inv!18747 _values!688) e!478487)))

(declare-fun b!858590 () Bool)

(assert (=> b!858590 (= e!478487 (and e!478491 mapRes!26417))))

(declare-fun condMapEmpty!26417 () Bool)

(declare-fun mapDefault!26417 () ValueCell!7833)

(assert (=> b!858590 (= condMapEmpty!26417 (= (arr!23669 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7833)) mapDefault!26417)))))

(declare-fun mapNonEmpty!26417 () Bool)

(declare-fun tp!50730 () Bool)

(assert (=> mapNonEmpty!26417 (= mapRes!26417 (and tp!50730 e!478488))))

(declare-fun mapValue!26417 () ValueCell!7833)

(declare-fun mapRest!26417 () (Array (_ BitVec 32) ValueCell!7833))

(declare-fun mapKey!26417 () (_ BitVec 32))

(assert (=> mapNonEmpty!26417 (= (arr!23669 _values!688) (store mapRest!26417 mapKey!26417 mapValue!26417))))

(declare-fun b!858595 () Bool)

(assert (=> b!858595 (= e!478490 (not e!478486))))

(declare-fun res!583295 () Bool)

(assert (=> b!858595 (=> res!583295 e!478486)))

(assert (=> b!858595 (= res!583295 (not (validKeyInArray!0 (select (arr!23668 _keys!868) from!1053))))))

(declare-fun lt!386793 () ListLongMap!9751)

(assert (=> b!858595 (= lt!386793 lt!386796)))

(declare-fun lt!386794 () ListLongMap!9751)

(assert (=> b!858595 (= lt!386796 (+!2244 lt!386794 (tuple2!10983 k0!854 v!557)))))

(assert (=> b!858595 (= lt!386793 (getCurrentListMapNoExtraKeys!2871 _keys!868 lt!386799 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858595 (= lt!386794 (getCurrentListMapNoExtraKeys!2871 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386798 () Unit!29273)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!463 (array!49274 array!49276 (_ BitVec 32) (_ BitVec 32) V!27107 V!27107 (_ BitVec 32) (_ BitVec 64) V!27107 (_ BitVec 32) Int) Unit!29273)

(assert (=> b!858595 (= lt!386798 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!463 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73494 res!583300) b!858583))

(assert (= (and b!858583 res!583296) b!858584))

(assert (= (and b!858584 res!583301) b!858594))

(assert (= (and b!858594 res!583299) b!858588))

(assert (= (and b!858588 res!583298) b!858582))

(assert (= (and b!858582 res!583302) b!858592))

(assert (= (and b!858592 res!583294) b!858589))

(assert (= (and b!858589 res!583303) b!858586))

(assert (= (and b!858586 res!583297) b!858595))

(assert (= (and b!858595 (not res!583295)) b!858591))

(assert (= (and b!858591 (not res!583304)) b!858585))

(assert (= (and b!858590 condMapEmpty!26417) mapIsEmpty!26417))

(assert (= (and b!858590 (not condMapEmpty!26417)) mapNonEmpty!26417))

(get-info :version)

(assert (= (and mapNonEmpty!26417 ((_ is ValueCellFull!7833) mapValue!26417)) b!858587))

(assert (= (and b!858590 ((_ is ValueCellFull!7833) mapDefault!26417)) b!858593))

(assert (= start!73494 b!858590))

(declare-fun b_lambda!11761 () Bool)

(assert (=> (not b_lambda!11761) (not b!858591)))

(declare-fun t!23464 () Bool)

(declare-fun tb!4531 () Bool)

(assert (=> (and start!73494 (= defaultEntry!696 defaultEntry!696) t!23464) tb!4531))

(declare-fun result!8673 () Bool)

(assert (=> tb!4531 (= result!8673 tp_is_empty!16545)))

(assert (=> b!858591 t!23464))

(declare-fun b_and!23799 () Bool)

(assert (= b_and!23797 (and (=> t!23464 result!8673) b_and!23799)))

(declare-fun m!799299 () Bool)

(assert (=> mapNonEmpty!26417 m!799299))

(declare-fun m!799301 () Bool)

(assert (=> b!858594 m!799301))

(declare-fun m!799303 () Bool)

(assert (=> b!858585 m!799303))

(declare-fun m!799305 () Bool)

(assert (=> b!858585 m!799305))

(declare-fun m!799307 () Bool)

(assert (=> start!73494 m!799307))

(declare-fun m!799309 () Bool)

(assert (=> start!73494 m!799309))

(declare-fun m!799311 () Bool)

(assert (=> b!858595 m!799311))

(declare-fun m!799313 () Bool)

(assert (=> b!858595 m!799313))

(assert (=> b!858595 m!799311))

(declare-fun m!799315 () Bool)

(assert (=> b!858595 m!799315))

(declare-fun m!799317 () Bool)

(assert (=> b!858595 m!799317))

(declare-fun m!799319 () Bool)

(assert (=> b!858595 m!799319))

(declare-fun m!799321 () Bool)

(assert (=> b!858595 m!799321))

(declare-fun m!799323 () Bool)

(assert (=> b!858583 m!799323))

(declare-fun m!799325 () Bool)

(assert (=> b!858586 m!799325))

(declare-fun m!799327 () Bool)

(assert (=> b!858586 m!799327))

(declare-fun m!799329 () Bool)

(assert (=> b!858586 m!799329))

(declare-fun m!799331 () Bool)

(assert (=> b!858588 m!799331))

(declare-fun m!799333 () Bool)

(assert (=> b!858591 m!799333))

(declare-fun m!799335 () Bool)

(assert (=> b!858591 m!799335))

(declare-fun m!799337 () Bool)

(assert (=> b!858591 m!799337))

(declare-fun m!799339 () Bool)

(assert (=> b!858591 m!799339))

(assert (=> b!858591 m!799335))

(assert (=> b!858591 m!799311))

(assert (=> b!858591 m!799337))

(declare-fun m!799341 () Bool)

(assert (=> b!858592 m!799341))

(declare-fun m!799343 () Bool)

(assert (=> b!858589 m!799343))

(check-sat (not b!858591) (not b!858594) (not b!858588) (not b!858583) tp_is_empty!16545 (not b!858595) (not b_lambda!11761) (not mapNonEmpty!26417) (not b!858586) b_and!23799 (not start!73494) (not b!858592) (not b_next!14409) (not b!858585))
(check-sat b_and!23799 (not b_next!14409))
