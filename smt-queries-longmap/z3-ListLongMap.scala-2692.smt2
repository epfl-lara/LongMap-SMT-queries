; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39956 () Bool)

(assert start!39956)

(declare-fun b_free!10237 () Bool)

(declare-fun b_next!10237 () Bool)

(assert (=> start!39956 (= b_free!10237 (not b_next!10237))))

(declare-fun tp!36239 () Bool)

(declare-fun b_and!18107 () Bool)

(assert (=> start!39956 (= tp!36239 b_and!18107)))

(declare-fun mapIsEmpty!18705 () Bool)

(declare-fun mapRes!18705 () Bool)

(assert (=> mapIsEmpty!18705 mapRes!18705))

(declare-fun b!434277 () Bool)

(declare-fun res!255774 () Bool)

(declare-fun e!256643 () Bool)

(assert (=> b!434277 (=> (not res!255774) (not e!256643))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434277 (= res!255774 (validMask!0 mask!1025))))

(declare-fun b!434278 () Bool)

(declare-fun res!255783 () Bool)

(assert (=> b!434278 (=> (not res!255783) (not e!256643))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26601 0))(
  ( (array!26602 (arr!12750 (Array (_ BitVec 32) (_ BitVec 64))) (size!13103 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26601)

(assert (=> b!434278 (= res!255783 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13103 _keys!709))))))

(declare-fun b!434279 () Bool)

(declare-fun res!255779 () Bool)

(declare-fun e!256647 () Bool)

(assert (=> b!434279 (=> (not res!255779) (not e!256647))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!434279 (= res!255779 (bvsle from!863 i!563))))

(declare-fun b!434280 () Bool)

(declare-fun res!255784 () Bool)

(assert (=> b!434280 (=> (not res!255784) (not e!256643))))

