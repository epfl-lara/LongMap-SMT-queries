; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39978 () Bool)

(assert start!39978)

(declare-fun b_free!10245 () Bool)

(declare-fun b_next!10245 () Bool)

(assert (=> start!39978 (= b_free!10245 (not b_next!10245))))

(declare-fun tp!36264 () Bool)

(declare-fun b_and!18149 () Bool)

(assert (=> start!39978 (= tp!36264 b_and!18149)))

(declare-fun b!434796 () Bool)

(declare-fun e!256932 () Bool)

(assert (=> b!434796 (= e!256932 true)))

(declare-datatypes ((V!16301 0))(
  ( (V!16302 (val!5743 Int)) )
))
(declare-datatypes ((tuple2!7602 0))(
  ( (tuple2!7603 (_1!3812 (_ BitVec 64)) (_2!3812 V!16301)) )
))
(declare-fun lt!200017 () tuple2!7602)

(declare-datatypes ((List!7605 0))(
  ( (Nil!7602) (Cons!7601 (h!8457 tuple2!7602) (t!13299 List!7605)) )
))
(declare-datatypes ((ListLongMap!6515 0))(
  ( (ListLongMap!6516 (toList!3273 List!7605)) )
))
(declare-fun lt!200022 () ListLongMap!6515)

(declare-fun lt!200028 () ListLongMap!6515)

(declare-fun lt!200019 () tuple2!7602)

(declare-fun +!1421 (ListLongMap!6515 tuple2!7602) ListLongMap!6515)

(assert (=> b!434796 (= lt!200028 (+!1421 (+!1421 lt!200022 lt!200017) lt!200019))))

(declare-fun lt!200016 () V!16301)

(declare-datatypes ((Unit!12899 0))(
  ( (Unit!12900) )
))
(declare-fun lt!200023 () Unit!12899)

(declare-fun v!412 () V!16301)

