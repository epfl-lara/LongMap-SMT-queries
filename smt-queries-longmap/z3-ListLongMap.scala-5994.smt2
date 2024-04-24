; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77984 () Bool)

(assert start!77984)

(declare-fun b_free!16375 () Bool)

(declare-fun b_next!16375 () Bool)

(assert (=> start!77984 (= b_free!16375 (not b_next!16375))))

(declare-fun tp!57390 () Bool)

(declare-fun b_and!26917 () Bool)

(assert (=> start!77984 (= tp!57390 b_and!26917)))

(declare-fun mapNonEmpty!29905 () Bool)

(declare-fun mapRes!29905 () Bool)

(declare-fun tp!57391 () Bool)

(declare-fun e!509680 () Bool)

(assert (=> mapNonEmpty!29905 (= mapRes!29905 (and tp!57391 e!509680))))

(declare-datatypes ((V!30023 0))(
  ( (V!30024 (val!9447 Int)) )
))
(declare-datatypes ((ValueCell!8915 0))(
  ( (ValueCellFull!8915 (v!11951 V!30023)) (EmptyCell!8915) )
))
(declare-datatypes ((array!53663 0))(
  ( (array!53664 (arr!25785 (Array (_ BitVec 32) ValueCell!8915)) (size!26245 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53663)

(declare-fun mapRest!29905 () (Array (_ BitVec 32) ValueCell!8915))

(declare-fun mapKey!29905 () (_ BitVec 32))

(declare-fun mapValue!29905 () ValueCell!8915)

(assert (=> mapNonEmpty!29905 (= (arr!25785 _values!1152) (store mapRest!29905 mapKey!29905 mapValue!29905))))

(declare-fun res!613422 () Bool)

(declare-fun e!509684 () Bool)

(assert (=> start!77984 (=> (not res!613422) (not e!509684))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77984 (= res!613422 (validMask!0 mask!1756))))

(assert (=> start!77984 e!509684))

(declare-fun e!509678 () Bool)

(declare-fun array_inv!20248 (array!53663) Bool)

(assert (=> start!77984 (and (array_inv!20248 _values!1152) e!509678)))

(assert (=> start!77984 tp!57390))

(assert (=> start!77984 true))

(declare-fun tp_is_empty!18793 () Bool)

(assert (=> start!77984 tp_is_empty!18793))

(declare-datatypes ((array!53665 0))(
  ( (array!53666 (arr!25786 (Array (_ BitVec 32) (_ BitVec 64))) (size!26246 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53665)

(declare-fun array_inv!20249 (array!53665) Bool)

(assert (=> start!77984 (array_inv!20249 _keys!1386)))

(declare-fun mapIsEmpty!29905 () Bool)

(assert (=> mapIsEmpty!29905 mapRes!29905))

(declare-fun b!909253 () Bool)

(declare-fun e!509679 () Bool)

(declare-fun e!509683 () Bool)

(assert (=> b!909253 (= e!509679 (not e!509683))))

(declare-fun res!613419 () Bool)

(assert (=> b!909253 (=> res!613419 e!509683)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!909253 (= res!613419 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26246 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410043 () V!30023)

(declare-fun get!13583 (ValueCell!8915 V!30023) V!30023)

(declare-fun dynLambda!1390 (Int (_ BitVec 64)) V!30023)

(assert (=> b!909253 (= lt!410043 (get!13583 (select (arr!25785 _values!1152) i!717) (dynLambda!1390 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909253 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30023)

(declare-datatypes ((Unit!30820 0))(
  ( (Unit!30821) )
))
(declare-fun lt!410044 () Unit!30820)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30023)

(declare-fun lemmaKeyInListMapIsInArray!249 (array!53665 array!53663 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 64) Int) Unit!30820)

(assert (=> b!909253 (= lt!410044 (lemmaKeyInListMapIsInArray!249 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!909254 () Bool)

(declare-fun res!613426 () Bool)

(assert (=> b!909254 (=> (not res!613426) (not e!509679))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909254 (= res!613426 (inRange!0 i!717 mask!1756))))

(declare-fun b!909255 () Bool)

(declare-fun res!613418 () Bool)

(declare-fun e!509681 () Bool)

(assert (=> b!909255 (=> res!613418 e!509681)))

(declare-datatypes ((tuple2!12250 0))(
  ( (tuple2!12251 (_1!6136 (_ BitVec 64)) (_2!6136 V!30023)) )
))
(declare-datatypes ((List!18076 0))(
  ( (Nil!18073) (Cons!18072 (h!19224 tuple2!12250) (t!25615 List!18076)) )
))
(declare-datatypes ((ListLongMap!10949 0))(
  ( (ListLongMap!10950 (toList!5490 List!18076)) )
))
(declare-fun lt!410045 () ListLongMap!10949)

(declare-fun apply!506 (ListLongMap!10949 (_ BitVec 64)) V!30023)

(assert (=> b!909255 (= res!613418 (not (= (apply!506 lt!410045 k0!1033) lt!410043)))))

(declare-fun b!909256 () Bool)

(declare-fun res!613424 () Bool)

(assert (=> b!909256 (=> (not res!613424) (not e!509684))))

(declare-datatypes ((List!18077 0))(
  ( (Nil!18074) (Cons!18073 (h!19225 (_ BitVec 64)) (t!25616 List!18077)) )
))
(declare-fun arrayNoDuplicates!0 (array!53665 (_ BitVec 32) List!18077) Bool)

(assert (=> b!909256 (= res!613424 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18074))))

(declare-fun b!909257 () Bool)

(assert (=> b!909257 (= e!509681 true)))

(declare-fun lt!410046 () ListLongMap!10949)

(assert (=> b!909257 (= (apply!506 lt!410046 k0!1033) lt!410043)))

(declare-fun lt!410042 () Unit!30820)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!52 (array!53665 array!53663 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 64) V!30023 (_ BitVec 32) Int) Unit!30820)

(assert (=> b!909257 (= lt!410042 (lemmaListMapApplyFromThenApplyFromZero!52 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410043 i!717 defaultEntry!1160))))

(declare-fun b!909258 () Bool)

(declare-fun e!509685 () Bool)

(assert (=> b!909258 (= e!509685 tp_is_empty!18793)))

(declare-fun b!909259 () Bool)

(assert (=> b!909259 (= e!509684 e!509679)))

(declare-fun res!613425 () Bool)

(assert (=> b!909259 (=> (not res!613425) (not e!509679))))

(declare-fun contains!4542 (ListLongMap!10949 (_ BitVec 64)) Bool)

(assert (=> b!909259 (= res!613425 (contains!4542 lt!410046 k0!1033))))

(declare-fun getCurrentListMap!2752 (array!53665 array!53663 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 32) Int) ListLongMap!10949)

(assert (=> b!909259 (= lt!410046 (getCurrentListMap!2752 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909260 () Bool)

(declare-fun res!613427 () Bool)

(assert (=> b!909260 (=> (not res!613427) (not e!509684))))

(assert (=> b!909260 (= res!613427 (and (= (size!26245 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26246 _keys!1386) (size!26245 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909261 () Bool)

(assert (=> b!909261 (= e!509678 (and e!509685 mapRes!29905))))

(declare-fun condMapEmpty!29905 () Bool)

(declare-fun mapDefault!29905 () ValueCell!8915)

(assert (=> b!909261 (= condMapEmpty!29905 (= (arr!25785 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8915)) mapDefault!29905)))))

(declare-fun b!909262 () Bool)

(declare-fun res!613421 () Bool)

(assert (=> b!909262 (=> (not res!613421) (not e!509679))))

(assert (=> b!909262 (= res!613421 (and (= (select (arr!25786 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909263 () Bool)

(assert (=> b!909263 (= e!509680 tp_is_empty!18793)))

(declare-fun b!909264 () Bool)

(declare-fun res!613420 () Bool)

(assert (=> b!909264 (=> (not res!613420) (not e!509684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53665 (_ BitVec 32)) Bool)

(assert (=> b!909264 (= res!613420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909265 () Bool)

(assert (=> b!909265 (= e!509683 e!509681)))

(declare-fun res!613423 () Bool)

(assert (=> b!909265 (=> res!613423 e!509681)))

(assert (=> b!909265 (= res!613423 (not (contains!4542 lt!410045 k0!1033)))))

(assert (=> b!909265 (= lt!410045 (getCurrentListMap!2752 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77984 res!613422) b!909260))

(assert (= (and b!909260 res!613427) b!909264))

(assert (= (and b!909264 res!613420) b!909256))

(assert (= (and b!909256 res!613424) b!909259))

(assert (= (and b!909259 res!613425) b!909254))

(assert (= (and b!909254 res!613426) b!909262))

(assert (= (and b!909262 res!613421) b!909253))

(assert (= (and b!909253 (not res!613419)) b!909265))

(assert (= (and b!909265 (not res!613423)) b!909255))

(assert (= (and b!909255 (not res!613418)) b!909257))

(assert (= (and b!909261 condMapEmpty!29905) mapIsEmpty!29905))

(assert (= (and b!909261 (not condMapEmpty!29905)) mapNonEmpty!29905))

(get-info :version)

(assert (= (and mapNonEmpty!29905 ((_ is ValueCellFull!8915) mapValue!29905)) b!909263))

(assert (= (and b!909261 ((_ is ValueCellFull!8915) mapDefault!29905)) b!909258))

(assert (= start!77984 b!909261))

(declare-fun b_lambda!13273 () Bool)

(assert (=> (not b_lambda!13273) (not b!909253)))

(declare-fun t!25614 () Bool)

(declare-fun tb!5389 () Bool)

(assert (=> (and start!77984 (= defaultEntry!1160 defaultEntry!1160) t!25614) tb!5389))

(declare-fun result!10583 () Bool)

(assert (=> tb!5389 (= result!10583 tp_is_empty!18793)))

(assert (=> b!909253 t!25614))

(declare-fun b_and!26919 () Bool)

(assert (= b_and!26917 (and (=> t!25614 result!10583) b_and!26919)))

(declare-fun m!844983 () Bool)

(assert (=> mapNonEmpty!29905 m!844983))

(declare-fun m!844985 () Bool)

(assert (=> b!909265 m!844985))

(declare-fun m!844987 () Bool)

(assert (=> b!909265 m!844987))

(declare-fun m!844989 () Bool)

(assert (=> b!909256 m!844989))

(declare-fun m!844991 () Bool)

(assert (=> b!909262 m!844991))

(declare-fun m!844993 () Bool)

(assert (=> b!909259 m!844993))

(declare-fun m!844995 () Bool)

(assert (=> b!909259 m!844995))

(declare-fun m!844997 () Bool)

(assert (=> b!909254 m!844997))

(declare-fun m!844999 () Bool)

(assert (=> b!909257 m!844999))

(declare-fun m!845001 () Bool)

(assert (=> b!909257 m!845001))

(declare-fun m!845003 () Bool)

(assert (=> b!909253 m!845003))

(declare-fun m!845005 () Bool)

(assert (=> b!909253 m!845005))

(declare-fun m!845007 () Bool)

(assert (=> b!909253 m!845007))

(declare-fun m!845009 () Bool)

(assert (=> b!909253 m!845009))

(assert (=> b!909253 m!845003))

(assert (=> b!909253 m!845007))

(declare-fun m!845011 () Bool)

(assert (=> b!909253 m!845011))

(declare-fun m!845013 () Bool)

(assert (=> start!77984 m!845013))

(declare-fun m!845015 () Bool)

(assert (=> start!77984 m!845015))

(declare-fun m!845017 () Bool)

(assert (=> start!77984 m!845017))

(declare-fun m!845019 () Bool)

(assert (=> b!909264 m!845019))

(declare-fun m!845021 () Bool)

(assert (=> b!909255 m!845021))

(check-sat (not b_next!16375) (not b!909259) b_and!26919 (not b!909255) (not b!909254) (not mapNonEmpty!29905) tp_is_empty!18793 (not b!909264) (not b!909265) (not b!909253) (not start!77984) (not b_lambda!13273) (not b!909257) (not b!909256))
(check-sat b_and!26919 (not b_next!16375))
