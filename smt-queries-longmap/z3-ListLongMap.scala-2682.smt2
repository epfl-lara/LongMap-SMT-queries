; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39912 () Bool)

(assert start!39912)

(declare-fun b_free!10179 () Bool)

(declare-fun b_next!10179 () Bool)

(assert (=> start!39912 (= b_free!10179 (not b_next!10179))))

(declare-fun tp!36066 () Bool)

(declare-fun b_and!18017 () Bool)

(assert (=> start!39912 (= tp!36066 b_and!18017)))

(declare-fun b!432750 () Bool)

(declare-fun res!254600 () Bool)

(declare-fun e!255944 () Bool)

(assert (=> b!432750 (=> (not res!254600) (not e!255944))))

(declare-datatypes ((array!26495 0))(
  ( (array!26496 (arr!12697 (Array (_ BitVec 32) (_ BitVec 64))) (size!13049 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26495)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432750 (= res!254600 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432752 () Bool)

(declare-datatypes ((Unit!12790 0))(
  ( (Unit!12791) )
))
(declare-fun e!255947 () Unit!12790)

(declare-fun Unit!12792 () Unit!12790)

(assert (=> b!432752 (= e!255947 Unit!12792)))

(declare-fun lt!198544 () Unit!12790)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26495 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12790)

(assert (=> b!432752 (= lt!198544 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432752 false))

(declare-fun b!432753 () Bool)

(declare-fun res!254598 () Bool)

(declare-fun e!255949 () Bool)

(assert (=> b!432753 (=> (not res!254598) (not e!255949))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432753 (= res!254598 (bvsle from!863 i!563))))

(declare-fun b!432754 () Bool)

(declare-fun res!254607 () Bool)

(assert (=> b!432754 (=> (not res!254607) (not e!255944))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16213 0))(
  ( (V!16214 (val!5710 Int)) )
))
(declare-datatypes ((ValueCell!5322 0))(
  ( (ValueCellFull!5322 (v!7957 V!16213)) (EmptyCell!5322) )
))
(declare-datatypes ((array!26497 0))(
  ( (array!26498 (arr!12698 (Array (_ BitVec 32) ValueCell!5322)) (size!13050 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26497)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432754 (= res!254607 (and (= (size!13050 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13049 _keys!709) (size!13050 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18618 () Bool)

(declare-fun mapRes!18618 () Bool)

(assert (=> mapIsEmpty!18618 mapRes!18618))

(declare-fun b!432755 () Bool)

(declare-fun e!255950 () Bool)

(declare-fun e!255945 () Bool)

(assert (=> b!432755 (= e!255950 e!255945)))

(declare-fun res!254604 () Bool)

(assert (=> b!432755 (=> res!254604 e!255945)))

(assert (=> b!432755 (= res!254604 (= k0!794 (select (arr!12697 _keys!709) from!863)))))

(assert (=> b!432755 (not (= (select (arr!12697 _keys!709) from!863) k0!794))))

(declare-fun lt!198535 () Unit!12790)

(assert (=> b!432755 (= lt!198535 e!255947)))

(declare-fun c!55604 () Bool)

(assert (=> b!432755 (= c!55604 (= (select (arr!12697 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7538 0))(
  ( (tuple2!7539 (_1!3780 (_ BitVec 64)) (_2!3780 V!16213)) )
))
(declare-datatypes ((List!7552 0))(
  ( (Nil!7549) (Cons!7548 (h!8404 tuple2!7538) (t!13180 List!7552)) )
))
(declare-datatypes ((ListLongMap!6451 0))(
  ( (ListLongMap!6452 (toList!3241 List!7552)) )
))
(declare-fun lt!198532 () ListLongMap!6451)

(declare-fun lt!198540 () ListLongMap!6451)

(assert (=> b!432755 (= lt!198532 lt!198540)))

(declare-fun lt!198542 () ListLongMap!6451)

(declare-fun lt!198537 () tuple2!7538)

(declare-fun +!1389 (ListLongMap!6451 tuple2!7538) ListLongMap!6451)

(assert (=> b!432755 (= lt!198540 (+!1389 lt!198542 lt!198537))))

(declare-fun lt!198534 () V!16213)

(assert (=> b!432755 (= lt!198537 (tuple2!7539 (select (arr!12697 _keys!709) from!863) lt!198534))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6314 (ValueCell!5322 V!16213) V!16213)

(declare-fun dynLambda!807 (Int (_ BitVec 64)) V!16213)

(assert (=> b!432755 (= lt!198534 (get!6314 (select (arr!12698 _values!549) from!863) (dynLambda!807 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432756 () Bool)

(declare-fun e!255943 () Bool)

(declare-fun tp_is_empty!11331 () Bool)

(assert (=> b!432756 (= e!255943 tp_is_empty!11331)))

(declare-fun b!432757 () Bool)

(declare-fun res!254608 () Bool)

(assert (=> b!432757 (=> (not res!254608) (not e!255944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432757 (= res!254608 (validKeyInArray!0 k0!794))))

(declare-fun b!432758 () Bool)

(declare-fun res!254599 () Bool)

(assert (=> b!432758 (=> (not res!254599) (not e!255944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432758 (= res!254599 (validMask!0 mask!1025))))

(declare-fun b!432759 () Bool)

(declare-fun Unit!12793 () Unit!12790)

(assert (=> b!432759 (= e!255947 Unit!12793)))

(declare-fun b!432760 () Bool)

(declare-fun res!254606 () Bool)

(assert (=> b!432760 (=> (not res!254606) (not e!255944))))

(declare-datatypes ((List!7553 0))(
  ( (Nil!7550) (Cons!7549 (h!8405 (_ BitVec 64)) (t!13181 List!7553)) )
))
(declare-fun arrayNoDuplicates!0 (array!26495 (_ BitVec 32) List!7553) Bool)

(assert (=> b!432760 (= res!254606 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7550))))

(declare-fun b!432761 () Bool)

(declare-fun res!254596 () Bool)

(assert (=> b!432761 (=> (not res!254596) (not e!255944))))

(assert (=> b!432761 (= res!254596 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13049 _keys!709))))))

(declare-fun b!432762 () Bool)

(assert (=> b!432762 (= e!255944 e!255949)))

(declare-fun res!254610 () Bool)

(assert (=> b!432762 (=> (not res!254610) (not e!255949))))

(declare-fun lt!198533 () array!26495)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26495 (_ BitVec 32)) Bool)

(assert (=> b!432762 (= res!254610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198533 mask!1025))))

(assert (=> b!432762 (= lt!198533 (array!26496 (store (arr!12697 _keys!709) i!563 k0!794) (size!13049 _keys!709)))))

(declare-fun mapNonEmpty!18618 () Bool)

(declare-fun tp!36065 () Bool)

(declare-fun e!255942 () Bool)

(assert (=> mapNonEmpty!18618 (= mapRes!18618 (and tp!36065 e!255942))))

(declare-fun mapRest!18618 () (Array (_ BitVec 32) ValueCell!5322))

(declare-fun mapKey!18618 () (_ BitVec 32))

(declare-fun mapValue!18618 () ValueCell!5322)

(assert (=> mapNonEmpty!18618 (= (arr!12698 _values!549) (store mapRest!18618 mapKey!18618 mapValue!18618))))

(declare-fun b!432763 () Bool)

(assert (=> b!432763 (= e!255945 true)))

(declare-fun lt!198543 () ListLongMap!6451)

(declare-fun lt!198539 () tuple2!7538)

(assert (=> b!432763 (= lt!198540 (+!1389 (+!1389 lt!198543 lt!198537) lt!198539))))

(declare-fun lt!198531 () Unit!12790)

(declare-fun v!412 () V!16213)

(declare-fun addCommutativeForDiffKeys!378 (ListLongMap!6451 (_ BitVec 64) V!16213 (_ BitVec 64) V!16213) Unit!12790)

(assert (=> b!432763 (= lt!198531 (addCommutativeForDiffKeys!378 lt!198543 k0!794 v!412 (select (arr!12697 _keys!709) from!863) lt!198534))))

(declare-fun res!254601 () Bool)

(assert (=> start!39912 (=> (not res!254601) (not e!255944))))

(assert (=> start!39912 (= res!254601 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13049 _keys!709))))))

(assert (=> start!39912 e!255944))

(assert (=> start!39912 tp_is_empty!11331))

(assert (=> start!39912 tp!36066))

(assert (=> start!39912 true))

(declare-fun e!255951 () Bool)

(declare-fun array_inv!9236 (array!26497) Bool)

(assert (=> start!39912 (and (array_inv!9236 _values!549) e!255951)))

(declare-fun array_inv!9237 (array!26495) Bool)

(assert (=> start!39912 (array_inv!9237 _keys!709)))

(declare-fun b!432751 () Bool)

(declare-fun res!254602 () Bool)

(assert (=> b!432751 (=> (not res!254602) (not e!255944))))

(assert (=> b!432751 (= res!254602 (or (= (select (arr!12697 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12697 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432764 () Bool)

(declare-fun e!255946 () Bool)

(assert (=> b!432764 (= e!255949 e!255946)))

(declare-fun res!254609 () Bool)

(assert (=> b!432764 (=> (not res!254609) (not e!255946))))

(assert (=> b!432764 (= res!254609 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16213)

(declare-fun zeroValue!515 () V!16213)

(declare-fun lt!198541 () array!26497)

(declare-fun getCurrentListMapNoExtraKeys!1439 (array!26495 array!26497 (_ BitVec 32) (_ BitVec 32) V!16213 V!16213 (_ BitVec 32) Int) ListLongMap!6451)

(assert (=> b!432764 (= lt!198532 (getCurrentListMapNoExtraKeys!1439 lt!198533 lt!198541 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432764 (= lt!198541 (array!26498 (store (arr!12698 _values!549) i!563 (ValueCellFull!5322 v!412)) (size!13050 _values!549)))))

(declare-fun lt!198536 () ListLongMap!6451)

(assert (=> b!432764 (= lt!198536 (getCurrentListMapNoExtraKeys!1439 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432765 () Bool)

(assert (=> b!432765 (= e!255942 tp_is_empty!11331)))

(declare-fun b!432766 () Bool)

(assert (=> b!432766 (= e!255946 (not e!255950))))

(declare-fun res!254605 () Bool)

(assert (=> b!432766 (=> res!254605 e!255950)))

(assert (=> b!432766 (= res!254605 (not (validKeyInArray!0 (select (arr!12697 _keys!709) from!863))))))

(declare-fun lt!198538 () ListLongMap!6451)

(assert (=> b!432766 (= lt!198538 lt!198542)))

(assert (=> b!432766 (= lt!198542 (+!1389 lt!198543 lt!198539))))

(assert (=> b!432766 (= lt!198538 (getCurrentListMapNoExtraKeys!1439 lt!198533 lt!198541 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432766 (= lt!198539 (tuple2!7539 k0!794 v!412))))

(assert (=> b!432766 (= lt!198543 (getCurrentListMapNoExtraKeys!1439 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198545 () Unit!12790)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!572 (array!26495 array!26497 (_ BitVec 32) (_ BitVec 32) V!16213 V!16213 (_ BitVec 32) (_ BitVec 64) V!16213 (_ BitVec 32) Int) Unit!12790)

(assert (=> b!432766 (= lt!198545 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!572 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432767 () Bool)

(assert (=> b!432767 (= e!255951 (and e!255943 mapRes!18618))))

(declare-fun condMapEmpty!18618 () Bool)

(declare-fun mapDefault!18618 () ValueCell!5322)

(assert (=> b!432767 (= condMapEmpty!18618 (= (arr!12698 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5322)) mapDefault!18618)))))

(declare-fun b!432768 () Bool)

(declare-fun res!254603 () Bool)

(assert (=> b!432768 (=> (not res!254603) (not e!255949))))

(assert (=> b!432768 (= res!254603 (arrayNoDuplicates!0 lt!198533 #b00000000000000000000000000000000 Nil!7550))))

(declare-fun b!432769 () Bool)

(declare-fun res!254597 () Bool)

(assert (=> b!432769 (=> (not res!254597) (not e!255944))))

(assert (=> b!432769 (= res!254597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39912 res!254601) b!432758))

(assert (= (and b!432758 res!254599) b!432754))

(assert (= (and b!432754 res!254607) b!432769))

(assert (= (and b!432769 res!254597) b!432760))

(assert (= (and b!432760 res!254606) b!432761))

(assert (= (and b!432761 res!254596) b!432757))

(assert (= (and b!432757 res!254608) b!432751))

(assert (= (and b!432751 res!254602) b!432750))

(assert (= (and b!432750 res!254600) b!432762))

(assert (= (and b!432762 res!254610) b!432768))

(assert (= (and b!432768 res!254603) b!432753))

(assert (= (and b!432753 res!254598) b!432764))

(assert (= (and b!432764 res!254609) b!432766))

(assert (= (and b!432766 (not res!254605)) b!432755))

(assert (= (and b!432755 c!55604) b!432752))

(assert (= (and b!432755 (not c!55604)) b!432759))

(assert (= (and b!432755 (not res!254604)) b!432763))

(assert (= (and b!432767 condMapEmpty!18618) mapIsEmpty!18618))

(assert (= (and b!432767 (not condMapEmpty!18618)) mapNonEmpty!18618))

(get-info :version)

(assert (= (and mapNonEmpty!18618 ((_ is ValueCellFull!5322) mapValue!18618)) b!432765))

(assert (= (and b!432767 ((_ is ValueCellFull!5322) mapDefault!18618)) b!432756))

(assert (= start!39912 b!432767))

(declare-fun b_lambda!9267 () Bool)

(assert (=> (not b_lambda!9267) (not b!432755)))

(declare-fun t!13179 () Bool)

(declare-fun tb!3585 () Bool)

(assert (=> (and start!39912 (= defaultEntry!557 defaultEntry!557) t!13179) tb!3585))

(declare-fun result!6697 () Bool)

(assert (=> tb!3585 (= result!6697 tp_is_empty!11331)))

(assert (=> b!432755 t!13179))

(declare-fun b_and!18019 () Bool)

(assert (= b_and!18017 (and (=> t!13179 result!6697) b_and!18019)))

(declare-fun m!420811 () Bool)

(assert (=> b!432751 m!420811))

(declare-fun m!420813 () Bool)

(assert (=> mapNonEmpty!18618 m!420813))

(declare-fun m!420815 () Bool)

(assert (=> b!432766 m!420815))

(declare-fun m!420817 () Bool)

(assert (=> b!432766 m!420817))

(assert (=> b!432766 m!420815))

(declare-fun m!420819 () Bool)

(assert (=> b!432766 m!420819))

(declare-fun m!420821 () Bool)

(assert (=> b!432766 m!420821))

(declare-fun m!420823 () Bool)

(assert (=> b!432766 m!420823))

(declare-fun m!420825 () Bool)

(assert (=> b!432766 m!420825))

(declare-fun m!420827 () Bool)

(assert (=> b!432752 m!420827))

(declare-fun m!420829 () Bool)

(assert (=> b!432769 m!420829))

(assert (=> b!432755 m!420815))

(declare-fun m!420831 () Bool)

(assert (=> b!432755 m!420831))

(declare-fun m!420833 () Bool)

(assert (=> b!432755 m!420833))

(declare-fun m!420835 () Bool)

(assert (=> b!432755 m!420835))

(assert (=> b!432755 m!420833))

(assert (=> b!432755 m!420831))

(declare-fun m!420837 () Bool)

(assert (=> b!432755 m!420837))

(declare-fun m!420839 () Bool)

(assert (=> b!432768 m!420839))

(declare-fun m!420841 () Bool)

(assert (=> b!432757 m!420841))

(declare-fun m!420843 () Bool)

(assert (=> b!432763 m!420843))

(assert (=> b!432763 m!420843))

(declare-fun m!420845 () Bool)

(assert (=> b!432763 m!420845))

(assert (=> b!432763 m!420815))

(assert (=> b!432763 m!420815))

(declare-fun m!420847 () Bool)

(assert (=> b!432763 m!420847))

(declare-fun m!420849 () Bool)

(assert (=> start!39912 m!420849))

(declare-fun m!420851 () Bool)

(assert (=> start!39912 m!420851))

(declare-fun m!420853 () Bool)

(assert (=> b!432764 m!420853))

(declare-fun m!420855 () Bool)

(assert (=> b!432764 m!420855))

(declare-fun m!420857 () Bool)

(assert (=> b!432764 m!420857))

(declare-fun m!420859 () Bool)

(assert (=> b!432760 m!420859))

(declare-fun m!420861 () Bool)

(assert (=> b!432762 m!420861))

(declare-fun m!420863 () Bool)

(assert (=> b!432762 m!420863))

(declare-fun m!420865 () Bool)

(assert (=> b!432758 m!420865))

(declare-fun m!420867 () Bool)

(assert (=> b!432750 m!420867))

(check-sat (not b!432769) (not b!432766) (not b!432763) b_and!18019 (not b!432757) (not start!39912) (not b!432750) (not b!432752) (not b!432762) (not b!432764) tp_is_empty!11331 (not b!432758) (not b_lambda!9267) (not mapNonEmpty!18618) (not b!432768) (not b!432760) (not b_next!10179) (not b!432755))
(check-sat b_and!18019 (not b_next!10179))
