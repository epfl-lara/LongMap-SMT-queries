; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35006 () Bool)

(assert start!35006)

(declare-fun b_free!7695 () Bool)

(declare-fun b_next!7695 () Bool)

(assert (=> start!35006 (= b_free!7695 (not b_next!7695))))

(declare-fun tp!26664 () Bool)

(declare-fun b_and!14925 () Bool)

(assert (=> start!35006 (= tp!26664 b_and!14925)))

(declare-fun b!350711 () Bool)

(declare-fun e!214808 () Bool)

(declare-fun e!214812 () Bool)

(declare-fun mapRes!12942 () Bool)

(assert (=> b!350711 (= e!214808 (and e!214812 mapRes!12942))))

(declare-fun condMapEmpty!12942 () Bool)

(declare-datatypes ((V!11173 0))(
  ( (V!11174 (val!3868 Int)) )
))
(declare-datatypes ((ValueCell!3480 0))(
  ( (ValueCellFull!3480 (v!6055 V!11173)) (EmptyCell!3480) )
))
(declare-datatypes ((array!18881 0))(
  ( (array!18882 (arr!8946 (Array (_ BitVec 32) ValueCell!3480)) (size!9298 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18881)

(declare-fun mapDefault!12942 () ValueCell!3480)

(assert (=> b!350711 (= condMapEmpty!12942 (= (arr!8946 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3480)) mapDefault!12942)))))

(declare-fun res!194396 () Bool)

(declare-fun e!214813 () Bool)

(assert (=> start!35006 (=> (not res!194396) (not e!214813))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35006 (= res!194396 (validMask!0 mask!2385))))

(assert (=> start!35006 e!214813))

(assert (=> start!35006 true))

(declare-fun tp_is_empty!7647 () Bool)

(assert (=> start!35006 tp_is_empty!7647))

(assert (=> start!35006 tp!26664))

(declare-fun array_inv!6604 (array!18881) Bool)

(assert (=> start!35006 (and (array_inv!6604 _values!1525) e!214808)))

(declare-datatypes ((array!18883 0))(
  ( (array!18884 (arr!8947 (Array (_ BitVec 32) (_ BitVec 64))) (size!9299 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18883)

(declare-fun array_inv!6605 (array!18883) Bool)

(assert (=> start!35006 (array_inv!6605 _keys!1895)))

(declare-fun b!350712 () Bool)

(declare-fun res!194395 () Bool)

(assert (=> b!350712 (=> (not res!194395) (not e!214813))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11173)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11173)

(declare-datatypes ((tuple2!5582 0))(
  ( (tuple2!5583 (_1!2802 (_ BitVec 64)) (_2!2802 V!11173)) )
))
(declare-datatypes ((List!5204 0))(
  ( (Nil!5201) (Cons!5200 (h!6056 tuple2!5582) (t!10342 List!5204)) )
))
(declare-datatypes ((ListLongMap!4495 0))(
  ( (ListLongMap!4496 (toList!2263 List!5204)) )
))
(declare-fun contains!2332 (ListLongMap!4495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1784 (array!18883 array!18881 (_ BitVec 32) (_ BitVec 32) V!11173 V!11173 (_ BitVec 32) Int) ListLongMap!4495)

(assert (=> b!350712 (= res!194395 (not (contains!2332 (getCurrentListMap!1784 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350713 () Bool)

(declare-fun res!194394 () Bool)

(declare-fun e!214811 () Bool)

(assert (=> b!350713 (=> (not res!194394) (not e!214811))))

(declare-fun arrayContainsKey!0 (array!18883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350713 (= res!194394 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350714 () Bool)

(declare-fun res!194400 () Bool)

(assert (=> b!350714 (=> (not res!194400) (not e!214813))))

(assert (=> b!350714 (= res!194400 (and (= (size!9298 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9299 _keys!1895) (size!9298 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12942 () Bool)

(declare-fun tp!26663 () Bool)

(declare-fun e!214809 () Bool)

(assert (=> mapNonEmpty!12942 (= mapRes!12942 (and tp!26663 e!214809))))

(declare-fun mapRest!12942 () (Array (_ BitVec 32) ValueCell!3480))

(declare-fun mapKey!12942 () (_ BitVec 32))

(declare-fun mapValue!12942 () ValueCell!3480)

(assert (=> mapNonEmpty!12942 (= (arr!8946 _values!1525) (store mapRest!12942 mapKey!12942 mapValue!12942))))

(declare-fun b!350715 () Bool)

(declare-fun res!194397 () Bool)

(assert (=> b!350715 (=> (not res!194397) (not e!214813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350715 (= res!194397 (validKeyInArray!0 k0!1348))))

(declare-fun b!350716 () Bool)

(assert (=> b!350716 (= e!214813 e!214811)))

(declare-fun res!194399 () Bool)

(assert (=> b!350716 (=> (not res!194399) (not e!214811))))

(declare-datatypes ((SeekEntryResult!3443 0))(
  ( (MissingZero!3443 (index!15951 (_ BitVec 32))) (Found!3443 (index!15952 (_ BitVec 32))) (Intermediate!3443 (undefined!4255 Bool) (index!15953 (_ BitVec 32)) (x!34907 (_ BitVec 32))) (Undefined!3443) (MissingVacant!3443 (index!15954 (_ BitVec 32))) )
))
(declare-fun lt!164631 () SeekEntryResult!3443)

(get-info :version)

(assert (=> b!350716 (= res!194399 (and (not ((_ is Found!3443) lt!164631)) (not ((_ is MissingZero!3443) lt!164631)) ((_ is MissingVacant!3443) lt!164631)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18883 (_ BitVec 32)) SeekEntryResult!3443)

(assert (=> b!350716 (= lt!164631 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350717 () Bool)

(assert (=> b!350717 (= e!214809 tp_is_empty!7647)))

(declare-fun b!350718 () Bool)

(declare-fun res!194393 () Bool)

(assert (=> b!350718 (=> (not res!194393) (not e!214813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18883 (_ BitVec 32)) Bool)

(assert (=> b!350718 (= res!194393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12942 () Bool)

(assert (=> mapIsEmpty!12942 mapRes!12942))

(declare-fun b!350719 () Bool)

(declare-fun res!194398 () Bool)

(assert (=> b!350719 (=> (not res!194398) (not e!214813))))

(declare-datatypes ((List!5205 0))(
  ( (Nil!5202) (Cons!5201 (h!6057 (_ BitVec 64)) (t!10343 List!5205)) )
))
(declare-fun arrayNoDuplicates!0 (array!18883 (_ BitVec 32) List!5205) Bool)

(assert (=> b!350719 (= res!194398 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5202))))

(declare-fun b!350720 () Bool)

(assert (=> b!350720 (= e!214812 tp_is_empty!7647)))

(declare-fun b!350721 () Bool)

(assert (=> b!350721 (= e!214811 false)))

(declare-fun lt!164632 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18883 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350721 (= lt!164632 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35006 res!194396) b!350714))

(assert (= (and b!350714 res!194400) b!350718))

(assert (= (and b!350718 res!194393) b!350719))

(assert (= (and b!350719 res!194398) b!350715))

(assert (= (and b!350715 res!194397) b!350712))

(assert (= (and b!350712 res!194395) b!350716))

(assert (= (and b!350716 res!194399) b!350713))

(assert (= (and b!350713 res!194394) b!350721))

(assert (= (and b!350711 condMapEmpty!12942) mapIsEmpty!12942))

(assert (= (and b!350711 (not condMapEmpty!12942)) mapNonEmpty!12942))

(assert (= (and mapNonEmpty!12942 ((_ is ValueCellFull!3480) mapValue!12942)) b!350717))

(assert (= (and b!350711 ((_ is ValueCellFull!3480) mapDefault!12942)) b!350720))

(assert (= start!35006 b!350711))

(declare-fun m!350833 () Bool)

(assert (=> start!35006 m!350833))

(declare-fun m!350835 () Bool)

(assert (=> start!35006 m!350835))

(declare-fun m!350837 () Bool)

(assert (=> start!35006 m!350837))

(declare-fun m!350839 () Bool)

(assert (=> b!350718 m!350839))

(declare-fun m!350841 () Bool)

(assert (=> b!350716 m!350841))

(declare-fun m!350843 () Bool)

(assert (=> b!350715 m!350843))

(declare-fun m!350845 () Bool)

(assert (=> b!350713 m!350845))

(declare-fun m!350847 () Bool)

(assert (=> b!350719 m!350847))

(declare-fun m!350849 () Bool)

(assert (=> b!350712 m!350849))

(assert (=> b!350712 m!350849))

(declare-fun m!350851 () Bool)

(assert (=> b!350712 m!350851))

(declare-fun m!350853 () Bool)

(assert (=> mapNonEmpty!12942 m!350853))

(declare-fun m!350855 () Bool)

(assert (=> b!350721 m!350855))

(check-sat (not b!350718) (not mapNonEmpty!12942) (not b!350716) (not start!35006) (not b!350715) (not b!350713) (not b!350712) (not b!350719) tp_is_empty!7647 (not b_next!7695) b_and!14925 (not b!350721))
(check-sat b_and!14925 (not b_next!7695))
