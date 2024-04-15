; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20488 () Bool)

(assert start!20488)

(declare-fun b_free!5143 () Bool)

(declare-fun b_next!5143 () Bool)

(assert (=> start!20488 (= b_free!5143 (not b_next!5143))))

(declare-fun tp!18461 () Bool)

(declare-fun b_and!11863 () Bool)

(assert (=> start!20488 (= tp!18461 b_and!11863)))

(declare-fun b!203064 () Bool)

(declare-fun e!132953 () Bool)

(declare-fun e!132949 () Bool)

(assert (=> b!203064 (= e!132953 e!132949)))

(declare-fun res!97491 () Bool)

(assert (=> b!203064 (=> res!97491 e!132949)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203064 (= res!97491 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6313 0))(
  ( (V!6314 (val!2544 Int)) )
))
(declare-datatypes ((tuple2!3836 0))(
  ( (tuple2!3837 (_1!1929 (_ BitVec 64)) (_2!1929 V!6313)) )
))
(declare-datatypes ((List!2748 0))(
  ( (Nil!2745) (Cons!2744 (h!3386 tuple2!3836) (t!7670 List!2748)) )
))
(declare-datatypes ((ListLongMap!2739 0))(
  ( (ListLongMap!2740 (toList!1385 List!2748)) )
))
(declare-fun lt!102215 () ListLongMap!2739)

(declare-fun lt!102211 () ListLongMap!2739)

(assert (=> b!203064 (= lt!102215 lt!102211)))

(declare-fun lt!102208 () ListLongMap!2739)

(declare-fun lt!102207 () tuple2!3836)

(declare-fun +!434 (ListLongMap!2739 tuple2!3836) ListLongMap!2739)

(assert (=> b!203064 (= lt!102211 (+!434 lt!102208 lt!102207))))

(declare-fun lt!102212 () ListLongMap!2739)

(declare-fun lt!102213 () ListLongMap!2739)

(assert (=> b!203064 (= lt!102212 lt!102213)))

(declare-fun lt!102216 () ListLongMap!2739)

(assert (=> b!203064 (= lt!102213 (+!434 lt!102216 lt!102207))))

(declare-fun lt!102218 () ListLongMap!2739)

(assert (=> b!203064 (= lt!102215 (+!434 lt!102218 lt!102207))))

(declare-fun zeroValue!615 () V!6313)

