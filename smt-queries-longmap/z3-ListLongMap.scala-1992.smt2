; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34838 () Bool)

(assert start!34838)

(declare-fun b_free!7623 () Bool)

(declare-fun b_next!7623 () Bool)

(assert (=> start!34838 (= b_free!7623 (not b_next!7623))))

(declare-fun tp!26435 () Bool)

(declare-fun b_and!14845 () Bool)

(assert (=> start!34838 (= tp!26435 b_and!14845)))

(declare-fun b!348839 () Bool)

(declare-fun e!213704 () Bool)

(declare-fun tp_is_empty!7575 () Bool)

(assert (=> b!348839 (= e!213704 tp_is_empty!7575)))

(declare-fun b!348840 () Bool)

(declare-fun e!213703 () Bool)

(declare-fun mapRes!12822 () Bool)

(assert (=> b!348840 (= e!213703 (and e!213704 mapRes!12822))))

(declare-fun condMapEmpty!12822 () Bool)

(declare-datatypes ((V!11077 0))(
  ( (V!11078 (val!3832 Int)) )
))
(declare-datatypes ((ValueCell!3444 0))(
  ( (ValueCellFull!3444 (v!6015 V!11077)) (EmptyCell!3444) )
))
(declare-datatypes ((array!18735 0))(
  ( (array!18736 (arr!8877 (Array (_ BitVec 32) ValueCell!3444)) (size!9229 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18735)

(declare-fun mapDefault!12822 () ValueCell!3444)

(assert (=> b!348840 (= condMapEmpty!12822 (= (arr!8877 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3444)) mapDefault!12822)))))

(declare-fun b!348841 () Bool)

(declare-fun res!193306 () Bool)

(declare-fun e!213701 () Bool)

(assert (=> b!348841 (=> (not res!193306) (not e!213701))))

(declare-datatypes ((array!18737 0))(
  ( (array!18738 (arr!8878 (Array (_ BitVec 32) (_ BitVec 64))) (size!9230 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18737)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348841 (= res!193306 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348842 () Bool)

(declare-fun res!193310 () Bool)

(declare-fun e!213700 () Bool)

(assert (=> b!348842 (=> (not res!193310) (not e!213700))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348842 (= res!193310 (and (= (size!9229 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9230 _keys!1895) (size!9229 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348843 () Bool)

(declare-fun res!193311 () Bool)

(assert (=> b!348843 (=> (not res!193311) (not e!213700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348843 (= res!193311 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12822 () Bool)

(declare-fun tp!26436 () Bool)

(declare-fun e!213702 () Bool)

(assert (=> mapNonEmpty!12822 (= mapRes!12822 (and tp!26436 e!213702))))

(declare-fun mapKey!12822 () (_ BitVec 32))

(declare-fun mapRest!12822 () (Array (_ BitVec 32) ValueCell!3444))

(declare-fun mapValue!12822 () ValueCell!3444)

(assert (=> mapNonEmpty!12822 (= (arr!8877 _values!1525) (store mapRest!12822 mapKey!12822 mapValue!12822))))

(declare-fun b!348844 () Bool)

(assert (=> b!348844 (= e!213700 e!213701)))

(declare-fun res!193312 () Bool)

(assert (=> b!348844 (=> (not res!193312) (not e!213701))))

(declare-datatypes ((SeekEntryResult!3422 0))(
  ( (MissingZero!3422 (index!15867 (_ BitVec 32))) (Found!3422 (index!15868 (_ BitVec 32))) (Intermediate!3422 (undefined!4234 Bool) (index!15869 (_ BitVec 32)) (x!34750 (_ BitVec 32))) (Undefined!3422) (MissingVacant!3422 (index!15870 (_ BitVec 32))) )
))
(declare-fun lt!163951 () SeekEntryResult!3422)

(get-info :version)

(assert (=> b!348844 (= res!193312 (and (not ((_ is Found!3422) lt!163951)) ((_ is MissingZero!3422) lt!163951)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18737 (_ BitVec 32)) SeekEntryResult!3422)

(assert (=> b!348844 (= lt!163951 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348845 () Bool)

(declare-fun res!193309 () Bool)

(assert (=> b!348845 (=> (not res!193309) (not e!213700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18737 (_ BitVec 32)) Bool)

(assert (=> b!348845 (= res!193309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348846 () Bool)

(declare-fun res!193308 () Bool)

(assert (=> b!348846 (=> (not res!193308) (not e!213700))))

(declare-fun zeroValue!1467 () V!11077)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11077)

(declare-datatypes ((tuple2!5536 0))(
  ( (tuple2!5537 (_1!2779 (_ BitVec 64)) (_2!2779 V!11077)) )
))
(declare-datatypes ((List!5159 0))(
  ( (Nil!5156) (Cons!5155 (h!6011 tuple2!5536) (t!10289 List!5159)) )
))
(declare-datatypes ((ListLongMap!4449 0))(
  ( (ListLongMap!4450 (toList!2240 List!5159)) )
))
(declare-fun contains!2305 (ListLongMap!4449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1761 (array!18737 array!18735 (_ BitVec 32) (_ BitVec 32) V!11077 V!11077 (_ BitVec 32) Int) ListLongMap!4449)

(assert (=> b!348846 (= res!193308 (not (contains!2305 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348848 () Bool)

(assert (=> b!348848 (= e!213701 false)))

(declare-fun lt!163950 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18737 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348848 (= lt!163950 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348849 () Bool)

(declare-fun res!193307 () Bool)

(assert (=> b!348849 (=> (not res!193307) (not e!213700))))

(declare-datatypes ((List!5160 0))(
  ( (Nil!5157) (Cons!5156 (h!6012 (_ BitVec 64)) (t!10290 List!5160)) )
))
(declare-fun arrayNoDuplicates!0 (array!18737 (_ BitVec 32) List!5160) Bool)

(assert (=> b!348849 (= res!193307 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5157))))

(declare-fun mapIsEmpty!12822 () Bool)

(assert (=> mapIsEmpty!12822 mapRes!12822))

(declare-fun res!193305 () Bool)

(assert (=> start!34838 (=> (not res!193305) (not e!213700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34838 (= res!193305 (validMask!0 mask!2385))))

(assert (=> start!34838 e!213700))

(assert (=> start!34838 true))

(assert (=> start!34838 tp_is_empty!7575))

(assert (=> start!34838 tp!26435))

(declare-fun array_inv!6566 (array!18735) Bool)

(assert (=> start!34838 (and (array_inv!6566 _values!1525) e!213703)))

(declare-fun array_inv!6567 (array!18737) Bool)

(assert (=> start!34838 (array_inv!6567 _keys!1895)))

(declare-fun b!348847 () Bool)

(assert (=> b!348847 (= e!213702 tp_is_empty!7575)))

(assert (= (and start!34838 res!193305) b!348842))

(assert (= (and b!348842 res!193310) b!348845))

(assert (= (and b!348845 res!193309) b!348849))

(assert (= (and b!348849 res!193307) b!348843))

(assert (= (and b!348843 res!193311) b!348846))

(assert (= (and b!348846 res!193308) b!348844))

(assert (= (and b!348844 res!193312) b!348841))

(assert (= (and b!348841 res!193306) b!348848))

(assert (= (and b!348840 condMapEmpty!12822) mapIsEmpty!12822))

(assert (= (and b!348840 (not condMapEmpty!12822)) mapNonEmpty!12822))

(assert (= (and mapNonEmpty!12822 ((_ is ValueCellFull!3444) mapValue!12822)) b!348847))

(assert (= (and b!348840 ((_ is ValueCellFull!3444) mapDefault!12822)) b!348839))

(assert (= start!34838 b!348840))

(declare-fun m!349501 () Bool)

(assert (=> start!34838 m!349501))

(declare-fun m!349503 () Bool)

(assert (=> start!34838 m!349503))

(declare-fun m!349505 () Bool)

(assert (=> start!34838 m!349505))

(declare-fun m!349507 () Bool)

(assert (=> b!348841 m!349507))

(declare-fun m!349509 () Bool)

(assert (=> b!348846 m!349509))

(assert (=> b!348846 m!349509))

(declare-fun m!349511 () Bool)

(assert (=> b!348846 m!349511))

(declare-fun m!349513 () Bool)

(assert (=> b!348849 m!349513))

(declare-fun m!349515 () Bool)

(assert (=> b!348848 m!349515))

(declare-fun m!349517 () Bool)

(assert (=> mapNonEmpty!12822 m!349517))

(declare-fun m!349519 () Bool)

(assert (=> b!348844 m!349519))

(declare-fun m!349521 () Bool)

(assert (=> b!348843 m!349521))

(declare-fun m!349523 () Bool)

(assert (=> b!348845 m!349523))

(check-sat (not b!348848) (not b!348844) (not b!348849) (not b_next!7623) tp_is_empty!7575 (not start!34838) (not b!348846) b_and!14845 (not mapNonEmpty!12822) (not b!348845) (not b!348841) (not b!348843))
(check-sat b_and!14845 (not b_next!7623))
