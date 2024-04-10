; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77806 () Bool)

(assert start!77806)

(declare-fun b_free!16365 () Bool)

(declare-fun b_next!16365 () Bool)

(assert (=> start!77806 (= b_free!16365 (not b_next!16365))))

(declare-fun tp!57359 () Bool)

(declare-fun b_and!26887 () Bool)

(assert (=> start!77806 (= tp!57359 b_and!26887)))

(declare-fun b!908145 () Bool)

(declare-fun res!612927 () Bool)

(declare-fun e!508981 () Bool)

(assert (=> b!908145 (=> (not res!612927) (not e!508981))))

(declare-datatypes ((V!30009 0))(
  ( (V!30010 (val!9442 Int)) )
))
(declare-datatypes ((ValueCell!8910 0))(
  ( (ValueCellFull!8910 (v!11949 V!30009)) (EmptyCell!8910) )
))
(declare-datatypes ((array!53600 0))(
  ( (array!53601 (arr!25758 (Array (_ BitVec 32) ValueCell!8910)) (size!26217 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53600)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53602 0))(
  ( (array!53603 (arr!25759 (Array (_ BitVec 32) (_ BitVec 64))) (size!26218 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53602)

(assert (=> b!908145 (= res!612927 (and (= (size!26217 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26218 _keys!1386) (size!26217 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908146 () Bool)

(declare-fun e!508980 () Bool)

(assert (=> b!908146 (= e!508981 e!508980)))

(declare-fun res!612929 () Bool)

(assert (=> b!908146 (=> (not res!612929) (not e!508980))))

(declare-datatypes ((tuple2!12300 0))(
  ( (tuple2!12301 (_1!6161 (_ BitVec 64)) (_2!6161 V!30009)) )
))
(declare-datatypes ((List!18098 0))(
  ( (Nil!18095) (Cons!18094 (h!19240 tuple2!12300) (t!25635 List!18098)) )
))
(declare-datatypes ((ListLongMap!10997 0))(
  ( (ListLongMap!10998 (toList!5514 List!18098)) )
))
(declare-fun lt!409608 () ListLongMap!10997)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4557 (ListLongMap!10997 (_ BitVec 64)) Bool)

(assert (=> b!908146 (= res!612929 (contains!4557 lt!409608 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30009)

(declare-fun minValue!1094 () V!30009)

(declare-fun getCurrentListMap!2777 (array!53602 array!53600 (_ BitVec 32) (_ BitVec 32) V!30009 V!30009 (_ BitVec 32) Int) ListLongMap!10997)

(assert (=> b!908146 (= lt!409608 (getCurrentListMap!2777 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun res!612930 () Bool)

(assert (=> start!77806 (=> (not res!612930) (not e!508981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77806 (= res!612930 (validMask!0 mask!1756))))

(assert (=> start!77806 e!508981))

(declare-fun e!508983 () Bool)

(declare-fun array_inv!20168 (array!53600) Bool)

(assert (=> start!77806 (and (array_inv!20168 _values!1152) e!508983)))

(assert (=> start!77806 tp!57359))

(assert (=> start!77806 true))

(declare-fun tp_is_empty!18783 () Bool)

(assert (=> start!77806 tp_is_empty!18783))

(declare-fun array_inv!20169 (array!53602) Bool)

(assert (=> start!77806 (array_inv!20169 _keys!1386)))

(declare-fun b!908147 () Bool)

(declare-fun res!612924 () Bool)

(assert (=> b!908147 (=> (not res!612924) (not e!508981))))

(declare-datatypes ((List!18099 0))(
  ( (Nil!18096) (Cons!18095 (h!19241 (_ BitVec 64)) (t!25636 List!18099)) )
))
(declare-fun arrayNoDuplicates!0 (array!53602 (_ BitVec 32) List!18099) Bool)

(assert (=> b!908147 (= res!612924 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18096))))

(declare-fun b!908148 () Bool)

(declare-fun e!508978 () Bool)

(assert (=> b!908148 (= e!508978 true)))

(declare-fun lt!409606 () V!30009)

(declare-fun apply!498 (ListLongMap!10997 (_ BitVec 64)) V!30009)

(assert (=> b!908148 (= (apply!498 lt!409608 k0!1033) lt!409606)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30824 0))(
  ( (Unit!30825) )
))
(declare-fun lt!409610 () Unit!30824)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!50 (array!53602 array!53600 (_ BitVec 32) (_ BitVec 32) V!30009 V!30009 (_ BitVec 64) V!30009 (_ BitVec 32) Int) Unit!30824)

(assert (=> b!908148 (= lt!409610 (lemmaListMapApplyFromThenApplyFromZero!50 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409606 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29890 () Bool)

(declare-fun mapRes!29890 () Bool)

(assert (=> mapIsEmpty!29890 mapRes!29890))

(declare-fun b!908149 () Bool)

(declare-fun res!612926 () Bool)

(assert (=> b!908149 (=> res!612926 e!508978)))

(declare-fun lt!409607 () ListLongMap!10997)

(assert (=> b!908149 (= res!612926 (not (= (apply!498 lt!409607 k0!1033) lt!409606)))))

(declare-fun b!908150 () Bool)

(declare-fun e!508976 () Bool)

(assert (=> b!908150 (= e!508976 tp_is_empty!18783)))

(declare-fun b!908151 () Bool)

(declare-fun res!612933 () Bool)

(assert (=> b!908151 (=> (not res!612933) (not e!508981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53602 (_ BitVec 32)) Bool)

(assert (=> b!908151 (= res!612933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29890 () Bool)

(declare-fun tp!57360 () Bool)

(declare-fun e!508979 () Bool)

(assert (=> mapNonEmpty!29890 (= mapRes!29890 (and tp!57360 e!508979))))

(declare-fun mapKey!29890 () (_ BitVec 32))

(declare-fun mapRest!29890 () (Array (_ BitVec 32) ValueCell!8910))

(declare-fun mapValue!29890 () ValueCell!8910)

(assert (=> mapNonEmpty!29890 (= (arr!25758 _values!1152) (store mapRest!29890 mapKey!29890 mapValue!29890))))

(declare-fun b!908152 () Bool)

(declare-fun e!508977 () Bool)

(assert (=> b!908152 (= e!508980 (not e!508977))))

(declare-fun res!612932 () Bool)

(assert (=> b!908152 (=> res!612932 e!508977)))

(assert (=> b!908152 (= res!612932 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26218 _keys!1386))))))

(declare-fun get!13558 (ValueCell!8910 V!30009) V!30009)

(declare-fun dynLambda!1373 (Int (_ BitVec 64)) V!30009)

(assert (=> b!908152 (= lt!409606 (get!13558 (select (arr!25758 _values!1152) i!717) (dynLambda!1373 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908152 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409609 () Unit!30824)

(declare-fun lemmaKeyInListMapIsInArray!245 (array!53602 array!53600 (_ BitVec 32) (_ BitVec 32) V!30009 V!30009 (_ BitVec 64) Int) Unit!30824)

(assert (=> b!908152 (= lt!409609 (lemmaKeyInListMapIsInArray!245 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908153 () Bool)

(assert (=> b!908153 (= e!508983 (and e!508976 mapRes!29890))))

(declare-fun condMapEmpty!29890 () Bool)

(declare-fun mapDefault!29890 () ValueCell!8910)

(assert (=> b!908153 (= condMapEmpty!29890 (= (arr!25758 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8910)) mapDefault!29890)))))

(declare-fun b!908154 () Bool)

(declare-fun res!612928 () Bool)

(assert (=> b!908154 (=> (not res!612928) (not e!508980))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908154 (= res!612928 (inRange!0 i!717 mask!1756))))

(declare-fun b!908155 () Bool)

(assert (=> b!908155 (= e!508979 tp_is_empty!18783)))

(declare-fun b!908156 () Bool)

(assert (=> b!908156 (= e!508977 e!508978)))

(declare-fun res!612931 () Bool)

(assert (=> b!908156 (=> res!612931 e!508978)))

(assert (=> b!908156 (= res!612931 (not (contains!4557 lt!409607 k0!1033)))))

(assert (=> b!908156 (= lt!409607 (getCurrentListMap!2777 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908157 () Bool)

(declare-fun res!612925 () Bool)

(assert (=> b!908157 (=> (not res!612925) (not e!508980))))

(assert (=> b!908157 (= res!612925 (and (= (select (arr!25759 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77806 res!612930) b!908145))

(assert (= (and b!908145 res!612927) b!908151))

(assert (= (and b!908151 res!612933) b!908147))

(assert (= (and b!908147 res!612924) b!908146))

(assert (= (and b!908146 res!612929) b!908154))

(assert (= (and b!908154 res!612928) b!908157))

(assert (= (and b!908157 res!612925) b!908152))

(assert (= (and b!908152 (not res!612932)) b!908156))

(assert (= (and b!908156 (not res!612931)) b!908149))

(assert (= (and b!908149 (not res!612926)) b!908148))

(assert (= (and b!908153 condMapEmpty!29890) mapIsEmpty!29890))

(assert (= (and b!908153 (not condMapEmpty!29890)) mapNonEmpty!29890))

(get-info :version)

(assert (= (and mapNonEmpty!29890 ((_ is ValueCellFull!8910) mapValue!29890)) b!908155))

(assert (= (and b!908153 ((_ is ValueCellFull!8910) mapDefault!29890)) b!908150))

(assert (= start!77806 b!908153))

(declare-fun b_lambda!13249 () Bool)

(assert (=> (not b_lambda!13249) (not b!908152)))

(declare-fun t!25634 () Bool)

(declare-fun tb!5387 () Bool)

(assert (=> (and start!77806 (= defaultEntry!1160 defaultEntry!1160) t!25634) tb!5387))

(declare-fun result!10571 () Bool)

(assert (=> tb!5387 (= result!10571 tp_is_empty!18783)))

(assert (=> b!908152 t!25634))

(declare-fun b_and!26889 () Bool)

(assert (= b_and!26887 (and (=> t!25634 result!10571) b_and!26889)))

(declare-fun m!843489 () Bool)

(assert (=> b!908156 m!843489))

(declare-fun m!843491 () Bool)

(assert (=> b!908156 m!843491))

(declare-fun m!843493 () Bool)

(assert (=> b!908147 m!843493))

(declare-fun m!843495 () Bool)

(assert (=> b!908148 m!843495))

(declare-fun m!843497 () Bool)

(assert (=> b!908148 m!843497))

(declare-fun m!843499 () Bool)

(assert (=> b!908151 m!843499))

(declare-fun m!843501 () Bool)

(assert (=> mapNonEmpty!29890 m!843501))

(declare-fun m!843503 () Bool)

(assert (=> b!908149 m!843503))

(declare-fun m!843505 () Bool)

(assert (=> b!908154 m!843505))

(declare-fun m!843507 () Bool)

(assert (=> b!908146 m!843507))

(declare-fun m!843509 () Bool)

(assert (=> b!908146 m!843509))

(declare-fun m!843511 () Bool)

(assert (=> b!908157 m!843511))

(declare-fun m!843513 () Bool)

(assert (=> b!908152 m!843513))

(declare-fun m!843515 () Bool)

(assert (=> b!908152 m!843515))

(declare-fun m!843517 () Bool)

(assert (=> b!908152 m!843517))

(declare-fun m!843519 () Bool)

(assert (=> b!908152 m!843519))

(assert (=> b!908152 m!843513))

(assert (=> b!908152 m!843517))

(declare-fun m!843521 () Bool)

(assert (=> b!908152 m!843521))

(declare-fun m!843523 () Bool)

(assert (=> start!77806 m!843523))

(declare-fun m!843525 () Bool)

(assert (=> start!77806 m!843525))

(declare-fun m!843527 () Bool)

(assert (=> start!77806 m!843527))

(check-sat (not b!908148) (not b!908151) (not b!908149) (not b_next!16365) (not b!908147) (not mapNonEmpty!29890) (not start!77806) (not b!908156) (not b_lambda!13249) b_and!26889 tp_is_empty!18783 (not b!908154) (not b!908146) (not b!908152))
(check-sat b_and!26889 (not b_next!16365))
