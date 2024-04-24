; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39482 () Bool)

(assert start!39482)

(declare-fun b_free!9763 () Bool)

(declare-fun b_next!9763 () Bool)

(assert (=> start!39482 (= b_free!9763 (not b_next!9763))))

(declare-fun tp!34817 () Bool)

(declare-fun b_and!17415 () Bool)

(assert (=> start!39482 (= tp!34817 b_and!17415)))

(declare-fun res!246203 () Bool)

(declare-fun e!251023 () Bool)

(assert (=> start!39482 (=> (not res!246203) (not e!251023))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25684 0))(
  ( (array!25685 (arr!12291 (Array (_ BitVec 32) (_ BitVec 64))) (size!12643 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25684)

(assert (=> start!39482 (= res!246203 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12643 _keys!709))))))

(assert (=> start!39482 e!251023))

(declare-fun tp_is_empty!10915 () Bool)

(assert (=> start!39482 tp_is_empty!10915))

(assert (=> start!39482 tp!34817))

(assert (=> start!39482 true))

(declare-datatypes ((V!15659 0))(
  ( (V!15660 (val!5502 Int)) )
))
(declare-datatypes ((ValueCell!5114 0))(
  ( (ValueCellFull!5114 (v!7750 V!15659)) (EmptyCell!5114) )
))
(declare-datatypes ((array!25686 0))(
  ( (array!25687 (arr!12292 (Array (_ BitVec 32) ValueCell!5114)) (size!12644 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25686)

(declare-fun e!251018 () Bool)

(declare-fun array_inv!9034 (array!25686) Bool)

(assert (=> start!39482 (and (array_inv!9034 _values!549) e!251018)))

(declare-fun array_inv!9035 (array!25684) Bool)

(assert (=> start!39482 (array_inv!9035 _keys!709)))

(declare-fun mapIsEmpty!17994 () Bool)

(declare-fun mapRes!17994 () Bool)

(assert (=> mapIsEmpty!17994 mapRes!17994))

(declare-fun b!421747 () Bool)

(declare-fun res!246216 () Bool)

(assert (=> b!421747 (=> (not res!246216) (not e!251023))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421747 (= res!246216 (validKeyInArray!0 k0!794))))

(declare-fun b!421748 () Bool)

(declare-fun e!251021 () Bool)

(declare-fun e!251020 () Bool)

(assert (=> b!421748 (= e!251021 (not e!251020))))

(declare-fun res!246204 () Bool)

(assert (=> b!421748 (=> res!246204 e!251020)))

(assert (=> b!421748 (= res!246204 (validKeyInArray!0 (select (arr!12291 _keys!709) from!863)))))

(declare-fun e!251019 () Bool)

(assert (=> b!421748 e!251019))

(declare-fun c!55335 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421748 (= c!55335 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12445 0))(
  ( (Unit!12446) )
))
(declare-fun lt!193682 () Unit!12445)

(declare-fun zeroValue!515 () V!15659)

(declare-fun v!412 () V!15659)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!470 (array!25684 array!25686 (_ BitVec 32) (_ BitVec 32) V!15659 V!15659 (_ BitVec 32) (_ BitVec 64) V!15659 (_ BitVec 32) Int) Unit!12445)

(assert (=> b!421748 (= lt!193682 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!470 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17994 () Bool)

(declare-fun tp!34818 () Bool)

(declare-fun e!251022 () Bool)

(assert (=> mapNonEmpty!17994 (= mapRes!17994 (and tp!34818 e!251022))))

(declare-fun mapRest!17994 () (Array (_ BitVec 32) ValueCell!5114))

(declare-fun mapKey!17994 () (_ BitVec 32))

(declare-fun mapValue!17994 () ValueCell!5114)

(assert (=> mapNonEmpty!17994 (= (arr!12292 _values!549) (store mapRest!17994 mapKey!17994 mapValue!17994))))

(declare-fun b!421749 () Bool)

(assert (=> b!421749 (= e!251020 true)))

(declare-datatypes ((tuple2!7104 0))(
  ( (tuple2!7105 (_1!3563 (_ BitVec 64)) (_2!3563 V!15659)) )
))
(declare-datatypes ((List!7104 0))(
  ( (Nil!7101) (Cons!7100 (h!7956 tuple2!7104) (t!12524 List!7104)) )
))
(declare-datatypes ((ListLongMap!6019 0))(
  ( (ListLongMap!6020 (toList!3025 List!7104)) )
))
(declare-fun lt!193683 () ListLongMap!6019)

(declare-fun lt!193692 () V!15659)

(declare-fun lt!193689 () tuple2!7104)

(declare-fun +!1285 (ListLongMap!6019 tuple2!7104) ListLongMap!6019)

(assert (=> b!421749 (= (+!1285 lt!193683 lt!193689) (+!1285 (+!1285 lt!193683 (tuple2!7105 k0!794 lt!193692)) lt!193689))))

(declare-fun lt!193688 () V!15659)

(assert (=> b!421749 (= lt!193689 (tuple2!7105 k0!794 lt!193688))))

(declare-fun lt!193686 () Unit!12445)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!75 (ListLongMap!6019 (_ BitVec 64) V!15659 V!15659) Unit!12445)

(assert (=> b!421749 (= lt!193686 (addSameAsAddTwiceSameKeyDiffValues!75 lt!193683 k0!794 lt!193692 lt!193688))))

(declare-fun lt!193687 () V!15659)

(declare-fun get!6117 (ValueCell!5114 V!15659) V!15659)

(assert (=> b!421749 (= lt!193692 (get!6117 (select (arr!12292 _values!549) from!863) lt!193687))))

(declare-fun lt!193691 () array!25684)

(declare-fun lt!193690 () ListLongMap!6019)

(assert (=> b!421749 (= lt!193690 (+!1285 lt!193683 (tuple2!7105 (select (arr!12291 lt!193691) from!863) lt!193688)))))

(assert (=> b!421749 (= lt!193688 (get!6117 (select (store (arr!12292 _values!549) i!563 (ValueCellFull!5114 v!412)) from!863) lt!193687))))

(declare-fun dynLambda!742 (Int (_ BitVec 64)) V!15659)

(assert (=> b!421749 (= lt!193687 (dynLambda!742 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!193685 () array!25686)

(declare-fun getCurrentListMapNoExtraKeys!1271 (array!25684 array!25686 (_ BitVec 32) (_ BitVec 32) V!15659 V!15659 (_ BitVec 32) Int) ListLongMap!6019)

(assert (=> b!421749 (= lt!193683 (getCurrentListMapNoExtraKeys!1271 lt!193691 lt!193685 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421750 () Bool)

(declare-fun e!251026 () Bool)

(assert (=> b!421750 (= e!251018 (and e!251026 mapRes!17994))))

(declare-fun condMapEmpty!17994 () Bool)

(declare-fun mapDefault!17994 () ValueCell!5114)

(assert (=> b!421750 (= condMapEmpty!17994 (= (arr!12292 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5114)) mapDefault!17994)))))

(declare-fun b!421751 () Bool)

(declare-fun res!246205 () Bool)

(assert (=> b!421751 (=> (not res!246205) (not e!251023))))

(declare-datatypes ((List!7105 0))(
  ( (Nil!7102) (Cons!7101 (h!7957 (_ BitVec 64)) (t!12525 List!7105)) )
))
(declare-fun arrayNoDuplicates!0 (array!25684 (_ BitVec 32) List!7105) Bool)

(assert (=> b!421751 (= res!246205 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7102))))

(declare-fun b!421752 () Bool)

(assert (=> b!421752 (= e!251022 tp_is_empty!10915)))

(declare-fun b!421753 () Bool)

(declare-fun res!246210 () Bool)

(declare-fun e!251024 () Bool)

(assert (=> b!421753 (=> (not res!246210) (not e!251024))))

(assert (=> b!421753 (= res!246210 (bvsle from!863 i!563))))

(declare-fun b!421754 () Bool)

(assert (=> b!421754 (= e!251024 e!251021)))

(declare-fun res!246207 () Bool)

(assert (=> b!421754 (=> (not res!246207) (not e!251021))))

(assert (=> b!421754 (= res!246207 (= from!863 i!563))))

(assert (=> b!421754 (= lt!193690 (getCurrentListMapNoExtraKeys!1271 lt!193691 lt!193685 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421754 (= lt!193685 (array!25687 (store (arr!12292 _values!549) i!563 (ValueCellFull!5114 v!412)) (size!12644 _values!549)))))

(declare-fun lt!193684 () ListLongMap!6019)

(assert (=> b!421754 (= lt!193684 (getCurrentListMapNoExtraKeys!1271 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421755 () Bool)

(declare-fun res!246213 () Bool)

(assert (=> b!421755 (=> (not res!246213) (not e!251023))))

(assert (=> b!421755 (= res!246213 (and (= (size!12644 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12643 _keys!709) (size!12644 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!29455 () ListLongMap!6019)

(declare-fun bm!29451 () Bool)

(assert (=> bm!29451 (= call!29455 (getCurrentListMapNoExtraKeys!1271 (ite c!55335 lt!193691 _keys!709) (ite c!55335 lt!193685 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29454 () ListLongMap!6019)

(declare-fun b!421756 () Bool)

(assert (=> b!421756 (= e!251019 (= call!29455 (+!1285 call!29454 (tuple2!7105 k0!794 v!412))))))

(declare-fun b!421757 () Bool)

(declare-fun res!246208 () Bool)

(assert (=> b!421757 (=> (not res!246208) (not e!251023))))

(assert (=> b!421757 (= res!246208 (or (= (select (arr!12291 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12291 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421758 () Bool)

(assert (=> b!421758 (= e!251019 (= call!29454 call!29455))))

(declare-fun b!421759 () Bool)

(declare-fun res!246215 () Bool)

(assert (=> b!421759 (=> (not res!246215) (not e!251024))))

(assert (=> b!421759 (= res!246215 (arrayNoDuplicates!0 lt!193691 #b00000000000000000000000000000000 Nil!7102))))

(declare-fun b!421760 () Bool)

(declare-fun res!246206 () Bool)

(assert (=> b!421760 (=> (not res!246206) (not e!251023))))

(declare-fun arrayContainsKey!0 (array!25684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421760 (= res!246206 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421761 () Bool)

(declare-fun res!246214 () Bool)

(assert (=> b!421761 (=> (not res!246214) (not e!251023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25684 (_ BitVec 32)) Bool)

(assert (=> b!421761 (= res!246214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!29452 () Bool)

(assert (=> bm!29452 (= call!29454 (getCurrentListMapNoExtraKeys!1271 (ite c!55335 _keys!709 lt!193691) (ite c!55335 _values!549 lt!193685) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421762 () Bool)

(declare-fun res!246209 () Bool)

(assert (=> b!421762 (=> (not res!246209) (not e!251023))))

(assert (=> b!421762 (= res!246209 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12643 _keys!709))))))

(declare-fun b!421763 () Bool)

(declare-fun res!246212 () Bool)

(assert (=> b!421763 (=> (not res!246212) (not e!251023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421763 (= res!246212 (validMask!0 mask!1025))))

(declare-fun b!421764 () Bool)

(assert (=> b!421764 (= e!251023 e!251024)))

(declare-fun res!246211 () Bool)

(assert (=> b!421764 (=> (not res!246211) (not e!251024))))

(assert (=> b!421764 (= res!246211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193691 mask!1025))))

(assert (=> b!421764 (= lt!193691 (array!25685 (store (arr!12291 _keys!709) i!563 k0!794) (size!12643 _keys!709)))))

(declare-fun b!421765 () Bool)

(assert (=> b!421765 (= e!251026 tp_is_empty!10915)))

(assert (= (and start!39482 res!246203) b!421763))

(assert (= (and b!421763 res!246212) b!421755))

(assert (= (and b!421755 res!246213) b!421761))

(assert (= (and b!421761 res!246214) b!421751))

(assert (= (and b!421751 res!246205) b!421762))

(assert (= (and b!421762 res!246209) b!421747))

(assert (= (and b!421747 res!246216) b!421757))

(assert (= (and b!421757 res!246208) b!421760))

(assert (= (and b!421760 res!246206) b!421764))

(assert (= (and b!421764 res!246211) b!421759))

(assert (= (and b!421759 res!246215) b!421753))

(assert (= (and b!421753 res!246210) b!421754))

(assert (= (and b!421754 res!246207) b!421748))

(assert (= (and b!421748 c!55335) b!421756))

(assert (= (and b!421748 (not c!55335)) b!421758))

(assert (= (or b!421756 b!421758) bm!29451))

(assert (= (or b!421756 b!421758) bm!29452))

(assert (= (and b!421748 (not res!246204)) b!421749))

(assert (= (and b!421750 condMapEmpty!17994) mapIsEmpty!17994))

(assert (= (and b!421750 (not condMapEmpty!17994)) mapNonEmpty!17994))

(get-info :version)

(assert (= (and mapNonEmpty!17994 ((_ is ValueCellFull!5114) mapValue!17994)) b!421752))

(assert (= (and b!421750 ((_ is ValueCellFull!5114) mapDefault!17994)) b!421765))

(assert (= start!39482 b!421750))

(declare-fun b_lambda!9089 () Bool)

(assert (=> (not b_lambda!9089) (not b!421749)))

(declare-fun t!12523 () Bool)

(declare-fun tb!3377 () Bool)

(assert (=> (and start!39482 (= defaultEntry!557 defaultEntry!557) t!12523) tb!3377))

(declare-fun result!6289 () Bool)

(assert (=> tb!3377 (= result!6289 tp_is_empty!10915)))

(assert (=> b!421749 t!12523))

(declare-fun b_and!17417 () Bool)

(assert (= b_and!17415 (and (=> t!12523 result!6289) b_and!17417)))

(declare-fun m!411797 () Bool)

(assert (=> b!421759 m!411797))

(declare-fun m!411799 () Bool)

(assert (=> b!421749 m!411799))

(declare-fun m!411801 () Bool)

(assert (=> b!421749 m!411801))

(declare-fun m!411803 () Bool)

(assert (=> b!421749 m!411803))

(declare-fun m!411805 () Bool)

(assert (=> b!421749 m!411805))

(declare-fun m!411807 () Bool)

(assert (=> b!421749 m!411807))

(assert (=> b!421749 m!411801))

(declare-fun m!411809 () Bool)

(assert (=> b!421749 m!411809))

(declare-fun m!411811 () Bool)

(assert (=> b!421749 m!411811))

(declare-fun m!411813 () Bool)

(assert (=> b!421749 m!411813))

(assert (=> b!421749 m!411805))

(declare-fun m!411815 () Bool)

(assert (=> b!421749 m!411815))

(declare-fun m!411817 () Bool)

(assert (=> b!421749 m!411817))

(declare-fun m!411819 () Bool)

(assert (=> b!421749 m!411819))

(declare-fun m!411821 () Bool)

(assert (=> b!421749 m!411821))

(assert (=> b!421749 m!411819))

(declare-fun m!411823 () Bool)

(assert (=> b!421749 m!411823))

(declare-fun m!411825 () Bool)

(assert (=> b!421757 m!411825))

(declare-fun m!411827 () Bool)

(assert (=> b!421748 m!411827))

(assert (=> b!421748 m!411827))

(declare-fun m!411829 () Bool)

(assert (=> b!421748 m!411829))

(declare-fun m!411831 () Bool)

(assert (=> b!421748 m!411831))

(declare-fun m!411833 () Bool)

(assert (=> bm!29451 m!411833))

(declare-fun m!411835 () Bool)

(assert (=> start!39482 m!411835))

(declare-fun m!411837 () Bool)

(assert (=> start!39482 m!411837))

(declare-fun m!411839 () Bool)

(assert (=> b!421763 m!411839))

(declare-fun m!411841 () Bool)

(assert (=> mapNonEmpty!17994 m!411841))

(declare-fun m!411843 () Bool)

(assert (=> b!421760 m!411843))

(declare-fun m!411845 () Bool)

(assert (=> b!421756 m!411845))

(declare-fun m!411847 () Bool)

(assert (=> bm!29452 m!411847))

(declare-fun m!411849 () Bool)

(assert (=> b!421761 m!411849))

(declare-fun m!411851 () Bool)

(assert (=> b!421751 m!411851))

(declare-fun m!411853 () Bool)

(assert (=> b!421764 m!411853))

(declare-fun m!411855 () Bool)

(assert (=> b!421764 m!411855))

(declare-fun m!411857 () Bool)

(assert (=> b!421747 m!411857))

(declare-fun m!411859 () Bool)

(assert (=> b!421754 m!411859))

(assert (=> b!421754 m!411809))

(declare-fun m!411861 () Bool)

(assert (=> b!421754 m!411861))

(check-sat (not b!421760) (not b_next!9763) (not b!421747) (not b!421748) (not bm!29451) (not b!421749) b_and!17417 (not b!421763) (not b!421761) (not start!39482) (not mapNonEmpty!17994) (not b!421756) (not bm!29452) (not b_lambda!9089) (not b!421754) (not b!421764) (not b!421759) (not b!421751) tp_is_empty!10915)
(check-sat b_and!17417 (not b_next!9763))
