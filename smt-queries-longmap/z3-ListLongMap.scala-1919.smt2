; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34162 () Bool)

(assert start!34162)

(declare-fun b_free!7185 () Bool)

(declare-fun b_next!7185 () Bool)

(assert (=> start!34162 (= b_free!7185 (not b_next!7185))))

(declare-fun tp!25088 () Bool)

(declare-fun b_and!14385 () Bool)

(assert (=> start!34162 (= tp!25088 b_and!14385)))

(declare-fun b!340404 () Bool)

(declare-fun res!188004 () Bool)

(declare-fun e!208829 () Bool)

(assert (=> b!340404 (=> (not res!188004) (not e!208829))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10493 0))(
  ( (V!10494 (val!3613 Int)) )
))
(declare-datatypes ((ValueCell!3225 0))(
  ( (ValueCellFull!3225 (v!5785 V!10493)) (EmptyCell!3225) )
))
(declare-datatypes ((array!17879 0))(
  ( (array!17880 (arr!8460 (Array (_ BitVec 32) ValueCell!3225)) (size!8812 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17879)

(declare-datatypes ((array!17881 0))(
  ( (array!17882 (arr!8461 (Array (_ BitVec 32) (_ BitVec 64))) (size!8813 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17881)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10493)

(declare-fun zeroValue!1467 () V!10493)

(declare-datatypes ((tuple2!5246 0))(
  ( (tuple2!5247 (_1!2634 (_ BitVec 64)) (_2!2634 V!10493)) )
))
(declare-datatypes ((List!4863 0))(
  ( (Nil!4860) (Cons!4859 (h!5715 tuple2!5246) (t!9971 List!4863)) )
))
(declare-datatypes ((ListLongMap!4159 0))(
  ( (ListLongMap!4160 (toList!2095 List!4863)) )
))
(declare-fun contains!2149 (ListLongMap!4159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1616 (array!17881 array!17879 (_ BitVec 32) (_ BitVec 32) V!10493 V!10493 (_ BitVec 32) Int) ListLongMap!4159)

(assert (=> b!340404 (= res!188004 (not (contains!2149 (getCurrentListMap!1616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340405 () Bool)

(assert (=> b!340405 (= e!208829 false)))

(declare-datatypes ((SeekEntryResult!3269 0))(
  ( (MissingZero!3269 (index!15255 (_ BitVec 32))) (Found!3269 (index!15256 (_ BitVec 32))) (Intermediate!3269 (undefined!4081 Bool) (index!15257 (_ BitVec 32)) (x!33903 (_ BitVec 32))) (Undefined!3269) (MissingVacant!3269 (index!15258 (_ BitVec 32))) )
))
(declare-fun lt!161584 () SeekEntryResult!3269)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17881 (_ BitVec 32)) SeekEntryResult!3269)

(assert (=> b!340405 (= lt!161584 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340406 () Bool)

(declare-fun res!188003 () Bool)

(assert (=> b!340406 (=> (not res!188003) (not e!208829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17881 (_ BitVec 32)) Bool)

(assert (=> b!340406 (= res!188003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340407 () Bool)

(declare-fun e!208831 () Bool)

(declare-fun tp_is_empty!7137 () Bool)

(assert (=> b!340407 (= e!208831 tp_is_empty!7137)))

(declare-fun res!188006 () Bool)

(assert (=> start!34162 (=> (not res!188006) (not e!208829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34162 (= res!188006 (validMask!0 mask!2385))))

(assert (=> start!34162 e!208829))

(assert (=> start!34162 true))

(assert (=> start!34162 tp_is_empty!7137))

(assert (=> start!34162 tp!25088))

(declare-fun e!208833 () Bool)

(declare-fun array_inv!6268 (array!17879) Bool)

(assert (=> start!34162 (and (array_inv!6268 _values!1525) e!208833)))

(declare-fun array_inv!6269 (array!17881) Bool)

(assert (=> start!34162 (array_inv!6269 _keys!1895)))

(declare-fun b!340408 () Bool)

(declare-fun res!188002 () Bool)

(assert (=> b!340408 (=> (not res!188002) (not e!208829))))

(declare-datatypes ((List!4864 0))(
  ( (Nil!4861) (Cons!4860 (h!5716 (_ BitVec 64)) (t!9972 List!4864)) )
))
(declare-fun arrayNoDuplicates!0 (array!17881 (_ BitVec 32) List!4864) Bool)

(assert (=> b!340408 (= res!188002 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4861))))

(declare-fun b!340409 () Bool)

(declare-fun e!208830 () Bool)

(declare-fun mapRes!12132 () Bool)

(assert (=> b!340409 (= e!208833 (and e!208830 mapRes!12132))))

(declare-fun condMapEmpty!12132 () Bool)

(declare-fun mapDefault!12132 () ValueCell!3225)

(assert (=> b!340409 (= condMapEmpty!12132 (= (arr!8460 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3225)) mapDefault!12132)))))

(declare-fun mapIsEmpty!12132 () Bool)

(assert (=> mapIsEmpty!12132 mapRes!12132))

(declare-fun mapNonEmpty!12132 () Bool)

(declare-fun tp!25089 () Bool)

(assert (=> mapNonEmpty!12132 (= mapRes!12132 (and tp!25089 e!208831))))

(declare-fun mapValue!12132 () ValueCell!3225)

(declare-fun mapRest!12132 () (Array (_ BitVec 32) ValueCell!3225))

(declare-fun mapKey!12132 () (_ BitVec 32))

(assert (=> mapNonEmpty!12132 (= (arr!8460 _values!1525) (store mapRest!12132 mapKey!12132 mapValue!12132))))

(declare-fun b!340410 () Bool)

(declare-fun res!188005 () Bool)

(assert (=> b!340410 (=> (not res!188005) (not e!208829))))

(assert (=> b!340410 (= res!188005 (and (= (size!8812 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8813 _keys!1895) (size!8812 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340411 () Bool)

(declare-fun res!188001 () Bool)

(assert (=> b!340411 (=> (not res!188001) (not e!208829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340411 (= res!188001 (validKeyInArray!0 k0!1348))))

(declare-fun b!340412 () Bool)

(assert (=> b!340412 (= e!208830 tp_is_empty!7137)))

(assert (= (and start!34162 res!188006) b!340410))

(assert (= (and b!340410 res!188005) b!340406))

(assert (= (and b!340406 res!188003) b!340408))

(assert (= (and b!340408 res!188002) b!340411))

(assert (= (and b!340411 res!188001) b!340404))

(assert (= (and b!340404 res!188004) b!340405))

(assert (= (and b!340409 condMapEmpty!12132) mapIsEmpty!12132))

(assert (= (and b!340409 (not condMapEmpty!12132)) mapNonEmpty!12132))

(get-info :version)

(assert (= (and mapNonEmpty!12132 ((_ is ValueCellFull!3225) mapValue!12132)) b!340407))

(assert (= (and b!340409 ((_ is ValueCellFull!3225) mapDefault!12132)) b!340412))

(assert (= start!34162 b!340409))

(declare-fun m!343119 () Bool)

(assert (=> b!340405 m!343119))

(declare-fun m!343121 () Bool)

(assert (=> mapNonEmpty!12132 m!343121))

(declare-fun m!343123 () Bool)

(assert (=> b!340408 m!343123))

(declare-fun m!343125 () Bool)

(assert (=> b!340406 m!343125))

(declare-fun m!343127 () Bool)

(assert (=> start!34162 m!343127))

(declare-fun m!343129 () Bool)

(assert (=> start!34162 m!343129))

(declare-fun m!343131 () Bool)

(assert (=> start!34162 m!343131))

(declare-fun m!343133 () Bool)

(assert (=> b!340404 m!343133))

(assert (=> b!340404 m!343133))

(declare-fun m!343135 () Bool)

(assert (=> b!340404 m!343135))

(declare-fun m!343137 () Bool)

(assert (=> b!340411 m!343137))

(check-sat b_and!14385 (not b_next!7185) (not b!340405) (not b!340406) tp_is_empty!7137 (not b!340411) (not mapNonEmpty!12132) (not b!340408) (not b!340404) (not start!34162))
(check-sat b_and!14385 (not b_next!7185))
