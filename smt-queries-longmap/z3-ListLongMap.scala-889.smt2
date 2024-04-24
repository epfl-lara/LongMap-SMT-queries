; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20434 () Bool)

(assert start!20434)

(declare-fun b_free!5089 () Bool)

(declare-fun b_next!5089 () Bool)

(assert (=> start!20434 (= b_free!5089 (not b_next!5089))))

(declare-fun tp!18298 () Bool)

(declare-fun b_and!11849 () Bool)

(assert (=> start!20434 (= tp!18298 b_and!11849)))

(declare-fun mapNonEmpty!8486 () Bool)

(declare-fun mapRes!8486 () Bool)

(declare-fun tp!18299 () Bool)

(declare-fun e!132507 () Bool)

(assert (=> mapNonEmpty!8486 (= mapRes!8486 (and tp!18299 e!132507))))

(declare-datatypes ((V!6241 0))(
  ( (V!6242 (val!2517 Int)) )
))
(declare-datatypes ((ValueCell!2129 0))(
  ( (ValueCellFull!2129 (v!4488 V!6241)) (EmptyCell!2129) )
))
(declare-fun mapRest!8486 () (Array (_ BitVec 32) ValueCell!2129))

(declare-datatypes ((array!9109 0))(
  ( (array!9110 (arr!4305 (Array (_ BitVec 32) ValueCell!2129)) (size!4630 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9109)

(declare-fun mapKey!8486 () (_ BitVec 32))

(declare-fun mapValue!8486 () ValueCell!2129)

(assert (=> mapNonEmpty!8486 (= (arr!4305 _values!649) (store mapRest!8486 mapKey!8486 mapValue!8486))))

(declare-fun b!202277 () Bool)

(declare-fun res!96867 () Bool)

(declare-fun e!132509 () Bool)

(assert (=> b!202277 (=> (not res!96867) (not e!132509))))

(declare-datatypes ((array!9111 0))(
  ( (array!9112 (arr!4306 (Array (_ BitVec 32) (_ BitVec 64))) (size!4631 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9111)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202277 (= res!96867 (and (= (size!4630 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4631 _keys!825) (size!4630 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202278 () Bool)

(declare-fun e!132511 () Bool)

(assert (=> b!202278 (= e!132511 (bvsle #b00000000000000000000000000000000 (size!4631 _keys!825)))))

(declare-datatypes ((tuple2!3750 0))(
  ( (tuple2!3751 (_1!1886 (_ BitVec 64)) (_2!1886 V!6241)) )
))
(declare-datatypes ((List!2658 0))(
  ( (Nil!2655) (Cons!2654 (h!3296 tuple2!3750) (t!7581 List!2658)) )
))
(declare-datatypes ((ListLongMap!2665 0))(
  ( (ListLongMap!2666 (toList!1348 List!2658)) )
))
(declare-fun lt!101490 () ListLongMap!2665)

(declare-fun lt!101492 () tuple2!3750)

(declare-fun lt!101485 () ListLongMap!2665)

(declare-fun lt!101487 () tuple2!3750)

(declare-fun +!402 (ListLongMap!2665 tuple2!3750) ListLongMap!2665)

(assert (=> b!202278 (= (+!402 lt!101485 lt!101487) (+!402 lt!101490 lt!101492))))

(declare-fun minValue!615 () V!6241)

(declare-fun lt!101488 () ListLongMap!2665)

(declare-datatypes ((Unit!6088 0))(
  ( (Unit!6089) )
))
(declare-fun lt!101489 () Unit!6088)

(declare-fun v!520 () V!6241)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!125 (ListLongMap!2665 (_ BitVec 64) V!6241 (_ BitVec 64) V!6241) Unit!6088)

(assert (=> b!202278 (= lt!101489 (addCommutativeForDiffKeys!125 lt!101488 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202279 () Bool)

(declare-fun tp_is_empty!4945 () Bool)

(assert (=> b!202279 (= e!132507 tp_is_empty!4945)))

(declare-fun res!96874 () Bool)

(assert (=> start!20434 (=> (not res!96874) (not e!132509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20434 (= res!96874 (validMask!0 mask!1149))))

(assert (=> start!20434 e!132509))

(declare-fun e!132510 () Bool)

(declare-fun array_inv!2807 (array!9109) Bool)

(assert (=> start!20434 (and (array_inv!2807 _values!649) e!132510)))

(assert (=> start!20434 true))

(assert (=> start!20434 tp_is_empty!4945))

(declare-fun array_inv!2808 (array!9111) Bool)

(assert (=> start!20434 (array_inv!2808 _keys!825)))

(assert (=> start!20434 tp!18298))

(declare-fun mapIsEmpty!8486 () Bool)

(assert (=> mapIsEmpty!8486 mapRes!8486))

(declare-fun b!202280 () Bool)

(declare-fun e!132512 () Bool)

(assert (=> b!202280 (= e!132510 (and e!132512 mapRes!8486))))

(declare-fun condMapEmpty!8486 () Bool)

(declare-fun mapDefault!8486 () ValueCell!2129)

(assert (=> b!202280 (= condMapEmpty!8486 (= (arr!4305 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2129)) mapDefault!8486)))))

(declare-fun b!202281 () Bool)

(declare-fun res!96866 () Bool)

(assert (=> b!202281 (=> (not res!96866) (not e!132509))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202281 (= res!96866 (= (select (arr!4306 _keys!825) i!601) k0!843))))

(declare-fun b!202282 () Bool)

(declare-fun res!96870 () Bool)

(assert (=> b!202282 (=> (not res!96870) (not e!132509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9111 (_ BitVec 32)) Bool)

(assert (=> b!202282 (= res!96870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202283 () Bool)

(declare-fun res!96871 () Bool)

(assert (=> b!202283 (=> (not res!96871) (not e!132509))))

(declare-datatypes ((List!2659 0))(
  ( (Nil!2656) (Cons!2655 (h!3297 (_ BitVec 64)) (t!7582 List!2659)) )
))
(declare-fun arrayNoDuplicates!0 (array!9111 (_ BitVec 32) List!2659) Bool)

(assert (=> b!202283 (= res!96871 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2656))))

(declare-fun b!202284 () Bool)

(declare-fun res!96868 () Bool)

(assert (=> b!202284 (=> (not res!96868) (not e!132509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202284 (= res!96868 (validKeyInArray!0 k0!843))))

(declare-fun b!202285 () Bool)

(declare-fun e!132508 () Bool)

(assert (=> b!202285 (= e!132509 (not e!132508))))

(declare-fun res!96872 () Bool)

(assert (=> b!202285 (=> res!96872 e!132508)))

(assert (=> b!202285 (= res!96872 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6241)

(declare-fun defaultEntry!657 () Int)

(declare-fun lt!101497 () ListLongMap!2665)

(declare-fun getCurrentListMap!932 (array!9111 array!9109 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) Int) ListLongMap!2665)

(assert (=> b!202285 (= lt!101497 (getCurrentListMap!932 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101484 () ListLongMap!2665)

(declare-fun lt!101486 () array!9109)

(assert (=> b!202285 (= lt!101484 (getCurrentListMap!932 _keys!825 lt!101486 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101495 () ListLongMap!2665)

(declare-fun lt!101496 () ListLongMap!2665)

(assert (=> b!202285 (and (= lt!101495 lt!101496) (= lt!101496 lt!101495))))

(declare-fun lt!101494 () ListLongMap!2665)

(assert (=> b!202285 (= lt!101496 (+!402 lt!101494 lt!101492))))

(assert (=> b!202285 (= lt!101492 (tuple2!3751 k0!843 v!520))))

(declare-fun lt!101498 () Unit!6088)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!68 (array!9111 array!9109 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) (_ BitVec 64) V!6241 (_ BitVec 32) Int) Unit!6088)

(assert (=> b!202285 (= lt!101498 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!68 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!325 (array!9111 array!9109 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) Int) ListLongMap!2665)

(assert (=> b!202285 (= lt!101495 (getCurrentListMapNoExtraKeys!325 _keys!825 lt!101486 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202285 (= lt!101486 (array!9110 (store (arr!4305 _values!649) i!601 (ValueCellFull!2129 v!520)) (size!4630 _values!649)))))

(assert (=> b!202285 (= lt!101494 (getCurrentListMapNoExtraKeys!325 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202286 () Bool)

(assert (=> b!202286 (= e!132508 e!132511)))

(declare-fun res!96873 () Bool)

(assert (=> b!202286 (=> res!96873 e!132511)))

(assert (=> b!202286 (= res!96873 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101493 () ListLongMap!2665)

(assert (=> b!202286 (= lt!101493 lt!101485)))

(assert (=> b!202286 (= lt!101485 (+!402 lt!101488 lt!101492))))

(declare-fun lt!101483 () Unit!6088)

(assert (=> b!202286 (= lt!101483 (addCommutativeForDiffKeys!125 lt!101494 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!202286 (= lt!101484 (+!402 lt!101493 lt!101487))))

(declare-fun lt!101491 () tuple2!3750)

(assert (=> b!202286 (= lt!101493 (+!402 lt!101496 lt!101491))))

(assert (=> b!202286 (= lt!101497 lt!101490)))

(assert (=> b!202286 (= lt!101490 (+!402 lt!101488 lt!101487))))

(assert (=> b!202286 (= lt!101488 (+!402 lt!101494 lt!101491))))

(assert (=> b!202286 (= lt!101484 (+!402 (+!402 lt!101495 lt!101491) lt!101487))))

(assert (=> b!202286 (= lt!101487 (tuple2!3751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202286 (= lt!101491 (tuple2!3751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202287 () Bool)

(assert (=> b!202287 (= e!132512 tp_is_empty!4945)))

(declare-fun b!202288 () Bool)

(declare-fun res!96869 () Bool)

(assert (=> b!202288 (=> (not res!96869) (not e!132509))))

(assert (=> b!202288 (= res!96869 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4631 _keys!825))))))

(assert (= (and start!20434 res!96874) b!202277))

(assert (= (and b!202277 res!96867) b!202282))

(assert (= (and b!202282 res!96870) b!202283))

(assert (= (and b!202283 res!96871) b!202288))

(assert (= (and b!202288 res!96869) b!202284))

(assert (= (and b!202284 res!96868) b!202281))

(assert (= (and b!202281 res!96866) b!202285))

(assert (= (and b!202285 (not res!96872)) b!202286))

(assert (= (and b!202286 (not res!96873)) b!202278))

(assert (= (and b!202280 condMapEmpty!8486) mapIsEmpty!8486))

(assert (= (and b!202280 (not condMapEmpty!8486)) mapNonEmpty!8486))

(get-info :version)

(assert (= (and mapNonEmpty!8486 ((_ is ValueCellFull!2129) mapValue!8486)) b!202279))

(assert (= (and b!202280 ((_ is ValueCellFull!2129) mapDefault!8486)) b!202287))

(assert (= start!20434 b!202280))

(declare-fun m!229689 () Bool)

(assert (=> b!202278 m!229689))

(declare-fun m!229691 () Bool)

(assert (=> b!202278 m!229691))

(declare-fun m!229693 () Bool)

(assert (=> b!202278 m!229693))

(declare-fun m!229695 () Bool)

(assert (=> start!20434 m!229695))

(declare-fun m!229697 () Bool)

(assert (=> start!20434 m!229697))

(declare-fun m!229699 () Bool)

(assert (=> start!20434 m!229699))

(declare-fun m!229701 () Bool)

(assert (=> b!202282 m!229701))

(declare-fun m!229703 () Bool)

(assert (=> b!202285 m!229703))

(declare-fun m!229705 () Bool)

(assert (=> b!202285 m!229705))

(declare-fun m!229707 () Bool)

(assert (=> b!202285 m!229707))

(declare-fun m!229709 () Bool)

(assert (=> b!202285 m!229709))

(declare-fun m!229711 () Bool)

(assert (=> b!202285 m!229711))

(declare-fun m!229713 () Bool)

(assert (=> b!202285 m!229713))

(declare-fun m!229715 () Bool)

(assert (=> b!202285 m!229715))

(declare-fun m!229717 () Bool)

(assert (=> b!202286 m!229717))

(declare-fun m!229719 () Bool)

(assert (=> b!202286 m!229719))

(declare-fun m!229721 () Bool)

(assert (=> b!202286 m!229721))

(declare-fun m!229723 () Bool)

(assert (=> b!202286 m!229723))

(declare-fun m!229725 () Bool)

(assert (=> b!202286 m!229725))

(declare-fun m!229727 () Bool)

(assert (=> b!202286 m!229727))

(declare-fun m!229729 () Bool)

(assert (=> b!202286 m!229729))

(declare-fun m!229731 () Bool)

(assert (=> b!202286 m!229731))

(assert (=> b!202286 m!229727))

(declare-fun m!229733 () Bool)

(assert (=> mapNonEmpty!8486 m!229733))

(declare-fun m!229735 () Bool)

(assert (=> b!202281 m!229735))

(declare-fun m!229737 () Bool)

(assert (=> b!202283 m!229737))

(declare-fun m!229739 () Bool)

(assert (=> b!202284 m!229739))

(check-sat b_and!11849 tp_is_empty!4945 (not b!202278) (not start!20434) (not b!202284) (not b_next!5089) (not b!202285) (not b!202283) (not b!202286) (not mapNonEmpty!8486) (not b!202282))
(check-sat b_and!11849 (not b_next!5089))