(assert (=> b!203064 (= lt!102207 (tuple2!3837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203065 () Bool)

(declare-fun e!132951 () Bool)

(assert (=> b!203065 (= e!132951 (not e!132953))))

(declare-fun res!97495 () Bool)

(assert (=> b!203065 (=> res!97495 e!132953)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203065 (= res!97495 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2156 0))(
  ( (ValueCellFull!2156 (v!4508 V!6313)) (EmptyCell!2156) )
))
(declare-datatypes ((array!9209 0))(
  ( (array!9210 (arr!4354 (Array (_ BitVec 32) ValueCell!2156)) (size!4680 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9209)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9211 0))(
  ( (array!9212 (arr!4355 (Array (_ BitVec 32) (_ BitVec 64))) (size!4681 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9211)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6313)

(declare-fun getCurrentListMap!938 (array!9211 array!9209 (_ BitVec 32) (_ BitVec 32) V!6313 V!6313 (_ BitVec 32) Int) ListLongMap!2739)

(assert (=> b!203065 (= lt!102212 (getCurrentListMap!938 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102217 () array!9209)

(assert (=> b!203065 (= lt!102215 (getCurrentListMap!938 _keys!825 lt!102217 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203065 (and (= lt!102218 lt!102208) (= lt!102208 lt!102218))))

(declare-fun lt!102214 () tuple2!3836)

(assert (=> b!203065 (= lt!102208 (+!434 lt!102216 lt!102214))))

(declare-fun v!520 () V!6313)

(assert (=> b!203065 (= lt!102214 (tuple2!3837 k0!843 v!520))))

(declare-datatypes ((Unit!6118 0))(
  ( (Unit!6119) )
))
(declare-fun lt!102209 () Unit!6118)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!97 (array!9211 array!9209 (_ BitVec 32) (_ BitVec 32) V!6313 V!6313 (_ BitVec 32) (_ BitVec 64) V!6313 (_ BitVec 32) Int) Unit!6118)

(assert (=> b!203065 (= lt!102209 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!97 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!348 (array!9211 array!9209 (_ BitVec 32) (_ BitVec 32) V!6313 V!6313 (_ BitVec 32) Int) ListLongMap!2739)

(assert (=> b!203065 (= lt!102218 (getCurrentListMapNoExtraKeys!348 _keys!825 lt!102217 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203065 (= lt!102217 (array!9210 (store (arr!4354 _values!649) i!601 (ValueCellFull!2156 v!520)) (size!4680 _values!649)))))

(assert (=> b!203065 (= lt!102216 (getCurrentListMapNoExtraKeys!348 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203066 () Bool)

(declare-fun res!97496 () Bool)

(assert (=> b!203066 (=> (not res!97496) (not e!132951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9211 (_ BitVec 32)) Bool)

(assert (=> b!203066 (= res!97496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203067 () Bool)

(declare-fun res!97490 () Bool)

(assert (=> b!203067 (=> (not res!97490) (not e!132951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203067 (= res!97490 (validKeyInArray!0 k0!843))))

(declare-fun b!203068 () Bool)

(declare-fun e!132954 () Bool)

(declare-fun tp_is_empty!4999 () Bool)

(assert (=> b!203068 (= e!132954 tp_is_empty!4999)))

(declare-fun mapIsEmpty!8567 () Bool)

(declare-fun mapRes!8567 () Bool)

(assert (=> mapIsEmpty!8567 mapRes!8567))

(declare-fun mapNonEmpty!8567 () Bool)

(declare-fun tp!18460 () Bool)

(declare-fun e!132952 () Bool)

(assert (=> mapNonEmpty!8567 (= mapRes!8567 (and tp!18460 e!132952))))

(declare-fun mapRest!8567 () (Array (_ BitVec 32) ValueCell!2156))

(declare-fun mapValue!8567 () ValueCell!2156)

(declare-fun mapKey!8567 () (_ BitVec 32))

(assert (=> mapNonEmpty!8567 (= (arr!4354 _values!649) (store mapRest!8567 mapKey!8567 mapValue!8567))))

(declare-fun b!203069 () Bool)

(assert (=> b!203069 (= e!132949 true)))

(assert (=> b!203069 (= lt!102211 (+!434 lt!102213 lt!102214))))

(declare-fun lt!102210 () Unit!6118)

(declare-fun addCommutativeForDiffKeys!134 (ListLongMap!2739 (_ BitVec 64) V!6313 (_ BitVec 64) V!6313) Unit!6118)

(assert (=> b!203069 (= lt!102210 (addCommutativeForDiffKeys!134 lt!102216 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203070 () Bool)

(declare-fun res!97492 () Bool)

(assert (=> b!203070 (=> (not res!97492) (not e!132951))))

(assert (=> b!203070 (= res!97492 (= (select (arr!4355 _keys!825) i!601) k0!843))))

(declare-fun res!97494 () Bool)

(assert (=> start!20488 (=> (not res!97494) (not e!132951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20488 (= res!97494 (validMask!0 mask!1149))))

(assert (=> start!20488 e!132951))

(declare-fun e!132948 () Bool)

(declare-fun array_inv!2855 (array!9209) Bool)

(assert (=> start!20488 (and (array_inv!2855 _values!649) e!132948)))

(assert (=> start!20488 true))

(assert (=> start!20488 tp_is_empty!4999))

(declare-fun array_inv!2856 (array!9211) Bool)

(assert (=> start!20488 (array_inv!2856 _keys!825)))

(assert (=> start!20488 tp!18461))

(declare-fun b!203071 () Bool)

(declare-fun res!97493 () Bool)

(assert (=> b!203071 (=> (not res!97493) (not e!132951))))

(assert (=> b!203071 (= res!97493 (and (= (size!4680 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4681 _keys!825) (size!4680 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203072 () Bool)

(declare-fun res!97488 () Bool)

(assert (=> b!203072 (=> (not res!97488) (not e!132951))))

(assert (=> b!203072 (= res!97488 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4681 _keys!825))))))

(declare-fun b!203073 () Bool)

(assert (=> b!203073 (= e!132952 tp_is_empty!4999)))

(declare-fun b!203074 () Bool)

(assert (=> b!203074 (= e!132948 (and e!132954 mapRes!8567))))

(declare-fun condMapEmpty!8567 () Bool)

(declare-fun mapDefault!8567 () ValueCell!2156)

(assert (=> b!203074 (= condMapEmpty!8567 (= (arr!4354 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2156)) mapDefault!8567)))))

(declare-fun b!203075 () Bool)

(declare-fun res!97489 () Bool)

(assert (=> b!203075 (=> (not res!97489) (not e!132951))))

(declare-datatypes ((List!2749 0))(
  ( (Nil!2746) (Cons!2745 (h!3387 (_ BitVec 64)) (t!7671 List!2749)) )
))
(declare-fun arrayNoDuplicates!0 (array!9211 (_ BitVec 32) List!2749) Bool)

(assert (=> b!203075 (= res!97489 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2746))))

(assert (= (and start!20488 res!97494) b!203071))

(assert (= (and b!203071 res!97493) b!203066))

(assert (= (and b!203066 res!97496) b!203075))

(assert (= (and b!203075 res!97489) b!203072))

(assert (= (and b!203072 res!97488) b!203067))

(assert (= (and b!203067 res!97490) b!203070))

(assert (= (and b!203070 res!97492) b!203065))

(assert (= (and b!203065 (not res!97495)) b!203064))

(assert (= (and b!203064 (not res!97491)) b!203069))

(assert (= (and b!203074 condMapEmpty!8567) mapIsEmpty!8567))

(assert (= (and b!203074 (not condMapEmpty!8567)) mapNonEmpty!8567))

(get-info :version)

(assert (= (and mapNonEmpty!8567 ((_ is ValueCellFull!2156) mapValue!8567)) b!203073))

(assert (= (and b!203074 ((_ is ValueCellFull!2156) mapDefault!8567)) b!203068))

(assert (= start!20488 b!203074))

(declare-fun m!229995 () Bool)

(assert (=> b!203065 m!229995))

(declare-fun m!229997 () Bool)

(assert (=> b!203065 m!229997))

(declare-fun m!229999 () Bool)

(assert (=> b!203065 m!229999))

(declare-fun m!230001 () Bool)

(assert (=> b!203065 m!230001))

(declare-fun m!230003 () Bool)

(assert (=> b!203065 m!230003))

(declare-fun m!230005 () Bool)

(assert (=> b!203065 m!230005))

(declare-fun m!230007 () Bool)

(assert (=> b!203065 m!230007))

(declare-fun m!230009 () Bool)

(assert (=> b!203064 m!230009))

(declare-fun m!230011 () Bool)

(assert (=> b!203064 m!230011))

(declare-fun m!230013 () Bool)

(assert (=> b!203064 m!230013))

(declare-fun m!230015 () Bool)

(assert (=> b!203070 m!230015))

(declare-fun m!230017 () Bool)

(assert (=> b!203067 m!230017))

(declare-fun m!230019 () Bool)

(assert (=> b!203069 m!230019))

(declare-fun m!230021 () Bool)

(assert (=> b!203069 m!230021))

(declare-fun m!230023 () Bool)

(assert (=> start!20488 m!230023))

(declare-fun m!230025 () Bool)

(assert (=> start!20488 m!230025))

(declare-fun m!230027 () Bool)

(assert (=> start!20488 m!230027))

(declare-fun m!230029 () Bool)

(assert (=> mapNonEmpty!8567 m!230029))

(declare-fun m!230031 () Bool)

(assert (=> b!203066 m!230031))

(declare-fun m!230033 () Bool)

(assert (=> b!203075 m!230033))

(check-sat (not b!203067) (not b!203075) (not b!203066) tp_is_empty!4999 (not start!20488) (not b!203065) (not b!203064) b_and!11863 (not b!203069) (not b_next!5143) (not mapNonEmpty!8567))
(check-sat b_and!11863 (not b_next!5143))
