; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39962 () Bool)

(assert start!39962)

(declare-fun b_free!10243 () Bool)

(declare-fun b_next!10243 () Bool)

(assert (=> start!39962 (= b_free!10243 (not b_next!10243))))

(declare-fun tp!36258 () Bool)

(declare-fun b_and!18119 () Bool)

(assert (=> start!39962 (= tp!36258 b_and!18119)))

(declare-fun b!434463 () Bool)

(declare-fun res!255913 () Bool)

(declare-fun e!256737 () Bool)

(assert (=> b!434463 (=> (not res!255913) (not e!256737))))

(declare-datatypes ((array!26613 0))(
  ( (array!26614 (arr!12756 (Array (_ BitVec 32) (_ BitVec 64))) (size!13109 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26613)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26613 (_ BitVec 32)) Bool)

(assert (=> b!434463 (= res!255913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434464 () Bool)

(declare-datatypes ((Unit!12859 0))(
  ( (Unit!12860) )
))
(declare-fun e!256735 () Unit!12859)

(declare-fun Unit!12861 () Unit!12859)

(assert (=> b!434464 (= e!256735 Unit!12861)))

(declare-fun b!434465 () Bool)

(declare-fun res!255910 () Bool)

(assert (=> b!434465 (=> (not res!255910) (not e!256737))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434465 (= res!255910 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434466 () Bool)

(declare-fun res!255920 () Bool)

(declare-fun e!256733 () Bool)

(assert (=> b!434466 (=> (not res!255920) (not e!256733))))

(declare-fun lt!199749 () array!26613)

(declare-datatypes ((List!7595 0))(
  ( (Nil!7592) (Cons!7591 (h!8447 (_ BitVec 64)) (t!13278 List!7595)) )
))
(declare-fun arrayNoDuplicates!0 (array!26613 (_ BitVec 32) List!7595) Bool)

(assert (=> b!434466 (= res!255920 (arrayNoDuplicates!0 lt!199749 #b00000000000000000000000000000000 Nil!7592))))

(declare-fun b!434467 () Bool)

(assert (=> b!434467 (= e!256737 e!256733)))

(declare-fun res!255917 () Bool)

(assert (=> b!434467 (=> (not res!255917) (not e!256733))))

(assert (=> b!434467 (= res!255917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199749 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434467 (= lt!199749 (array!26614 (store (arr!12756 _keys!709) i!563 k0!794) (size!13109 _keys!709)))))

(declare-fun b!434468 () Bool)

(declare-fun res!255914 () Bool)

(assert (=> b!434468 (=> (not res!255914) (not e!256737))))

(declare-datatypes ((V!16299 0))(
  ( (V!16300 (val!5742 Int)) )
))
(declare-datatypes ((ValueCell!5354 0))(
  ( (ValueCellFull!5354 (v!7983 V!16299)) (EmptyCell!5354) )
))
(declare-datatypes ((array!26615 0))(
  ( (array!26616 (arr!12757 (Array (_ BitVec 32) ValueCell!5354)) (size!13110 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26615)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!434468 (= res!255914 (and (= (size!13110 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13109 _keys!709) (size!13110 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434469 () Bool)

(declare-fun e!256728 () Bool)

(declare-fun tp_is_empty!11395 () Bool)

(assert (=> b!434469 (= e!256728 tp_is_empty!11395)))

(declare-fun b!434470 () Bool)

(declare-fun e!256730 () Bool)

(assert (=> b!434470 (= e!256730 tp_is_empty!11395)))

(declare-fun mapNonEmpty!18714 () Bool)

(declare-fun mapRes!18714 () Bool)

(declare-fun tp!36257 () Bool)

(assert (=> mapNonEmpty!18714 (= mapRes!18714 (and tp!36257 e!256728))))

(declare-fun mapRest!18714 () (Array (_ BitVec 32) ValueCell!5354))

(declare-fun mapKey!18714 () (_ BitVec 32))

(declare-fun mapValue!18714 () ValueCell!5354)

(assert (=> mapNonEmpty!18714 (= (arr!12757 _values!549) (store mapRest!18714 mapKey!18714 mapValue!18714))))

(declare-fun b!434471 () Bool)

(declare-fun e!256732 () Bool)

(declare-fun e!256729 () Bool)

(assert (=> b!434471 (= e!256732 e!256729)))

(declare-fun res!255907 () Bool)

(assert (=> b!434471 (=> res!255907 e!256729)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!434471 (= res!255907 (= k0!794 (select (arr!12756 _keys!709) from!863)))))

(assert (=> b!434471 (not (= (select (arr!12756 _keys!709) from!863) k0!794))))

(declare-fun lt!199741 () Unit!12859)

(assert (=> b!434471 (= lt!199741 e!256735)))

(declare-fun c!55629 () Bool)

(assert (=> b!434471 (= c!55629 (= (select (arr!12756 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7606 0))(
  ( (tuple2!7607 (_1!3814 (_ BitVec 64)) (_2!3814 V!16299)) )
))
(declare-datatypes ((List!7596 0))(
  ( (Nil!7593) (Cons!7592 (h!8448 tuple2!7606) (t!13279 List!7596)) )
))
(declare-datatypes ((ListLongMap!6509 0))(
  ( (ListLongMap!6510 (toList!3270 List!7596)) )
))
(declare-fun lt!199737 () ListLongMap!6509)

(declare-fun lt!199742 () ListLongMap!6509)

(assert (=> b!434471 (= lt!199737 lt!199742)))

(declare-fun lt!199746 () ListLongMap!6509)

(declare-fun lt!199750 () tuple2!7606)

(declare-fun +!1445 (ListLongMap!6509 tuple2!7606) ListLongMap!6509)

(assert (=> b!434471 (= lt!199742 (+!1445 lt!199746 lt!199750))))

(declare-fun lt!199743 () V!16299)

(assert (=> b!434471 (= lt!199750 (tuple2!7607 (select (arr!12756 _keys!709) from!863) lt!199743))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6355 (ValueCell!5354 V!16299) V!16299)

(declare-fun dynLambda!823 (Int (_ BitVec 64)) V!16299)

(assert (=> b!434471 (= lt!199743 (get!6355 (select (arr!12757 _values!549) from!863) (dynLambda!823 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18714 () Bool)

(assert (=> mapIsEmpty!18714 mapRes!18714))

(declare-fun b!434472 () Bool)

(declare-fun Unit!12862 () Unit!12859)

(assert (=> b!434472 (= e!256735 Unit!12862)))

(declare-fun lt!199740 () Unit!12859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12859)

(assert (=> b!434472 (= lt!199740 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434472 false))

(declare-fun res!255912 () Bool)

(assert (=> start!39962 (=> (not res!255912) (not e!256737))))

(assert (=> start!39962 (= res!255912 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13109 _keys!709))))))

(assert (=> start!39962 e!256737))

(assert (=> start!39962 tp_is_empty!11395))

(assert (=> start!39962 tp!36258))

(assert (=> start!39962 true))

(declare-fun e!256734 () Bool)

(declare-fun array_inv!9308 (array!26615) Bool)

(assert (=> start!39962 (and (array_inv!9308 _values!549) e!256734)))

(declare-fun array_inv!9309 (array!26613) Bool)

(assert (=> start!39962 (array_inv!9309 _keys!709)))

(declare-fun b!434473 () Bool)

(declare-fun res!255909 () Bool)

(assert (=> b!434473 (=> (not res!255909) (not e!256737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434473 (= res!255909 (validKeyInArray!0 k0!794))))

(declare-fun b!434474 () Bool)

(assert (=> b!434474 (= e!256729 true)))

(declare-fun lt!199751 () ListLongMap!6509)

(declare-fun lt!199745 () tuple2!7606)

(assert (=> b!434474 (= lt!199742 (+!1445 (+!1445 lt!199751 lt!199750) lt!199745))))

(declare-fun v!412 () V!16299)

(declare-fun lt!199748 () Unit!12859)

(declare-fun addCommutativeForDiffKeys!398 (ListLongMap!6509 (_ BitVec 64) V!16299 (_ BitVec 64) V!16299) Unit!12859)

(assert (=> b!434474 (= lt!199748 (addCommutativeForDiffKeys!398 lt!199751 k0!794 v!412 (select (arr!12756 _keys!709) from!863) lt!199743))))

(declare-fun b!434475 () Bool)

(declare-fun res!255915 () Bool)

(assert (=> b!434475 (=> (not res!255915) (not e!256737))))

(assert (=> b!434475 (= res!255915 (or (= (select (arr!12756 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12756 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434476 () Bool)

(declare-fun res!255921 () Bool)

(assert (=> b!434476 (=> (not res!255921) (not e!256737))))

(assert (=> b!434476 (= res!255921 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13109 _keys!709))))))

(declare-fun b!434477 () Bool)

(declare-fun res!255919 () Bool)

(assert (=> b!434477 (=> (not res!255919) (not e!256737))))

(assert (=> b!434477 (= res!255919 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7592))))

(declare-fun b!434478 () Bool)

(declare-fun e!256731 () Bool)

(assert (=> b!434478 (= e!256733 e!256731)))

(declare-fun res!255911 () Bool)

(assert (=> b!434478 (=> (not res!255911) (not e!256731))))

(assert (=> b!434478 (= res!255911 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16299)

(declare-fun zeroValue!515 () V!16299)

(declare-fun lt!199744 () array!26615)

(declare-fun getCurrentListMapNoExtraKeys!1472 (array!26613 array!26615 (_ BitVec 32) (_ BitVec 32) V!16299 V!16299 (_ BitVec 32) Int) ListLongMap!6509)

(assert (=> b!434478 (= lt!199737 (getCurrentListMapNoExtraKeys!1472 lt!199749 lt!199744 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434478 (= lt!199744 (array!26616 (store (arr!12757 _values!549) i!563 (ValueCellFull!5354 v!412)) (size!13110 _values!549)))))

(declare-fun lt!199738 () ListLongMap!6509)

(assert (=> b!434478 (= lt!199738 (getCurrentListMapNoExtraKeys!1472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434479 () Bool)

(declare-fun res!255908 () Bool)

(assert (=> b!434479 (=> (not res!255908) (not e!256733))))

(assert (=> b!434479 (= res!255908 (bvsle from!863 i!563))))

(declare-fun b!434480 () Bool)

(declare-fun res!255916 () Bool)

(assert (=> b!434480 (=> (not res!255916) (not e!256737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434480 (= res!255916 (validMask!0 mask!1025))))

(declare-fun b!434481 () Bool)

(assert (=> b!434481 (= e!256734 (and e!256730 mapRes!18714))))

(declare-fun condMapEmpty!18714 () Bool)

(declare-fun mapDefault!18714 () ValueCell!5354)

(assert (=> b!434481 (= condMapEmpty!18714 (= (arr!12757 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5354)) mapDefault!18714)))))

(declare-fun b!434482 () Bool)

(assert (=> b!434482 (= e!256731 (not e!256732))))

(declare-fun res!255918 () Bool)

(assert (=> b!434482 (=> res!255918 e!256732)))

(assert (=> b!434482 (= res!255918 (not (validKeyInArray!0 (select (arr!12756 _keys!709) from!863))))))

(declare-fun lt!199747 () ListLongMap!6509)

(assert (=> b!434482 (= lt!199747 lt!199746)))

(assert (=> b!434482 (= lt!199746 (+!1445 lt!199751 lt!199745))))

(assert (=> b!434482 (= lt!199747 (getCurrentListMapNoExtraKeys!1472 lt!199749 lt!199744 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434482 (= lt!199745 (tuple2!7607 k0!794 v!412))))

(assert (=> b!434482 (= lt!199751 (getCurrentListMapNoExtraKeys!1472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199739 () Unit!12859)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!591 (array!26613 array!26615 (_ BitVec 32) (_ BitVec 32) V!16299 V!16299 (_ BitVec 32) (_ BitVec 64) V!16299 (_ BitVec 32) Int) Unit!12859)

(assert (=> b!434482 (= lt!199739 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39962 res!255912) b!434480))

(assert (= (and b!434480 res!255916) b!434468))

(assert (= (and b!434468 res!255914) b!434463))

(assert (= (and b!434463 res!255913) b!434477))

(assert (= (and b!434477 res!255919) b!434476))

(assert (= (and b!434476 res!255921) b!434473))

(assert (= (and b!434473 res!255909) b!434475))

(assert (= (and b!434475 res!255915) b!434465))

(assert (= (and b!434465 res!255910) b!434467))

(assert (= (and b!434467 res!255917) b!434466))

(assert (= (and b!434466 res!255920) b!434479))

(assert (= (and b!434479 res!255908) b!434478))

(assert (= (and b!434478 res!255911) b!434482))

(assert (= (and b!434482 (not res!255918)) b!434471))

(assert (= (and b!434471 c!55629) b!434472))

(assert (= (and b!434471 (not c!55629)) b!434464))

(assert (= (and b!434471 (not res!255907)) b!434474))

(assert (= (and b!434481 condMapEmpty!18714) mapIsEmpty!18714))

(assert (= (and b!434481 (not condMapEmpty!18714)) mapNonEmpty!18714))

(get-info :version)

(assert (= (and mapNonEmpty!18714 ((_ is ValueCellFull!5354) mapValue!18714)) b!434469))

(assert (= (and b!434481 ((_ is ValueCellFull!5354) mapDefault!18714)) b!434470))

(assert (= start!39962 b!434481))

(declare-fun b_lambda!9313 () Bool)

(assert (=> (not b_lambda!9313) (not b!434471)))

(declare-fun t!13277 () Bool)

(declare-fun tb!3641 () Bool)

(assert (=> (and start!39962 (= defaultEntry!557 defaultEntry!557) t!13277) tb!3641))

(declare-fun result!6817 () Bool)

(assert (=> tb!3641 (= result!6817 tp_is_empty!11395)))

(assert (=> b!434471 t!13277))

(declare-fun b_and!18121 () Bool)

(assert (= b_and!18119 (and (=> t!13277 result!6817) b_and!18121)))

(declare-fun m!421935 () Bool)

(assert (=> b!434471 m!421935))

(declare-fun m!421937 () Bool)

(assert (=> b!434471 m!421937))

(declare-fun m!421939 () Bool)

(assert (=> b!434471 m!421939))

(declare-fun m!421941 () Bool)

(assert (=> b!434471 m!421941))

(assert (=> b!434471 m!421939))

(assert (=> b!434471 m!421937))

(declare-fun m!421943 () Bool)

(assert (=> b!434471 m!421943))

(declare-fun m!421945 () Bool)

(assert (=> b!434474 m!421945))

(assert (=> b!434474 m!421945))

(declare-fun m!421947 () Bool)

(assert (=> b!434474 m!421947))

(assert (=> b!434474 m!421935))

(assert (=> b!434474 m!421935))

(declare-fun m!421949 () Bool)

(assert (=> b!434474 m!421949))

(declare-fun m!421951 () Bool)

(assert (=> b!434472 m!421951))

(declare-fun m!421953 () Bool)

(assert (=> start!39962 m!421953))

(declare-fun m!421955 () Bool)

(assert (=> start!39962 m!421955))

(declare-fun m!421957 () Bool)

(assert (=> b!434475 m!421957))

(declare-fun m!421959 () Bool)

(assert (=> b!434463 m!421959))

(declare-fun m!421961 () Bool)

(assert (=> b!434465 m!421961))

(declare-fun m!421963 () Bool)

(assert (=> b!434467 m!421963))

(declare-fun m!421965 () Bool)

(assert (=> b!434467 m!421965))

(declare-fun m!421967 () Bool)

(assert (=> b!434478 m!421967))

(declare-fun m!421969 () Bool)

(assert (=> b!434478 m!421969))

(declare-fun m!421971 () Bool)

(assert (=> b!434478 m!421971))

(declare-fun m!421973 () Bool)

(assert (=> b!434482 m!421973))

(declare-fun m!421975 () Bool)

(assert (=> b!434482 m!421975))

(assert (=> b!434482 m!421935))

(declare-fun m!421977 () Bool)

(assert (=> b!434482 m!421977))

(declare-fun m!421979 () Bool)

(assert (=> b!434482 m!421979))

(declare-fun m!421981 () Bool)

(assert (=> b!434482 m!421981))

(assert (=> b!434482 m!421935))

(declare-fun m!421983 () Bool)

(assert (=> b!434466 m!421983))

(declare-fun m!421985 () Bool)

(assert (=> b!434477 m!421985))

(declare-fun m!421987 () Bool)

(assert (=> mapNonEmpty!18714 m!421987))

(declare-fun m!421989 () Bool)

(assert (=> b!434473 m!421989))

(declare-fun m!421991 () Bool)

(assert (=> b!434480 m!421991))

(check-sat (not start!39962) (not b_next!10243) tp_is_empty!11395 (not b!434473) (not b!434467) (not b!434463) (not b!434477) (not b!434465) (not b!434474) (not b!434478) (not mapNonEmpty!18714) (not b!434482) b_and!18121 (not b!434466) (not b!434472) (not b_lambda!9313) (not b!434471) (not b!434480))
(check-sat b_and!18121 (not b_next!10243))