(declare-datatypes ((array!26625 0))(
  ( (array!26626 (arr!12762 (Array (_ BitVec 32) (_ BitVec 64))) (size!13114 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26625)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!405 (ListLongMap!6515 (_ BitVec 64) V!16301 (_ BitVec 64) V!16301) Unit!12899)

(assert (=> b!434796 (= lt!200023 (addCommutativeForDiffKeys!405 lt!200022 k0!794 v!412 (select (arr!12762 _keys!709) from!863) lt!200016))))

(declare-fun b!434797 () Bool)

(declare-fun e!256936 () Bool)

(assert (=> b!434797 (= e!256936 e!256932)))

(declare-fun res!256090 () Bool)

(assert (=> b!434797 (=> res!256090 e!256932)))

(assert (=> b!434797 (= res!256090 (= k0!794 (select (arr!12762 _keys!709) from!863)))))

(assert (=> b!434797 (not (= (select (arr!12762 _keys!709) from!863) k0!794))))

(declare-fun lt!200018 () Unit!12899)

(declare-fun e!256941 () Unit!12899)

(assert (=> b!434797 (= lt!200018 e!256941)))

(declare-fun c!55703 () Bool)

(assert (=> b!434797 (= c!55703 (= (select (arr!12762 _keys!709) from!863) k0!794))))

(declare-fun lt!200026 () ListLongMap!6515)

(assert (=> b!434797 (= lt!200026 lt!200028)))

(declare-fun lt!200020 () ListLongMap!6515)

(assert (=> b!434797 (= lt!200028 (+!1421 lt!200020 lt!200017))))

(assert (=> b!434797 (= lt!200017 (tuple2!7603 (select (arr!12762 _keys!709) from!863) lt!200016))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5355 0))(
  ( (ValueCellFull!5355 (v!7990 V!16301)) (EmptyCell!5355) )
))
(declare-datatypes ((array!26627 0))(
  ( (array!26628 (arr!12763 (Array (_ BitVec 32) ValueCell!5355)) (size!13115 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26627)

(declare-fun get!6358 (ValueCell!5355 V!16301) V!16301)

(declare-fun dynLambda!829 (Int (_ BitVec 64)) V!16301)

(assert (=> b!434797 (= lt!200016 (get!6358 (select (arr!12763 _values!549) from!863) (dynLambda!829 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434798 () Bool)

(declare-fun e!256934 () Bool)

(declare-fun tp_is_empty!11397 () Bool)

(assert (=> b!434798 (= e!256934 tp_is_empty!11397)))

(declare-fun b!434799 () Bool)

(declare-fun res!256092 () Bool)

(declare-fun e!256937 () Bool)

(assert (=> b!434799 (=> (not res!256092) (not e!256937))))

(declare-fun lt!200024 () array!26625)

(declare-datatypes ((List!7606 0))(
  ( (Nil!7603) (Cons!7602 (h!8458 (_ BitVec 64)) (t!13300 List!7606)) )
))
(declare-fun arrayNoDuplicates!0 (array!26625 (_ BitVec 32) List!7606) Bool)

(assert (=> b!434799 (= res!256092 (arrayNoDuplicates!0 lt!200024 #b00000000000000000000000000000000 Nil!7603))))

(declare-fun b!434800 () Bool)

(declare-fun Unit!12901 () Unit!12899)

(assert (=> b!434800 (= e!256941 Unit!12901)))

(declare-fun b!434801 () Bool)

(declare-fun res!256087 () Bool)

(declare-fun e!256940 () Bool)

(assert (=> b!434801 (=> (not res!256087) (not e!256940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434801 (= res!256087 (validKeyInArray!0 k0!794))))

(declare-fun res!256084 () Bool)

(assert (=> start!39978 (=> (not res!256084) (not e!256940))))

(assert (=> start!39978 (= res!256084 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13114 _keys!709))))))

(assert (=> start!39978 e!256940))

(assert (=> start!39978 tp_is_empty!11397))

(assert (=> start!39978 tp!36264))

(assert (=> start!39978 true))

(declare-fun e!256939 () Bool)

(declare-fun array_inv!9280 (array!26627) Bool)

(assert (=> start!39978 (and (array_inv!9280 _values!549) e!256939)))

(declare-fun array_inv!9281 (array!26625) Bool)

(assert (=> start!39978 (array_inv!9281 _keys!709)))

(declare-fun b!434802 () Bool)

(declare-fun res!256082 () Bool)

(assert (=> b!434802 (=> (not res!256082) (not e!256940))))

(assert (=> b!434802 (= res!256082 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7603))))

(declare-fun b!434803 () Bool)

(declare-fun e!256938 () Bool)

(assert (=> b!434803 (= e!256938 tp_is_empty!11397)))

(declare-fun b!434804 () Bool)

(declare-fun res!256086 () Bool)

(assert (=> b!434804 (=> (not res!256086) (not e!256940))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26625 (_ BitVec 32)) Bool)

(assert (=> b!434804 (= res!256086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434805 () Bool)

(declare-fun Unit!12902 () Unit!12899)

(assert (=> b!434805 (= e!256941 Unit!12902)))

(declare-fun lt!200030 () Unit!12899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12899)

(assert (=> b!434805 (= lt!200030 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434805 false))

(declare-fun mapIsEmpty!18717 () Bool)

(declare-fun mapRes!18717 () Bool)

(assert (=> mapIsEmpty!18717 mapRes!18717))

(declare-fun b!434806 () Bool)

(declare-fun res!256095 () Bool)

(assert (=> b!434806 (=> (not res!256095) (not e!256940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434806 (= res!256095 (validMask!0 mask!1025))))

(declare-fun b!434807 () Bool)

(declare-fun e!256933 () Bool)

(assert (=> b!434807 (= e!256933 (not e!256936))))

(declare-fun res!256083 () Bool)

(assert (=> b!434807 (=> res!256083 e!256936)))

(assert (=> b!434807 (= res!256083 (not (validKeyInArray!0 (select (arr!12762 _keys!709) from!863))))))

(declare-fun lt!200021 () ListLongMap!6515)

(assert (=> b!434807 (= lt!200021 lt!200020)))

(assert (=> b!434807 (= lt!200020 (+!1421 lt!200022 lt!200019))))

(declare-fun minValue!515 () V!16301)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16301)

(declare-fun lt!200025 () array!26627)

(declare-fun getCurrentListMapNoExtraKeys!1464 (array!26625 array!26627 (_ BitVec 32) (_ BitVec 32) V!16301 V!16301 (_ BitVec 32) Int) ListLongMap!6515)

(assert (=> b!434807 (= lt!200021 (getCurrentListMapNoExtraKeys!1464 lt!200024 lt!200025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434807 (= lt!200019 (tuple2!7603 k0!794 v!412))))

(assert (=> b!434807 (= lt!200022 (getCurrentListMapNoExtraKeys!1464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200027 () Unit!12899)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!594 (array!26625 array!26627 (_ BitVec 32) (_ BitVec 32) V!16301 V!16301 (_ BitVec 32) (_ BitVec 64) V!16301 (_ BitVec 32) Int) Unit!12899)

(assert (=> b!434807 (= lt!200027 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!594 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434808 () Bool)

(assert (=> b!434808 (= e!256940 e!256937)))

(declare-fun res!256091 () Bool)

(assert (=> b!434808 (=> (not res!256091) (not e!256937))))

(assert (=> b!434808 (= res!256091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200024 mask!1025))))

(assert (=> b!434808 (= lt!200024 (array!26626 (store (arr!12762 _keys!709) i!563 k0!794) (size!13114 _keys!709)))))

(declare-fun b!434809 () Bool)

(assert (=> b!434809 (= e!256939 (and e!256938 mapRes!18717))))

(declare-fun condMapEmpty!18717 () Bool)

(declare-fun mapDefault!18717 () ValueCell!5355)

(assert (=> b!434809 (= condMapEmpty!18717 (= (arr!12763 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5355)) mapDefault!18717)))))

(declare-fun b!434810 () Bool)

(declare-fun res!256093 () Bool)

(assert (=> b!434810 (=> (not res!256093) (not e!256940))))

(assert (=> b!434810 (= res!256093 (and (= (size!13115 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13114 _keys!709) (size!13115 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434811 () Bool)

(declare-fun res!256094 () Bool)

(assert (=> b!434811 (=> (not res!256094) (not e!256940))))

(declare-fun arrayContainsKey!0 (array!26625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434811 (= res!256094 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434812 () Bool)

(assert (=> b!434812 (= e!256937 e!256933)))

(declare-fun res!256085 () Bool)

(assert (=> b!434812 (=> (not res!256085) (not e!256933))))

(assert (=> b!434812 (= res!256085 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!434812 (= lt!200026 (getCurrentListMapNoExtraKeys!1464 lt!200024 lt!200025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434812 (= lt!200025 (array!26628 (store (arr!12763 _values!549) i!563 (ValueCellFull!5355 v!412)) (size!13115 _values!549)))))

(declare-fun lt!200029 () ListLongMap!6515)

(assert (=> b!434812 (= lt!200029 (getCurrentListMapNoExtraKeys!1464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434813 () Bool)

(declare-fun res!256081 () Bool)

(assert (=> b!434813 (=> (not res!256081) (not e!256937))))

(assert (=> b!434813 (= res!256081 (bvsle from!863 i!563))))

(declare-fun b!434814 () Bool)

(declare-fun res!256089 () Bool)

(assert (=> b!434814 (=> (not res!256089) (not e!256940))))

(assert (=> b!434814 (= res!256089 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13114 _keys!709))))))

(declare-fun mapNonEmpty!18717 () Bool)

(declare-fun tp!36263 () Bool)

(assert (=> mapNonEmpty!18717 (= mapRes!18717 (and tp!36263 e!256934))))

(declare-fun mapKey!18717 () (_ BitVec 32))

(declare-fun mapRest!18717 () (Array (_ BitVec 32) ValueCell!5355))

(declare-fun mapValue!18717 () ValueCell!5355)

(assert (=> mapNonEmpty!18717 (= (arr!12763 _values!549) (store mapRest!18717 mapKey!18717 mapValue!18717))))

(declare-fun b!434815 () Bool)

(declare-fun res!256088 () Bool)

(assert (=> b!434815 (=> (not res!256088) (not e!256940))))

(assert (=> b!434815 (= res!256088 (or (= (select (arr!12762 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12762 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39978 res!256084) b!434806))

(assert (= (and b!434806 res!256095) b!434810))

(assert (= (and b!434810 res!256093) b!434804))

(assert (= (and b!434804 res!256086) b!434802))

(assert (= (and b!434802 res!256082) b!434814))

(assert (= (and b!434814 res!256089) b!434801))

(assert (= (and b!434801 res!256087) b!434815))

(assert (= (and b!434815 res!256088) b!434811))

(assert (= (and b!434811 res!256094) b!434808))

(assert (= (and b!434808 res!256091) b!434799))

(assert (= (and b!434799 res!256092) b!434813))

(assert (= (and b!434813 res!256081) b!434812))

(assert (= (and b!434812 res!256085) b!434807))

(assert (= (and b!434807 (not res!256083)) b!434797))

(assert (= (and b!434797 c!55703) b!434805))

(assert (= (and b!434797 (not c!55703)) b!434800))

(assert (= (and b!434797 (not res!256090)) b!434796))

(assert (= (and b!434809 condMapEmpty!18717) mapIsEmpty!18717))

(assert (= (and b!434809 (not condMapEmpty!18717)) mapNonEmpty!18717))

(get-info :version)

(assert (= (and mapNonEmpty!18717 ((_ is ValueCellFull!5355) mapValue!18717)) b!434798))

(assert (= (and b!434809 ((_ is ValueCellFull!5355) mapDefault!18717)) b!434803))

(assert (= start!39978 b!434809))

(declare-fun b_lambda!9333 () Bool)

(assert (=> (not b_lambda!9333) (not b!434797)))

(declare-fun t!13298 () Bool)

(declare-fun tb!3651 () Bool)

(assert (=> (and start!39978 (= defaultEntry!557 defaultEntry!557) t!13298) tb!3651))

(declare-fun result!6829 () Bool)

(assert (=> tb!3651 (= result!6829 tp_is_empty!11397)))

(assert (=> b!434797 t!13298))

(declare-fun b_and!18151 () Bool)

(assert (= b_and!18149 (and (=> t!13298 result!6829) b_and!18151)))

(declare-fun m!422725 () Bool)

(assert (=> b!434808 m!422725))

(declare-fun m!422727 () Bool)

(assert (=> b!434808 m!422727))

(declare-fun m!422729 () Bool)

(assert (=> b!434799 m!422729))

(declare-fun m!422731 () Bool)

(assert (=> b!434796 m!422731))

(assert (=> b!434796 m!422731))

(declare-fun m!422733 () Bool)

(assert (=> b!434796 m!422733))

(declare-fun m!422735 () Bool)

(assert (=> b!434796 m!422735))

(assert (=> b!434796 m!422735))

(declare-fun m!422737 () Bool)

(assert (=> b!434796 m!422737))

(assert (=> b!434807 m!422735))

(declare-fun m!422739 () Bool)

(assert (=> b!434807 m!422739))

(declare-fun m!422741 () Bool)

(assert (=> b!434807 m!422741))

(assert (=> b!434807 m!422735))

(declare-fun m!422743 () Bool)

(assert (=> b!434807 m!422743))

(declare-fun m!422745 () Bool)

(assert (=> b!434807 m!422745))

(declare-fun m!422747 () Bool)

(assert (=> b!434807 m!422747))

(declare-fun m!422749 () Bool)

(assert (=> b!434811 m!422749))

(declare-fun m!422751 () Bool)

(assert (=> b!434812 m!422751))

(declare-fun m!422753 () Bool)

(assert (=> b!434812 m!422753))

(declare-fun m!422755 () Bool)

(assert (=> b!434812 m!422755))

(declare-fun m!422757 () Bool)

(assert (=> b!434801 m!422757))

(declare-fun m!422759 () Bool)

(assert (=> b!434804 m!422759))

(declare-fun m!422761 () Bool)

(assert (=> b!434802 m!422761))

(declare-fun m!422763 () Bool)

(assert (=> b!434815 m!422763))

(declare-fun m!422765 () Bool)

(assert (=> b!434805 m!422765))

(assert (=> b!434797 m!422735))

(declare-fun m!422767 () Bool)

(assert (=> b!434797 m!422767))

(declare-fun m!422769 () Bool)

(assert (=> b!434797 m!422769))

(declare-fun m!422771 () Bool)

(assert (=> b!434797 m!422771))

(assert (=> b!434797 m!422771))

(assert (=> b!434797 m!422767))

(declare-fun m!422773 () Bool)

(assert (=> b!434797 m!422773))

(declare-fun m!422775 () Bool)

(assert (=> b!434806 m!422775))

(declare-fun m!422777 () Bool)

(assert (=> mapNonEmpty!18717 m!422777))

(declare-fun m!422779 () Bool)

(assert (=> start!39978 m!422779))

(declare-fun m!422781 () Bool)

(assert (=> start!39978 m!422781))

(check-sat (not mapNonEmpty!18717) (not b!434796) (not b!434811) (not b!434797) (not b!434802) (not b!434808) (not b!434806) tp_is_empty!11397 b_and!18151 (not start!39978) (not b!434807) (not b!434804) (not b!434801) (not b!434799) (not b_next!10245) (not b_lambda!9333) (not b!434812) (not b!434805))
(check-sat b_and!18151 (not b_next!10245))
