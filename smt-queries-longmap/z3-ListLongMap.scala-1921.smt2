; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34158 () Bool)

(assert start!34158)

(declare-fun b_free!7195 () Bool)

(declare-fun b_next!7195 () Bool)

(assert (=> start!34158 (= b_free!7195 (not b_next!7195))))

(declare-fun tp!25118 () Bool)

(declare-fun b_and!14409 () Bool)

(assert (=> start!34158 (= tp!25118 b_and!14409)))

(declare-fun b!340508 () Bool)

(declare-fun e!208882 () Bool)

(declare-fun e!208885 () Bool)

(declare-fun mapRes!12147 () Bool)

(assert (=> b!340508 (= e!208882 (and e!208885 mapRes!12147))))

(declare-fun condMapEmpty!12147 () Bool)

(declare-datatypes ((V!10507 0))(
  ( (V!10508 (val!3618 Int)) )
))
(declare-datatypes ((ValueCell!3230 0))(
  ( (ValueCellFull!3230 (v!5791 V!10507)) (EmptyCell!3230) )
))
(declare-datatypes ((array!17880 0))(
  ( (array!17881 (arr!8460 (Array (_ BitVec 32) ValueCell!3230)) (size!8812 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17880)

(declare-fun mapDefault!12147 () ValueCell!3230)

(assert (=> b!340508 (= condMapEmpty!12147 (= (arr!8460 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3230)) mapDefault!12147)))))

(declare-fun mapIsEmpty!12147 () Bool)

(assert (=> mapIsEmpty!12147 mapRes!12147))

(declare-fun b!340509 () Bool)

(declare-fun res!188117 () Bool)

(declare-fun e!208884 () Bool)

(assert (=> b!340509 (=> (not res!188117) (not e!208884))))

(declare-datatypes ((array!17882 0))(
  ( (array!17883 (arr!8461 (Array (_ BitVec 32) (_ BitVec 64))) (size!8813 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17882)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340509 (= res!188117 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340510 () Bool)

(declare-fun e!208881 () Bool)

(assert (=> b!340510 (= e!208881 e!208884)))

(declare-fun res!188115 () Bool)

(assert (=> b!340510 (=> (not res!188115) (not e!208884))))

(declare-datatypes ((SeekEntryResult!3223 0))(
  ( (MissingZero!3223 (index!15071 (_ BitVec 32))) (Found!3223 (index!15072 (_ BitVec 32))) (Intermediate!3223 (undefined!4035 Bool) (index!15073 (_ BitVec 32)) (x!33870 (_ BitVec 32))) (Undefined!3223) (MissingVacant!3223 (index!15074 (_ BitVec 32))) )
))
(declare-fun lt!161629 () SeekEntryResult!3223)

(get-info :version)

(assert (=> b!340510 (= res!188115 (and (not ((_ is Found!3223) lt!161629)) (not ((_ is MissingZero!3223) lt!161629)) ((_ is MissingVacant!3223) lt!161629)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17882 (_ BitVec 32)) SeekEntryResult!3223)

(assert (=> b!340510 (= lt!161629 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340511 () Bool)

(declare-fun res!188114 () Bool)

(assert (=> b!340511 (=> (not res!188114) (not e!208881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340511 (= res!188114 (validKeyInArray!0 k0!1348))))

(declare-fun b!340512 () Bool)

(assert (=> b!340512 (= e!208884 false)))

(declare-fun lt!161628 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17882 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340512 (= lt!161628 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340513 () Bool)

(declare-fun res!188110 () Bool)

(assert (=> b!340513 (=> (not res!188110) (not e!208881))))

(declare-fun zeroValue!1467 () V!10507)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10507)

(declare-datatypes ((tuple2!5162 0))(
  ( (tuple2!5163 (_1!2592 (_ BitVec 64)) (_2!2592 V!10507)) )
))
(declare-datatypes ((List!4767 0))(
  ( (Nil!4764) (Cons!4763 (h!5619 tuple2!5162) (t!9867 List!4767)) )
))
(declare-datatypes ((ListLongMap!4077 0))(
  ( (ListLongMap!4078 (toList!2054 List!4767)) )
))
(declare-fun contains!2127 (ListLongMap!4077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1583 (array!17882 array!17880 (_ BitVec 32) (_ BitVec 32) V!10507 V!10507 (_ BitVec 32) Int) ListLongMap!4077)

(assert (=> b!340513 (= res!188110 (not (contains!2127 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340514 () Bool)

(declare-fun res!188116 () Bool)

(assert (=> b!340514 (=> (not res!188116) (not e!208881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17882 (_ BitVec 32)) Bool)

(assert (=> b!340514 (= res!188116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!188111 () Bool)

(assert (=> start!34158 (=> (not res!188111) (not e!208881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34158 (= res!188111 (validMask!0 mask!2385))))

(assert (=> start!34158 e!208881))

(assert (=> start!34158 true))

(declare-fun tp_is_empty!7147 () Bool)

(assert (=> start!34158 tp_is_empty!7147))

(assert (=> start!34158 tp!25118))

(declare-fun array_inv!6270 (array!17880) Bool)

(assert (=> start!34158 (and (array_inv!6270 _values!1525) e!208882)))

(declare-fun array_inv!6271 (array!17882) Bool)

(assert (=> start!34158 (array_inv!6271 _keys!1895)))

(declare-fun mapNonEmpty!12147 () Bool)

(declare-fun tp!25119 () Bool)

(declare-fun e!208883 () Bool)

(assert (=> mapNonEmpty!12147 (= mapRes!12147 (and tp!25119 e!208883))))

(declare-fun mapRest!12147 () (Array (_ BitVec 32) ValueCell!3230))

(declare-fun mapKey!12147 () (_ BitVec 32))

(declare-fun mapValue!12147 () ValueCell!3230)

(assert (=> mapNonEmpty!12147 (= (arr!8460 _values!1525) (store mapRest!12147 mapKey!12147 mapValue!12147))))

(declare-fun b!340515 () Bool)

(assert (=> b!340515 (= e!208885 tp_is_empty!7147)))

(declare-fun b!340516 () Bool)

(declare-fun res!188113 () Bool)

(assert (=> b!340516 (=> (not res!188113) (not e!208881))))

(assert (=> b!340516 (= res!188113 (and (= (size!8812 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8813 _keys!1895) (size!8812 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340517 () Bool)

(declare-fun res!188112 () Bool)

(assert (=> b!340517 (=> (not res!188112) (not e!208881))))

(declare-datatypes ((List!4768 0))(
  ( (Nil!4765) (Cons!4764 (h!5620 (_ BitVec 64)) (t!9868 List!4768)) )
))
(declare-fun arrayNoDuplicates!0 (array!17882 (_ BitVec 32) List!4768) Bool)

(assert (=> b!340517 (= res!188112 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4765))))

(declare-fun b!340518 () Bool)

(assert (=> b!340518 (= e!208883 tp_is_empty!7147)))

(assert (= (and start!34158 res!188111) b!340516))

(assert (= (and b!340516 res!188113) b!340514))

(assert (= (and b!340514 res!188116) b!340517))

(assert (= (and b!340517 res!188112) b!340511))

(assert (= (and b!340511 res!188114) b!340513))

(assert (= (and b!340513 res!188110) b!340510))

(assert (= (and b!340510 res!188115) b!340509))

(assert (= (and b!340509 res!188117) b!340512))

(assert (= (and b!340508 condMapEmpty!12147) mapIsEmpty!12147))

(assert (= (and b!340508 (not condMapEmpty!12147)) mapNonEmpty!12147))

(assert (= (and mapNonEmpty!12147 ((_ is ValueCellFull!3230) mapValue!12147)) b!340518))

(assert (= (and b!340508 ((_ is ValueCellFull!3230) mapDefault!12147)) b!340515))

(assert (= start!34158 b!340508))

(declare-fun m!343455 () Bool)

(assert (=> b!340513 m!343455))

(assert (=> b!340513 m!343455))

(declare-fun m!343457 () Bool)

(assert (=> b!340513 m!343457))

(declare-fun m!343459 () Bool)

(assert (=> b!340512 m!343459))

(declare-fun m!343461 () Bool)

(assert (=> b!340517 m!343461))

(declare-fun m!343463 () Bool)

(assert (=> b!340509 m!343463))

(declare-fun m!343465 () Bool)

(assert (=> b!340514 m!343465))

(declare-fun m!343467 () Bool)

(assert (=> mapNonEmpty!12147 m!343467))

(declare-fun m!343469 () Bool)

(assert (=> start!34158 m!343469))

(declare-fun m!343471 () Bool)

(assert (=> start!34158 m!343471))

(declare-fun m!343473 () Bool)

(assert (=> start!34158 m!343473))

(declare-fun m!343475 () Bool)

(assert (=> b!340510 m!343475))

(declare-fun m!343477 () Bool)

(assert (=> b!340511 m!343477))

(check-sat (not b!340511) tp_is_empty!7147 b_and!14409 (not b!340509) (not b!340513) (not b!340510) (not b!340512) (not start!34158) (not mapNonEmpty!12147) (not b!340514) (not b!340517) (not b_next!7195))
(check-sat b_and!14409 (not b_next!7195))
