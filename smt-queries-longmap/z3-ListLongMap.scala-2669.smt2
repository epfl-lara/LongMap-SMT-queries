; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39818 () Bool)

(assert start!39818)

(declare-fun b_free!10099 () Bool)

(declare-fun b_next!10099 () Bool)

(assert (=> start!39818 (= b_free!10099 (not b_next!10099))))

(declare-fun tp!35826 () Bool)

(declare-fun b_and!17831 () Bool)

(assert (=> start!39818 (= tp!35826 b_and!17831)))

(declare-fun b!429999 () Bool)

(declare-fun e!254571 () Bool)

(declare-fun e!254573 () Bool)

(assert (=> b!429999 (= e!254571 e!254573)))

(declare-fun res!252667 () Bool)

(assert (=> b!429999 (=> res!252667 e!254573)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26331 0))(
  ( (array!26332 (arr!12615 (Array (_ BitVec 32) (_ BitVec 64))) (size!12968 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26331)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429999 (= res!252667 (= k0!794 (select (arr!12615 _keys!709) from!863)))))

(assert (=> b!429999 (not (= (select (arr!12615 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12651 0))(
  ( (Unit!12652) )
))
(declare-fun lt!196508 () Unit!12651)

(declare-fun e!254570 () Unit!12651)

(assert (=> b!429999 (= lt!196508 e!254570)))

(declare-fun c!55413 () Bool)

(assert (=> b!429999 (= c!55413 (= (select (arr!12615 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16107 0))(
  ( (V!16108 (val!5670 Int)) )
))
(declare-datatypes ((tuple2!7476 0))(
  ( (tuple2!7477 (_1!3749 (_ BitVec 64)) (_2!3749 V!16107)) )
))
(declare-datatypes ((List!7474 0))(
  ( (Nil!7471) (Cons!7470 (h!8326 tuple2!7476) (t!13013 List!7474)) )
))
(declare-datatypes ((ListLongMap!6379 0))(
  ( (ListLongMap!6380 (toList!3205 List!7474)) )
))
(declare-fun lt!196505 () ListLongMap!6379)

(declare-fun lt!196501 () ListLongMap!6379)

(assert (=> b!429999 (= lt!196505 lt!196501)))

(declare-fun lt!196502 () ListLongMap!6379)

(declare-fun lt!196510 () tuple2!7476)

(declare-fun +!1382 (ListLongMap!6379 tuple2!7476) ListLongMap!6379)

(assert (=> b!429999 (= lt!196501 (+!1382 lt!196502 lt!196510))))

(declare-fun lt!196500 () V!16107)

(assert (=> b!429999 (= lt!196510 (tuple2!7477 (select (arr!12615 _keys!709) from!863) lt!196500))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5282 0))(
  ( (ValueCellFull!5282 (v!7911 V!16107)) (EmptyCell!5282) )
))
(declare-datatypes ((array!26333 0))(
  ( (array!26334 (arr!12616 (Array (_ BitVec 32) ValueCell!5282)) (size!12969 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26333)

(declare-fun get!6259 (ValueCell!5282 V!16107) V!16107)

(declare-fun dynLambda!775 (Int (_ BitVec 64)) V!16107)

(assert (=> b!429999 (= lt!196500 (get!6259 (select (arr!12616 _values!549) from!863) (dynLambda!775 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430000 () Bool)

(declare-fun e!254577 () Bool)

(declare-fun tp_is_empty!11251 () Bool)

(assert (=> b!430000 (= e!254577 tp_is_empty!11251)))

(declare-fun b!430001 () Bool)

(declare-fun e!254572 () Bool)

(assert (=> b!430001 (= e!254572 (not e!254571))))

(declare-fun res!252668 () Bool)

(assert (=> b!430001 (=> res!252668 e!254571)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430001 (= res!252668 (not (validKeyInArray!0 (select (arr!12615 _keys!709) from!863))))))

(declare-fun lt!196504 () ListLongMap!6379)

(assert (=> b!430001 (= lt!196504 lt!196502)))

(declare-fun lt!196506 () ListLongMap!6379)

(declare-fun lt!196497 () tuple2!7476)

(assert (=> b!430001 (= lt!196502 (+!1382 lt!196506 lt!196497))))

(declare-fun lt!196507 () array!26331)

(declare-fun minValue!515 () V!16107)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16107)

(declare-fun lt!196503 () array!26333)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1412 (array!26331 array!26333 (_ BitVec 32) (_ BitVec 32) V!16107 V!16107 (_ BitVec 32) Int) ListLongMap!6379)

(assert (=> b!430001 (= lt!196504 (getCurrentListMapNoExtraKeys!1412 lt!196507 lt!196503 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16107)

(assert (=> b!430001 (= lt!196497 (tuple2!7477 k0!794 v!412))))

(assert (=> b!430001 (= lt!196506 (getCurrentListMapNoExtraKeys!1412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!196499 () Unit!12651)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!546 (array!26331 array!26333 (_ BitVec 32) (_ BitVec 32) V!16107 V!16107 (_ BitVec 32) (_ BitVec 64) V!16107 (_ BitVec 32) Int) Unit!12651)

(assert (=> b!430001 (= lt!196499 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18498 () Bool)

(declare-fun mapRes!18498 () Bool)

(declare-fun tp!35825 () Bool)

(declare-fun e!254575 () Bool)

(assert (=> mapNonEmpty!18498 (= mapRes!18498 (and tp!35825 e!254575))))

(declare-fun mapValue!18498 () ValueCell!5282)

(declare-fun mapKey!18498 () (_ BitVec 32))

(declare-fun mapRest!18498 () (Array (_ BitVec 32) ValueCell!5282))

(assert (=> mapNonEmpty!18498 (= (arr!12616 _values!549) (store mapRest!18498 mapKey!18498 mapValue!18498))))

(declare-fun b!430002 () Bool)

(declare-fun Unit!12653 () Unit!12651)

(assert (=> b!430002 (= e!254570 Unit!12653)))

(declare-fun b!430003 () Bool)

(declare-fun res!252674 () Bool)

(declare-fun e!254574 () Bool)

(assert (=> b!430003 (=> (not res!252674) (not e!254574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430003 (= res!252674 (validMask!0 mask!1025))))

(declare-fun res!252680 () Bool)

(assert (=> start!39818 (=> (not res!252680) (not e!254574))))

(assert (=> start!39818 (= res!252680 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12968 _keys!709))))))

(assert (=> start!39818 e!254574))

(assert (=> start!39818 tp_is_empty!11251))

(assert (=> start!39818 tp!35826))

(assert (=> start!39818 true))

(declare-fun e!254576 () Bool)

(declare-fun array_inv!9218 (array!26333) Bool)

(assert (=> start!39818 (and (array_inv!9218 _values!549) e!254576)))

(declare-fun array_inv!9219 (array!26331) Bool)

(assert (=> start!39818 (array_inv!9219 _keys!709)))

(declare-fun mapIsEmpty!18498 () Bool)

(assert (=> mapIsEmpty!18498 mapRes!18498))

(declare-fun b!430004 () Bool)

(declare-fun e!254568 () Bool)

(assert (=> b!430004 (= e!254574 e!254568)))

(declare-fun res!252669 () Bool)

(assert (=> b!430004 (=> (not res!252669) (not e!254568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26331 (_ BitVec 32)) Bool)

(assert (=> b!430004 (= res!252669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196507 mask!1025))))

(assert (=> b!430004 (= lt!196507 (array!26332 (store (arr!12615 _keys!709) i!563 k0!794) (size!12968 _keys!709)))))

(declare-fun b!430005 () Bool)

(assert (=> b!430005 (= e!254568 e!254572)))

(declare-fun res!252681 () Bool)

(assert (=> b!430005 (=> (not res!252681) (not e!254572))))

(assert (=> b!430005 (= res!252681 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430005 (= lt!196505 (getCurrentListMapNoExtraKeys!1412 lt!196507 lt!196503 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430005 (= lt!196503 (array!26334 (store (arr!12616 _values!549) i!563 (ValueCellFull!5282 v!412)) (size!12969 _values!549)))))

(declare-fun lt!196498 () ListLongMap!6379)

(assert (=> b!430005 (= lt!196498 (getCurrentListMapNoExtraKeys!1412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430006 () Bool)

(declare-fun res!252672 () Bool)

(assert (=> b!430006 (=> (not res!252672) (not e!254574))))

(declare-datatypes ((List!7475 0))(
  ( (Nil!7472) (Cons!7471 (h!8327 (_ BitVec 64)) (t!13014 List!7475)) )
))
(declare-fun arrayNoDuplicates!0 (array!26331 (_ BitVec 32) List!7475) Bool)

(assert (=> b!430006 (= res!252672 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7472))))

(declare-fun b!430007 () Bool)

(declare-fun res!252679 () Bool)

(assert (=> b!430007 (=> (not res!252679) (not e!254574))))

(assert (=> b!430007 (= res!252679 (validKeyInArray!0 k0!794))))

(declare-fun b!430008 () Bool)

(declare-fun res!252676 () Bool)

(assert (=> b!430008 (=> (not res!252676) (not e!254568))))

(assert (=> b!430008 (= res!252676 (bvsle from!863 i!563))))

(declare-fun b!430009 () Bool)

(declare-fun res!252670 () Bool)

(assert (=> b!430009 (=> (not res!252670) (not e!254574))))

(assert (=> b!430009 (= res!252670 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12968 _keys!709))))))

(declare-fun b!430010 () Bool)

(assert (=> b!430010 (= e!254573 true)))

(assert (=> b!430010 (= lt!196501 (+!1382 (+!1382 lt!196506 lt!196510) lt!196497))))

(declare-fun lt!196511 () Unit!12651)

(declare-fun addCommutativeForDiffKeys!348 (ListLongMap!6379 (_ BitVec 64) V!16107 (_ BitVec 64) V!16107) Unit!12651)

(assert (=> b!430010 (= lt!196511 (addCommutativeForDiffKeys!348 lt!196506 k0!794 v!412 (select (arr!12615 _keys!709) from!863) lt!196500))))

(declare-fun b!430011 () Bool)

(declare-fun res!252678 () Bool)

(assert (=> b!430011 (=> (not res!252678) (not e!254568))))

(assert (=> b!430011 (= res!252678 (arrayNoDuplicates!0 lt!196507 #b00000000000000000000000000000000 Nil!7472))))

(declare-fun b!430012 () Bool)

(declare-fun res!252677 () Bool)

(assert (=> b!430012 (=> (not res!252677) (not e!254574))))

(assert (=> b!430012 (= res!252677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430013 () Bool)

(assert (=> b!430013 (= e!254576 (and e!254577 mapRes!18498))))

(declare-fun condMapEmpty!18498 () Bool)

(declare-fun mapDefault!18498 () ValueCell!5282)

(assert (=> b!430013 (= condMapEmpty!18498 (= (arr!12616 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5282)) mapDefault!18498)))))

(declare-fun b!430014 () Bool)

(declare-fun res!252675 () Bool)

(assert (=> b!430014 (=> (not res!252675) (not e!254574))))

(assert (=> b!430014 (= res!252675 (and (= (size!12969 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12968 _keys!709) (size!12969 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430015 () Bool)

(assert (=> b!430015 (= e!254575 tp_is_empty!11251)))

(declare-fun b!430016 () Bool)

(declare-fun res!252671 () Bool)

(assert (=> b!430016 (=> (not res!252671) (not e!254574))))

(declare-fun arrayContainsKey!0 (array!26331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430016 (= res!252671 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430017 () Bool)

(declare-fun res!252673 () Bool)

(assert (=> b!430017 (=> (not res!252673) (not e!254574))))

(assert (=> b!430017 (= res!252673 (or (= (select (arr!12615 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12615 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430018 () Bool)

(declare-fun Unit!12654 () Unit!12651)

(assert (=> b!430018 (= e!254570 Unit!12654)))

(declare-fun lt!196509 () Unit!12651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12651)

(assert (=> b!430018 (= lt!196509 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430018 false))

(assert (= (and start!39818 res!252680) b!430003))

(assert (= (and b!430003 res!252674) b!430014))

(assert (= (and b!430014 res!252675) b!430012))

(assert (= (and b!430012 res!252677) b!430006))

(assert (= (and b!430006 res!252672) b!430009))

(assert (= (and b!430009 res!252670) b!430007))

(assert (= (and b!430007 res!252679) b!430017))

(assert (= (and b!430017 res!252673) b!430016))

(assert (= (and b!430016 res!252671) b!430004))

(assert (= (and b!430004 res!252669) b!430011))

(assert (= (and b!430011 res!252678) b!430008))

(assert (= (and b!430008 res!252676) b!430005))

(assert (= (and b!430005 res!252681) b!430001))

(assert (= (and b!430001 (not res!252668)) b!429999))

(assert (= (and b!429999 c!55413) b!430018))

(assert (= (and b!429999 (not c!55413)) b!430002))

(assert (= (and b!429999 (not res!252667)) b!430010))

(assert (= (and b!430013 condMapEmpty!18498) mapIsEmpty!18498))

(assert (= (and b!430013 (not condMapEmpty!18498)) mapNonEmpty!18498))

(get-info :version)

(assert (= (and mapNonEmpty!18498 ((_ is ValueCellFull!5282) mapValue!18498)) b!430015))

(assert (= (and b!430013 ((_ is ValueCellFull!5282) mapDefault!18498)) b!430000))

(assert (= start!39818 b!430013))

(declare-fun b_lambda!9169 () Bool)

(assert (=> (not b_lambda!9169) (not b!429999)))

(declare-fun t!13012 () Bool)

(declare-fun tb!3497 () Bool)

(assert (=> (and start!39818 (= defaultEntry!557 defaultEntry!557) t!13012) tb!3497))

(declare-fun result!6529 () Bool)

(assert (=> tb!3497 (= result!6529 tp_is_empty!11251)))

(assert (=> b!429999 t!13012))

(declare-fun b_and!17833 () Bool)

(assert (= b_and!17831 (and (=> t!13012 result!6529) b_and!17833)))

(declare-fun m!417759 () Bool)

(assert (=> b!430001 m!417759))

(declare-fun m!417761 () Bool)

(assert (=> b!430001 m!417761))

(assert (=> b!430001 m!417759))

(declare-fun m!417763 () Bool)

(assert (=> b!430001 m!417763))

(declare-fun m!417765 () Bool)

(assert (=> b!430001 m!417765))

(declare-fun m!417767 () Bool)

(assert (=> b!430001 m!417767))

(declare-fun m!417769 () Bool)

(assert (=> b!430001 m!417769))

(declare-fun m!417771 () Bool)

(assert (=> b!430017 m!417771))

(assert (=> b!429999 m!417759))

(declare-fun m!417773 () Bool)

(assert (=> b!429999 m!417773))

(declare-fun m!417775 () Bool)

(assert (=> b!429999 m!417775))

(assert (=> b!429999 m!417775))

(assert (=> b!429999 m!417773))

(declare-fun m!417777 () Bool)

(assert (=> b!429999 m!417777))

(declare-fun m!417779 () Bool)

(assert (=> b!429999 m!417779))

(declare-fun m!417781 () Bool)

(assert (=> mapNonEmpty!18498 m!417781))

(declare-fun m!417783 () Bool)

(assert (=> b!430016 m!417783))

(declare-fun m!417785 () Bool)

(assert (=> b!430005 m!417785))

(declare-fun m!417787 () Bool)

(assert (=> b!430005 m!417787))

(declare-fun m!417789 () Bool)

(assert (=> b!430005 m!417789))

(declare-fun m!417791 () Bool)

(assert (=> b!430003 m!417791))

(declare-fun m!417793 () Bool)

(assert (=> b!430007 m!417793))

(declare-fun m!417795 () Bool)

(assert (=> b!430004 m!417795))

(declare-fun m!417797 () Bool)

(assert (=> b!430004 m!417797))

(declare-fun m!417799 () Bool)

(assert (=> start!39818 m!417799))

(declare-fun m!417801 () Bool)

(assert (=> start!39818 m!417801))

(declare-fun m!417803 () Bool)

(assert (=> b!430018 m!417803))

(declare-fun m!417805 () Bool)

(assert (=> b!430011 m!417805))

(declare-fun m!417807 () Bool)

(assert (=> b!430010 m!417807))

(assert (=> b!430010 m!417807))

(declare-fun m!417809 () Bool)

(assert (=> b!430010 m!417809))

(assert (=> b!430010 m!417759))

(assert (=> b!430010 m!417759))

(declare-fun m!417811 () Bool)

(assert (=> b!430010 m!417811))

(declare-fun m!417813 () Bool)

(assert (=> b!430006 m!417813))

(declare-fun m!417815 () Bool)

(assert (=> b!430012 m!417815))

(check-sat (not b!430004) (not b_next!10099) (not b!430001) (not b!430018) (not b!430003) (not b!430010) (not b!430005) tp_is_empty!11251 (not b!430007) (not b!430012) (not b!429999) (not b!430016) (not b_lambda!9169) (not start!39818) b_and!17833 (not mapNonEmpty!18498) (not b!430011) (not b!430006))
(check-sat b_and!17833 (not b_next!10099))
