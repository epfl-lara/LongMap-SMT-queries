; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39902 () Bool)

(assert start!39902)

(declare-fun b_free!10183 () Bool)

(declare-fun b_next!10183 () Bool)

(assert (=> start!39902 (= b_free!10183 (not b_next!10183))))

(declare-fun tp!36077 () Bool)

(declare-fun b_and!18039 () Bool)

(assert (=> start!39902 (= tp!36077 b_and!18039)))

(declare-fun mapIsEmpty!18624 () Bool)

(declare-fun mapRes!18624 () Bool)

(assert (=> mapIsEmpty!18624 mapRes!18624))

(declare-fun b!432825 () Bool)

(declare-fun e!255973 () Bool)

(declare-fun e!255976 () Bool)

(assert (=> b!432825 (= e!255973 e!255976)))

(declare-fun res!254683 () Bool)

(assert (=> b!432825 (=> res!254683 e!255976)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26506 0))(
  ( (array!26507 (arr!12702 (Array (_ BitVec 32) (_ BitVec 64))) (size!13054 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26506)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!432825 (= res!254683 (= k0!794 (select (arr!12702 _keys!709) from!863)))))

(assert (=> b!432825 (not (= (select (arr!12702 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12798 0))(
  ( (Unit!12799) )
))
(declare-fun lt!198654 () Unit!12798)

(declare-fun e!255971 () Unit!12798)

(assert (=> b!432825 (= lt!198654 e!255971)))

(declare-fun c!55587 () Bool)

(assert (=> b!432825 (= c!55587 (= (select (arr!12702 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16219 0))(
  ( (V!16220 (val!5712 Int)) )
))
(declare-datatypes ((tuple2!7450 0))(
  ( (tuple2!7451 (_1!3736 (_ BitVec 64)) (_2!3736 V!16219)) )
))
(declare-datatypes ((List!7442 0))(
  ( (Nil!7439) (Cons!7438 (h!8294 tuple2!7450) (t!13066 List!7442)) )
))
(declare-datatypes ((ListLongMap!6365 0))(
  ( (ListLongMap!6366 (toList!3198 List!7442)) )
))
(declare-fun lt!198651 () ListLongMap!6365)

(declare-fun lt!198641 () ListLongMap!6365)

(assert (=> b!432825 (= lt!198651 lt!198641)))

(declare-fun lt!198650 () ListLongMap!6365)

(declare-fun lt!198653 () tuple2!7450)

(declare-fun +!1405 (ListLongMap!6365 tuple2!7450) ListLongMap!6365)

(assert (=> b!432825 (= lt!198641 (+!1405 lt!198650 lt!198653))))

(declare-fun lt!198645 () V!16219)

(assert (=> b!432825 (= lt!198653 (tuple2!7451 (select (arr!12702 _keys!709) from!863) lt!198645))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5324 0))(
  ( (ValueCellFull!5324 (v!7960 V!16219)) (EmptyCell!5324) )
))
(declare-datatypes ((array!26508 0))(
  ( (array!26509 (arr!12703 (Array (_ BitVec 32) ValueCell!5324)) (size!13055 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26508)

(declare-fun get!6325 (ValueCell!5324 V!16219) V!16219)

(declare-fun dynLambda!810 (Int (_ BitVec 64)) V!16219)

(assert (=> b!432825 (= lt!198645 (get!6325 (select (arr!12703 _values!549) from!863) (dynLambda!810 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432826 () Bool)

(declare-fun res!254689 () Bool)

(declare-fun e!255975 () Bool)

(assert (=> b!432826 (=> (not res!254689) (not e!255975))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432826 (= res!254689 (and (= (size!13055 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13054 _keys!709) (size!13055 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432827 () Bool)

(declare-fun res!254691 () Bool)

(assert (=> b!432827 (=> (not res!254691) (not e!255975))))

(declare-datatypes ((List!7443 0))(
  ( (Nil!7440) (Cons!7439 (h!8295 (_ BitVec 64)) (t!13067 List!7443)) )
))
(declare-fun arrayNoDuplicates!0 (array!26506 (_ BitVec 32) List!7443) Bool)

(assert (=> b!432827 (= res!254691 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7440))))

(declare-fun b!432828 () Bool)

(declare-fun res!254684 () Bool)

(declare-fun e!255972 () Bool)

(assert (=> b!432828 (=> (not res!254684) (not e!255972))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432828 (= res!254684 (bvsle from!863 i!563))))

(declare-fun b!432829 () Bool)

(declare-fun res!254688 () Bool)

(assert (=> b!432829 (=> (not res!254688) (not e!255975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432829 (= res!254688 (validMask!0 mask!1025))))

(declare-fun b!432831 () Bool)

(declare-fun e!255970 () Bool)

(assert (=> b!432831 (= e!255972 e!255970)))

(declare-fun res!254686 () Bool)

(assert (=> b!432831 (=> (not res!254686) (not e!255970))))

(assert (=> b!432831 (= res!254686 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16219)

(declare-fun zeroValue!515 () V!16219)

(declare-fun lt!198648 () array!26508)

(declare-fun lt!198649 () array!26506)

(declare-fun getCurrentListMapNoExtraKeys!1435 (array!26506 array!26508 (_ BitVec 32) (_ BitVec 32) V!16219 V!16219 (_ BitVec 32) Int) ListLongMap!6365)

(assert (=> b!432831 (= lt!198651 (getCurrentListMapNoExtraKeys!1435 lt!198649 lt!198648 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16219)

(assert (=> b!432831 (= lt!198648 (array!26509 (store (arr!12703 _values!549) i!563 (ValueCellFull!5324 v!412)) (size!13055 _values!549)))))

(declare-fun lt!198642 () ListLongMap!6365)

(assert (=> b!432831 (= lt!198642 (getCurrentListMapNoExtraKeys!1435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432832 () Bool)

(declare-fun res!254694 () Bool)

(assert (=> b!432832 (=> (not res!254694) (not e!255975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432832 (= res!254694 (validKeyInArray!0 k0!794))))

(declare-fun b!432833 () Bool)

(declare-fun res!254696 () Bool)

(assert (=> b!432833 (=> (not res!254696) (not e!255975))))

(assert (=> b!432833 (= res!254696 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13054 _keys!709))))))

(declare-fun mapNonEmpty!18624 () Bool)

(declare-fun tp!36078 () Bool)

(declare-fun e!255977 () Bool)

(assert (=> mapNonEmpty!18624 (= mapRes!18624 (and tp!36078 e!255977))))

(declare-fun mapRest!18624 () (Array (_ BitVec 32) ValueCell!5324))

(declare-fun mapKey!18624 () (_ BitVec 32))

(declare-fun mapValue!18624 () ValueCell!5324)

(assert (=> mapNonEmpty!18624 (= (arr!12703 _values!549) (store mapRest!18624 mapKey!18624 mapValue!18624))))

(declare-fun b!432834 () Bool)

(declare-fun Unit!12800 () Unit!12798)

(assert (=> b!432834 (= e!255971 Unit!12800)))

(declare-fun b!432835 () Bool)

(assert (=> b!432835 (= e!255970 (not e!255973))))

(declare-fun res!254690 () Bool)

(assert (=> b!432835 (=> res!254690 e!255973)))

(assert (=> b!432835 (= res!254690 (not (validKeyInArray!0 (select (arr!12702 _keys!709) from!863))))))

(declare-fun lt!198644 () ListLongMap!6365)

(assert (=> b!432835 (= lt!198644 lt!198650)))

(declare-fun lt!198646 () ListLongMap!6365)

(declare-fun lt!198652 () tuple2!7450)

(assert (=> b!432835 (= lt!198650 (+!1405 lt!198646 lt!198652))))

(assert (=> b!432835 (= lt!198644 (getCurrentListMapNoExtraKeys!1435 lt!198649 lt!198648 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432835 (= lt!198652 (tuple2!7451 k0!794 v!412))))

(assert (=> b!432835 (= lt!198646 (getCurrentListMapNoExtraKeys!1435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198647 () Unit!12798)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!574 (array!26506 array!26508 (_ BitVec 32) (_ BitVec 32) V!16219 V!16219 (_ BitVec 32) (_ BitVec 64) V!16219 (_ BitVec 32) Int) Unit!12798)

(assert (=> b!432835 (= lt!198647 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432836 () Bool)

(declare-fun e!255979 () Bool)

(declare-fun tp_is_empty!11335 () Bool)

(assert (=> b!432836 (= e!255979 tp_is_empty!11335)))

(declare-fun b!432837 () Bool)

(assert (=> b!432837 (= e!255975 e!255972)))

(declare-fun res!254692 () Bool)

(assert (=> b!432837 (=> (not res!254692) (not e!255972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26506 (_ BitVec 32)) Bool)

(assert (=> b!432837 (= res!254692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198649 mask!1025))))

(assert (=> b!432837 (= lt!198649 (array!26507 (store (arr!12702 _keys!709) i!563 k0!794) (size!13054 _keys!709)))))

(declare-fun b!432838 () Bool)

(declare-fun Unit!12801 () Unit!12798)

(assert (=> b!432838 (= e!255971 Unit!12801)))

(declare-fun lt!198640 () Unit!12798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12798)

(assert (=> b!432838 (= lt!198640 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432838 false))

(declare-fun b!432839 () Bool)

(declare-fun res!254695 () Bool)

(assert (=> b!432839 (=> (not res!254695) (not e!255975))))

(declare-fun arrayContainsKey!0 (array!26506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432839 (= res!254695 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432840 () Bool)

(assert (=> b!432840 (= e!255976 true)))

(assert (=> b!432840 (= lt!198641 (+!1405 (+!1405 lt!198646 lt!198653) lt!198652))))

(declare-fun lt!198643 () Unit!12798)

(declare-fun addCommutativeForDiffKeys!381 (ListLongMap!6365 (_ BitVec 64) V!16219 (_ BitVec 64) V!16219) Unit!12798)

(assert (=> b!432840 (= lt!198643 (addCommutativeForDiffKeys!381 lt!198646 k0!794 v!412 (select (arr!12702 _keys!709) from!863) lt!198645))))

(declare-fun b!432841 () Bool)

(declare-fun res!254687 () Bool)

(assert (=> b!432841 (=> (not res!254687) (not e!255975))))

(assert (=> b!432841 (= res!254687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432842 () Bool)

(declare-fun res!254693 () Bool)

(assert (=> b!432842 (=> (not res!254693) (not e!255975))))

(assert (=> b!432842 (= res!254693 (or (= (select (arr!12702 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12702 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432843 () Bool)

(declare-fun e!255978 () Bool)

(assert (=> b!432843 (= e!255978 (and e!255979 mapRes!18624))))

(declare-fun condMapEmpty!18624 () Bool)

(declare-fun mapDefault!18624 () ValueCell!5324)

(assert (=> b!432843 (= condMapEmpty!18624 (= (arr!12703 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5324)) mapDefault!18624)))))

(declare-fun b!432844 () Bool)

(assert (=> b!432844 (= e!255977 tp_is_empty!11335)))

(declare-fun b!432830 () Bool)

(declare-fun res!254697 () Bool)

(assert (=> b!432830 (=> (not res!254697) (not e!255972))))

(assert (=> b!432830 (= res!254697 (arrayNoDuplicates!0 lt!198649 #b00000000000000000000000000000000 Nil!7440))))

(declare-fun res!254685 () Bool)

(assert (=> start!39902 (=> (not res!254685) (not e!255975))))

(assert (=> start!39902 (= res!254685 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13054 _keys!709))))))

(assert (=> start!39902 e!255975))

(assert (=> start!39902 tp_is_empty!11335))

(assert (=> start!39902 tp!36077))

(assert (=> start!39902 true))

(declare-fun array_inv!9296 (array!26508) Bool)

(assert (=> start!39902 (and (array_inv!9296 _values!549) e!255978)))

(declare-fun array_inv!9297 (array!26506) Bool)

(assert (=> start!39902 (array_inv!9297 _keys!709)))

(assert (= (and start!39902 res!254685) b!432829))

(assert (= (and b!432829 res!254688) b!432826))

(assert (= (and b!432826 res!254689) b!432841))

(assert (= (and b!432841 res!254687) b!432827))

(assert (= (and b!432827 res!254691) b!432833))

(assert (= (and b!432833 res!254696) b!432832))

(assert (= (and b!432832 res!254694) b!432842))

(assert (= (and b!432842 res!254693) b!432839))

(assert (= (and b!432839 res!254695) b!432837))

(assert (= (and b!432837 res!254692) b!432830))

(assert (= (and b!432830 res!254697) b!432828))

(assert (= (and b!432828 res!254684) b!432831))

(assert (= (and b!432831 res!254686) b!432835))

(assert (= (and b!432835 (not res!254690)) b!432825))

(assert (= (and b!432825 c!55587) b!432838))

(assert (= (and b!432825 (not c!55587)) b!432834))

(assert (= (and b!432825 (not res!254683)) b!432840))

(assert (= (and b!432843 condMapEmpty!18624) mapIsEmpty!18624))

(assert (= (and b!432843 (not condMapEmpty!18624)) mapNonEmpty!18624))

(get-info :version)

(assert (= (and mapNonEmpty!18624 ((_ is ValueCellFull!5324) mapValue!18624)) b!432844))

(assert (= (and b!432843 ((_ is ValueCellFull!5324) mapDefault!18624)) b!432836))

(assert (= start!39902 b!432843))

(declare-fun b_lambda!9293 () Bool)

(assert (=> (not b_lambda!9293) (not b!432825)))

(declare-fun t!13065 () Bool)

(declare-fun tb!3581 () Bool)

(assert (=> (and start!39902 (= defaultEntry!557 defaultEntry!557) t!13065) tb!3581))

(declare-fun result!6697 () Bool)

(assert (=> tb!3581 (= result!6697 tp_is_empty!11335)))

(assert (=> b!432825 t!13065))

(declare-fun b_and!18041 () Bool)

(assert (= b_and!18039 (and (=> t!13065 result!6697) b_and!18041)))

(declare-fun m!421145 () Bool)

(assert (=> b!432832 m!421145))

(declare-fun m!421147 () Bool)

(assert (=> b!432831 m!421147))

(declare-fun m!421149 () Bool)

(assert (=> b!432831 m!421149))

(declare-fun m!421151 () Bool)

(assert (=> b!432831 m!421151))

(declare-fun m!421153 () Bool)

(assert (=> b!432842 m!421153))

(declare-fun m!421155 () Bool)

(assert (=> b!432825 m!421155))

(declare-fun m!421157 () Bool)

(assert (=> b!432825 m!421157))

(declare-fun m!421159 () Bool)

(assert (=> b!432825 m!421159))

(assert (=> b!432825 m!421159))

(assert (=> b!432825 m!421157))

(declare-fun m!421161 () Bool)

(assert (=> b!432825 m!421161))

(declare-fun m!421163 () Bool)

(assert (=> b!432825 m!421163))

(declare-fun m!421165 () Bool)

(assert (=> mapNonEmpty!18624 m!421165))

(declare-fun m!421167 () Bool)

(assert (=> b!432841 m!421167))

(declare-fun m!421169 () Bool)

(assert (=> b!432830 m!421169))

(declare-fun m!421171 () Bool)

(assert (=> b!432829 m!421171))

(declare-fun m!421173 () Bool)

(assert (=> b!432827 m!421173))

(declare-fun m!421175 () Bool)

(assert (=> b!432840 m!421175))

(assert (=> b!432840 m!421175))

(declare-fun m!421177 () Bool)

(assert (=> b!432840 m!421177))

(assert (=> b!432840 m!421155))

(assert (=> b!432840 m!421155))

(declare-fun m!421179 () Bool)

(assert (=> b!432840 m!421179))

(declare-fun m!421181 () Bool)

(assert (=> b!432837 m!421181))

(declare-fun m!421183 () Bool)

(assert (=> b!432837 m!421183))

(declare-fun m!421185 () Bool)

(assert (=> start!39902 m!421185))

(declare-fun m!421187 () Bool)

(assert (=> start!39902 m!421187))

(assert (=> b!432835 m!421155))

(declare-fun m!421189 () Bool)

(assert (=> b!432835 m!421189))

(declare-fun m!421191 () Bool)

(assert (=> b!432835 m!421191))

(assert (=> b!432835 m!421155))

(declare-fun m!421193 () Bool)

(assert (=> b!432835 m!421193))

(declare-fun m!421195 () Bool)

(assert (=> b!432835 m!421195))

(declare-fun m!421197 () Bool)

(assert (=> b!432835 m!421197))

(declare-fun m!421199 () Bool)

(assert (=> b!432839 m!421199))

(declare-fun m!421201 () Bool)

(assert (=> b!432838 m!421201))

(check-sat (not b!432838) (not b!432840) (not b_next!10183) (not b!432831) tp_is_empty!11335 (not b!432830) (not b!432825) (not b!432837) (not b_lambda!9293) (not b!432827) (not start!39902) (not mapNonEmpty!18624) (not b!432839) b_and!18041 (not b!432835) (not b!432841) (not b!432832) (not b!432829))
(check-sat b_and!18041 (not b_next!10183))
