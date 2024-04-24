; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34786 () Bool)

(assert start!34786)

(declare-fun b_free!7585 () Bool)

(declare-fun b_next!7585 () Bool)

(assert (=> start!34786 (= b_free!7585 (not b_next!7585))))

(declare-fun tp!26322 () Bool)

(declare-fun b_and!14821 () Bool)

(assert (=> start!34786 (= tp!26322 b_and!14821)))

(declare-fun b!348159 () Bool)

(declare-fun e!213324 () Bool)

(declare-fun e!213323 () Bool)

(declare-fun mapRes!12765 () Bool)

(assert (=> b!348159 (= e!213324 (and e!213323 mapRes!12765))))

(declare-fun condMapEmpty!12765 () Bool)

(declare-datatypes ((V!11027 0))(
  ( (V!11028 (val!3813 Int)) )
))
(declare-datatypes ((ValueCell!3425 0))(
  ( (ValueCellFull!3425 (v!5997 V!11027)) (EmptyCell!3425) )
))
(declare-datatypes ((array!18652 0))(
  ( (array!18653 (arr!8835 (Array (_ BitVec 32) ValueCell!3425)) (size!9187 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18652)

(declare-fun mapDefault!12765 () ValueCell!3425)

(assert (=> b!348159 (= condMapEmpty!12765 (= (arr!8835 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3425)) mapDefault!12765)))))

(declare-fun mapNonEmpty!12765 () Bool)

(declare-fun tp!26321 () Bool)

(declare-fun e!213326 () Bool)

(assert (=> mapNonEmpty!12765 (= mapRes!12765 (and tp!26321 e!213326))))

(declare-fun mapRest!12765 () (Array (_ BitVec 32) ValueCell!3425))

(declare-fun mapValue!12765 () ValueCell!3425)

(declare-fun mapKey!12765 () (_ BitVec 32))

(assert (=> mapNonEmpty!12765 (= (arr!8835 _values!1525) (store mapRest!12765 mapKey!12765 mapValue!12765))))

(declare-fun b!348160 () Bool)

(declare-fun res!192850 () Bool)

(declare-fun e!213327 () Bool)

(assert (=> b!348160 (=> (not res!192850) (not e!213327))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348160 (= res!192850 (validKeyInArray!0 k0!1348))))

(declare-fun b!348161 () Bool)

(declare-fun res!192853 () Bool)

(assert (=> b!348161 (=> (not res!192853) (not e!213327))))

(declare-datatypes ((array!18654 0))(
  ( (array!18655 (arr!8836 (Array (_ BitVec 32) (_ BitVec 64))) (size!9188 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18654)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18654 (_ BitVec 32)) Bool)

(assert (=> b!348161 (= res!192853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348162 () Bool)

(declare-fun tp_is_empty!7537 () Bool)

(assert (=> b!348162 (= e!213323 tp_is_empty!7537)))

(declare-fun mapIsEmpty!12765 () Bool)

(assert (=> mapIsEmpty!12765 mapRes!12765))

(declare-fun res!192851 () Bool)

(assert (=> start!34786 (=> (not res!192851) (not e!213327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34786 (= res!192851 (validMask!0 mask!2385))))

(assert (=> start!34786 e!213327))

(assert (=> start!34786 true))

(assert (=> start!34786 tp_is_empty!7537))

(assert (=> start!34786 tp!26322))

(declare-fun array_inv!6526 (array!18652) Bool)

(assert (=> start!34786 (and (array_inv!6526 _values!1525) e!213324)))

(declare-fun array_inv!6527 (array!18654) Bool)

(assert (=> start!34786 (array_inv!6527 _keys!1895)))

(declare-fun b!348163 () Bool)

(declare-fun e!213325 () Bool)

(assert (=> b!348163 (= e!213327 e!213325)))

(declare-fun res!192848 () Bool)

(assert (=> b!348163 (=> (not res!192848) (not e!213325))))

(declare-datatypes ((SeekEntryResult!3362 0))(
  ( (MissingZero!3362 (index!15627 (_ BitVec 32))) (Found!3362 (index!15628 (_ BitVec 32))) (Intermediate!3362 (undefined!4174 Bool) (index!15629 (_ BitVec 32)) (x!34639 (_ BitVec 32))) (Undefined!3362) (MissingVacant!3362 (index!15630 (_ BitVec 32))) )
))
(declare-fun lt!163855 () SeekEntryResult!3362)

(get-info :version)

(assert (=> b!348163 (= res!192848 (and (not ((_ is Found!3362) lt!163855)) ((_ is MissingZero!3362) lt!163855)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18654 (_ BitVec 32)) SeekEntryResult!3362)

(assert (=> b!348163 (= lt!163855 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348164 () Bool)

(assert (=> b!348164 (= e!213325 false)))

(declare-fun lt!163854 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18654 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348164 (= lt!163854 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348165 () Bool)

(declare-fun res!192847 () Bool)

(assert (=> b!348165 (=> (not res!192847) (not e!213327))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348165 (= res!192847 (and (= (size!9187 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9188 _keys!1895) (size!9187 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348166 () Bool)

(assert (=> b!348166 (= e!213326 tp_is_empty!7537)))

(declare-fun b!348167 () Bool)

(declare-fun res!192852 () Bool)

(assert (=> b!348167 (=> (not res!192852) (not e!213327))))

(declare-datatypes ((List!5034 0))(
  ( (Nil!5031) (Cons!5030 (h!5886 (_ BitVec 64)) (t!10156 List!5034)) )
))
(declare-fun arrayNoDuplicates!0 (array!18654 (_ BitVec 32) List!5034) Bool)

(assert (=> b!348167 (= res!192852 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5031))))

(declare-fun b!348168 () Bool)

(declare-fun res!192846 () Bool)

(assert (=> b!348168 (=> (not res!192846) (not e!213325))))

(declare-fun arrayContainsKey!0 (array!18654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348168 (= res!192846 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348169 () Bool)

(declare-fun res!192849 () Bool)

(assert (=> b!348169 (=> (not res!192849) (not e!213327))))

(declare-fun zeroValue!1467 () V!11027)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11027)

(declare-datatypes ((tuple2!5426 0))(
  ( (tuple2!5427 (_1!2724 (_ BitVec 64)) (_2!2724 V!11027)) )
))
(declare-datatypes ((List!5035 0))(
  ( (Nil!5032) (Cons!5031 (h!5887 tuple2!5426) (t!10157 List!5035)) )
))
(declare-datatypes ((ListLongMap!4341 0))(
  ( (ListLongMap!4342 (toList!2186 List!5035)) )
))
(declare-fun contains!2270 (ListLongMap!4341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1714 (array!18654 array!18652 (_ BitVec 32) (_ BitVec 32) V!11027 V!11027 (_ BitVec 32) Int) ListLongMap!4341)

(assert (=> b!348169 (= res!192849 (not (contains!2270 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34786 res!192851) b!348165))

(assert (= (and b!348165 res!192847) b!348161))

(assert (= (and b!348161 res!192853) b!348167))

(assert (= (and b!348167 res!192852) b!348160))

(assert (= (and b!348160 res!192850) b!348169))

(assert (= (and b!348169 res!192849) b!348163))

(assert (= (and b!348163 res!192848) b!348168))

(assert (= (and b!348168 res!192846) b!348164))

(assert (= (and b!348159 condMapEmpty!12765) mapIsEmpty!12765))

(assert (= (and b!348159 (not condMapEmpty!12765)) mapNonEmpty!12765))

(assert (= (and mapNonEmpty!12765 ((_ is ValueCellFull!3425) mapValue!12765)) b!348166))

(assert (= (and b!348159 ((_ is ValueCellFull!3425) mapDefault!12765)) b!348162))

(assert (= start!34786 b!348159))

(declare-fun m!349269 () Bool)

(assert (=> start!34786 m!349269))

(declare-fun m!349271 () Bool)

(assert (=> start!34786 m!349271))

(declare-fun m!349273 () Bool)

(assert (=> start!34786 m!349273))

(declare-fun m!349275 () Bool)

(assert (=> b!348167 m!349275))

(declare-fun m!349277 () Bool)

(assert (=> b!348164 m!349277))

(declare-fun m!349279 () Bool)

(assert (=> b!348160 m!349279))

(declare-fun m!349281 () Bool)

(assert (=> mapNonEmpty!12765 m!349281))

(declare-fun m!349283 () Bool)

(assert (=> b!348168 m!349283))

(declare-fun m!349285 () Bool)

(assert (=> b!348169 m!349285))

(assert (=> b!348169 m!349285))

(declare-fun m!349287 () Bool)

(assert (=> b!348169 m!349287))

(declare-fun m!349289 () Bool)

(assert (=> b!348161 m!349289))

(declare-fun m!349291 () Bool)

(assert (=> b!348163 m!349291))

(check-sat (not start!34786) tp_is_empty!7537 (not b!348161) (not b!348164) (not b!348168) (not b!348160) (not mapNonEmpty!12765) (not b_next!7585) b_and!14821 (not b!348163) (not b!348169) (not b!348167))
(check-sat b_and!14821 (not b_next!7585))