(assert (=> b!434280 (= res!255784 (or (= (select (arr!12750 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12750 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434281 () Bool)

(assert (=> b!434281 (= e!256643 e!256647)))

(declare-fun res!255782 () Bool)

(assert (=> b!434281 (=> (not res!255782) (not e!256647))))

(declare-fun lt!199614 () array!26601)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26601 (_ BitVec 32)) Bool)

(assert (=> b!434281 (= res!255782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199614 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!434281 (= lt!199614 (array!26602 (store (arr!12750 _keys!709) i!563 k0!794) (size!13103 _keys!709)))))

(declare-fun b!434282 () Bool)

(declare-fun e!256638 () Bool)

(declare-fun e!256645 () Bool)

(assert (=> b!434282 (= e!256638 e!256645)))

(declare-fun res!255776 () Bool)

(assert (=> b!434282 (=> res!255776 e!256645)))

(assert (=> b!434282 (= res!255776 (= k0!794 (select (arr!12750 _keys!709) from!863)))))

(assert (=> b!434282 (not (= (select (arr!12750 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12850 0))(
  ( (Unit!12851) )
))
(declare-fun lt!199615 () Unit!12850)

(declare-fun e!256646 () Unit!12850)

(assert (=> b!434282 (= lt!199615 e!256646)))

(declare-fun c!55620 () Bool)

(assert (=> b!434282 (= c!55620 (= (select (arr!12750 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16291 0))(
  ( (V!16292 (val!5739 Int)) )
))
(declare-datatypes ((tuple2!7600 0))(
  ( (tuple2!7601 (_1!3811 (_ BitVec 64)) (_2!3811 V!16291)) )
))
(declare-datatypes ((List!7591 0))(
  ( (Nil!7588) (Cons!7587 (h!8443 tuple2!7600) (t!13268 List!7591)) )
))
(declare-datatypes ((ListLongMap!6503 0))(
  ( (ListLongMap!6504 (toList!3267 List!7591)) )
))
(declare-fun lt!199606 () ListLongMap!6503)

(declare-fun lt!199613 () ListLongMap!6503)

(assert (=> b!434282 (= lt!199606 lt!199613)))

(declare-fun lt!199608 () ListLongMap!6503)

(declare-fun lt!199604 () tuple2!7600)

(declare-fun +!1442 (ListLongMap!6503 tuple2!7600) ListLongMap!6503)

(assert (=> b!434282 (= lt!199613 (+!1442 lt!199608 lt!199604))))

(declare-fun lt!199610 () V!16291)

(assert (=> b!434282 (= lt!199604 (tuple2!7601 (select (arr!12750 _keys!709) from!863) lt!199610))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5351 0))(
  ( (ValueCellFull!5351 (v!7980 V!16291)) (EmptyCell!5351) )
))
(declare-datatypes ((array!26603 0))(
  ( (array!26604 (arr!12751 (Array (_ BitVec 32) ValueCell!5351)) (size!13104 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26603)

(declare-fun get!6351 (ValueCell!5351 V!16291) V!16291)

(declare-fun dynLambda!821 (Int (_ BitVec 64)) V!16291)

(assert (=> b!434282 (= lt!199610 (get!6351 (select (arr!12751 _values!549) from!863) (dynLambda!821 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434283 () Bool)

(declare-fun res!255780 () Bool)

(assert (=> b!434283 (=> (not res!255780) (not e!256643))))

(declare-datatypes ((List!7592 0))(
  ( (Nil!7589) (Cons!7588 (h!8444 (_ BitVec 64)) (t!13269 List!7592)) )
))
(declare-fun arrayNoDuplicates!0 (array!26601 (_ BitVec 32) List!7592) Bool)

(assert (=> b!434283 (= res!255780 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7589))))

(declare-fun b!434284 () Bool)

(declare-fun res!255781 () Bool)

(assert (=> b!434284 (=> (not res!255781) (not e!256643))))

(assert (=> b!434284 (= res!255781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434286 () Bool)

(declare-fun Unit!12852 () Unit!12850)

(assert (=> b!434286 (= e!256646 Unit!12852)))

(declare-fun lt!199611 () Unit!12850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26601 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12850)

(assert (=> b!434286 (= lt!199611 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434286 false))

(declare-fun b!434287 () Bool)

(declare-fun Unit!12853 () Unit!12850)

(assert (=> b!434287 (= e!256646 Unit!12853)))

(declare-fun b!434288 () Bool)

(declare-fun e!256639 () Bool)

(declare-fun tp_is_empty!11389 () Bool)

(assert (=> b!434288 (= e!256639 tp_is_empty!11389)))

(declare-fun b!434289 () Bool)

(declare-fun res!255785 () Bool)

(assert (=> b!434289 (=> (not res!255785) (not e!256643))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!434289 (= res!255785 (and (= (size!13104 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13103 _keys!709) (size!13104 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434290 () Bool)

(declare-fun e!256644 () Bool)

(assert (=> b!434290 (= e!256644 (not e!256638))))

(declare-fun res!255778 () Bool)

(assert (=> b!434290 (=> res!255778 e!256638)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434290 (= res!255778 (not (validKeyInArray!0 (select (arr!12750 _keys!709) from!863))))))

(declare-fun lt!199602 () ListLongMap!6503)

(assert (=> b!434290 (= lt!199602 lt!199608)))

(declare-fun lt!199607 () ListLongMap!6503)

(declare-fun lt!199609 () tuple2!7600)

(assert (=> b!434290 (= lt!199608 (+!1442 lt!199607 lt!199609))))

(declare-fun minValue!515 () V!16291)

(declare-fun lt!199616 () array!26603)

(declare-fun zeroValue!515 () V!16291)

(declare-fun getCurrentListMapNoExtraKeys!1469 (array!26601 array!26603 (_ BitVec 32) (_ BitVec 32) V!16291 V!16291 (_ BitVec 32) Int) ListLongMap!6503)

(assert (=> b!434290 (= lt!199602 (getCurrentListMapNoExtraKeys!1469 lt!199614 lt!199616 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16291)

(assert (=> b!434290 (= lt!199609 (tuple2!7601 k0!794 v!412))))

(assert (=> b!434290 (= lt!199607 (getCurrentListMapNoExtraKeys!1469 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199612 () Unit!12850)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!590 (array!26601 array!26603 (_ BitVec 32) (_ BitVec 32) V!16291 V!16291 (_ BitVec 32) (_ BitVec 64) V!16291 (_ BitVec 32) Int) Unit!12850)

(assert (=> b!434290 (= lt!199612 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!590 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434291 () Bool)

(assert (=> b!434291 (= e!256645 true)))

(assert (=> b!434291 (= lt!199613 (+!1442 (+!1442 lt!199607 lt!199604) lt!199609))))

(declare-fun lt!199603 () Unit!12850)

(declare-fun addCommutativeForDiffKeys!396 (ListLongMap!6503 (_ BitVec 64) V!16291 (_ BitVec 64) V!16291) Unit!12850)

(assert (=> b!434291 (= lt!199603 (addCommutativeForDiffKeys!396 lt!199607 k0!794 v!412 (select (arr!12750 _keys!709) from!863) lt!199610))))

(declare-fun b!434292 () Bool)

(declare-fun res!255777 () Bool)

(assert (=> b!434292 (=> (not res!255777) (not e!256643))))

(declare-fun arrayContainsKey!0 (array!26601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434292 (= res!255777 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434293 () Bool)

(declare-fun res!255786 () Bool)

(assert (=> b!434293 (=> (not res!255786) (not e!256647))))

(assert (=> b!434293 (= res!255786 (arrayNoDuplicates!0 lt!199614 #b00000000000000000000000000000000 Nil!7589))))

(declare-fun b!434294 () Bool)

(declare-fun e!256640 () Bool)

(assert (=> b!434294 (= e!256640 (and e!256639 mapRes!18705))))

(declare-fun condMapEmpty!18705 () Bool)

(declare-fun mapDefault!18705 () ValueCell!5351)

(assert (=> b!434294 (= condMapEmpty!18705 (= (arr!12751 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5351)) mapDefault!18705)))))

(declare-fun b!434295 () Bool)

(declare-fun res!255775 () Bool)

(assert (=> b!434295 (=> (not res!255775) (not e!256643))))

(assert (=> b!434295 (= res!255775 (validKeyInArray!0 k0!794))))

(declare-fun b!434285 () Bool)

(assert (=> b!434285 (= e!256647 e!256644)))

(declare-fun res!255773 () Bool)

(assert (=> b!434285 (=> (not res!255773) (not e!256644))))

(assert (=> b!434285 (= res!255773 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!434285 (= lt!199606 (getCurrentListMapNoExtraKeys!1469 lt!199614 lt!199616 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434285 (= lt!199616 (array!26604 (store (arr!12751 _values!549) i!563 (ValueCellFull!5351 v!412)) (size!13104 _values!549)))))

(declare-fun lt!199605 () ListLongMap!6503)

(assert (=> b!434285 (= lt!199605 (getCurrentListMapNoExtraKeys!1469 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!255772 () Bool)

(assert (=> start!39956 (=> (not res!255772) (not e!256643))))

(assert (=> start!39956 (= res!255772 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13103 _keys!709))))))

(assert (=> start!39956 e!256643))

(assert (=> start!39956 tp_is_empty!11389))

(assert (=> start!39956 tp!36239))

(assert (=> start!39956 true))

(declare-fun array_inv!9306 (array!26603) Bool)

(assert (=> start!39956 (and (array_inv!9306 _values!549) e!256640)))

(declare-fun array_inv!9307 (array!26601) Bool)

(assert (=> start!39956 (array_inv!9307 _keys!709)))

(declare-fun b!434296 () Bool)

(declare-fun e!256642 () Bool)

(assert (=> b!434296 (= e!256642 tp_is_empty!11389)))

(declare-fun mapNonEmpty!18705 () Bool)

(declare-fun tp!36240 () Bool)

(assert (=> mapNonEmpty!18705 (= mapRes!18705 (and tp!36240 e!256642))))

(declare-fun mapRest!18705 () (Array (_ BitVec 32) ValueCell!5351))

(declare-fun mapValue!18705 () ValueCell!5351)

(declare-fun mapKey!18705 () (_ BitVec 32))

(assert (=> mapNonEmpty!18705 (= (arr!12751 _values!549) (store mapRest!18705 mapKey!18705 mapValue!18705))))

(assert (= (and start!39956 res!255772) b!434277))

(assert (= (and b!434277 res!255774) b!434289))

(assert (= (and b!434289 res!255785) b!434284))

(assert (= (and b!434284 res!255781) b!434283))

(assert (= (and b!434283 res!255780) b!434278))

(assert (= (and b!434278 res!255783) b!434295))

(assert (= (and b!434295 res!255775) b!434280))

(assert (= (and b!434280 res!255784) b!434292))

(assert (= (and b!434292 res!255777) b!434281))

(assert (= (and b!434281 res!255782) b!434293))

(assert (= (and b!434293 res!255786) b!434279))

(assert (= (and b!434279 res!255779) b!434285))

(assert (= (and b!434285 res!255773) b!434290))

(assert (= (and b!434290 (not res!255778)) b!434282))

(assert (= (and b!434282 c!55620) b!434286))

(assert (= (and b!434282 (not c!55620)) b!434287))

(assert (= (and b!434282 (not res!255776)) b!434291))

(assert (= (and b!434294 condMapEmpty!18705) mapIsEmpty!18705))

(assert (= (and b!434294 (not condMapEmpty!18705)) mapNonEmpty!18705))

(get-info :version)

(assert (= (and mapNonEmpty!18705 ((_ is ValueCellFull!5351) mapValue!18705)) b!434296))

(assert (= (and b!434294 ((_ is ValueCellFull!5351) mapDefault!18705)) b!434288))

(assert (= start!39956 b!434294))

(declare-fun b_lambda!9307 () Bool)

(assert (=> (not b_lambda!9307) (not b!434282)))

(declare-fun t!13267 () Bool)

(declare-fun tb!3635 () Bool)

(assert (=> (and start!39956 (= defaultEntry!557 defaultEntry!557) t!13267) tb!3635))

(declare-fun result!6805 () Bool)

(assert (=> tb!3635 (= result!6805 tp_is_empty!11389)))

(assert (=> b!434282 t!13267))

(declare-fun b_and!18109 () Bool)

(assert (= b_and!18107 (and (=> t!13267 result!6805) b_and!18109)))

(declare-fun m!421761 () Bool)

(assert (=> b!434290 m!421761))

(declare-fun m!421763 () Bool)

(assert (=> b!434290 m!421763))

(declare-fun m!421765 () Bool)

(assert (=> b!434290 m!421765))

(declare-fun m!421767 () Bool)

(assert (=> b!434290 m!421767))

(declare-fun m!421769 () Bool)

(assert (=> b!434290 m!421769))

(assert (=> b!434290 m!421763))

(declare-fun m!421771 () Bool)

(assert (=> b!434290 m!421771))

(declare-fun m!421773 () Bool)

(assert (=> b!434293 m!421773))

(declare-fun m!421775 () Bool)

(assert (=> b!434284 m!421775))

(declare-fun m!421777 () Bool)

(assert (=> b!434283 m!421777))

(declare-fun m!421779 () Bool)

(assert (=> b!434285 m!421779))

(declare-fun m!421781 () Bool)

(assert (=> b!434285 m!421781))

(declare-fun m!421783 () Bool)

(assert (=> b!434285 m!421783))

(assert (=> b!434282 m!421763))

(declare-fun m!421785 () Bool)

(assert (=> b!434282 m!421785))

(declare-fun m!421787 () Bool)

(assert (=> b!434282 m!421787))

(declare-fun m!421789 () Bool)

(assert (=> b!434282 m!421789))

(assert (=> b!434282 m!421787))

(assert (=> b!434282 m!421785))

(declare-fun m!421791 () Bool)

(assert (=> b!434282 m!421791))

(declare-fun m!421793 () Bool)

(assert (=> b!434280 m!421793))

(declare-fun m!421795 () Bool)

(assert (=> b!434292 m!421795))

(declare-fun m!421797 () Bool)

(assert (=> b!434295 m!421797))

(declare-fun m!421799 () Bool)

(assert (=> b!434286 m!421799))

(declare-fun m!421801 () Bool)

(assert (=> b!434277 m!421801))

(declare-fun m!421803 () Bool)

(assert (=> b!434281 m!421803))

(declare-fun m!421805 () Bool)

(assert (=> b!434281 m!421805))

(declare-fun m!421807 () Bool)

(assert (=> b!434291 m!421807))

(assert (=> b!434291 m!421807))

(declare-fun m!421809 () Bool)

(assert (=> b!434291 m!421809))

(assert (=> b!434291 m!421763))

(assert (=> b!434291 m!421763))

(declare-fun m!421811 () Bool)

(assert (=> b!434291 m!421811))

(declare-fun m!421813 () Bool)

(assert (=> start!39956 m!421813))

(declare-fun m!421815 () Bool)

(assert (=> start!39956 m!421815))

(declare-fun m!421817 () Bool)

(assert (=> mapNonEmpty!18705 m!421817))

(check-sat (not b!434282) (not b!434284) (not b!434277) (not b!434295) (not b!434285) (not b!434290) (not b!434293) (not b!434286) tp_is_empty!11389 (not b!434281) (not b_lambda!9307) (not b!434292) (not mapNonEmpty!18705) (not b!434283) b_and!18109 (not b!434291) (not start!39956) (not b_next!10237))
(check-sat b_and!18109 (not b_next!10237))
