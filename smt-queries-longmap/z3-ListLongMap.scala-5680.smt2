; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73866 () Bool)

(assert start!73866)

(declare-fun b_free!14781 () Bool)

(declare-fun b_next!14781 () Bool)

(assert (=> start!73866 (= b_free!14781 (not b_next!14781))))

(declare-fun tp!51847 () Bool)

(declare-fun b_and!24533 () Bool)

(assert (=> start!73866 (= tp!51847 b_and!24533)))

(declare-fun b!867711 () Bool)

(declare-fun res!589565 () Bool)

(declare-fun e!483329 () Bool)

(assert (=> b!867711 (=> (not res!589565) (not e!483329))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49994 0))(
  ( (array!49995 (arr!24028 (Array (_ BitVec 32) (_ BitVec 64))) (size!24468 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49994)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867711 (= res!589565 (and (= (select (arr!24028 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867712 () Bool)

(declare-fun e!483331 () Bool)

(declare-fun tp_is_empty!16917 () Bool)

(assert (=> b!867712 (= e!483331 tp_is_empty!16917)))

(declare-fun b!867713 () Bool)

(declare-fun e!483330 () Bool)

(assert (=> b!867713 (= e!483329 e!483330)))

(declare-fun res!589564 () Bool)

(assert (=> b!867713 (=> (not res!589564) (not e!483330))))

(assert (=> b!867713 (= res!589564 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27603 0))(
  ( (V!27604 (val!8506 Int)) )
))
(declare-datatypes ((ValueCell!8019 0))(
  ( (ValueCellFull!8019 (v!10931 V!27603)) (EmptyCell!8019) )
))
(declare-datatypes ((array!49996 0))(
  ( (array!49997 (arr!24029 (Array (_ BitVec 32) ValueCell!8019)) (size!24469 (_ BitVec 32))) )
))
(declare-fun lt!394227 () array!49996)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27603)

(declare-fun zeroValue!654 () V!27603)

(declare-datatypes ((tuple2!11284 0))(
  ( (tuple2!11285 (_1!5653 (_ BitVec 64)) (_2!5653 V!27603)) )
))
(declare-datatypes ((List!17084 0))(
  ( (Nil!17081) (Cons!17080 (h!18211 tuple2!11284) (t!24121 List!17084)) )
))
(declare-datatypes ((ListLongMap!10053 0))(
  ( (ListLongMap!10054 (toList!5042 List!17084)) )
))
(declare-fun lt!394225 () ListLongMap!10053)

(declare-fun getCurrentListMapNoExtraKeys!3011 (array!49994 array!49996 (_ BitVec 32) (_ BitVec 32) V!27603 V!27603 (_ BitVec 32) Int) ListLongMap!10053)

(assert (=> b!867713 (= lt!394225 (getCurrentListMapNoExtraKeys!3011 _keys!868 lt!394227 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49996)

(declare-fun v!557 () V!27603)

(assert (=> b!867713 (= lt!394227 (array!49997 (store (arr!24029 _values!688) i!612 (ValueCellFull!8019 v!557)) (size!24469 _values!688)))))

(declare-fun lt!394228 () ListLongMap!10053)

(assert (=> b!867713 (= lt!394228 (getCurrentListMapNoExtraKeys!3011 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867714 () Bool)

(declare-fun res!589563 () Bool)

(assert (=> b!867714 (=> (not res!589563) (not e!483329))))

(declare-datatypes ((List!17085 0))(
  ( (Nil!17082) (Cons!17081 (h!18212 (_ BitVec 64)) (t!24122 List!17085)) )
))
(declare-fun arrayNoDuplicates!0 (array!49994 (_ BitVec 32) List!17085) Bool)

(assert (=> b!867714 (= res!589563 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17082))))

(declare-fun b!867715 () Bool)

(declare-fun res!589557 () Bool)

(assert (=> b!867715 (=> (not res!589557) (not e!483329))))

(assert (=> b!867715 (= res!589557 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24468 _keys!868))))))

(declare-fun b!867716 () Bool)

(declare-fun res!589560 () Bool)

(assert (=> b!867716 (=> (not res!589560) (not e!483329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867716 (= res!589560 (validKeyInArray!0 k0!854))))

(declare-fun b!867717 () Bool)

(assert (=> b!867717 (= e!483330 (not true))))

(declare-fun +!2388 (ListLongMap!10053 tuple2!11284) ListLongMap!10053)

(assert (=> b!867717 (= (getCurrentListMapNoExtraKeys!3011 _keys!868 lt!394227 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2388 (getCurrentListMapNoExtraKeys!3011 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11285 k0!854 v!557)))))

(declare-datatypes ((Unit!29774 0))(
  ( (Unit!29775) )
))
(declare-fun lt!394226 () Unit!29774)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!582 (array!49994 array!49996 (_ BitVec 32) (_ BitVec 32) V!27603 V!27603 (_ BitVec 32) (_ BitVec 64) V!27603 (_ BitVec 32) Int) Unit!29774)

(assert (=> b!867717 (= lt!394226 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!582 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867718 () Bool)

(declare-fun res!589562 () Bool)

(assert (=> b!867718 (=> (not res!589562) (not e!483329))))

(assert (=> b!867718 (= res!589562 (and (= (size!24469 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24468 _keys!868) (size!24469 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26975 () Bool)

(declare-fun mapRes!26975 () Bool)

(declare-fun tp!51846 () Bool)

(assert (=> mapNonEmpty!26975 (= mapRes!26975 (and tp!51846 e!483331))))

(declare-fun mapRest!26975 () (Array (_ BitVec 32) ValueCell!8019))

(declare-fun mapValue!26975 () ValueCell!8019)

(declare-fun mapKey!26975 () (_ BitVec 32))

(assert (=> mapNonEmpty!26975 (= (arr!24029 _values!688) (store mapRest!26975 mapKey!26975 mapValue!26975))))

(declare-fun res!589559 () Bool)

(assert (=> start!73866 (=> (not res!589559) (not e!483329))))

(assert (=> start!73866 (= res!589559 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24468 _keys!868))))))

(assert (=> start!73866 e!483329))

(assert (=> start!73866 tp_is_empty!16917))

(assert (=> start!73866 true))

(assert (=> start!73866 tp!51847))

(declare-fun array_inv!18984 (array!49994) Bool)

(assert (=> start!73866 (array_inv!18984 _keys!868)))

(declare-fun e!483327 () Bool)

(declare-fun array_inv!18985 (array!49996) Bool)

(assert (=> start!73866 (and (array_inv!18985 _values!688) e!483327)))

(declare-fun mapIsEmpty!26975 () Bool)

(assert (=> mapIsEmpty!26975 mapRes!26975))

(declare-fun b!867719 () Bool)

(declare-fun e!483326 () Bool)

(assert (=> b!867719 (= e!483326 tp_is_empty!16917)))

(declare-fun b!867720 () Bool)

(declare-fun res!589561 () Bool)

(assert (=> b!867720 (=> (not res!589561) (not e!483329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867720 (= res!589561 (validMask!0 mask!1196))))

(declare-fun b!867721 () Bool)

(declare-fun res!589558 () Bool)

(assert (=> b!867721 (=> (not res!589558) (not e!483329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49994 (_ BitVec 32)) Bool)

(assert (=> b!867721 (= res!589558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867722 () Bool)

(assert (=> b!867722 (= e!483327 (and e!483326 mapRes!26975))))

(declare-fun condMapEmpty!26975 () Bool)

(declare-fun mapDefault!26975 () ValueCell!8019)

(assert (=> b!867722 (= condMapEmpty!26975 (= (arr!24029 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8019)) mapDefault!26975)))))

(assert (= (and start!73866 res!589559) b!867720))

(assert (= (and b!867720 res!589561) b!867718))

(assert (= (and b!867718 res!589562) b!867721))

(assert (= (and b!867721 res!589558) b!867714))

(assert (= (and b!867714 res!589563) b!867715))

(assert (= (and b!867715 res!589557) b!867716))

(assert (= (and b!867716 res!589560) b!867711))

(assert (= (and b!867711 res!589565) b!867713))

(assert (= (and b!867713 res!589564) b!867717))

(assert (= (and b!867722 condMapEmpty!26975) mapIsEmpty!26975))

(assert (= (and b!867722 (not condMapEmpty!26975)) mapNonEmpty!26975))

(get-info :version)

(assert (= (and mapNonEmpty!26975 ((_ is ValueCellFull!8019) mapValue!26975)) b!867712))

(assert (= (and b!867722 ((_ is ValueCellFull!8019) mapDefault!26975)) b!867719))

(assert (= start!73866 b!867722))

(declare-fun m!809537 () Bool)

(assert (=> start!73866 m!809537))

(declare-fun m!809539 () Bool)

(assert (=> start!73866 m!809539))

(declare-fun m!809541 () Bool)

(assert (=> mapNonEmpty!26975 m!809541))

(declare-fun m!809543 () Bool)

(assert (=> b!867714 m!809543))

(declare-fun m!809545 () Bool)

(assert (=> b!867711 m!809545))

(declare-fun m!809547 () Bool)

(assert (=> b!867713 m!809547))

(declare-fun m!809549 () Bool)

(assert (=> b!867713 m!809549))

(declare-fun m!809551 () Bool)

(assert (=> b!867713 m!809551))

(declare-fun m!809553 () Bool)

(assert (=> b!867721 m!809553))

(declare-fun m!809555 () Bool)

(assert (=> b!867716 m!809555))

(declare-fun m!809557 () Bool)

(assert (=> b!867717 m!809557))

(declare-fun m!809559 () Bool)

(assert (=> b!867717 m!809559))

(assert (=> b!867717 m!809559))

(declare-fun m!809561 () Bool)

(assert (=> b!867717 m!809561))

(declare-fun m!809563 () Bool)

(assert (=> b!867717 m!809563))

(declare-fun m!809565 () Bool)

(assert (=> b!867720 m!809565))

(check-sat (not b_next!14781) (not start!73866) (not b!867716) (not b!867717) b_and!24533 tp_is_empty!16917 (not b!867713) (not b!867714) (not b!867720) (not b!867721) (not mapNonEmpty!26975))
(check-sat b_and!24533 (not b_next!14781))
