; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34212 () Bool)

(assert start!34212)

(declare-fun b_free!7249 () Bool)

(declare-fun b_next!7249 () Bool)

(assert (=> start!34212 (= b_free!7249 (not b_next!7249))))

(declare-fun tp!25281 () Bool)

(declare-fun b_and!14463 () Bool)

(assert (=> start!34212 (= tp!25281 b_and!14463)))

(declare-fun res!188765 () Bool)

(declare-fun e!209369 () Bool)

(assert (=> start!34212 (=> (not res!188765) (not e!209369))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34212 (= res!188765 (validMask!0 mask!2385))))

(assert (=> start!34212 e!209369))

(assert (=> start!34212 true))

(declare-fun tp_is_empty!7201 () Bool)

(assert (=> start!34212 tp_is_empty!7201))

(assert (=> start!34212 tp!25281))

(declare-datatypes ((V!10579 0))(
  ( (V!10580 (val!3645 Int)) )
))
(declare-datatypes ((ValueCell!3257 0))(
  ( (ValueCellFull!3257 (v!5818 V!10579)) (EmptyCell!3257) )
))
(declare-datatypes ((array!17988 0))(
  ( (array!17989 (arr!8514 (Array (_ BitVec 32) ValueCell!3257)) (size!8866 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17988)

(declare-fun e!209372 () Bool)

(declare-fun array_inv!6302 (array!17988) Bool)

(assert (=> start!34212 (and (array_inv!6302 _values!1525) e!209372)))

(declare-datatypes ((array!17990 0))(
  ( (array!17991 (arr!8515 (Array (_ BitVec 32) (_ BitVec 64))) (size!8867 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17990)

(declare-fun array_inv!6303 (array!17990) Bool)

(assert (=> start!34212 (array_inv!6303 _keys!1895)))

(declare-fun b!341399 () Bool)

(declare-fun e!209371 () Bool)

(assert (=> b!341399 (= e!209369 e!209371)))

(declare-fun res!188758 () Bool)

(assert (=> b!341399 (=> (not res!188758) (not e!209371))))

(declare-datatypes ((SeekEntryResult!3242 0))(
  ( (MissingZero!3242 (index!15147 (_ BitVec 32))) (Found!3242 (index!15148 (_ BitVec 32))) (Intermediate!3242 (undefined!4054 Bool) (index!15149 (_ BitVec 32)) (x!33961 (_ BitVec 32))) (Undefined!3242) (MissingVacant!3242 (index!15150 (_ BitVec 32))) )
))
(declare-fun lt!161791 () SeekEntryResult!3242)

(get-info :version)

(assert (=> b!341399 (= res!188758 (and (not ((_ is Found!3242) lt!161791)) (not ((_ is MissingZero!3242) lt!161791)) ((_ is MissingVacant!3242) lt!161791)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17990 (_ BitVec 32)) SeekEntryResult!3242)

(assert (=> b!341399 (= lt!161791 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341400 () Bool)

(declare-fun res!188764 () Bool)

(assert (=> b!341400 (=> (not res!188764) (not e!209369))))

(declare-fun zeroValue!1467 () V!10579)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10579)

(declare-datatypes ((tuple2!5198 0))(
  ( (tuple2!5199 (_1!2610 (_ BitVec 64)) (_2!2610 V!10579)) )
))
(declare-datatypes ((List!4802 0))(
  ( (Nil!4799) (Cons!4798 (h!5654 tuple2!5198) (t!9902 List!4802)) )
))
(declare-datatypes ((ListLongMap!4113 0))(
  ( (ListLongMap!4114 (toList!2072 List!4802)) )
))
(declare-fun contains!2145 (ListLongMap!4113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1601 (array!17990 array!17988 (_ BitVec 32) (_ BitVec 32) V!10579 V!10579 (_ BitVec 32) Int) ListLongMap!4113)

(assert (=> b!341400 (= res!188764 (not (contains!2145 (getCurrentListMap!1601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341401 () Bool)

(declare-fun e!209368 () Bool)

(declare-fun mapRes!12228 () Bool)

(assert (=> b!341401 (= e!209372 (and e!209368 mapRes!12228))))

(declare-fun condMapEmpty!12228 () Bool)

(declare-fun mapDefault!12228 () ValueCell!3257)

(assert (=> b!341401 (= condMapEmpty!12228 (= (arr!8514 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3257)) mapDefault!12228)))))

(declare-fun b!341402 () Bool)

(declare-fun res!188763 () Bool)

(assert (=> b!341402 (=> (not res!188763) (not e!209369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341402 (= res!188763 (validKeyInArray!0 k0!1348))))

(declare-fun b!341403 () Bool)

(declare-fun e!209370 () Bool)

(assert (=> b!341403 (= e!209370 tp_is_empty!7201)))

(declare-fun b!341404 () Bool)

(assert (=> b!341404 (= e!209371 false)))

(declare-fun lt!161790 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17990 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341404 (= lt!161790 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341405 () Bool)

(declare-fun res!188761 () Bool)

(assert (=> b!341405 (=> (not res!188761) (not e!209369))))

(declare-datatypes ((List!4803 0))(
  ( (Nil!4800) (Cons!4799 (h!5655 (_ BitVec 64)) (t!9903 List!4803)) )
))
(declare-fun arrayNoDuplicates!0 (array!17990 (_ BitVec 32) List!4803) Bool)

(assert (=> b!341405 (= res!188761 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4800))))

(declare-fun b!341406 () Bool)

(assert (=> b!341406 (= e!209368 tp_is_empty!7201)))

(declare-fun b!341407 () Bool)

(declare-fun res!188760 () Bool)

(assert (=> b!341407 (=> (not res!188760) (not e!209369))))

(assert (=> b!341407 (= res!188760 (and (= (size!8866 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8867 _keys!1895) (size!8866 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12228 () Bool)

(assert (=> mapIsEmpty!12228 mapRes!12228))

(declare-fun b!341408 () Bool)

(declare-fun res!188762 () Bool)

(assert (=> b!341408 (=> (not res!188762) (not e!209369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17990 (_ BitVec 32)) Bool)

(assert (=> b!341408 (= res!188762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12228 () Bool)

(declare-fun tp!25280 () Bool)

(assert (=> mapNonEmpty!12228 (= mapRes!12228 (and tp!25280 e!209370))))

(declare-fun mapValue!12228 () ValueCell!3257)

(declare-fun mapKey!12228 () (_ BitVec 32))

(declare-fun mapRest!12228 () (Array (_ BitVec 32) ValueCell!3257))

(assert (=> mapNonEmpty!12228 (= (arr!8514 _values!1525) (store mapRest!12228 mapKey!12228 mapValue!12228))))

(declare-fun b!341409 () Bool)

(declare-fun res!188759 () Bool)

(assert (=> b!341409 (=> (not res!188759) (not e!209371))))

(declare-fun arrayContainsKey!0 (array!17990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341409 (= res!188759 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34212 res!188765) b!341407))

(assert (= (and b!341407 res!188760) b!341408))

(assert (= (and b!341408 res!188762) b!341405))

(assert (= (and b!341405 res!188761) b!341402))

(assert (= (and b!341402 res!188763) b!341400))

(assert (= (and b!341400 res!188764) b!341399))

(assert (= (and b!341399 res!188758) b!341409))

(assert (= (and b!341409 res!188759) b!341404))

(assert (= (and b!341401 condMapEmpty!12228) mapIsEmpty!12228))

(assert (= (and b!341401 (not condMapEmpty!12228)) mapNonEmpty!12228))

(assert (= (and mapNonEmpty!12228 ((_ is ValueCellFull!3257) mapValue!12228)) b!341403))

(assert (= (and b!341401 ((_ is ValueCellFull!3257) mapDefault!12228)) b!341406))

(assert (= start!34212 b!341401))

(declare-fun m!344103 () Bool)

(assert (=> b!341408 m!344103))

(declare-fun m!344105 () Bool)

(assert (=> b!341402 m!344105))

(declare-fun m!344107 () Bool)

(assert (=> start!34212 m!344107))

(declare-fun m!344109 () Bool)

(assert (=> start!34212 m!344109))

(declare-fun m!344111 () Bool)

(assert (=> start!34212 m!344111))

(declare-fun m!344113 () Bool)

(assert (=> b!341409 m!344113))

(declare-fun m!344115 () Bool)

(assert (=> mapNonEmpty!12228 m!344115))

(declare-fun m!344117 () Bool)

(assert (=> b!341399 m!344117))

(declare-fun m!344119 () Bool)

(assert (=> b!341404 m!344119))

(declare-fun m!344121 () Bool)

(assert (=> b!341400 m!344121))

(assert (=> b!341400 m!344121))

(declare-fun m!344123 () Bool)

(assert (=> b!341400 m!344123))

(declare-fun m!344125 () Bool)

(assert (=> b!341405 m!344125))

(check-sat b_and!14463 (not b!341402) (not b_next!7249) (not b!341400) (not b!341408) (not mapNonEmpty!12228) (not start!34212) (not b!341405) tp_is_empty!7201 (not b!341409) (not b!341399) (not b!341404))
(check-sat b_and!14463 (not b_next!7249))
