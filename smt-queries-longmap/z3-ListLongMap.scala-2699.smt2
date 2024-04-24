; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39998 () Bool)

(assert start!39998)

(declare-fun b_free!10279 () Bool)

(declare-fun b_next!10279 () Bool)

(assert (=> start!39998 (= b_free!10279 (not b_next!10279))))

(declare-fun tp!36366 () Bool)

(declare-fun b_and!18231 () Bool)

(assert (=> start!39998 (= tp!36366 b_and!18231)))

(declare-fun b!435801 () Bool)

(declare-fun res!256850 () Bool)

(declare-fun e!257412 () Bool)

(assert (=> b!435801 (=> (not res!256850) (not e!257412))))

(declare-datatypes ((array!26690 0))(
  ( (array!26691 (arr!12794 (Array (_ BitVec 32) (_ BitVec 64))) (size!13146 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26690)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435801 (= res!256850 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435802 () Bool)

(declare-fun e!257413 () Bool)

(declare-fun tp_is_empty!11431 () Bool)

(assert (=> b!435802 (= e!257413 tp_is_empty!11431)))

(declare-fun mapIsEmpty!18768 () Bool)

(declare-fun mapRes!18768 () Bool)

(assert (=> mapIsEmpty!18768 mapRes!18768))

(declare-fun b!435803 () Bool)

(declare-fun res!256851 () Bool)

(declare-fun e!257416 () Bool)

(assert (=> b!435803 (=> (not res!256851) (not e!257416))))

(declare-fun lt!200803 () array!26690)

(declare-datatypes ((List!7520 0))(
  ( (Nil!7517) (Cons!7516 (h!8372 (_ BitVec 64)) (t!13240 List!7520)) )
))
(declare-fun arrayNoDuplicates!0 (array!26690 (_ BitVec 32) List!7520) Bool)

(assert (=> b!435803 (= res!256851 (arrayNoDuplicates!0 lt!200803 #b00000000000000000000000000000000 Nil!7517))))

(declare-fun b!435804 () Bool)

(declare-fun res!256847 () Bool)

(assert (=> b!435804 (=> (not res!256847) (not e!257412))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26690 (_ BitVec 32)) Bool)

(assert (=> b!435804 (= res!256847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435805 () Bool)

(declare-fun res!256843 () Bool)

(assert (=> b!435805 (=> (not res!256843) (not e!257412))))

(assert (=> b!435805 (= res!256843 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7517))))

(declare-fun b!435806 () Bool)

(declare-fun res!256856 () Bool)

(assert (=> b!435806 (=> (not res!256856) (not e!257412))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435806 (= res!256856 (or (= (select (arr!12794 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12794 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435807 () Bool)

(declare-fun res!256844 () Bool)

(assert (=> b!435807 (=> (not res!256844) (not e!257412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435807 (= res!256844 (validKeyInArray!0 k0!794))))

(declare-fun res!256849 () Bool)

(assert (=> start!39998 (=> (not res!256849) (not e!257412))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39998 (= res!256849 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13146 _keys!709))))))

(assert (=> start!39998 e!257412))

(assert (=> start!39998 tp_is_empty!11431))

(assert (=> start!39998 tp!36366))

(assert (=> start!39998 true))

(declare-datatypes ((V!16347 0))(
  ( (V!16348 (val!5760 Int)) )
))
(declare-datatypes ((ValueCell!5372 0))(
  ( (ValueCellFull!5372 (v!8008 V!16347)) (EmptyCell!5372) )
))
(declare-datatypes ((array!26692 0))(
  ( (array!26693 (arr!12795 (Array (_ BitVec 32) ValueCell!5372)) (size!13147 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26692)

(declare-fun e!257410 () Bool)

(declare-fun array_inv!9360 (array!26692) Bool)

(assert (=> start!39998 (and (array_inv!9360 _values!549) e!257410)))

(declare-fun array_inv!9361 (array!26690) Bool)

(assert (=> start!39998 (array_inv!9361 _keys!709)))

(declare-fun b!435808 () Bool)

(declare-fun e!257419 () Bool)

(declare-fun e!257415 () Bool)

(assert (=> b!435808 (= e!257419 (not e!257415))))

(declare-fun res!256852 () Bool)

(assert (=> b!435808 (=> res!256852 e!257415)))

(assert (=> b!435808 (= res!256852 (not (validKeyInArray!0 (select (arr!12794 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7530 0))(
  ( (tuple2!7531 (_1!3776 (_ BitVec 64)) (_2!3776 V!16347)) )
))
(declare-datatypes ((List!7521 0))(
  ( (Nil!7518) (Cons!7517 (h!8373 tuple2!7530) (t!13241 List!7521)) )
))
(declare-datatypes ((ListLongMap!6445 0))(
  ( (ListLongMap!6446 (toList!3238 List!7521)) )
))
(declare-fun lt!200813 () ListLongMap!6445)

(declare-fun lt!200801 () ListLongMap!6445)

(assert (=> b!435808 (= lt!200813 lt!200801)))

(declare-fun lt!200804 () ListLongMap!6445)

(declare-fun lt!200811 () tuple2!7530)

(declare-fun +!1442 (ListLongMap!6445 tuple2!7530) ListLongMap!6445)

(assert (=> b!435808 (= lt!200801 (+!1442 lt!200804 lt!200811))))

(declare-fun minValue!515 () V!16347)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!200806 () array!26692)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16347)

(declare-fun getCurrentListMapNoExtraKeys!1472 (array!26690 array!26692 (_ BitVec 32) (_ BitVec 32) V!16347 V!16347 (_ BitVec 32) Int) ListLongMap!6445)

(assert (=> b!435808 (= lt!200813 (getCurrentListMapNoExtraKeys!1472 lt!200803 lt!200806 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16347)

(assert (=> b!435808 (= lt!200811 (tuple2!7531 k0!794 v!412))))

(assert (=> b!435808 (= lt!200804 (getCurrentListMapNoExtraKeys!1472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12941 0))(
  ( (Unit!12942) )
))
(declare-fun lt!200805 () Unit!12941)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!604 (array!26690 array!26692 (_ BitVec 32) (_ BitVec 32) V!16347 V!16347 (_ BitVec 32) (_ BitVec 64) V!16347 (_ BitVec 32) Int) Unit!12941)

(assert (=> b!435808 (= lt!200805 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!604 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435809 () Bool)

(assert (=> b!435809 (= e!257416 e!257419)))

(declare-fun res!256855 () Bool)

(assert (=> b!435809 (=> (not res!256855) (not e!257419))))

(assert (=> b!435809 (= res!256855 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200807 () ListLongMap!6445)

(assert (=> b!435809 (= lt!200807 (getCurrentListMapNoExtraKeys!1472 lt!200803 lt!200806 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435809 (= lt!200806 (array!26693 (store (arr!12795 _values!549) i!563 (ValueCellFull!5372 v!412)) (size!13147 _values!549)))))

(declare-fun lt!200802 () ListLongMap!6445)

(assert (=> b!435809 (= lt!200802 (getCurrentListMapNoExtraKeys!1472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435810 () Bool)

(declare-fun res!256848 () Bool)

(assert (=> b!435810 (=> (not res!256848) (not e!257412))))

(assert (=> b!435810 (= res!256848 (and (= (size!13147 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13146 _keys!709) (size!13147 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435811 () Bool)

(declare-fun res!256857 () Bool)

(assert (=> b!435811 (=> (not res!256857) (not e!257412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435811 (= res!256857 (validMask!0 mask!1025))))

(declare-fun b!435812 () Bool)

(assert (=> b!435812 (= e!257412 e!257416)))

(declare-fun res!256845 () Bool)

(assert (=> b!435812 (=> (not res!256845) (not e!257416))))

(assert (=> b!435812 (= res!256845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200803 mask!1025))))

(assert (=> b!435812 (= lt!200803 (array!26691 (store (arr!12794 _keys!709) i!563 k0!794) (size!13146 _keys!709)))))

(declare-fun b!435813 () Bool)

(declare-fun res!256853 () Bool)

(assert (=> b!435813 (=> (not res!256853) (not e!257416))))

(assert (=> b!435813 (= res!256853 (bvsle from!863 i!563))))

(declare-fun b!435814 () Bool)

(declare-fun e!257417 () Bool)

(assert (=> b!435814 (= e!257415 e!257417)))

(declare-fun res!256854 () Bool)

(assert (=> b!435814 (=> res!256854 e!257417)))

(assert (=> b!435814 (= res!256854 (= k0!794 (select (arr!12794 _keys!709) from!863)))))

(assert (=> b!435814 (not (= (select (arr!12794 _keys!709) from!863) k0!794))))

(declare-fun lt!200809 () Unit!12941)

(declare-fun e!257418 () Unit!12941)

(assert (=> b!435814 (= lt!200809 e!257418)))

(declare-fun c!55731 () Bool)

(assert (=> b!435814 (= c!55731 (= (select (arr!12794 _keys!709) from!863) k0!794))))

(declare-fun lt!200812 () ListLongMap!6445)

(assert (=> b!435814 (= lt!200807 lt!200812)))

(declare-fun lt!200814 () tuple2!7530)

(assert (=> b!435814 (= lt!200812 (+!1442 lt!200801 lt!200814))))

(declare-fun lt!200808 () V!16347)

(assert (=> b!435814 (= lt!200814 (tuple2!7531 (select (arr!12794 _keys!709) from!863) lt!200808))))

(declare-fun get!6388 (ValueCell!5372 V!16347) V!16347)

(declare-fun dynLambda!841 (Int (_ BitVec 64)) V!16347)

(assert (=> b!435814 (= lt!200808 (get!6388 (select (arr!12795 _values!549) from!863) (dynLambda!841 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435815 () Bool)

(declare-fun e!257411 () Bool)

(assert (=> b!435815 (= e!257411 tp_is_empty!11431)))

(declare-fun b!435816 () Bool)

(declare-fun res!256846 () Bool)

(assert (=> b!435816 (=> (not res!256846) (not e!257412))))

(assert (=> b!435816 (= res!256846 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13146 _keys!709))))))

(declare-fun b!435817 () Bool)

(declare-fun Unit!12943 () Unit!12941)

(assert (=> b!435817 (= e!257418 Unit!12943)))

(declare-fun lt!200800 () Unit!12941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12941)

(assert (=> b!435817 (= lt!200800 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435817 false))

(declare-fun mapNonEmpty!18768 () Bool)

(declare-fun tp!36365 () Bool)

(assert (=> mapNonEmpty!18768 (= mapRes!18768 (and tp!36365 e!257411))))

(declare-fun mapKey!18768 () (_ BitVec 32))

(declare-fun mapRest!18768 () (Array (_ BitVec 32) ValueCell!5372))

(declare-fun mapValue!18768 () ValueCell!5372)

(assert (=> mapNonEmpty!18768 (= (arr!12795 _values!549) (store mapRest!18768 mapKey!18768 mapValue!18768))))

(declare-fun b!435818 () Bool)

(assert (=> b!435818 (= e!257410 (and e!257413 mapRes!18768))))

(declare-fun condMapEmpty!18768 () Bool)

(declare-fun mapDefault!18768 () ValueCell!5372)

(assert (=> b!435818 (= condMapEmpty!18768 (= (arr!12795 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5372)) mapDefault!18768)))))

(declare-fun b!435819 () Bool)

(declare-fun Unit!12944 () Unit!12941)

(assert (=> b!435819 (= e!257418 Unit!12944)))

(declare-fun b!435820 () Bool)

(assert (=> b!435820 (= e!257417 true)))

(assert (=> b!435820 (= lt!200812 (+!1442 (+!1442 lt!200804 lt!200814) lt!200811))))

(declare-fun lt!200810 () Unit!12941)

(declare-fun addCommutativeForDiffKeys!410 (ListLongMap!6445 (_ BitVec 64) V!16347 (_ BitVec 64) V!16347) Unit!12941)

(assert (=> b!435820 (= lt!200810 (addCommutativeForDiffKeys!410 lt!200804 k0!794 v!412 (select (arr!12794 _keys!709) from!863) lt!200808))))

(assert (= (and start!39998 res!256849) b!435811))

(assert (= (and b!435811 res!256857) b!435810))

(assert (= (and b!435810 res!256848) b!435804))

(assert (= (and b!435804 res!256847) b!435805))

(assert (= (and b!435805 res!256843) b!435816))

(assert (= (and b!435816 res!256846) b!435807))

(assert (= (and b!435807 res!256844) b!435806))

(assert (= (and b!435806 res!256856) b!435801))

(assert (= (and b!435801 res!256850) b!435812))

(assert (= (and b!435812 res!256845) b!435803))

(assert (= (and b!435803 res!256851) b!435813))

(assert (= (and b!435813 res!256853) b!435809))

(assert (= (and b!435809 res!256855) b!435808))

(assert (= (and b!435808 (not res!256852)) b!435814))

(assert (= (and b!435814 c!55731) b!435817))

(assert (= (and b!435814 (not c!55731)) b!435819))

(assert (= (and b!435814 (not res!256854)) b!435820))

(assert (= (and b!435818 condMapEmpty!18768) mapIsEmpty!18768))

(assert (= (and b!435818 (not condMapEmpty!18768)) mapNonEmpty!18768))

(get-info :version)

(assert (= (and mapNonEmpty!18768 ((_ is ValueCellFull!5372) mapValue!18768)) b!435815))

(assert (= (and b!435818 ((_ is ValueCellFull!5372) mapDefault!18768)) b!435802))

(assert (= start!39998 b!435818))

(declare-fun b_lambda!9389 () Bool)

(assert (=> (not b_lambda!9389) (not b!435814)))

(declare-fun t!13239 () Bool)

(declare-fun tb!3677 () Bool)

(assert (=> (and start!39998 (= defaultEntry!557 defaultEntry!557) t!13239) tb!3677))

(declare-fun result!6889 () Bool)

(assert (=> tb!3677 (= result!6889 tp_is_empty!11431)))

(assert (=> b!435814 t!13239))

(declare-fun b_and!18233 () Bool)

(assert (= b_and!18231 (and (=> t!13239 result!6889) b_and!18233)))

(declare-fun m!423929 () Bool)

(assert (=> mapNonEmpty!18768 m!423929))

(declare-fun m!423931 () Bool)

(assert (=> b!435805 m!423931))

(declare-fun m!423933 () Bool)

(assert (=> start!39998 m!423933))

(declare-fun m!423935 () Bool)

(assert (=> start!39998 m!423935))

(declare-fun m!423937 () Bool)

(assert (=> b!435804 m!423937))

(declare-fun m!423939 () Bool)

(assert (=> b!435812 m!423939))

(declare-fun m!423941 () Bool)

(assert (=> b!435812 m!423941))

(declare-fun m!423943 () Bool)

(assert (=> b!435811 m!423943))

(declare-fun m!423945 () Bool)

(assert (=> b!435807 m!423945))

(declare-fun m!423947 () Bool)

(assert (=> b!435820 m!423947))

(assert (=> b!435820 m!423947))

(declare-fun m!423949 () Bool)

(assert (=> b!435820 m!423949))

(declare-fun m!423951 () Bool)

(assert (=> b!435820 m!423951))

(assert (=> b!435820 m!423951))

(declare-fun m!423953 () Bool)

(assert (=> b!435820 m!423953))

(declare-fun m!423955 () Bool)

(assert (=> b!435809 m!423955))

(declare-fun m!423957 () Bool)

(assert (=> b!435809 m!423957))

(declare-fun m!423959 () Bool)

(assert (=> b!435809 m!423959))

(declare-fun m!423961 () Bool)

(assert (=> b!435806 m!423961))

(declare-fun m!423963 () Bool)

(assert (=> b!435801 m!423963))

(declare-fun m!423965 () Bool)

(assert (=> b!435817 m!423965))

(assert (=> b!435814 m!423951))

(declare-fun m!423967 () Bool)

(assert (=> b!435814 m!423967))

(declare-fun m!423969 () Bool)

(assert (=> b!435814 m!423969))

(declare-fun m!423971 () Bool)

(assert (=> b!435814 m!423971))

(assert (=> b!435814 m!423971))

(assert (=> b!435814 m!423969))

(declare-fun m!423973 () Bool)

(assert (=> b!435814 m!423973))

(declare-fun m!423975 () Bool)

(assert (=> b!435803 m!423975))

(assert (=> b!435808 m!423951))

(declare-fun m!423977 () Bool)

(assert (=> b!435808 m!423977))

(declare-fun m!423979 () Bool)

(assert (=> b!435808 m!423979))

(declare-fun m!423981 () Bool)

(assert (=> b!435808 m!423981))

(assert (=> b!435808 m!423951))

(declare-fun m!423983 () Bool)

(assert (=> b!435808 m!423983))

(declare-fun m!423985 () Bool)

(assert (=> b!435808 m!423985))

(check-sat (not b!435820) (not b!435807) (not b_lambda!9389) (not b!435811) (not start!39998) (not b!435804) (not b!435817) b_and!18233 (not b!435801) (not b!435808) (not b!435803) (not mapNonEmpty!18768) (not b!435814) (not b!435805) tp_is_empty!11431 (not b!435809) (not b_next!10279) (not b!435812))
(check-sat b_and!18233 (not b_next!10279))
