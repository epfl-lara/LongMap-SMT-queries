; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20576 () Bool)

(assert start!20576)

(declare-fun b_free!5235 () Bool)

(declare-fun b_next!5235 () Bool)

(assert (=> start!20576 (= b_free!5235 (not b_next!5235))))

(declare-fun tp!18737 () Bool)

(declare-fun b_and!11981 () Bool)

(assert (=> start!20576 (= tp!18737 b_and!11981)))

(declare-fun b!204876 () Bool)

(declare-fun e!134020 () Bool)

(declare-fun e!134016 () Bool)

(assert (=> b!204876 (= e!134020 (not e!134016))))

(declare-fun res!98842 () Bool)

(assert (=> b!204876 (=> res!98842 e!134016)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204876 (= res!98842 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6435 0))(
  ( (V!6436 (val!2590 Int)) )
))
(declare-datatypes ((ValueCell!2202 0))(
  ( (ValueCellFull!2202 (v!4560 V!6435)) (EmptyCell!2202) )
))
(declare-datatypes ((array!9397 0))(
  ( (array!9398 (arr!4449 (Array (_ BitVec 32) ValueCell!2202)) (size!4774 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9397)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3926 0))(
  ( (tuple2!3927 (_1!1974 (_ BitVec 64)) (_2!1974 V!6435)) )
))
(declare-datatypes ((List!2825 0))(
  ( (Nil!2822) (Cons!2821 (h!3463 tuple2!3926) (t!7756 List!2825)) )
))
(declare-datatypes ((ListLongMap!2839 0))(
  ( (ListLongMap!2840 (toList!1435 List!2825)) )
))
(declare-fun lt!104009 () ListLongMap!2839)

(declare-fun zeroValue!615 () V!6435)

(declare-datatypes ((array!9399 0))(
  ( (array!9400 (arr!4450 (Array (_ BitVec 32) (_ BitVec 64))) (size!4775 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9399)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6435)

(declare-fun getCurrentListMap!1008 (array!9399 array!9397 (_ BitVec 32) (_ BitVec 32) V!6435 V!6435 (_ BitVec 32) Int) ListLongMap!2839)

(assert (=> b!204876 (= lt!104009 (getCurrentListMap!1008 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104010 () ListLongMap!2839)

(declare-fun lt!104013 () array!9397)

(assert (=> b!204876 (= lt!104010 (getCurrentListMap!1008 _keys!825 lt!104013 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104018 () ListLongMap!2839)

(declare-fun lt!104019 () ListLongMap!2839)

(assert (=> b!204876 (and (= lt!104018 lt!104019) (= lt!104019 lt!104018))))

(declare-fun lt!104012 () ListLongMap!2839)

(declare-fun lt!104016 () tuple2!3926)

(declare-fun +!462 (ListLongMap!2839 tuple2!3926) ListLongMap!2839)

(assert (=> b!204876 (= lt!104019 (+!462 lt!104012 lt!104016))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6435)

(assert (=> b!204876 (= lt!104016 (tuple2!3927 k0!843 v!520))))

(declare-datatypes ((Unit!6216 0))(
  ( (Unit!6217) )
))
(declare-fun lt!104017 () Unit!6216)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!121 (array!9399 array!9397 (_ BitVec 32) (_ BitVec 32) V!6435 V!6435 (_ BitVec 32) (_ BitVec 64) V!6435 (_ BitVec 32) Int) Unit!6216)

(assert (=> b!204876 (= lt!104017 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!121 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!382 (array!9399 array!9397 (_ BitVec 32) (_ BitVec 32) V!6435 V!6435 (_ BitVec 32) Int) ListLongMap!2839)

(assert (=> b!204876 (= lt!104018 (getCurrentListMapNoExtraKeys!382 _keys!825 lt!104013 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204876 (= lt!104013 (array!9398 (store (arr!4449 _values!649) i!601 (ValueCellFull!2202 v!520)) (size!4774 _values!649)))))

(assert (=> b!204876 (= lt!104012 (getCurrentListMapNoExtraKeys!382 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204877 () Bool)

(declare-fun e!134019 () Bool)

(assert (=> b!204877 (= e!134016 e!134019)))

(declare-fun res!98840 () Bool)

(assert (=> b!204877 (=> res!98840 e!134019)))

(assert (=> b!204877 (= res!98840 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104008 () ListLongMap!2839)

(assert (=> b!204877 (= lt!104009 lt!104008)))

(declare-fun lt!104014 () tuple2!3926)

(assert (=> b!204877 (= lt!104008 (+!462 lt!104012 lt!104014))))

(declare-fun lt!104015 () ListLongMap!2839)

(assert (=> b!204877 (= lt!104010 lt!104015)))

(assert (=> b!204877 (= lt!104015 (+!462 lt!104019 lt!104014))))

(assert (=> b!204877 (= lt!104010 (+!462 lt!104018 lt!104014))))

(assert (=> b!204877 (= lt!104014 (tuple2!3927 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204878 () Bool)

(declare-fun res!98836 () Bool)

(assert (=> b!204878 (=> (not res!98836) (not e!134020))))

(assert (=> b!204878 (= res!98836 (= (select (arr!4450 _keys!825) i!601) k0!843))))

(declare-fun b!204879 () Bool)

(declare-fun res!98838 () Bool)

(assert (=> b!204879 (=> (not res!98838) (not e!134020))))

(assert (=> b!204879 (= res!98838 (and (= (size!4774 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4775 _keys!825) (size!4774 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204880 () Bool)

(declare-fun res!98839 () Bool)

(assert (=> b!204880 (=> (not res!98839) (not e!134020))))

(assert (=> b!204880 (= res!98839 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4775 _keys!825))))))

(declare-fun mapNonEmpty!8705 () Bool)

(declare-fun mapRes!8705 () Bool)

(declare-fun tp!18736 () Bool)

(declare-fun e!134018 () Bool)

(assert (=> mapNonEmpty!8705 (= mapRes!8705 (and tp!18736 e!134018))))

(declare-fun mapRest!8705 () (Array (_ BitVec 32) ValueCell!2202))

(declare-fun mapValue!8705 () ValueCell!2202)

(declare-fun mapKey!8705 () (_ BitVec 32))

(assert (=> mapNonEmpty!8705 (= (arr!4449 _values!649) (store mapRest!8705 mapKey!8705 mapValue!8705))))

(declare-fun res!98834 () Bool)

(assert (=> start!20576 (=> (not res!98834) (not e!134020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20576 (= res!98834 (validMask!0 mask!1149))))

(assert (=> start!20576 e!134020))

(declare-fun e!134021 () Bool)

(declare-fun array_inv!2937 (array!9397) Bool)

(assert (=> start!20576 (and (array_inv!2937 _values!649) e!134021)))

(assert (=> start!20576 true))

(declare-fun tp_is_empty!5091 () Bool)

(assert (=> start!20576 tp_is_empty!5091))

(declare-fun array_inv!2938 (array!9399) Bool)

(assert (=> start!20576 (array_inv!2938 _keys!825)))

(assert (=> start!20576 tp!18737))

(declare-fun b!204881 () Bool)

(declare-fun e!134017 () Bool)

(assert (=> b!204881 (= e!134021 (and e!134017 mapRes!8705))))

(declare-fun condMapEmpty!8705 () Bool)

(declare-fun mapDefault!8705 () ValueCell!2202)

(assert (=> b!204881 (= condMapEmpty!8705 (= (arr!4449 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2202)) mapDefault!8705)))))

(declare-fun mapIsEmpty!8705 () Bool)

(assert (=> mapIsEmpty!8705 mapRes!8705))

(declare-fun b!204882 () Bool)

(declare-fun res!98835 () Bool)

(assert (=> b!204882 (=> (not res!98835) (not e!134020))))

(declare-datatypes ((List!2826 0))(
  ( (Nil!2823) (Cons!2822 (h!3464 (_ BitVec 64)) (t!7757 List!2826)) )
))
(declare-fun arrayNoDuplicates!0 (array!9399 (_ BitVec 32) List!2826) Bool)

(assert (=> b!204882 (= res!98835 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2823))))

(declare-fun b!204883 () Bool)

(assert (=> b!204883 (= e!134018 tp_is_empty!5091)))

(declare-fun b!204884 () Bool)

(assert (=> b!204884 (= e!134017 tp_is_empty!5091)))

(declare-fun b!204885 () Bool)

(assert (=> b!204885 (= e!134019 true)))

(assert (=> b!204885 (= lt!104015 (+!462 lt!104008 lt!104016))))

(declare-fun lt!104011 () Unit!6216)

(declare-fun addCommutativeForDiffKeys!167 (ListLongMap!2839 (_ BitVec 64) V!6435 (_ BitVec 64) V!6435) Unit!6216)

(assert (=> b!204885 (= lt!104011 (addCommutativeForDiffKeys!167 lt!104012 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204886 () Bool)

(declare-fun res!98841 () Bool)

(assert (=> b!204886 (=> (not res!98841) (not e!134020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204886 (= res!98841 (validKeyInArray!0 k0!843))))

(declare-fun b!204887 () Bool)

(declare-fun res!98837 () Bool)

(assert (=> b!204887 (=> (not res!98837) (not e!134020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9399 (_ BitVec 32)) Bool)

(assert (=> b!204887 (= res!98837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20576 res!98834) b!204879))

(assert (= (and b!204879 res!98838) b!204887))

(assert (= (and b!204887 res!98837) b!204882))

(assert (= (and b!204882 res!98835) b!204880))

(assert (= (and b!204880 res!98839) b!204886))

(assert (= (and b!204886 res!98841) b!204878))

(assert (= (and b!204878 res!98836) b!204876))

(assert (= (and b!204876 (not res!98842)) b!204877))

(assert (= (and b!204877 (not res!98840)) b!204885))

(assert (= (and b!204881 condMapEmpty!8705) mapIsEmpty!8705))

(assert (= (and b!204881 (not condMapEmpty!8705)) mapNonEmpty!8705))

(get-info :version)

(assert (= (and mapNonEmpty!8705 ((_ is ValueCellFull!2202) mapValue!8705)) b!204883))

(assert (= (and b!204881 ((_ is ValueCellFull!2202) mapDefault!8705)) b!204884))

(assert (= start!20576 b!204881))

(declare-fun m!232439 () Bool)

(assert (=> b!204876 m!232439))

(declare-fun m!232441 () Bool)

(assert (=> b!204876 m!232441))

(declare-fun m!232443 () Bool)

(assert (=> b!204876 m!232443))

(declare-fun m!232445 () Bool)

(assert (=> b!204876 m!232445))

(declare-fun m!232447 () Bool)

(assert (=> b!204876 m!232447))

(declare-fun m!232449 () Bool)

(assert (=> b!204876 m!232449))

(declare-fun m!232451 () Bool)

(assert (=> b!204876 m!232451))

(declare-fun m!232453 () Bool)

(assert (=> b!204886 m!232453))

(declare-fun m!232455 () Bool)

(assert (=> mapNonEmpty!8705 m!232455))

(declare-fun m!232457 () Bool)

(assert (=> b!204885 m!232457))

(declare-fun m!232459 () Bool)

(assert (=> b!204885 m!232459))

(declare-fun m!232461 () Bool)

(assert (=> b!204877 m!232461))

(declare-fun m!232463 () Bool)

(assert (=> b!204877 m!232463))

(declare-fun m!232465 () Bool)

(assert (=> b!204877 m!232465))

(declare-fun m!232467 () Bool)

(assert (=> start!20576 m!232467))

(declare-fun m!232469 () Bool)

(assert (=> start!20576 m!232469))

(declare-fun m!232471 () Bool)

(assert (=> start!20576 m!232471))

(declare-fun m!232473 () Bool)

(assert (=> b!204878 m!232473))

(declare-fun m!232475 () Bool)

(assert (=> b!204882 m!232475))

(declare-fun m!232477 () Bool)

(assert (=> b!204887 m!232477))

(check-sat (not b!204886) (not b!204887) (not b!204882) (not b!204885) (not b_next!5235) (not b!204877) tp_is_empty!5091 b_and!11981 (not start!20576) (not mapNonEmpty!8705) (not b!204876))
(check-sat b_and!11981 (not b_next!5235))
