; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34158 () Bool)

(assert start!34158)

(declare-fun b_free!7195 () Bool)

(declare-fun b_next!7195 () Bool)

(assert (=> start!34158 (= b_free!7195 (not b_next!7195))))

(declare-fun tp!25119 () Bool)

(declare-fun b_and!14369 () Bool)

(assert (=> start!34158 (= tp!25119 b_and!14369)))

(declare-fun b!340286 () Bool)

(declare-fun e!208739 () Bool)

(declare-fun tp_is_empty!7147 () Bool)

(assert (=> b!340286 (= e!208739 tp_is_empty!7147)))

(declare-fun mapNonEmpty!12147 () Bool)

(declare-fun mapRes!12147 () Bool)

(declare-fun tp!25118 () Bool)

(assert (=> mapNonEmpty!12147 (= mapRes!12147 (and tp!25118 e!208739))))

(declare-datatypes ((V!10507 0))(
  ( (V!10508 (val!3618 Int)) )
))
(declare-datatypes ((ValueCell!3230 0))(
  ( (ValueCellFull!3230 (v!5784 V!10507)) (EmptyCell!3230) )
))
(declare-fun mapValue!12147 () ValueCell!3230)

(declare-fun mapRest!12147 () (Array (_ BitVec 32) ValueCell!3230))

(declare-fun mapKey!12147 () (_ BitVec 32))

