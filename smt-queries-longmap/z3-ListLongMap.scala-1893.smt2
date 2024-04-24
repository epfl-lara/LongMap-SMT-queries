; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33834 () Bool)

(assert start!33834)

(declare-fun b_free!7027 () Bool)

(declare-fun b_next!7027 () Bool)

(assert (=> start!33834 (= b_free!7027 (not b_next!7027))))

(declare-fun tp!24593 () Bool)

(declare-fun b_and!14227 () Bool)

(assert (=> start!33834 (= tp!24593 b_and!14227)))

(declare-fun b!336712 () Bool)

(declare-fun res!185902 () Bool)

(declare-fun e!206663 () Bool)

(assert (=> b!336712 (=> (not res!185902) (not e!206663))))

(declare-datatypes ((array!17540 0))(
  ( (array!17541 (arr!8297 (Array (_ BitVec 32) (_ BitVec 64))) (size!8649 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17540)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17540 (_ BitVec 32)) Bool)

(assert (=> b!336712 (= res!185902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336713 () Bool)

(declare-fun res!185907 () Bool)

(assert (=> b!336713 (=> (not res!185907) (not e!206663))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10283 0))(
  ( (V!10284 (val!3534 Int)) )
))
(declare-fun zeroValue!1467 () V!10283)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3146 0))(
  ( (ValueCellFull!3146 (v!5700 V!10283)) (EmptyCell!3146) )
))
(declare-datatypes ((array!17542 0))(
  ( (array!17543 (arr!8298 (Array (_ BitVec 32) ValueCell!3146)) (size!8650 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17542)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10283)

(declare-datatypes ((tuple2!5050 0))(
  ( (tuple2!5051 (_1!2536 (_ BitVec 64)) (_2!2536 V!10283)) )
))
(declare-datatypes ((List!4666 0))(
  ( (Nil!4663) (Cons!4662 (h!5518 tuple2!5050) (t!9752 List!4666)) )
))
(declare-datatypes ((ListLongMap!3965 0))(
  ( (ListLongMap!3966 (toList!1998 List!4666)) )
))
(declare-fun contains!2064 (ListLongMap!3965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1527 (array!17540 array!17542 (_ BitVec 32) (_ BitVec 32) V!10283 V!10283 (_ BitVec 32) Int) ListLongMap!3965)

(assert (=> b!336713 (= res!185907 (not (contains!2064 (getCurrentListMap!1527 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!185905 () Bool)

(assert (=> start!33834 (=> (not res!185905) (not e!206663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33834 (= res!185905 (validMask!0 mask!2385))))

(assert (=> start!33834 e!206663))

(assert (=> start!33834 true))

(declare-fun tp_is_empty!6979 () Bool)

(assert (=> start!33834 tp_is_empty!6979))

(assert (=> start!33834 tp!24593))

(declare-fun e!206666 () Bool)

(declare-fun array_inv!6166 (array!17542) Bool)

(assert (=> start!33834 (and (array_inv!6166 _values!1525) e!206666)))

(declare-fun array_inv!6167 (array!17540) Bool)

(assert (=> start!33834 (array_inv!6167 _keys!1895)))

(declare-fun b!336714 () Bool)

(declare-fun e!206661 () Bool)

(assert (=> b!336714 (= e!206663 e!206661)))

(declare-fun res!185909 () Bool)

(assert (=> b!336714 (=> (not res!185909) (not e!206661))))

(declare-datatypes ((SeekEntryResult!3171 0))(
  ( (MissingZero!3171 (index!14863 (_ BitVec 32))) (Found!3171 (index!14864 (_ BitVec 32))) (Intermediate!3171 (undefined!3983 Bool) (index!14865 (_ BitVec 32)) (x!33524 (_ BitVec 32))) (Undefined!3171) (MissingVacant!3171 (index!14866 (_ BitVec 32))) )
))
(declare-fun lt!160330 () SeekEntryResult!3171)

(get-info :version)

(assert (=> b!336714 (= res!185909 (and (not ((_ is Found!3171) lt!160330)) ((_ is MissingZero!3171) lt!160330)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17540 (_ BitVec 32)) SeekEntryResult!3171)

(assert (=> b!336714 (= lt!160330 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336715 () Bool)

(declare-fun res!185904 () Bool)

(assert (=> b!336715 (=> (not res!185904) (not e!206663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336715 (= res!185904 (validKeyInArray!0 k0!1348))))

(declare-fun b!336716 () Bool)

(declare-fun res!185906 () Bool)

(assert (=> b!336716 (=> (not res!185906) (not e!206661))))

(declare-fun arrayContainsKey!0 (array!17540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336716 (= res!185906 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336717 () Bool)

(declare-fun e!206662 () Bool)

(assert (=> b!336717 (= e!206662 tp_is_empty!6979)))

(declare-fun mapIsEmpty!11874 () Bool)

(declare-fun mapRes!11874 () Bool)

(assert (=> mapIsEmpty!11874 mapRes!11874))

(declare-fun mapNonEmpty!11874 () Bool)

(declare-fun tp!24594 () Bool)

(declare-fun e!206664 () Bool)

(assert (=> mapNonEmpty!11874 (= mapRes!11874 (and tp!24594 e!206664))))

(declare-fun mapRest!11874 () (Array (_ BitVec 32) ValueCell!3146))

(declare-fun mapValue!11874 () ValueCell!3146)

(declare-fun mapKey!11874 () (_ BitVec 32))

(assert (=> mapNonEmpty!11874 (= (arr!8298 _values!1525) (store mapRest!11874 mapKey!11874 mapValue!11874))))

(declare-fun b!336718 () Bool)

(assert (=> b!336718 (= e!206666 (and e!206662 mapRes!11874))))

(declare-fun condMapEmpty!11874 () Bool)

(declare-fun mapDefault!11874 () ValueCell!3146)

(assert (=> b!336718 (= condMapEmpty!11874 (= (arr!8298 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3146)) mapDefault!11874)))))

(declare-fun b!336719 () Bool)

(declare-fun res!185908 () Bool)

(assert (=> b!336719 (=> (not res!185908) (not e!206663))))

(assert (=> b!336719 (= res!185908 (and (= (size!8650 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8649 _keys!1895) (size!8650 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336720 () Bool)

(assert (=> b!336720 (= e!206664 tp_is_empty!6979)))

(declare-fun b!336721 () Bool)

(assert (=> b!336721 (= e!206661 false)))

(declare-fun lt!160329 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17540 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336721 (= lt!160329 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336722 () Bool)

(declare-fun res!185903 () Bool)

(assert (=> b!336722 (=> (not res!185903) (not e!206663))))

(declare-datatypes ((List!4667 0))(
  ( (Nil!4664) (Cons!4663 (h!5519 (_ BitVec 64)) (t!9753 List!4667)) )
))
(declare-fun arrayNoDuplicates!0 (array!17540 (_ BitVec 32) List!4667) Bool)

(assert (=> b!336722 (= res!185903 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4664))))

(assert (= (and start!33834 res!185905) b!336719))

(assert (= (and b!336719 res!185908) b!336712))

(assert (= (and b!336712 res!185902) b!336722))

(assert (= (and b!336722 res!185903) b!336715))

(assert (= (and b!336715 res!185904) b!336713))

(assert (= (and b!336713 res!185907) b!336714))

(assert (= (and b!336714 res!185909) b!336716))

(assert (= (and b!336716 res!185906) b!336721))

(assert (= (and b!336718 condMapEmpty!11874) mapIsEmpty!11874))

(assert (= (and b!336718 (not condMapEmpty!11874)) mapNonEmpty!11874))

(assert (= (and mapNonEmpty!11874 ((_ is ValueCellFull!3146) mapValue!11874)) b!336720))

(assert (= (and b!336718 ((_ is ValueCellFull!3146) mapDefault!11874)) b!336717))

(assert (= start!33834 b!336718))

(declare-fun m!340699 () Bool)

(assert (=> b!336712 m!340699))

(declare-fun m!340701 () Bool)

(assert (=> b!336722 m!340701))

(declare-fun m!340703 () Bool)

(assert (=> b!336714 m!340703))

(declare-fun m!340705 () Bool)

(assert (=> b!336715 m!340705))

(declare-fun m!340707 () Bool)

(assert (=> b!336713 m!340707))

(assert (=> b!336713 m!340707))

(declare-fun m!340709 () Bool)

(assert (=> b!336713 m!340709))

(declare-fun m!340711 () Bool)

(assert (=> b!336716 m!340711))

(declare-fun m!340713 () Bool)

(assert (=> b!336721 m!340713))

(declare-fun m!340715 () Bool)

(assert (=> start!33834 m!340715))

(declare-fun m!340717 () Bool)

(assert (=> start!33834 m!340717))

(declare-fun m!340719 () Bool)

(assert (=> start!33834 m!340719))

(declare-fun m!340721 () Bool)

(assert (=> mapNonEmpty!11874 m!340721))

(check-sat (not b!336714) tp_is_empty!6979 (not b!336716) b_and!14227 (not start!33834) (not b!336722) (not b!336715) (not b!336713) (not mapNonEmpty!11874) (not b_next!7027) (not b!336712) (not b!336721))
(check-sat b_and!14227 (not b_next!7027))
