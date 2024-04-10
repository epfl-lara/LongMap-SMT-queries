; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33722 () Bool)

(assert start!33722)

(declare-fun b_free!6957 () Bool)

(declare-fun b_next!6957 () Bool)

(assert (=> start!33722 (= b_free!6957 (not b_next!6957))))

(declare-fun tp!24375 () Bool)

(declare-fun b_and!14137 () Bool)

(assert (=> start!33722 (= tp!24375 b_and!14137)))

(declare-fun mapNonEmpty!11760 () Bool)

(declare-fun mapRes!11760 () Bool)

(declare-fun tp!24374 () Bool)

(declare-fun e!205818 () Bool)

(assert (=> mapNonEmpty!11760 (= mapRes!11760 (and tp!24374 e!205818))))

(declare-fun mapKey!11760 () (_ BitVec 32))

(declare-datatypes ((V!10189 0))(
  ( (V!10190 (val!3499 Int)) )
))
(declare-datatypes ((ValueCell!3111 0))(
  ( (ValueCellFull!3111 (v!5661 V!10189)) (EmptyCell!3111) )
))
(declare-fun mapRest!11760 () (Array (_ BitVec 32) ValueCell!3111))

(declare-datatypes ((array!17411 0))(
  ( (array!17412 (arr!8236 (Array (_ BitVec 32) ValueCell!3111)) (size!8588 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17411)

(declare-fun mapValue!11760 () ValueCell!3111)

(assert (=> mapNonEmpty!11760 (= (arr!8236 _values!1525) (store mapRest!11760 mapKey!11760 mapValue!11760))))

(declare-fun b!335295 () Bool)

(declare-fun e!205816 () Bool)

(declare-fun e!205812 () Bool)

(assert (=> b!335295 (= e!205816 e!205812)))

(declare-fun res!185003 () Bool)

(assert (=> b!335295 (=> (not res!185003) (not e!205812))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17413 0))(
  ( (array!17414 (arr!8237 (Array (_ BitVec 32) (_ BitVec 64))) (size!8589 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17413)

(declare-datatypes ((SeekEntryResult!3184 0))(
  ( (MissingZero!3184 (index!14915 (_ BitVec 32))) (Found!3184 (index!14916 (_ BitVec 32))) (Intermediate!3184 (undefined!3996 Bool) (index!14917 (_ BitVec 32)) (x!33414 (_ BitVec 32))) (Undefined!3184) (MissingVacant!3184 (index!14918 (_ BitVec 32))) )
))
(declare-fun lt!159778 () SeekEntryResult!3184)

(get-info :version)

(assert (=> b!335295 (= res!185003 (and ((_ is Found!3184) lt!159778) (= (select (arr!8237 _keys!1895) (index!14916 lt!159778)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17413 (_ BitVec 32)) SeekEntryResult!3184)

(assert (=> b!335295 (= lt!159778 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11760 () Bool)

(assert (=> mapIsEmpty!11760 mapRes!11760))

(declare-fun res!184999 () Bool)

(declare-fun e!205815 () Bool)

(assert (=> start!33722 (=> (not res!184999) (not e!205815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33722 (= res!184999 (validMask!0 mask!2385))))

(assert (=> start!33722 e!205815))

(assert (=> start!33722 true))

(declare-fun tp_is_empty!6909 () Bool)

(assert (=> start!33722 tp_is_empty!6909))

(assert (=> start!33722 tp!24375))

(declare-fun e!205814 () Bool)

(declare-fun array_inv!6120 (array!17411) Bool)

(assert (=> start!33722 (and (array_inv!6120 _values!1525) e!205814)))

(declare-fun array_inv!6121 (array!17413) Bool)

(assert (=> start!33722 (array_inv!6121 _keys!1895)))

(declare-fun b!335296 () Bool)

(declare-fun res!185000 () Bool)

(assert (=> b!335296 (=> (not res!185000) (not e!205812))))

(declare-fun arrayContainsKey!0 (array!17413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335296 (= res!185000 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14916 lt!159778)))))

(declare-fun b!335297 () Bool)

(declare-fun res!184996 () Bool)

(assert (=> b!335297 (=> (not res!184996) (not e!205815))))

(declare-datatypes ((List!4701 0))(
  ( (Nil!4698) (Cons!4697 (h!5553 (_ BitVec 64)) (t!9789 List!4701)) )
))
(declare-fun arrayNoDuplicates!0 (array!17413 (_ BitVec 32) List!4701) Bool)

(assert (=> b!335297 (= res!184996 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4698))))

(declare-fun b!335298 () Bool)

(declare-fun res!184997 () Bool)

(assert (=> b!335298 (=> (not res!184997) (not e!205815))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335298 (= res!184997 (and (= (size!8588 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8589 _keys!1895) (size!8588 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335299 () Bool)

(declare-fun e!205817 () Bool)

(assert (=> b!335299 (= e!205817 tp_is_empty!6909)))

(declare-fun b!335300 () Bool)

(assert (=> b!335300 (= e!205812 (not true))))

(declare-datatypes ((tuple2!5080 0))(
  ( (tuple2!5081 (_1!2551 (_ BitVec 64)) (_2!2551 V!10189)) )
))
(declare-datatypes ((List!4702 0))(
  ( (Nil!4699) (Cons!4698 (h!5554 tuple2!5080) (t!9790 List!4702)) )
))
(declare-datatypes ((ListLongMap!3993 0))(
  ( (ListLongMap!3994 (toList!2012 List!4702)) )
))
(declare-fun lt!159779 () ListLongMap!3993)

(declare-fun contains!2056 (ListLongMap!3993 (_ BitVec 64)) Bool)

(assert (=> b!335300 (contains!2056 lt!159779 (select (arr!8237 _keys!1895) (index!14916 lt!159778)))))

(declare-fun zeroValue!1467 () V!10189)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10189)

(declare-datatypes ((Unit!10435 0))(
  ( (Unit!10436) )
))
(declare-fun lt!159780 () Unit!10435)

(declare-fun lemmaValidKeyInArrayIsInListMap!164 (array!17413 array!17411 (_ BitVec 32) (_ BitVec 32) V!10189 V!10189 (_ BitVec 32) Int) Unit!10435)

(assert (=> b!335300 (= lt!159780 (lemmaValidKeyInArrayIsInListMap!164 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14916 lt!159778) defaultEntry!1528))))

(assert (=> b!335300 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159781 () Unit!10435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17413 (_ BitVec 64) (_ BitVec 32)) Unit!10435)

(assert (=> b!335300 (= lt!159781 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14916 lt!159778)))))

(declare-fun b!335301 () Bool)

(declare-fun res!185001 () Bool)

(assert (=> b!335301 (=> (not res!185001) (not e!205815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335301 (= res!185001 (validKeyInArray!0 k0!1348))))

(declare-fun b!335302 () Bool)

(assert (=> b!335302 (= e!205815 e!205816)))

(declare-fun res!184998 () Bool)

(assert (=> b!335302 (=> (not res!184998) (not e!205816))))

(assert (=> b!335302 (= res!184998 (not (contains!2056 lt!159779 k0!1348)))))

(declare-fun getCurrentListMap!1536 (array!17413 array!17411 (_ BitVec 32) (_ BitVec 32) V!10189 V!10189 (_ BitVec 32) Int) ListLongMap!3993)

(assert (=> b!335302 (= lt!159779 (getCurrentListMap!1536 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335303 () Bool)

(assert (=> b!335303 (= e!205818 tp_is_empty!6909)))

(declare-fun b!335304 () Bool)

(declare-fun res!185002 () Bool)

(assert (=> b!335304 (=> (not res!185002) (not e!205815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17413 (_ BitVec 32)) Bool)

(assert (=> b!335304 (= res!185002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335305 () Bool)

(assert (=> b!335305 (= e!205814 (and e!205817 mapRes!11760))))

(declare-fun condMapEmpty!11760 () Bool)

(declare-fun mapDefault!11760 () ValueCell!3111)

(assert (=> b!335305 (= condMapEmpty!11760 (= (arr!8236 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3111)) mapDefault!11760)))))

(assert (= (and start!33722 res!184999) b!335298))

(assert (= (and b!335298 res!184997) b!335304))

(assert (= (and b!335304 res!185002) b!335297))

(assert (= (and b!335297 res!184996) b!335301))

(assert (= (and b!335301 res!185001) b!335302))

(assert (= (and b!335302 res!184998) b!335295))

(assert (= (and b!335295 res!185003) b!335296))

(assert (= (and b!335296 res!185000) b!335300))

(assert (= (and b!335305 condMapEmpty!11760) mapIsEmpty!11760))

(assert (= (and b!335305 (not condMapEmpty!11760)) mapNonEmpty!11760))

(assert (= (and mapNonEmpty!11760 ((_ is ValueCellFull!3111) mapValue!11760)) b!335303))

(assert (= (and b!335305 ((_ is ValueCellFull!3111) mapDefault!11760)) b!335299))

(assert (= start!33722 b!335305))

(declare-fun m!339293 () Bool)

(assert (=> start!33722 m!339293))

(declare-fun m!339295 () Bool)

(assert (=> start!33722 m!339295))

(declare-fun m!339297 () Bool)

(assert (=> start!33722 m!339297))

(declare-fun m!339299 () Bool)

(assert (=> b!335300 m!339299))

(declare-fun m!339301 () Bool)

(assert (=> b!335300 m!339301))

(declare-fun m!339303 () Bool)

(assert (=> b!335300 m!339303))

(assert (=> b!335300 m!339303))

(declare-fun m!339305 () Bool)

(assert (=> b!335300 m!339305))

(declare-fun m!339307 () Bool)

(assert (=> b!335300 m!339307))

(declare-fun m!339309 () Bool)

(assert (=> mapNonEmpty!11760 m!339309))

(declare-fun m!339311 () Bool)

(assert (=> b!335297 m!339311))

(assert (=> b!335295 m!339303))

(declare-fun m!339313 () Bool)

(assert (=> b!335295 m!339313))

(declare-fun m!339315 () Bool)

(assert (=> b!335301 m!339315))

(declare-fun m!339317 () Bool)

(assert (=> b!335302 m!339317))

(declare-fun m!339319 () Bool)

(assert (=> b!335302 m!339319))

(declare-fun m!339321 () Bool)

(assert (=> b!335304 m!339321))

(declare-fun m!339323 () Bool)

(assert (=> b!335296 m!339323))

(check-sat (not b_next!6957) tp_is_empty!6909 (not b!335302) (not mapNonEmpty!11760) (not b!335295) (not b!335296) (not b!335297) (not b!335304) b_and!14137 (not b!335301) (not b!335300) (not start!33722))
(check-sat b_and!14137 (not b_next!6957))
