; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20432 () Bool)

(assert start!20432)

(declare-fun b_free!5091 () Bool)

(declare-fun b_next!5091 () Bool)

(assert (=> start!20432 (= b_free!5091 (not b_next!5091))))

(declare-fun tp!18304 () Bool)

(declare-fun b_and!11837 () Bool)

(assert (=> start!20432 (= tp!18304 b_and!11837)))

(declare-fun b!202266 () Bool)

(declare-fun res!96872 () Bool)

(declare-fun e!132505 () Bool)

(assert (=> b!202266 (=> (not res!96872) (not e!132505))))

(declare-datatypes ((array!9119 0))(
  ( (array!9120 (arr!4310 (Array (_ BitVec 32) (_ BitVec 64))) (size!4635 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9119)

(declare-datatypes ((List!2724 0))(
  ( (Nil!2721) (Cons!2720 (h!3362 (_ BitVec 64)) (t!7655 List!2724)) )
))
(declare-fun arrayNoDuplicates!0 (array!9119 (_ BitVec 32) List!2724) Bool)

(assert (=> b!202266 (= res!96872 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2721))))

(declare-fun b!202267 () Bool)

(declare-fun e!132507 () Bool)

(assert (=> b!202267 (= e!132507 (bvsle #b00000000000000000000000000000000 (size!4635 _keys!825)))))

(declare-datatypes ((V!6243 0))(
  ( (V!6244 (val!2518 Int)) )
))
(declare-datatypes ((tuple2!3816 0))(
  ( (tuple2!3817 (_1!1919 (_ BitVec 64)) (_2!1919 V!6243)) )
))
(declare-fun lt!101483 () tuple2!3816)

(declare-datatypes ((List!2725 0))(
  ( (Nil!2722) (Cons!2721 (h!3363 tuple2!3816) (t!7656 List!2725)) )
))
(declare-datatypes ((ListLongMap!2729 0))(
  ( (ListLongMap!2730 (toList!1380 List!2725)) )
))
(declare-fun lt!101473 () ListLongMap!2729)

(declare-fun lt!101476 () ListLongMap!2729)

(declare-fun lt!101482 () tuple2!3816)

(declare-fun +!407 (ListLongMap!2729 tuple2!3816) ListLongMap!2729)

(assert (=> b!202267 (= (+!407 lt!101476 lt!101483) (+!407 lt!101473 lt!101482))))

(declare-fun minValue!615 () V!6243)

(declare-fun lt!101486 () ListLongMap!2729)

(declare-fun v!520 () V!6243)

(declare-datatypes ((Unit!6114 0))(
  ( (Unit!6115) )
))
(declare-fun lt!101484 () Unit!6114)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!128 (ListLongMap!2729 (_ BitVec 64) V!6243 (_ BitVec 64) V!6243) Unit!6114)

(assert (=> b!202267 (= lt!101484 (addCommutativeForDiffKeys!128 lt!101486 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8489 () Bool)

(declare-fun mapRes!8489 () Bool)

(assert (=> mapIsEmpty!8489 mapRes!8489))

(declare-fun b!202269 () Bool)

(declare-fun res!96879 () Bool)

(assert (=> b!202269 (=> (not res!96879) (not e!132505))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9119 (_ BitVec 32)) Bool)

(assert (=> b!202269 (= res!96879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202270 () Bool)

(declare-fun e!132503 () Bool)

(declare-fun e!132504 () Bool)

(assert (=> b!202270 (= e!132503 (and e!132504 mapRes!8489))))

(declare-fun condMapEmpty!8489 () Bool)

(declare-datatypes ((ValueCell!2130 0))(
  ( (ValueCellFull!2130 (v!4488 V!6243)) (EmptyCell!2130) )
))
(declare-datatypes ((array!9121 0))(
  ( (array!9122 (arr!4311 (Array (_ BitVec 32) ValueCell!2130)) (size!4636 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9121)

(declare-fun mapDefault!8489 () ValueCell!2130)

(assert (=> b!202270 (= condMapEmpty!8489 (= (arr!4311 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2130)) mapDefault!8489)))))

(declare-fun b!202271 () Bool)

(declare-fun res!96873 () Bool)

(assert (=> b!202271 (=> (not res!96873) (not e!132505))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202271 (= res!96873 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4635 _keys!825))))))

(declare-fun b!202272 () Bool)

(declare-fun e!132509 () Bool)

(declare-fun tp_is_empty!4947 () Bool)

(assert (=> b!202272 (= e!132509 tp_is_empty!4947)))

(declare-fun b!202273 () Bool)

(declare-fun res!96874 () Bool)

(assert (=> b!202273 (=> (not res!96874) (not e!132505))))

(assert (=> b!202273 (= res!96874 (= (select (arr!4310 _keys!825) i!601) k0!843))))

(declare-fun b!202274 () Bool)

(declare-fun res!96875 () Bool)

(assert (=> b!202274 (=> (not res!96875) (not e!132505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202274 (= res!96875 (validKeyInArray!0 k0!843))))

(declare-fun b!202275 () Bool)

(declare-fun e!132506 () Bool)

(assert (=> b!202275 (= e!132506 e!132507)))

(declare-fun res!96876 () Bool)

(assert (=> b!202275 (=> res!96876 e!132507)))

(assert (=> b!202275 (= res!96876 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101485 () ListLongMap!2729)

(assert (=> b!202275 (= lt!101485 lt!101476)))

(assert (=> b!202275 (= lt!101476 (+!407 lt!101486 lt!101482))))

(declare-fun lt!101479 () ListLongMap!2729)

(declare-fun zeroValue!615 () V!6243)

(declare-fun lt!101475 () Unit!6114)

(assert (=> b!202275 (= lt!101475 (addCommutativeForDiffKeys!128 lt!101479 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101480 () ListLongMap!2729)

(assert (=> b!202275 (= lt!101480 (+!407 lt!101485 lt!101483))))

(declare-fun lt!101472 () ListLongMap!2729)

(declare-fun lt!101487 () tuple2!3816)

(assert (=> b!202275 (= lt!101485 (+!407 lt!101472 lt!101487))))

(declare-fun lt!101481 () ListLongMap!2729)

(assert (=> b!202275 (= lt!101481 lt!101473)))

(assert (=> b!202275 (= lt!101473 (+!407 lt!101486 lt!101483))))

(assert (=> b!202275 (= lt!101486 (+!407 lt!101479 lt!101487))))

(declare-fun lt!101478 () ListLongMap!2729)

(assert (=> b!202275 (= lt!101480 (+!407 (+!407 lt!101478 lt!101487) lt!101483))))

(assert (=> b!202275 (= lt!101483 (tuple2!3817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202275 (= lt!101487 (tuple2!3817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202276 () Bool)

(assert (=> b!202276 (= e!132505 (not e!132506))))

(declare-fun res!96877 () Bool)

(assert (=> b!202276 (=> res!96877 e!132506)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202276 (= res!96877 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!963 (array!9119 array!9121 (_ BitVec 32) (_ BitVec 32) V!6243 V!6243 (_ BitVec 32) Int) ListLongMap!2729)

(assert (=> b!202276 (= lt!101481 (getCurrentListMap!963 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101474 () array!9121)

(assert (=> b!202276 (= lt!101480 (getCurrentListMap!963 _keys!825 lt!101474 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202276 (and (= lt!101478 lt!101472) (= lt!101472 lt!101478))))

(assert (=> b!202276 (= lt!101472 (+!407 lt!101479 lt!101482))))

(assert (=> b!202276 (= lt!101482 (tuple2!3817 k0!843 v!520))))

(declare-fun lt!101477 () Unit!6114)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!76 (array!9119 array!9121 (_ BitVec 32) (_ BitVec 32) V!6243 V!6243 (_ BitVec 32) (_ BitVec 64) V!6243 (_ BitVec 32) Int) Unit!6114)

(assert (=> b!202276 (= lt!101477 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!76 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!337 (array!9119 array!9121 (_ BitVec 32) (_ BitVec 32) V!6243 V!6243 (_ BitVec 32) Int) ListLongMap!2729)

(assert (=> b!202276 (= lt!101478 (getCurrentListMapNoExtraKeys!337 _keys!825 lt!101474 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202276 (= lt!101474 (array!9122 (store (arr!4311 _values!649) i!601 (ValueCellFull!2130 v!520)) (size!4636 _values!649)))))

(assert (=> b!202276 (= lt!101479 (getCurrentListMapNoExtraKeys!337 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202268 () Bool)

(declare-fun res!96880 () Bool)

(assert (=> b!202268 (=> (not res!96880) (not e!132505))))

(assert (=> b!202268 (= res!96880 (and (= (size!4636 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4635 _keys!825) (size!4636 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!96878 () Bool)

(assert (=> start!20432 (=> (not res!96878) (not e!132505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20432 (= res!96878 (validMask!0 mask!1149))))

(assert (=> start!20432 e!132505))

(declare-fun array_inv!2845 (array!9121) Bool)

(assert (=> start!20432 (and (array_inv!2845 _values!649) e!132503)))

(assert (=> start!20432 true))

(assert (=> start!20432 tp_is_empty!4947))

(declare-fun array_inv!2846 (array!9119) Bool)

(assert (=> start!20432 (array_inv!2846 _keys!825)))

(assert (=> start!20432 tp!18304))

(declare-fun mapNonEmpty!8489 () Bool)

(declare-fun tp!18305 () Bool)

(assert (=> mapNonEmpty!8489 (= mapRes!8489 (and tp!18305 e!132509))))

(declare-fun mapKey!8489 () (_ BitVec 32))

(declare-fun mapRest!8489 () (Array (_ BitVec 32) ValueCell!2130))

(declare-fun mapValue!8489 () ValueCell!2130)

(assert (=> mapNonEmpty!8489 (= (arr!4311 _values!649) (store mapRest!8489 mapKey!8489 mapValue!8489))))

(declare-fun b!202277 () Bool)

(assert (=> b!202277 (= e!132504 tp_is_empty!4947)))

(assert (= (and start!20432 res!96878) b!202268))

(assert (= (and b!202268 res!96880) b!202269))

(assert (= (and b!202269 res!96879) b!202266))

(assert (= (and b!202266 res!96872) b!202271))

(assert (= (and b!202271 res!96873) b!202274))

(assert (= (and b!202274 res!96875) b!202273))

(assert (= (and b!202273 res!96874) b!202276))

(assert (= (and b!202276 (not res!96877)) b!202275))

(assert (= (and b!202275 (not res!96876)) b!202267))

(assert (= (and b!202270 condMapEmpty!8489) mapIsEmpty!8489))

(assert (= (and b!202270 (not condMapEmpty!8489)) mapNonEmpty!8489))

(get-info :version)

(assert (= (and mapNonEmpty!8489 ((_ is ValueCellFull!2130) mapValue!8489)) b!202272))

(assert (= (and b!202270 ((_ is ValueCellFull!2130) mapDefault!8489)) b!202277))

(assert (= start!20432 b!202270))

(declare-fun m!229559 () Bool)

(assert (=> start!20432 m!229559))

(declare-fun m!229561 () Bool)

(assert (=> start!20432 m!229561))

(declare-fun m!229563 () Bool)

(assert (=> start!20432 m!229563))

(declare-fun m!229565 () Bool)

(assert (=> b!202269 m!229565))

(declare-fun m!229567 () Bool)

(assert (=> b!202267 m!229567))

(declare-fun m!229569 () Bool)

(assert (=> b!202267 m!229569))

(declare-fun m!229571 () Bool)

(assert (=> b!202267 m!229571))

(declare-fun m!229573 () Bool)

(assert (=> b!202275 m!229573))

(declare-fun m!229575 () Bool)

(assert (=> b!202275 m!229575))

(declare-fun m!229577 () Bool)

(assert (=> b!202275 m!229577))

(declare-fun m!229579 () Bool)

(assert (=> b!202275 m!229579))

(assert (=> b!202275 m!229577))

(declare-fun m!229581 () Bool)

(assert (=> b!202275 m!229581))

(declare-fun m!229583 () Bool)

(assert (=> b!202275 m!229583))

(declare-fun m!229585 () Bool)

(assert (=> b!202275 m!229585))

(declare-fun m!229587 () Bool)

(assert (=> b!202275 m!229587))

(declare-fun m!229589 () Bool)

(assert (=> b!202276 m!229589))

(declare-fun m!229591 () Bool)

(assert (=> b!202276 m!229591))

(declare-fun m!229593 () Bool)

(assert (=> b!202276 m!229593))

(declare-fun m!229595 () Bool)

(assert (=> b!202276 m!229595))

(declare-fun m!229597 () Bool)

(assert (=> b!202276 m!229597))

(declare-fun m!229599 () Bool)

(assert (=> b!202276 m!229599))

(declare-fun m!229601 () Bool)

(assert (=> b!202276 m!229601))

(declare-fun m!229603 () Bool)

(assert (=> b!202274 m!229603))

(declare-fun m!229605 () Bool)

(assert (=> b!202273 m!229605))

(declare-fun m!229607 () Bool)

(assert (=> mapNonEmpty!8489 m!229607))

(declare-fun m!229609 () Bool)

(assert (=> b!202266 m!229609))

(check-sat b_and!11837 (not mapNonEmpty!8489) (not b_next!5091) (not b!202267) (not b!202274) (not b!202266) (not b!202276) (not start!20432) (not b!202275) tp_is_empty!4947 (not b!202269))
(check-sat b_and!11837 (not b_next!5091))
