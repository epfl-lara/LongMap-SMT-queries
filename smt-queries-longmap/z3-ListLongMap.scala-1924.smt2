; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34176 () Bool)

(assert start!34176)

(declare-fun b_free!7213 () Bool)

(declare-fun b_next!7213 () Bool)

(assert (=> start!34176 (= b_free!7213 (not b_next!7213))))

(declare-fun tp!25172 () Bool)

(declare-fun b_and!14427 () Bool)

(assert (=> start!34176 (= tp!25172 b_and!14427)))

(declare-fun mapIsEmpty!12174 () Bool)

(declare-fun mapRes!12174 () Bool)

(assert (=> mapIsEmpty!12174 mapRes!12174))

(declare-fun b!340805 () Bool)

(declare-fun e!209045 () Bool)

(declare-fun tp_is_empty!7165 () Bool)

(assert (=> b!340805 (= e!209045 tp_is_empty!7165)))

(declare-fun b!340806 () Bool)

(declare-fun e!209047 () Bool)

(declare-fun e!209043 () Bool)

(assert (=> b!340806 (= e!209047 (and e!209043 mapRes!12174))))

(declare-fun condMapEmpty!12174 () Bool)

(declare-datatypes ((V!10531 0))(
  ( (V!10532 (val!3627 Int)) )
))
(declare-datatypes ((ValueCell!3239 0))(
  ( (ValueCellFull!3239 (v!5800 V!10531)) (EmptyCell!3239) )
))
(declare-datatypes ((array!17916 0))(
  ( (array!17917 (arr!8478 (Array (_ BitVec 32) ValueCell!3239)) (size!8830 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17916)

(declare-fun mapDefault!12174 () ValueCell!3239)

(assert (=> b!340806 (= condMapEmpty!12174 (= (arr!8478 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3239)) mapDefault!12174)))))

(declare-fun b!340807 () Bool)

(declare-fun res!188326 () Bool)

(declare-fun e!209048 () Bool)

(assert (=> b!340807 (=> (not res!188326) (not e!209048))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17918 0))(
  ( (array!17919 (arr!8479 (Array (_ BitVec 32) (_ BitVec 64))) (size!8831 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17918)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10531)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10531)

(declare-datatypes ((tuple2!5174 0))(
  ( (tuple2!5175 (_1!2598 (_ BitVec 64)) (_2!2598 V!10531)) )
))
(declare-datatypes ((List!4779 0))(
  ( (Nil!4776) (Cons!4775 (h!5631 tuple2!5174) (t!9879 List!4779)) )
))
(declare-datatypes ((ListLongMap!4089 0))(
  ( (ListLongMap!4090 (toList!2060 List!4779)) )
))
(declare-fun contains!2133 (ListLongMap!4089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1589 (array!17918 array!17916 (_ BitVec 32) (_ BitVec 32) V!10531 V!10531 (_ BitVec 32) Int) ListLongMap!4089)

(assert (=> b!340807 (= res!188326 (not (contains!2133 (getCurrentListMap!1589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340808 () Bool)

(declare-fun res!188328 () Bool)

(assert (=> b!340808 (=> (not res!188328) (not e!209048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340808 (= res!188328 (validKeyInArray!0 k0!1348))))

(declare-fun res!188331 () Bool)

(assert (=> start!34176 (=> (not res!188331) (not e!209048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34176 (= res!188331 (validMask!0 mask!2385))))

(assert (=> start!34176 e!209048))

(assert (=> start!34176 true))

(assert (=> start!34176 tp_is_empty!7165))

(assert (=> start!34176 tp!25172))

(declare-fun array_inv!6280 (array!17916) Bool)

(assert (=> start!34176 (and (array_inv!6280 _values!1525) e!209047)))

(declare-fun array_inv!6281 (array!17918) Bool)

(assert (=> start!34176 (array_inv!6281 _keys!1895)))

(declare-fun b!340809 () Bool)

(declare-fun res!188329 () Bool)

(assert (=> b!340809 (=> (not res!188329) (not e!209048))))

(declare-datatypes ((List!4780 0))(
  ( (Nil!4777) (Cons!4776 (h!5632 (_ BitVec 64)) (t!9880 List!4780)) )
))
(declare-fun arrayNoDuplicates!0 (array!17918 (_ BitVec 32) List!4780) Bool)

(assert (=> b!340809 (= res!188329 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4777))))

(declare-fun b!340810 () Bool)

(declare-fun e!209046 () Bool)

(assert (=> b!340810 (= e!209046 false)))

(declare-fun lt!161683 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17918 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340810 (= lt!161683 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340811 () Bool)

(assert (=> b!340811 (= e!209043 tp_is_empty!7165)))

(declare-fun b!340812 () Bool)

(assert (=> b!340812 (= e!209048 e!209046)))

(declare-fun res!188327 () Bool)

(assert (=> b!340812 (=> (not res!188327) (not e!209046))))

(declare-datatypes ((SeekEntryResult!3229 0))(
  ( (MissingZero!3229 (index!15095 (_ BitVec 32))) (Found!3229 (index!15096 (_ BitVec 32))) (Intermediate!3229 (undefined!4041 Bool) (index!15097 (_ BitVec 32)) (x!33900 (_ BitVec 32))) (Undefined!3229) (MissingVacant!3229 (index!15098 (_ BitVec 32))) )
))
(declare-fun lt!161682 () SeekEntryResult!3229)

(get-info :version)

(assert (=> b!340812 (= res!188327 (and (not ((_ is Found!3229) lt!161682)) (not ((_ is MissingZero!3229) lt!161682)) ((_ is MissingVacant!3229) lt!161682)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17918 (_ BitVec 32)) SeekEntryResult!3229)

(assert (=> b!340812 (= lt!161682 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340813 () Bool)

(declare-fun res!188330 () Bool)

(assert (=> b!340813 (=> (not res!188330) (not e!209046))))

(declare-fun arrayContainsKey!0 (array!17918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340813 (= res!188330 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12174 () Bool)

(declare-fun tp!25173 () Bool)

(assert (=> mapNonEmpty!12174 (= mapRes!12174 (and tp!25173 e!209045))))

(declare-fun mapValue!12174 () ValueCell!3239)

(declare-fun mapKey!12174 () (_ BitVec 32))

(declare-fun mapRest!12174 () (Array (_ BitVec 32) ValueCell!3239))

(assert (=> mapNonEmpty!12174 (= (arr!8478 _values!1525) (store mapRest!12174 mapKey!12174 mapValue!12174))))

(declare-fun b!340814 () Bool)

(declare-fun res!188332 () Bool)

(assert (=> b!340814 (=> (not res!188332) (not e!209048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17918 (_ BitVec 32)) Bool)

(assert (=> b!340814 (= res!188332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340815 () Bool)

(declare-fun res!188333 () Bool)

(assert (=> b!340815 (=> (not res!188333) (not e!209048))))

(assert (=> b!340815 (= res!188333 (and (= (size!8830 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8831 _keys!1895) (size!8830 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34176 res!188331) b!340815))

(assert (= (and b!340815 res!188333) b!340814))

(assert (= (and b!340814 res!188332) b!340809))

(assert (= (and b!340809 res!188329) b!340808))

(assert (= (and b!340808 res!188328) b!340807))

(assert (= (and b!340807 res!188326) b!340812))

(assert (= (and b!340812 res!188327) b!340813))

(assert (= (and b!340813 res!188330) b!340810))

(assert (= (and b!340806 condMapEmpty!12174) mapIsEmpty!12174))

(assert (= (and b!340806 (not condMapEmpty!12174)) mapNonEmpty!12174))

(assert (= (and mapNonEmpty!12174 ((_ is ValueCellFull!3239) mapValue!12174)) b!340805))

(assert (= (and b!340806 ((_ is ValueCellFull!3239) mapDefault!12174)) b!340811))

(assert (= start!34176 b!340806))

(declare-fun m!343671 () Bool)

(assert (=> b!340812 m!343671))

(declare-fun m!343673 () Bool)

(assert (=> start!34176 m!343673))

(declare-fun m!343675 () Bool)

(assert (=> start!34176 m!343675))

(declare-fun m!343677 () Bool)

(assert (=> start!34176 m!343677))

(declare-fun m!343679 () Bool)

(assert (=> b!340813 m!343679))

(declare-fun m!343681 () Bool)

(assert (=> b!340807 m!343681))

(assert (=> b!340807 m!343681))

(declare-fun m!343683 () Bool)

(assert (=> b!340807 m!343683))

(declare-fun m!343685 () Bool)

(assert (=> b!340814 m!343685))

(declare-fun m!343687 () Bool)

(assert (=> b!340808 m!343687))

(declare-fun m!343689 () Bool)

(assert (=> b!340810 m!343689))

(declare-fun m!343691 () Bool)

(assert (=> mapNonEmpty!12174 m!343691))

(declare-fun m!343693 () Bool)

(assert (=> b!340809 m!343693))

(check-sat (not b!340807) (not b!340810) b_and!14427 (not b!340809) (not b!340813) (not mapNonEmpty!12174) (not b!340814) (not b!340812) (not b!340808) (not start!34176) (not b_next!7213) tp_is_empty!7165)
(check-sat b_and!14427 (not b_next!7213))