(declare-datatypes ((array!17869 0))(
  ( (array!17870 (arr!8455 (Array (_ BitVec 32) ValueCell!3230)) (size!8808 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17869)

(assert (=> mapNonEmpty!12147 (= (arr!8455 _values!1525) (store mapRest!12147 mapKey!12147 mapValue!12147))))

(declare-fun b!340288 () Bool)

(declare-fun e!208743 () Bool)

(assert (=> b!340288 (= e!208743 tp_is_empty!7147)))

(declare-fun b!340289 () Bool)

(declare-fun e!208740 () Bool)

(assert (=> b!340289 (= e!208740 (and e!208743 mapRes!12147))))

(declare-fun condMapEmpty!12147 () Bool)

(declare-fun mapDefault!12147 () ValueCell!3230)

(assert (=> b!340289 (= condMapEmpty!12147 (= (arr!8455 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3230)) mapDefault!12147)))))

(declare-fun b!340290 () Bool)

(declare-fun res!187985 () Bool)

(declare-fun e!208744 () Bool)

(assert (=> b!340290 (=> (not res!187985) (not e!208744))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340290 (= res!187985 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12147 () Bool)

(assert (=> mapIsEmpty!12147 mapRes!12147))

(declare-fun b!340287 () Bool)

(declare-fun res!187988 () Bool)

(assert (=> b!340287 (=> (not res!187988) (not e!208744))))

(declare-datatypes ((array!17871 0))(
  ( (array!17872 (arr!8456 (Array (_ BitVec 32) (_ BitVec 64))) (size!8809 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17871)

(declare-datatypes ((List!4814 0))(
  ( (Nil!4811) (Cons!4810 (h!5666 (_ BitVec 64)) (t!9913 List!4814)) )
))
(declare-fun arrayNoDuplicates!0 (array!17871 (_ BitVec 32) List!4814) Bool)

(assert (=> b!340287 (= res!187988 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4811))))

(declare-fun res!187984 () Bool)

(assert (=> start!34158 (=> (not res!187984) (not e!208744))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34158 (= res!187984 (validMask!0 mask!2385))))

(assert (=> start!34158 e!208744))

(assert (=> start!34158 true))

(assert (=> start!34158 tp_is_empty!7147))

(assert (=> start!34158 tp!25119))

(declare-fun array_inv!6292 (array!17869) Bool)

(assert (=> start!34158 (and (array_inv!6292 _values!1525) e!208740)))

(declare-fun array_inv!6293 (array!17871) Bool)

(assert (=> start!34158 (array_inv!6293 _keys!1895)))

(declare-fun b!340291 () Bool)

(declare-fun e!208741 () Bool)

(assert (=> b!340291 (= e!208741 false)))

(declare-fun lt!161376 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17871 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340291 (= lt!161376 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340292 () Bool)

(declare-fun res!187990 () Bool)

(assert (=> b!340292 (=> (not res!187990) (not e!208744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17871 (_ BitVec 32)) Bool)

(assert (=> b!340292 (= res!187990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340293 () Bool)

(declare-fun res!187989 () Bool)

(assert (=> b!340293 (=> (not res!187989) (not e!208744))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340293 (= res!187989 (and (= (size!8808 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8809 _keys!1895) (size!8808 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340294 () Bool)

(assert (=> b!340294 (= e!208744 e!208741)))

(declare-fun res!187991 () Bool)

(assert (=> b!340294 (=> (not res!187991) (not e!208741))))

(declare-datatypes ((SeekEntryResult!3257 0))(
  ( (MissingZero!3257 (index!15207 (_ BitVec 32))) (Found!3257 (index!15208 (_ BitVec 32))) (Intermediate!3257 (undefined!4069 Bool) (index!15209 (_ BitVec 32)) (x!33902 (_ BitVec 32))) (Undefined!3257) (MissingVacant!3257 (index!15210 (_ BitVec 32))) )
))
(declare-fun lt!161375 () SeekEntryResult!3257)

(get-info :version)

(assert (=> b!340294 (= res!187991 (and (not ((_ is Found!3257) lt!161375)) (not ((_ is MissingZero!3257) lt!161375)) ((_ is MissingVacant!3257) lt!161375)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17871 (_ BitVec 32)) SeekEntryResult!3257)

(assert (=> b!340294 (= lt!161375 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340295 () Bool)

(declare-fun res!187987 () Bool)

(assert (=> b!340295 (=> (not res!187987) (not e!208741))))

(declare-fun arrayContainsKey!0 (array!17871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340295 (= res!187987 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340296 () Bool)

(declare-fun res!187986 () Bool)

(assert (=> b!340296 (=> (not res!187986) (not e!208744))))

(declare-fun zeroValue!1467 () V!10507)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10507)

(declare-datatypes ((tuple2!5190 0))(
  ( (tuple2!5191 (_1!2606 (_ BitVec 64)) (_2!2606 V!10507)) )
))
(declare-datatypes ((List!4815 0))(
  ( (Nil!4812) (Cons!4811 (h!5667 tuple2!5190) (t!9914 List!4815)) )
))
(declare-datatypes ((ListLongMap!4093 0))(
  ( (ListLongMap!4094 (toList!2062 List!4815)) )
))
(declare-fun contains!2127 (ListLongMap!4093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1568 (array!17871 array!17869 (_ BitVec 32) (_ BitVec 32) V!10507 V!10507 (_ BitVec 32) Int) ListLongMap!4093)

(assert (=> b!340296 (= res!187986 (not (contains!2127 (getCurrentListMap!1568 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34158 res!187984) b!340293))

(assert (= (and b!340293 res!187989) b!340292))

(assert (= (and b!340292 res!187990) b!340287))

(assert (= (and b!340287 res!187988) b!340290))

(assert (= (and b!340290 res!187985) b!340296))

(assert (= (and b!340296 res!187986) b!340294))

(assert (= (and b!340294 res!187991) b!340295))

(assert (= (and b!340295 res!187987) b!340291))

(assert (= (and b!340289 condMapEmpty!12147) mapIsEmpty!12147))

(assert (= (and b!340289 (not condMapEmpty!12147)) mapNonEmpty!12147))

(assert (= (and mapNonEmpty!12147 ((_ is ValueCellFull!3230) mapValue!12147)) b!340286))

(assert (= (and b!340289 ((_ is ValueCellFull!3230) mapDefault!12147)) b!340288))

(assert (= start!34158 b!340289))

(declare-fun m!342501 () Bool)

(assert (=> b!340292 m!342501))

(declare-fun m!342503 () Bool)

(assert (=> b!340287 m!342503))

(declare-fun m!342505 () Bool)

(assert (=> b!340291 m!342505))

(declare-fun m!342507 () Bool)

(assert (=> b!340290 m!342507))

(declare-fun m!342509 () Bool)

(assert (=> start!34158 m!342509))

(declare-fun m!342511 () Bool)

(assert (=> start!34158 m!342511))

(declare-fun m!342513 () Bool)

(assert (=> start!34158 m!342513))

(declare-fun m!342515 () Bool)

(assert (=> b!340294 m!342515))

(declare-fun m!342517 () Bool)

(assert (=> mapNonEmpty!12147 m!342517))

(declare-fun m!342519 () Bool)

(assert (=> b!340296 m!342519))

(assert (=> b!340296 m!342519))

(declare-fun m!342521 () Bool)

(assert (=> b!340296 m!342521))

(declare-fun m!342523 () Bool)

(assert (=> b!340295 m!342523))

(check-sat (not b!340290) (not b!340295) (not b!340292) (not b!340291) (not mapNonEmpty!12147) (not b!340294) tp_is_empty!7147 (not start!34158) (not b_next!7195) b_and!14369 (not b!340296) (not b!340287))
(check-sat b_and!14369 (not b_next!7195))
