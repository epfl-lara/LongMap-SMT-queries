; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39972 () Bool)

(assert start!39972)

(declare-fun b_free!10239 () Bool)

(declare-fun b_next!10239 () Bool)

(assert (=> start!39972 (= b_free!10239 (not b_next!10239))))

(declare-fun tp!36245 () Bool)

(declare-fun b_and!18137 () Bool)

(assert (=> start!39972 (= tp!36245 b_and!18137)))

(declare-fun b!434610 () Bool)

(declare-fun res!255960 () Bool)

(declare-fun e!256849 () Bool)

(assert (=> b!434610 (=> (not res!255960) (not e!256849))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434610 (= res!255960 (validMask!0 mask!1025))))

(declare-fun b!434611 () Bool)

(declare-fun e!256847 () Bool)

(declare-fun e!256850 () Bool)

(assert (=> b!434611 (= e!256847 (not e!256850))))

(declare-fun res!255957 () Bool)

(assert (=> b!434611 (=> res!255957 e!256850)))

(declare-datatypes ((array!26613 0))(
  ( (array!26614 (arr!12756 (Array (_ BitVec 32) (_ BitVec 64))) (size!13108 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26613)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434611 (= res!255957 (not (validKeyInArray!0 (select (arr!12756 _keys!709) from!863))))))

(declare-datatypes ((V!16293 0))(
  ( (V!16294 (val!5740 Int)) )
))
(declare-datatypes ((tuple2!7596 0))(
  ( (tuple2!7597 (_1!3809 (_ BitVec 64)) (_2!3809 V!16293)) )
))
(declare-datatypes ((List!7599 0))(
  ( (Nil!7596) (Cons!7595 (h!8451 tuple2!7596) (t!13287 List!7599)) )
))
(declare-datatypes ((ListLongMap!6509 0))(
  ( (ListLongMap!6510 (toList!3270 List!7599)) )
))
(declare-fun lt!199883 () ListLongMap!6509)

(declare-fun lt!199885 () ListLongMap!6509)

(assert (=> b!434611 (= lt!199883 lt!199885)))

(declare-fun lt!199895 () ListLongMap!6509)

(declare-fun lt!199884 () tuple2!7596)

(declare-fun +!1418 (ListLongMap!6509 tuple2!7596) ListLongMap!6509)

(assert (=> b!434611 (= lt!199885 (+!1418 lt!199895 lt!199884))))

(declare-fun minValue!515 () V!16293)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!199887 () array!26613)

(declare-fun zeroValue!515 () V!16293)

(declare-datatypes ((ValueCell!5352 0))(
  ( (ValueCellFull!5352 (v!7987 V!16293)) (EmptyCell!5352) )
))
(declare-datatypes ((array!26615 0))(
  ( (array!26616 (arr!12757 (Array (_ BitVec 32) ValueCell!5352)) (size!13109 (_ BitVec 32))) )
))
(declare-fun lt!199890 () array!26615)

(declare-fun getCurrentListMapNoExtraKeys!1462 (array!26613 array!26615 (_ BitVec 32) (_ BitVec 32) V!16293 V!16293 (_ BitVec 32) Int) ListLongMap!6509)

(assert (=> b!434611 (= lt!199883 (getCurrentListMapNoExtraKeys!1462 lt!199887 lt!199890 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16293)

(assert (=> b!434611 (= lt!199884 (tuple2!7597 k0!794 v!412))))

(declare-fun _values!549 () array!26615)

(assert (=> b!434611 (= lt!199895 (getCurrentListMapNoExtraKeys!1462 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12890 0))(
  ( (Unit!12891) )
))
(declare-fun lt!199882 () Unit!12890)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!593 (array!26613 array!26615 (_ BitVec 32) (_ BitVec 32) V!16293 V!16293 (_ BitVec 32) (_ BitVec 64) V!16293 (_ BitVec 32) Int) Unit!12890)

(assert (=> b!434611 (= lt!199882 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!593 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434612 () Bool)

(declare-fun e!256846 () Unit!12890)

(declare-fun Unit!12892 () Unit!12890)

(assert (=> b!434612 (= e!256846 Unit!12892)))

(declare-fun lt!199894 () Unit!12890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12890)

(assert (=> b!434612 (= lt!199894 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434612 false))

(declare-fun res!255953 () Bool)

(assert (=> start!39972 (=> (not res!255953) (not e!256849))))

(assert (=> start!39972 (= res!255953 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13108 _keys!709))))))

(assert (=> start!39972 e!256849))

(declare-fun tp_is_empty!11391 () Bool)

(assert (=> start!39972 tp_is_empty!11391))

(assert (=> start!39972 tp!36245))

(assert (=> start!39972 true))

(declare-fun e!256845 () Bool)

(declare-fun array_inv!9278 (array!26615) Bool)

(assert (=> start!39972 (and (array_inv!9278 _values!549) e!256845)))

(declare-fun array_inv!9279 (array!26613) Bool)

(assert (=> start!39972 (array_inv!9279 _keys!709)))

(declare-fun b!434613 () Bool)

(declare-fun e!256848 () Bool)

(assert (=> b!434613 (= e!256848 tp_is_empty!11391)))

(declare-fun b!434614 () Bool)

(declare-fun res!255959 () Bool)

(assert (=> b!434614 (=> (not res!255959) (not e!256849))))

(assert (=> b!434614 (= res!255959 (and (= (size!13109 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13108 _keys!709) (size!13109 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434615 () Bool)

(declare-fun e!256842 () Bool)

(assert (=> b!434615 (= e!256842 true)))

(declare-fun lt!199892 () ListLongMap!6509)

(declare-fun lt!199893 () tuple2!7596)

(assert (=> b!434615 (= lt!199892 (+!1418 (+!1418 lt!199895 lt!199893) lt!199884))))

(declare-fun lt!199891 () Unit!12890)

(declare-fun lt!199889 () V!16293)

(declare-fun addCommutativeForDiffKeys!402 (ListLongMap!6509 (_ BitVec 64) V!16293 (_ BitVec 64) V!16293) Unit!12890)

(assert (=> b!434615 (= lt!199891 (addCommutativeForDiffKeys!402 lt!199895 k0!794 v!412 (select (arr!12756 _keys!709) from!863) lt!199889))))

(declare-fun b!434616 () Bool)

(declare-fun res!255952 () Bool)

(assert (=> b!434616 (=> (not res!255952) (not e!256849))))

(assert (=> b!434616 (= res!255952 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18708 () Bool)

(declare-fun mapRes!18708 () Bool)

(declare-fun tp!36246 () Bool)

(assert (=> mapNonEmpty!18708 (= mapRes!18708 (and tp!36246 e!256848))))

(declare-fun mapRest!18708 () (Array (_ BitVec 32) ValueCell!5352))

(declare-fun mapValue!18708 () ValueCell!5352)

(declare-fun mapKey!18708 () (_ BitVec 32))

(assert (=> mapNonEmpty!18708 (= (arr!12757 _values!549) (store mapRest!18708 mapKey!18708 mapValue!18708))))

(declare-fun b!434617 () Bool)

(declare-fun res!255946 () Bool)

(assert (=> b!434617 (=> (not res!255946) (not e!256849))))

(assert (=> b!434617 (= res!255946 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13108 _keys!709))))))

(declare-fun b!434618 () Bool)

(declare-fun e!256843 () Bool)

(assert (=> b!434618 (= e!256849 e!256843)))

(declare-fun res!255954 () Bool)

(assert (=> b!434618 (=> (not res!255954) (not e!256843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26613 (_ BitVec 32)) Bool)

(assert (=> b!434618 (= res!255954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199887 mask!1025))))

(assert (=> b!434618 (= lt!199887 (array!26614 (store (arr!12756 _keys!709) i!563 k0!794) (size!13108 _keys!709)))))

(declare-fun b!434619 () Bool)

(assert (=> b!434619 (= e!256850 e!256842)))

(declare-fun res!255949 () Bool)

(assert (=> b!434619 (=> res!255949 e!256842)))

(assert (=> b!434619 (= res!255949 (= k0!794 (select (arr!12756 _keys!709) from!863)))))

(assert (=> b!434619 (not (= (select (arr!12756 _keys!709) from!863) k0!794))))

(declare-fun lt!199881 () Unit!12890)

(assert (=> b!434619 (= lt!199881 e!256846)))

(declare-fun c!55694 () Bool)

(assert (=> b!434619 (= c!55694 (= (select (arr!12756 _keys!709) from!863) k0!794))))

(declare-fun lt!199886 () ListLongMap!6509)

(assert (=> b!434619 (= lt!199886 lt!199892)))

(assert (=> b!434619 (= lt!199892 (+!1418 lt!199885 lt!199893))))

(assert (=> b!434619 (= lt!199893 (tuple2!7597 (select (arr!12756 _keys!709) from!863) lt!199889))))

(declare-fun get!6355 (ValueCell!5352 V!16293) V!16293)

(declare-fun dynLambda!828 (Int (_ BitVec 64)) V!16293)

(assert (=> b!434619 (= lt!199889 (get!6355 (select (arr!12757 _values!549) from!863) (dynLambda!828 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434620 () Bool)

(declare-fun Unit!12893 () Unit!12890)

(assert (=> b!434620 (= e!256846 Unit!12893)))

(declare-fun b!434621 () Bool)

(declare-fun e!256851 () Bool)

(assert (=> b!434621 (= e!256851 tp_is_empty!11391)))

(declare-fun b!434622 () Bool)

(declare-fun res!255958 () Bool)

(assert (=> b!434622 (=> (not res!255958) (not e!256849))))

(assert (=> b!434622 (= res!255958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434623 () Bool)

(declare-fun res!255951 () Bool)

(assert (=> b!434623 (=> (not res!255951) (not e!256849))))

(declare-fun arrayContainsKey!0 (array!26613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434623 (= res!255951 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434624 () Bool)

(declare-fun res!255955 () Bool)

(assert (=> b!434624 (=> (not res!255955) (not e!256849))))

(assert (=> b!434624 (= res!255955 (or (= (select (arr!12756 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12756 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18708 () Bool)

(assert (=> mapIsEmpty!18708 mapRes!18708))

(declare-fun b!434625 () Bool)

(assert (=> b!434625 (= e!256845 (and e!256851 mapRes!18708))))

(declare-fun condMapEmpty!18708 () Bool)

(declare-fun mapDefault!18708 () ValueCell!5352)

(assert (=> b!434625 (= condMapEmpty!18708 (= (arr!12757 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5352)) mapDefault!18708)))))

(declare-fun b!434626 () Bool)

(declare-fun res!255956 () Bool)

(assert (=> b!434626 (=> (not res!255956) (not e!256843))))

(declare-datatypes ((List!7600 0))(
  ( (Nil!7597) (Cons!7596 (h!8452 (_ BitVec 64)) (t!13288 List!7600)) )
))
(declare-fun arrayNoDuplicates!0 (array!26613 (_ BitVec 32) List!7600) Bool)

(assert (=> b!434626 (= res!255956 (arrayNoDuplicates!0 lt!199887 #b00000000000000000000000000000000 Nil!7597))))

(declare-fun b!434627 () Bool)

(declare-fun res!255947 () Bool)

(assert (=> b!434627 (=> (not res!255947) (not e!256849))))

(assert (=> b!434627 (= res!255947 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7597))))

(declare-fun b!434628 () Bool)

(declare-fun res!255948 () Bool)

(assert (=> b!434628 (=> (not res!255948) (not e!256843))))

(assert (=> b!434628 (= res!255948 (bvsle from!863 i!563))))

(declare-fun b!434629 () Bool)

(assert (=> b!434629 (= e!256843 e!256847)))

(declare-fun res!255950 () Bool)

(assert (=> b!434629 (=> (not res!255950) (not e!256847))))

(assert (=> b!434629 (= res!255950 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!434629 (= lt!199886 (getCurrentListMapNoExtraKeys!1462 lt!199887 lt!199890 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434629 (= lt!199890 (array!26616 (store (arr!12757 _values!549) i!563 (ValueCellFull!5352 v!412)) (size!13109 _values!549)))))

(declare-fun lt!199888 () ListLongMap!6509)

(assert (=> b!434629 (= lt!199888 (getCurrentListMapNoExtraKeys!1462 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39972 res!255953) b!434610))

(assert (= (and b!434610 res!255960) b!434614))

(assert (= (and b!434614 res!255959) b!434622))

(assert (= (and b!434622 res!255958) b!434627))

(assert (= (and b!434627 res!255947) b!434617))

(assert (= (and b!434617 res!255946) b!434616))

(assert (= (and b!434616 res!255952) b!434624))

(assert (= (and b!434624 res!255955) b!434623))

(assert (= (and b!434623 res!255951) b!434618))

(assert (= (and b!434618 res!255954) b!434626))

(assert (= (and b!434626 res!255956) b!434628))

(assert (= (and b!434628 res!255948) b!434629))

(assert (= (and b!434629 res!255950) b!434611))

(assert (= (and b!434611 (not res!255957)) b!434619))

(assert (= (and b!434619 c!55694) b!434612))

(assert (= (and b!434619 (not c!55694)) b!434620))

(assert (= (and b!434619 (not res!255949)) b!434615))

(assert (= (and b!434625 condMapEmpty!18708) mapIsEmpty!18708))

(assert (= (and b!434625 (not condMapEmpty!18708)) mapNonEmpty!18708))

(get-info :version)

(assert (= (and mapNonEmpty!18708 ((_ is ValueCellFull!5352) mapValue!18708)) b!434613))

(assert (= (and b!434625 ((_ is ValueCellFull!5352) mapDefault!18708)) b!434621))

(assert (= start!39972 b!434625))

(declare-fun b_lambda!9327 () Bool)

(assert (=> (not b_lambda!9327) (not b!434619)))

(declare-fun t!13286 () Bool)

(declare-fun tb!3645 () Bool)

(assert (=> (and start!39972 (= defaultEntry!557 defaultEntry!557) t!13286) tb!3645))

(declare-fun result!6817 () Bool)

(assert (=> tb!3645 (= result!6817 tp_is_empty!11391)))

(assert (=> b!434619 t!13286))

(declare-fun b_and!18139 () Bool)

(assert (= b_and!18137 (and (=> t!13286 result!6817) b_and!18139)))

(declare-fun m!422551 () Bool)

(assert (=> b!434622 m!422551))

(declare-fun m!422553 () Bool)

(assert (=> b!434623 m!422553))

(declare-fun m!422555 () Bool)

(assert (=> mapNonEmpty!18708 m!422555))

(declare-fun m!422557 () Bool)

(assert (=> b!434615 m!422557))

(assert (=> b!434615 m!422557))

(declare-fun m!422559 () Bool)

(assert (=> b!434615 m!422559))

(declare-fun m!422561 () Bool)

(assert (=> b!434615 m!422561))

(assert (=> b!434615 m!422561))

(declare-fun m!422563 () Bool)

(assert (=> b!434615 m!422563))

(declare-fun m!422565 () Bool)

(assert (=> b!434624 m!422565))

(declare-fun m!422567 () Bool)

(assert (=> b!434616 m!422567))

(assert (=> b!434619 m!422561))

(declare-fun m!422569 () Bool)

(assert (=> b!434619 m!422569))

(declare-fun m!422571 () Bool)

(assert (=> b!434619 m!422571))

(declare-fun m!422573 () Bool)

(assert (=> b!434619 m!422573))

(assert (=> b!434619 m!422573))

(assert (=> b!434619 m!422571))

(declare-fun m!422575 () Bool)

(assert (=> b!434619 m!422575))

(declare-fun m!422577 () Bool)

(assert (=> b!434627 m!422577))

(declare-fun m!422579 () Bool)

(assert (=> b!434610 m!422579))

(declare-fun m!422581 () Bool)

(assert (=> b!434612 m!422581))

(declare-fun m!422583 () Bool)

(assert (=> b!434618 m!422583))

(declare-fun m!422585 () Bool)

(assert (=> b!434618 m!422585))

(declare-fun m!422587 () Bool)

(assert (=> b!434626 m!422587))

(declare-fun m!422589 () Bool)

(assert (=> b!434629 m!422589))

(declare-fun m!422591 () Bool)

(assert (=> b!434629 m!422591))

(declare-fun m!422593 () Bool)

(assert (=> b!434629 m!422593))

(assert (=> b!434611 m!422561))

(declare-fun m!422595 () Bool)

(assert (=> b!434611 m!422595))

(declare-fun m!422597 () Bool)

(assert (=> b!434611 m!422597))

(declare-fun m!422599 () Bool)

(assert (=> b!434611 m!422599))

(assert (=> b!434611 m!422561))

(declare-fun m!422601 () Bool)

(assert (=> b!434611 m!422601))

(declare-fun m!422603 () Bool)

(assert (=> b!434611 m!422603))

(declare-fun m!422605 () Bool)

(assert (=> start!39972 m!422605))

(declare-fun m!422607 () Bool)

(assert (=> start!39972 m!422607))

(check-sat (not b!434629) b_and!18139 (not b!434622) (not start!39972) tp_is_empty!11391 (not b!434627) (not b!434615) (not b!434611) (not b!434610) (not b_lambda!9327) (not b!434618) (not b!434616) (not b_next!10239) (not b!434623) (not b!434626) (not b!434612) (not b!434619) (not mapNonEmpty!18708))
(check-sat b_and!18139 (not b_next!10239))
