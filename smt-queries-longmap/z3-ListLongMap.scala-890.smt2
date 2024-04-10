; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20438 () Bool)

(assert start!20438)

(declare-fun b_free!5097 () Bool)

(declare-fun b_next!5097 () Bool)

(assert (=> start!20438 (= b_free!5097 (not b_next!5097))))

(declare-fun tp!18323 () Bool)

(declare-fun b_and!11843 () Bool)

(assert (=> start!20438 (= tp!18323 b_and!11843)))

(declare-fun b!202379 () Bool)

(declare-fun res!96958 () Bool)

(declare-fun e!132571 () Bool)

(assert (=> b!202379 (=> (not res!96958) (not e!132571))))

(declare-datatypes ((array!9131 0))(
  ( (array!9132 (arr!4316 (Array (_ BitVec 32) (_ BitVec 64))) (size!4641 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9131)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6251 0))(
  ( (V!6252 (val!2521 Int)) )
))
(declare-datatypes ((ValueCell!2133 0))(
  ( (ValueCellFull!2133 (v!4491 V!6251)) (EmptyCell!2133) )
))
(declare-datatypes ((array!9133 0))(
  ( (array!9134 (arr!4317 (Array (_ BitVec 32) ValueCell!2133)) (size!4642 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9133)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202379 (= res!96958 (and (= (size!4642 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4641 _keys!825) (size!4642 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202380 () Bool)

(declare-fun e!132569 () Bool)

(declare-fun tp_is_empty!4953 () Bool)

(assert (=> b!202380 (= e!132569 tp_is_empty!4953)))

(declare-fun b!202381 () Bool)

(declare-fun res!96965 () Bool)

(assert (=> b!202381 (=> (not res!96965) (not e!132571))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202381 (= res!96965 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4641 _keys!825))))))

(declare-fun b!202382 () Bool)

(declare-fun e!132570 () Bool)

(assert (=> b!202382 (= e!132571 (not e!132570))))

(declare-fun res!96962 () Bool)

(assert (=> b!202382 (=> res!96962 e!132570)))

(assert (=> b!202382 (= res!96962 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6251)

(declare-datatypes ((tuple2!3822 0))(
  ( (tuple2!3823 (_1!1922 (_ BitVec 64)) (_2!1922 V!6251)) )
))
(declare-datatypes ((List!2728 0))(
  ( (Nil!2725) (Cons!2724 (h!3366 tuple2!3822) (t!7659 List!2728)) )
))
(declare-datatypes ((ListLongMap!2735 0))(
  ( (ListLongMap!2736 (toList!1383 List!2728)) )
))
(declare-fun lt!101583 () ListLongMap!2735)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6251)

(declare-fun getCurrentListMap!965 (array!9131 array!9133 (_ BitVec 32) (_ BitVec 32) V!6251 V!6251 (_ BitVec 32) Int) ListLongMap!2735)

(assert (=> b!202382 (= lt!101583 (getCurrentListMap!965 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101582 () array!9133)

(declare-fun lt!101580 () ListLongMap!2735)

(assert (=> b!202382 (= lt!101580 (getCurrentListMap!965 _keys!825 lt!101582 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101578 () ListLongMap!2735)

(declare-fun lt!101576 () ListLongMap!2735)

(assert (=> b!202382 (and (= lt!101578 lt!101576) (= lt!101576 lt!101578))))

(declare-fun v!520 () V!6251)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!101577 () ListLongMap!2735)

(declare-fun +!410 (ListLongMap!2735 tuple2!3822) ListLongMap!2735)

(assert (=> b!202382 (= lt!101576 (+!410 lt!101577 (tuple2!3823 k0!843 v!520)))))

(declare-datatypes ((Unit!6118 0))(
  ( (Unit!6119) )
))
(declare-fun lt!101581 () Unit!6118)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!78 (array!9131 array!9133 (_ BitVec 32) (_ BitVec 32) V!6251 V!6251 (_ BitVec 32) (_ BitVec 64) V!6251 (_ BitVec 32) Int) Unit!6118)

(assert (=> b!202382 (= lt!101581 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!78 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!339 (array!9131 array!9133 (_ BitVec 32) (_ BitVec 32) V!6251 V!6251 (_ BitVec 32) Int) ListLongMap!2735)

(assert (=> b!202382 (= lt!101578 (getCurrentListMapNoExtraKeys!339 _keys!825 lt!101582 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202382 (= lt!101582 (array!9134 (store (arr!4317 _values!649) i!601 (ValueCellFull!2133 v!520)) (size!4642 _values!649)))))

(assert (=> b!202382 (= lt!101577 (getCurrentListMapNoExtraKeys!339 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202383 () Bool)

(declare-fun e!132568 () Bool)

(assert (=> b!202383 (= e!132568 tp_is_empty!4953)))

(declare-fun b!202385 () Bool)

(declare-fun res!96966 () Bool)

(assert (=> b!202385 (=> (not res!96966) (not e!132571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202385 (= res!96966 (validKeyInArray!0 k0!843))))

(declare-fun b!202386 () Bool)

(declare-fun res!96960 () Bool)

(assert (=> b!202386 (=> (not res!96960) (not e!132571))))

(declare-datatypes ((List!2729 0))(
  ( (Nil!2726) (Cons!2725 (h!3367 (_ BitVec 64)) (t!7660 List!2729)) )
))
(declare-fun arrayNoDuplicates!0 (array!9131 (_ BitVec 32) List!2729) Bool)

(assert (=> b!202386 (= res!96960 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2726))))

(declare-fun b!202387 () Bool)

(assert (=> b!202387 (= e!132570 true)))

(declare-fun e!132572 () Bool)

(assert (=> b!202387 e!132572))

(declare-fun res!96967 () Bool)

(assert (=> b!202387 (=> (not res!96967) (not e!132572))))

(declare-fun lt!101579 () tuple2!3822)

(assert (=> b!202387 (= res!96967 (= lt!101580 (+!410 lt!101578 lt!101579)))))

(assert (=> b!202387 (= lt!101579 (tuple2!3823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202388 () Bool)

(declare-fun res!96964 () Bool)

(assert (=> b!202388 (=> (not res!96964) (not e!132571))))

(assert (=> b!202388 (= res!96964 (= (select (arr!4316 _keys!825) i!601) k0!843))))

(declare-fun b!202389 () Bool)

(declare-fun res!96961 () Bool)

(assert (=> b!202389 (=> (not res!96961) (not e!132572))))

(assert (=> b!202389 (= res!96961 (= lt!101583 (+!410 lt!101577 lt!101579)))))

(declare-fun b!202384 () Bool)

(declare-fun e!132566 () Bool)

(declare-fun mapRes!8498 () Bool)

(assert (=> b!202384 (= e!132566 (and e!132569 mapRes!8498))))

(declare-fun condMapEmpty!8498 () Bool)

(declare-fun mapDefault!8498 () ValueCell!2133)

(assert (=> b!202384 (= condMapEmpty!8498 (= (arr!4317 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2133)) mapDefault!8498)))))

(declare-fun res!96963 () Bool)

(assert (=> start!20438 (=> (not res!96963) (not e!132571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20438 (= res!96963 (validMask!0 mask!1149))))

(assert (=> start!20438 e!132571))

(declare-fun array_inv!2851 (array!9133) Bool)

(assert (=> start!20438 (and (array_inv!2851 _values!649) e!132566)))

(assert (=> start!20438 true))

(assert (=> start!20438 tp_is_empty!4953))

(declare-fun array_inv!2852 (array!9131) Bool)

(assert (=> start!20438 (array_inv!2852 _keys!825)))

(assert (=> start!20438 tp!18323))

(declare-fun mapNonEmpty!8498 () Bool)

(declare-fun tp!18322 () Bool)

(assert (=> mapNonEmpty!8498 (= mapRes!8498 (and tp!18322 e!132568))))

(declare-fun mapValue!8498 () ValueCell!2133)

(declare-fun mapRest!8498 () (Array (_ BitVec 32) ValueCell!2133))

(declare-fun mapKey!8498 () (_ BitVec 32))

(assert (=> mapNonEmpty!8498 (= (arr!4317 _values!649) (store mapRest!8498 mapKey!8498 mapValue!8498))))

(declare-fun b!202390 () Bool)

(assert (=> b!202390 (= e!132572 (= lt!101580 (+!410 lt!101576 lt!101579)))))

(declare-fun mapIsEmpty!8498 () Bool)

(assert (=> mapIsEmpty!8498 mapRes!8498))

(declare-fun b!202391 () Bool)

(declare-fun res!96959 () Bool)

(assert (=> b!202391 (=> (not res!96959) (not e!132571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9131 (_ BitVec 32)) Bool)

(assert (=> b!202391 (= res!96959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20438 res!96963) b!202379))

(assert (= (and b!202379 res!96958) b!202391))

(assert (= (and b!202391 res!96959) b!202386))

(assert (= (and b!202386 res!96960) b!202381))

(assert (= (and b!202381 res!96965) b!202385))

(assert (= (and b!202385 res!96966) b!202388))

(assert (= (and b!202388 res!96964) b!202382))

(assert (= (and b!202382 (not res!96962)) b!202387))

(assert (= (and b!202387 res!96967) b!202389))

(assert (= (and b!202389 res!96961) b!202390))

(assert (= (and b!202384 condMapEmpty!8498) mapIsEmpty!8498))

(assert (= (and b!202384 (not condMapEmpty!8498)) mapNonEmpty!8498))

(get-info :version)

(assert (= (and mapNonEmpty!8498 ((_ is ValueCellFull!2133) mapValue!8498)) b!202383))

(assert (= (and b!202384 ((_ is ValueCellFull!2133) mapDefault!8498)) b!202380))

(assert (= start!20438 b!202384))

(declare-fun m!229699 () Bool)

(assert (=> b!202387 m!229699))

(declare-fun m!229701 () Bool)

(assert (=> mapNonEmpty!8498 m!229701))

(declare-fun m!229703 () Bool)

(assert (=> b!202388 m!229703))

(declare-fun m!229705 () Bool)

(assert (=> b!202382 m!229705))

(declare-fun m!229707 () Bool)

(assert (=> b!202382 m!229707))

(declare-fun m!229709 () Bool)

(assert (=> b!202382 m!229709))

(declare-fun m!229711 () Bool)

(assert (=> b!202382 m!229711))

(declare-fun m!229713 () Bool)

(assert (=> b!202382 m!229713))

(declare-fun m!229715 () Bool)

(assert (=> b!202382 m!229715))

(declare-fun m!229717 () Bool)

(assert (=> b!202382 m!229717))

(declare-fun m!229719 () Bool)

(assert (=> start!20438 m!229719))

(declare-fun m!229721 () Bool)

(assert (=> start!20438 m!229721))

(declare-fun m!229723 () Bool)

(assert (=> start!20438 m!229723))

(declare-fun m!229725 () Bool)

(assert (=> b!202386 m!229725))

(declare-fun m!229727 () Bool)

(assert (=> b!202389 m!229727))

(declare-fun m!229729 () Bool)

(assert (=> b!202390 m!229729))

(declare-fun m!229731 () Bool)

(assert (=> b!202391 m!229731))

(declare-fun m!229733 () Bool)

(assert (=> b!202385 m!229733))

(check-sat (not start!20438) (not b!202386) (not b!202389) (not b!202387) (not b!202391) tp_is_empty!4953 (not b!202390) (not b!202382) b_and!11843 (not b_next!5097) (not mapNonEmpty!8498) (not b!202385))
(check-sat b_and!11843 (not b_next!5097))
