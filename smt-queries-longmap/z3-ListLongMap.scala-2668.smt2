; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39812 () Bool)

(assert start!39812)

(declare-fun b_free!10093 () Bool)

(declare-fun b_next!10093 () Bool)

(assert (=> start!39812 (= b_free!10093 (not b_next!10093))))

(declare-fun tp!35808 () Bool)

(declare-fun b_and!17859 () Bool)

(assert (=> start!39812 (= tp!35808 b_and!17859)))

(declare-fun res!252668 () Bool)

(declare-fun e!254623 () Bool)

(assert (=> start!39812 (=> (not res!252668) (not e!254623))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26330 0))(
  ( (array!26331 (arr!12614 (Array (_ BitVec 32) (_ BitVec 64))) (size!12966 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26330)

(assert (=> start!39812 (= res!252668 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12966 _keys!709))))))

(assert (=> start!39812 e!254623))

(declare-fun tp_is_empty!11245 () Bool)

(assert (=> start!39812 tp_is_empty!11245))

(assert (=> start!39812 tp!35808))

(assert (=> start!39812 true))

(declare-datatypes ((V!16099 0))(
  ( (V!16100 (val!5667 Int)) )
))
(declare-datatypes ((ValueCell!5279 0))(
  ( (ValueCellFull!5279 (v!7915 V!16099)) (EmptyCell!5279) )
))
(declare-datatypes ((array!26332 0))(
  ( (array!26333 (arr!12615 (Array (_ BitVec 32) ValueCell!5279)) (size!12967 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26332)

(declare-fun e!254629 () Bool)

(declare-fun array_inv!9248 (array!26332) Bool)

(assert (=> start!39812 (and (array_inv!9248 _values!549) e!254629)))

(declare-fun array_inv!9249 (array!26330) Bool)

(assert (=> start!39812 (array_inv!9249 _keys!709)))

(declare-fun mapIsEmpty!18489 () Bool)

(declare-fun mapRes!18489 () Bool)

(assert (=> mapIsEmpty!18489 mapRes!18489))

(declare-fun b!430035 () Bool)

(declare-fun e!254620 () Bool)

(assert (=> b!430035 (= e!254620 tp_is_empty!11245)))

(declare-fun b!430036 () Bool)

(declare-fun e!254628 () Bool)

(assert (=> b!430036 (= e!254628 tp_is_empty!11245)))

(declare-fun b!430037 () Bool)

(declare-fun e!254625 () Bool)

(assert (=> b!430037 (= e!254625 true)))

(declare-datatypes ((tuple2!7368 0))(
  ( (tuple2!7369 (_1!3695 (_ BitVec 64)) (_2!3695 V!16099)) )
))
(declare-fun lt!196629 () tuple2!7368)

(declare-fun lt!196624 () tuple2!7368)

(declare-datatypes ((List!7366 0))(
  ( (Nil!7363) (Cons!7362 (h!8218 tuple2!7368) (t!12900 List!7366)) )
))
(declare-datatypes ((ListLongMap!6283 0))(
  ( (ListLongMap!6284 (toList!3157 List!7366)) )
))
(declare-fun lt!196626 () ListLongMap!6283)

(declare-fun lt!196615 () ListLongMap!6283)

(declare-fun +!1368 (ListLongMap!6283 tuple2!7368) ListLongMap!6283)

(assert (=> b!430037 (= lt!196615 (+!1368 (+!1368 lt!196626 lt!196624) lt!196629))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12649 0))(
  ( (Unit!12650) )
))
(declare-fun lt!196620 () Unit!12649)

(declare-fun v!412 () V!16099)

(declare-fun lt!196628 () V!16099)

(declare-fun addCommutativeForDiffKeys!350 (ListLongMap!6283 (_ BitVec 64) V!16099 (_ BitVec 64) V!16099) Unit!12649)

(assert (=> b!430037 (= lt!196620 (addCommutativeForDiffKeys!350 lt!196626 k0!794 v!412 (select (arr!12614 _keys!709) from!863) lt!196628))))

(declare-fun b!430038 () Bool)

(declare-fun e!254621 () Unit!12649)

(declare-fun Unit!12651 () Unit!12649)

(assert (=> b!430038 (= e!254621 Unit!12651)))

(declare-fun lt!196627 () Unit!12649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26330 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12649)

(assert (=> b!430038 (= lt!196627 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430038 false))

(declare-fun b!430039 () Bool)

(declare-fun res!252660 () Bool)

(assert (=> b!430039 (=> (not res!252660) (not e!254623))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430039 (= res!252660 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12966 _keys!709))))))

(declare-fun b!430040 () Bool)

(declare-fun e!254624 () Bool)

(declare-fun e!254626 () Bool)

(assert (=> b!430040 (= e!254624 e!254626)))

(declare-fun res!252663 () Bool)

(assert (=> b!430040 (=> (not res!252663) (not e!254626))))

(assert (=> b!430040 (= res!252663 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16099)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16099)

(declare-fun lt!196622 () array!26332)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!196617 () ListLongMap!6283)

(declare-fun lt!196616 () array!26330)

(declare-fun getCurrentListMapNoExtraKeys!1401 (array!26330 array!26332 (_ BitVec 32) (_ BitVec 32) V!16099 V!16099 (_ BitVec 32) Int) ListLongMap!6283)

(assert (=> b!430040 (= lt!196617 (getCurrentListMapNoExtraKeys!1401 lt!196616 lt!196622 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430040 (= lt!196622 (array!26333 (store (arr!12615 _values!549) i!563 (ValueCellFull!5279 v!412)) (size!12967 _values!549)))))

(declare-fun lt!196621 () ListLongMap!6283)

(assert (=> b!430040 (= lt!196621 (getCurrentListMapNoExtraKeys!1401 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430041 () Bool)

(declare-fun res!252664 () Bool)

(assert (=> b!430041 (=> (not res!252664) (not e!254624))))

(assert (=> b!430041 (= res!252664 (bvsle from!863 i!563))))

(declare-fun b!430042 () Bool)

(declare-fun res!252658 () Bool)

(assert (=> b!430042 (=> (not res!252658) (not e!254624))))

(declare-datatypes ((List!7367 0))(
  ( (Nil!7364) (Cons!7363 (h!8219 (_ BitVec 64)) (t!12901 List!7367)) )
))
(declare-fun arrayNoDuplicates!0 (array!26330 (_ BitVec 32) List!7367) Bool)

(assert (=> b!430042 (= res!252658 (arrayNoDuplicates!0 lt!196616 #b00000000000000000000000000000000 Nil!7364))))

(declare-fun b!430043 () Bool)

(assert (=> b!430043 (= e!254623 e!254624)))

(declare-fun res!252670 () Bool)

(assert (=> b!430043 (=> (not res!252670) (not e!254624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26330 (_ BitVec 32)) Bool)

(assert (=> b!430043 (= res!252670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196616 mask!1025))))

(assert (=> b!430043 (= lt!196616 (array!26331 (store (arr!12614 _keys!709) i!563 k0!794) (size!12966 _keys!709)))))

(declare-fun b!430044 () Bool)

(declare-fun e!254622 () Bool)

(assert (=> b!430044 (= e!254622 e!254625)))

(declare-fun res!252671 () Bool)

(assert (=> b!430044 (=> res!252671 e!254625)))

(assert (=> b!430044 (= res!252671 (= k0!794 (select (arr!12614 _keys!709) from!863)))))

(assert (=> b!430044 (not (= (select (arr!12614 _keys!709) from!863) k0!794))))

(declare-fun lt!196623 () Unit!12649)

(assert (=> b!430044 (= lt!196623 e!254621)))

(declare-fun c!55452 () Bool)

(assert (=> b!430044 (= c!55452 (= (select (arr!12614 _keys!709) from!863) k0!794))))

(assert (=> b!430044 (= lt!196617 lt!196615)))

(declare-fun lt!196618 () ListLongMap!6283)

(assert (=> b!430044 (= lt!196615 (+!1368 lt!196618 lt!196624))))

(assert (=> b!430044 (= lt!196624 (tuple2!7369 (select (arr!12614 _keys!709) from!863) lt!196628))))

(declare-fun get!6266 (ValueCell!5279 V!16099) V!16099)

(declare-fun dynLambda!781 (Int (_ BitVec 64)) V!16099)

(assert (=> b!430044 (= lt!196628 (get!6266 (select (arr!12615 _values!549) from!863) (dynLambda!781 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430045 () Bool)

(declare-fun res!252672 () Bool)

(assert (=> b!430045 (=> (not res!252672) (not e!254623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430045 (= res!252672 (validKeyInArray!0 k0!794))))

(declare-fun b!430046 () Bool)

(assert (=> b!430046 (= e!254626 (not e!254622))))

(declare-fun res!252665 () Bool)

(assert (=> b!430046 (=> res!252665 e!254622)))

(assert (=> b!430046 (= res!252665 (not (validKeyInArray!0 (select (arr!12614 _keys!709) from!863))))))

(declare-fun lt!196619 () ListLongMap!6283)

(assert (=> b!430046 (= lt!196619 lt!196618)))

(assert (=> b!430046 (= lt!196618 (+!1368 lt!196626 lt!196629))))

(assert (=> b!430046 (= lt!196619 (getCurrentListMapNoExtraKeys!1401 lt!196616 lt!196622 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430046 (= lt!196629 (tuple2!7369 k0!794 v!412))))

(assert (=> b!430046 (= lt!196626 (getCurrentListMapNoExtraKeys!1401 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196625 () Unit!12649)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!546 (array!26330 array!26332 (_ BitVec 32) (_ BitVec 32) V!16099 V!16099 (_ BitVec 32) (_ BitVec 64) V!16099 (_ BitVec 32) Int) Unit!12649)

(assert (=> b!430046 (= lt!196625 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430047 () Bool)

(declare-fun res!252659 () Bool)

(assert (=> b!430047 (=> (not res!252659) (not e!254623))))

(declare-fun arrayContainsKey!0 (array!26330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430047 (= res!252659 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430048 () Bool)

(declare-fun Unit!12652 () Unit!12649)

(assert (=> b!430048 (= e!254621 Unit!12652)))

(declare-fun mapNonEmpty!18489 () Bool)

(declare-fun tp!35807 () Bool)

(assert (=> mapNonEmpty!18489 (= mapRes!18489 (and tp!35807 e!254628))))

(declare-fun mapRest!18489 () (Array (_ BitVec 32) ValueCell!5279))

(declare-fun mapValue!18489 () ValueCell!5279)

(declare-fun mapKey!18489 () (_ BitVec 32))

(assert (=> mapNonEmpty!18489 (= (arr!12615 _values!549) (store mapRest!18489 mapKey!18489 mapValue!18489))))

(declare-fun b!430049 () Bool)

(declare-fun res!252667 () Bool)

(assert (=> b!430049 (=> (not res!252667) (not e!254623))))

(assert (=> b!430049 (= res!252667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430050 () Bool)

(assert (=> b!430050 (= e!254629 (and e!254620 mapRes!18489))))

(declare-fun condMapEmpty!18489 () Bool)

(declare-fun mapDefault!18489 () ValueCell!5279)

(assert (=> b!430050 (= condMapEmpty!18489 (= (arr!12615 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5279)) mapDefault!18489)))))

(declare-fun b!430051 () Bool)

(declare-fun res!252669 () Bool)

(assert (=> b!430051 (=> (not res!252669) (not e!254623))))

(assert (=> b!430051 (= res!252669 (or (= (select (arr!12614 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12614 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430052 () Bool)

(declare-fun res!252662 () Bool)

(assert (=> b!430052 (=> (not res!252662) (not e!254623))))

(assert (=> b!430052 (= res!252662 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7364))))

(declare-fun b!430053 () Bool)

(declare-fun res!252661 () Bool)

(assert (=> b!430053 (=> (not res!252661) (not e!254623))))

(assert (=> b!430053 (= res!252661 (and (= (size!12967 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12966 _keys!709) (size!12967 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430054 () Bool)

(declare-fun res!252666 () Bool)

(assert (=> b!430054 (=> (not res!252666) (not e!254623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430054 (= res!252666 (validMask!0 mask!1025))))

(assert (= (and start!39812 res!252668) b!430054))

(assert (= (and b!430054 res!252666) b!430053))

(assert (= (and b!430053 res!252661) b!430049))

(assert (= (and b!430049 res!252667) b!430052))

(assert (= (and b!430052 res!252662) b!430039))

(assert (= (and b!430039 res!252660) b!430045))

(assert (= (and b!430045 res!252672) b!430051))

(assert (= (and b!430051 res!252669) b!430047))

(assert (= (and b!430047 res!252659) b!430043))

(assert (= (and b!430043 res!252670) b!430042))

(assert (= (and b!430042 res!252658) b!430041))

(assert (= (and b!430041 res!252664) b!430040))

(assert (= (and b!430040 res!252663) b!430046))

(assert (= (and b!430046 (not res!252665)) b!430044))

(assert (= (and b!430044 c!55452) b!430038))

(assert (= (and b!430044 (not c!55452)) b!430048))

(assert (= (and b!430044 (not res!252671)) b!430037))

(assert (= (and b!430050 condMapEmpty!18489) mapIsEmpty!18489))

(assert (= (and b!430050 (not condMapEmpty!18489)) mapNonEmpty!18489))

(get-info :version)

(assert (= (and mapNonEmpty!18489 ((_ is ValueCellFull!5279) mapValue!18489)) b!430036))

(assert (= (and b!430050 ((_ is ValueCellFull!5279) mapDefault!18489)) b!430035))

(assert (= start!39812 b!430050))

(declare-fun b_lambda!9203 () Bool)

(assert (=> (not b_lambda!9203) (not b!430044)))

(declare-fun t!12899 () Bool)

(declare-fun tb!3491 () Bool)

(assert (=> (and start!39812 (= defaultEntry!557 defaultEntry!557) t!12899) tb!3491))

(declare-fun result!6517 () Bool)

(assert (=> tb!3491 (= result!6517 tp_is_empty!11245)))

(assert (=> b!430044 t!12899))

(declare-fun b_and!17861 () Bool)

(assert (= b_and!17859 (and (=> t!12899 result!6517) b_and!17861)))

(declare-fun m!418535 () Bool)

(assert (=> b!430047 m!418535))

(declare-fun m!418537 () Bool)

(assert (=> b!430049 m!418537))

(declare-fun m!418539 () Bool)

(assert (=> b!430040 m!418539))

(declare-fun m!418541 () Bool)

(assert (=> b!430040 m!418541))

(declare-fun m!418543 () Bool)

(assert (=> b!430040 m!418543))

(declare-fun m!418545 () Bool)

(assert (=> b!430044 m!418545))

(declare-fun m!418547 () Bool)

(assert (=> b!430044 m!418547))

(declare-fun m!418549 () Bool)

(assert (=> b!430044 m!418549))

(declare-fun m!418551 () Bool)

(assert (=> b!430044 m!418551))

(assert (=> b!430044 m!418551))

(assert (=> b!430044 m!418547))

(declare-fun m!418553 () Bool)

(assert (=> b!430044 m!418553))

(declare-fun m!418555 () Bool)

(assert (=> b!430054 m!418555))

(declare-fun m!418557 () Bool)

(assert (=> b!430042 m!418557))

(declare-fun m!418559 () Bool)

(assert (=> b!430045 m!418559))

(declare-fun m!418561 () Bool)

(assert (=> b!430051 m!418561))

(declare-fun m!418563 () Bool)

(assert (=> b!430038 m!418563))

(assert (=> b!430046 m!418545))

(declare-fun m!418565 () Bool)

(assert (=> b!430046 m!418565))

(declare-fun m!418567 () Bool)

(assert (=> b!430046 m!418567))

(declare-fun m!418569 () Bool)

(assert (=> b!430046 m!418569))

(assert (=> b!430046 m!418545))

(declare-fun m!418571 () Bool)

(assert (=> b!430046 m!418571))

(declare-fun m!418573 () Bool)

(assert (=> b!430046 m!418573))

(declare-fun m!418575 () Bool)

(assert (=> start!39812 m!418575))

(declare-fun m!418577 () Bool)

(assert (=> start!39812 m!418577))

(declare-fun m!418579 () Bool)

(assert (=> b!430043 m!418579))

(declare-fun m!418581 () Bool)

(assert (=> b!430043 m!418581))

(declare-fun m!418583 () Bool)

(assert (=> b!430037 m!418583))

(assert (=> b!430037 m!418583))

(declare-fun m!418585 () Bool)

(assert (=> b!430037 m!418585))

(assert (=> b!430037 m!418545))

(assert (=> b!430037 m!418545))

(declare-fun m!418587 () Bool)

(assert (=> b!430037 m!418587))

(declare-fun m!418589 () Bool)

(assert (=> mapNonEmpty!18489 m!418589))

(declare-fun m!418591 () Bool)

(assert (=> b!430052 m!418591))

(check-sat (not b!430043) (not b!430054) (not b!430046) (not b!430044) (not b!430052) (not b!430037) (not b!430040) b_and!17861 (not b!430047) (not b!430049) (not b!430038) (not mapNonEmpty!18489) (not b!430042) (not b!430045) tp_is_empty!11245 (not b_next!10093) (not start!39812) (not b_lambda!9203))
(check-sat b_and!17861 (not b_next!10093))
