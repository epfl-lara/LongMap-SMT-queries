; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34170 () Bool)

(assert start!34170)

(declare-fun b_free!7207 () Bool)

(declare-fun b_next!7207 () Bool)

(assert (=> start!34170 (= b_free!7207 (not b_next!7207))))

(declare-fun tp!25155 () Bool)

(declare-fun b_and!14421 () Bool)

(assert (=> start!34170 (= tp!25155 b_and!14421)))

(declare-fun b!340706 () Bool)

(declare-fun e!208992 () Bool)

(declare-fun e!208993 () Bool)

(declare-fun mapRes!12165 () Bool)

(assert (=> b!340706 (= e!208992 (and e!208993 mapRes!12165))))

(declare-fun condMapEmpty!12165 () Bool)

(declare-datatypes ((V!10523 0))(
  ( (V!10524 (val!3624 Int)) )
))
(declare-datatypes ((ValueCell!3236 0))(
  ( (ValueCellFull!3236 (v!5797 V!10523)) (EmptyCell!3236) )
))
(declare-datatypes ((array!17904 0))(
  ( (array!17905 (arr!8472 (Array (_ BitVec 32) ValueCell!3236)) (size!8824 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17904)

(declare-fun mapDefault!12165 () ValueCell!3236)

(assert (=> b!340706 (= condMapEmpty!12165 (= (arr!8472 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3236)) mapDefault!12165)))))

(declare-fun b!340707 () Bool)

(declare-fun res!188257 () Bool)

(declare-fun e!208989 () Bool)

(assert (=> b!340707 (=> (not res!188257) (not e!208989))))

(declare-datatypes ((array!17906 0))(
  ( (array!17907 (arr!8473 (Array (_ BitVec 32) (_ BitVec 64))) (size!8825 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17906)

(declare-datatypes ((List!4776 0))(
  ( (Nil!4773) (Cons!4772 (h!5628 (_ BitVec 64)) (t!9876 List!4776)) )
))
(declare-fun arrayNoDuplicates!0 (array!17906 (_ BitVec 32) List!4776) Bool)

(assert (=> b!340707 (= res!188257 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4773))))

(declare-fun res!188259 () Bool)

(assert (=> start!34170 (=> (not res!188259) (not e!208989))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34170 (= res!188259 (validMask!0 mask!2385))))

(assert (=> start!34170 e!208989))

(assert (=> start!34170 true))

(declare-fun tp_is_empty!7159 () Bool)

(assert (=> start!34170 tp_is_empty!7159))

(assert (=> start!34170 tp!25155))

(declare-fun array_inv!6276 (array!17904) Bool)

(assert (=> start!34170 (and (array_inv!6276 _values!1525) e!208992)))

(declare-fun array_inv!6277 (array!17906) Bool)

(assert (=> start!34170 (array_inv!6277 _keys!1895)))

(declare-fun b!340708 () Bool)

(declare-fun res!188255 () Bool)

(assert (=> b!340708 (=> (not res!188255) (not e!208989))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340708 (= res!188255 (validKeyInArray!0 k0!1348))))

(declare-fun b!340709 () Bool)

(declare-fun res!188256 () Bool)

(assert (=> b!340709 (=> (not res!188256) (not e!208989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17906 (_ BitVec 32)) Bool)

(assert (=> b!340709 (= res!188256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340710 () Bool)

(declare-fun e!208994 () Bool)

(assert (=> b!340710 (= e!208994 false)))

(declare-fun lt!161664 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17906 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340710 (= lt!161664 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340711 () Bool)

(declare-fun res!188258 () Bool)

(assert (=> b!340711 (=> (not res!188258) (not e!208989))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340711 (= res!188258 (and (= (size!8824 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8825 _keys!1895) (size!8824 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12165 () Bool)

(assert (=> mapIsEmpty!12165 mapRes!12165))

(declare-fun b!340712 () Bool)

(assert (=> b!340712 (= e!208993 tp_is_empty!7159)))

(declare-fun b!340713 () Bool)

(declare-fun res!188260 () Bool)

(assert (=> b!340713 (=> (not res!188260) (not e!208989))))

(declare-fun zeroValue!1467 () V!10523)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10523)

(declare-datatypes ((tuple2!5172 0))(
  ( (tuple2!5173 (_1!2597 (_ BitVec 64)) (_2!2597 V!10523)) )
))
(declare-datatypes ((List!4777 0))(
  ( (Nil!4774) (Cons!4773 (h!5629 tuple2!5172) (t!9877 List!4777)) )
))
(declare-datatypes ((ListLongMap!4087 0))(
  ( (ListLongMap!4088 (toList!2059 List!4777)) )
))
(declare-fun contains!2132 (ListLongMap!4087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1588 (array!17906 array!17904 (_ BitVec 32) (_ BitVec 32) V!10523 V!10523 (_ BitVec 32) Int) ListLongMap!4087)

(assert (=> b!340713 (= res!188260 (not (contains!2132 (getCurrentListMap!1588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340714 () Bool)

(assert (=> b!340714 (= e!208989 e!208994)))

(declare-fun res!188254 () Bool)

(assert (=> b!340714 (=> (not res!188254) (not e!208994))))

(declare-datatypes ((SeekEntryResult!3227 0))(
  ( (MissingZero!3227 (index!15087 (_ BitVec 32))) (Found!3227 (index!15088 (_ BitVec 32))) (Intermediate!3227 (undefined!4039 Bool) (index!15089 (_ BitVec 32)) (x!33890 (_ BitVec 32))) (Undefined!3227) (MissingVacant!3227 (index!15090 (_ BitVec 32))) )
))
(declare-fun lt!161665 () SeekEntryResult!3227)

(get-info :version)

(assert (=> b!340714 (= res!188254 (and (not ((_ is Found!3227) lt!161665)) (not ((_ is MissingZero!3227) lt!161665)) ((_ is MissingVacant!3227) lt!161665)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17906 (_ BitVec 32)) SeekEntryResult!3227)

(assert (=> b!340714 (= lt!161665 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12165 () Bool)

(declare-fun tp!25154 () Bool)

(declare-fun e!208990 () Bool)

(assert (=> mapNonEmpty!12165 (= mapRes!12165 (and tp!25154 e!208990))))

(declare-fun mapRest!12165 () (Array (_ BitVec 32) ValueCell!3236))

(declare-fun mapValue!12165 () ValueCell!3236)

(declare-fun mapKey!12165 () (_ BitVec 32))

(assert (=> mapNonEmpty!12165 (= (arr!8472 _values!1525) (store mapRest!12165 mapKey!12165 mapValue!12165))))

(declare-fun b!340715 () Bool)

(assert (=> b!340715 (= e!208990 tp_is_empty!7159)))

(declare-fun b!340716 () Bool)

(declare-fun res!188261 () Bool)

(assert (=> b!340716 (=> (not res!188261) (not e!208994))))

(declare-fun arrayContainsKey!0 (array!17906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340716 (= res!188261 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34170 res!188259) b!340711))

(assert (= (and b!340711 res!188258) b!340709))

(assert (= (and b!340709 res!188256) b!340707))

(assert (= (and b!340707 res!188257) b!340708))

(assert (= (and b!340708 res!188255) b!340713))

(assert (= (and b!340713 res!188260) b!340714))

(assert (= (and b!340714 res!188254) b!340716))

(assert (= (and b!340716 res!188261) b!340710))

(assert (= (and b!340706 condMapEmpty!12165) mapIsEmpty!12165))

(assert (= (and b!340706 (not condMapEmpty!12165)) mapNonEmpty!12165))

(assert (= (and mapNonEmpty!12165 ((_ is ValueCellFull!3236) mapValue!12165)) b!340715))

(assert (= (and b!340706 ((_ is ValueCellFull!3236) mapDefault!12165)) b!340712))

(assert (= start!34170 b!340706))

(declare-fun m!343599 () Bool)

(assert (=> b!340716 m!343599))

(declare-fun m!343601 () Bool)

(assert (=> b!340713 m!343601))

(assert (=> b!340713 m!343601))

(declare-fun m!343603 () Bool)

(assert (=> b!340713 m!343603))

(declare-fun m!343605 () Bool)

(assert (=> b!340709 m!343605))

(declare-fun m!343607 () Bool)

(assert (=> b!340708 m!343607))

(declare-fun m!343609 () Bool)

(assert (=> b!340707 m!343609))

(declare-fun m!343611 () Bool)

(assert (=> mapNonEmpty!12165 m!343611))

(declare-fun m!343613 () Bool)

(assert (=> b!340710 m!343613))

(declare-fun m!343615 () Bool)

(assert (=> b!340714 m!343615))

(declare-fun m!343617 () Bool)

(assert (=> start!34170 m!343617))

(declare-fun m!343619 () Bool)

(assert (=> start!34170 m!343619))

(declare-fun m!343621 () Bool)

(assert (=> start!34170 m!343621))

(check-sat (not b!340716) (not b!340707) (not b!340709) (not b_next!7207) b_and!14421 (not mapNonEmpty!12165) (not b!340708) (not b!340714) (not b!340710) (not start!34170) (not b!340713) tp_is_empty!7159)
(check-sat b_and!14421 (not b_next!7207))
