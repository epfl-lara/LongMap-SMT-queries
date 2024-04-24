; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34164 () Bool)

(assert start!34164)

(declare-fun b_free!7201 () Bool)

(declare-fun b_next!7201 () Bool)

(assert (=> start!34164 (= b_free!7201 (not b_next!7201))))

(declare-fun tp!25136 () Bool)

(declare-fun b_and!14415 () Bool)

(assert (=> start!34164 (= tp!25136 b_and!14415)))

(declare-fun b!340607 () Bool)

(declare-fun res!188189 () Bool)

(declare-fun e!208935 () Bool)

(assert (=> b!340607 (=> (not res!188189) (not e!208935))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10515 0))(
  ( (V!10516 (val!3621 Int)) )
))
(declare-datatypes ((ValueCell!3233 0))(
  ( (ValueCellFull!3233 (v!5794 V!10515)) (EmptyCell!3233) )
))
(declare-datatypes ((array!17892 0))(
  ( (array!17893 (arr!8466 (Array (_ BitVec 32) ValueCell!3233)) (size!8818 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17892)

(declare-datatypes ((array!17894 0))(
  ( (array!17895 (arr!8467 (Array (_ BitVec 32) (_ BitVec 64))) (size!8819 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17894)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340607 (= res!188189 (and (= (size!8818 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8819 _keys!1895) (size!8818 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12156 () Bool)

(declare-fun mapRes!12156 () Bool)

(assert (=> mapIsEmpty!12156 mapRes!12156))

(declare-fun b!340608 () Bool)

(declare-fun res!188186 () Bool)

(declare-fun e!208937 () Bool)

(assert (=> b!340608 (=> (not res!188186) (not e!208937))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340608 (= res!188186 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!188182 () Bool)

(assert (=> start!34164 (=> (not res!188182) (not e!208935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34164 (= res!188182 (validMask!0 mask!2385))))

(assert (=> start!34164 e!208935))

(assert (=> start!34164 true))

(declare-fun tp_is_empty!7153 () Bool)

(assert (=> start!34164 tp_is_empty!7153))

(assert (=> start!34164 tp!25136))

(declare-fun e!208938 () Bool)

(declare-fun array_inv!6274 (array!17892) Bool)

(assert (=> start!34164 (and (array_inv!6274 _values!1525) e!208938)))

(declare-fun array_inv!6275 (array!17894) Bool)

(assert (=> start!34164 (array_inv!6275 _keys!1895)))

(declare-fun b!340609 () Bool)

(assert (=> b!340609 (= e!208935 e!208937)))

(declare-fun res!188188 () Bool)

(assert (=> b!340609 (=> (not res!188188) (not e!208937))))

(declare-datatypes ((SeekEntryResult!3226 0))(
  ( (MissingZero!3226 (index!15083 (_ BitVec 32))) (Found!3226 (index!15084 (_ BitVec 32))) (Intermediate!3226 (undefined!4038 Bool) (index!15085 (_ BitVec 32)) (x!33881 (_ BitVec 32))) (Undefined!3226) (MissingVacant!3226 (index!15086 (_ BitVec 32))) )
))
(declare-fun lt!161647 () SeekEntryResult!3226)

(get-info :version)

(assert (=> b!340609 (= res!188188 (and (not ((_ is Found!3226) lt!161647)) (not ((_ is MissingZero!3226) lt!161647)) ((_ is MissingVacant!3226) lt!161647)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17894 (_ BitVec 32)) SeekEntryResult!3226)

(assert (=> b!340609 (= lt!161647 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340610 () Bool)

(declare-fun res!188187 () Bool)

(assert (=> b!340610 (=> (not res!188187) (not e!208935))))

(declare-datatypes ((List!4772 0))(
  ( (Nil!4769) (Cons!4768 (h!5624 (_ BitVec 64)) (t!9872 List!4772)) )
))
(declare-fun arrayNoDuplicates!0 (array!17894 (_ BitVec 32) List!4772) Bool)

(assert (=> b!340610 (= res!188187 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4769))))

(declare-fun b!340611 () Bool)

(declare-fun e!208936 () Bool)

(assert (=> b!340611 (= e!208938 (and e!208936 mapRes!12156))))

(declare-fun condMapEmpty!12156 () Bool)

(declare-fun mapDefault!12156 () ValueCell!3233)

(assert (=> b!340611 (= condMapEmpty!12156 (= (arr!8466 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3233)) mapDefault!12156)))))

(declare-fun b!340612 () Bool)

(assert (=> b!340612 (= e!208937 false)))

(declare-fun lt!161646 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17894 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340612 (= lt!161646 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340613 () Bool)

(declare-fun res!188184 () Bool)

(assert (=> b!340613 (=> (not res!188184) (not e!208935))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10515)

(declare-fun zeroValue!1467 () V!10515)

(declare-datatypes ((tuple2!5168 0))(
  ( (tuple2!5169 (_1!2595 (_ BitVec 64)) (_2!2595 V!10515)) )
))
(declare-datatypes ((List!4773 0))(
  ( (Nil!4770) (Cons!4769 (h!5625 tuple2!5168) (t!9873 List!4773)) )
))
(declare-datatypes ((ListLongMap!4083 0))(
  ( (ListLongMap!4084 (toList!2057 List!4773)) )
))
(declare-fun contains!2130 (ListLongMap!4083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1586 (array!17894 array!17892 (_ BitVec 32) (_ BitVec 32) V!10515 V!10515 (_ BitVec 32) Int) ListLongMap!4083)

(assert (=> b!340613 (= res!188184 (not (contains!2130 (getCurrentListMap!1586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340614 () Bool)

(declare-fun res!188183 () Bool)

(assert (=> b!340614 (=> (not res!188183) (not e!208935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17894 (_ BitVec 32)) Bool)

(assert (=> b!340614 (= res!188183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340615 () Bool)

(declare-fun e!208939 () Bool)

(assert (=> b!340615 (= e!208939 tp_is_empty!7153)))

(declare-fun mapNonEmpty!12156 () Bool)

(declare-fun tp!25137 () Bool)

(assert (=> mapNonEmpty!12156 (= mapRes!12156 (and tp!25137 e!208939))))

(declare-fun mapRest!12156 () (Array (_ BitVec 32) ValueCell!3233))

(declare-fun mapValue!12156 () ValueCell!3233)

(declare-fun mapKey!12156 () (_ BitVec 32))

(assert (=> mapNonEmpty!12156 (= (arr!8466 _values!1525) (store mapRest!12156 mapKey!12156 mapValue!12156))))

(declare-fun b!340616 () Bool)

(assert (=> b!340616 (= e!208936 tp_is_empty!7153)))

(declare-fun b!340617 () Bool)

(declare-fun res!188185 () Bool)

(assert (=> b!340617 (=> (not res!188185) (not e!208935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340617 (= res!188185 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34164 res!188182) b!340607))

(assert (= (and b!340607 res!188189) b!340614))

(assert (= (and b!340614 res!188183) b!340610))

(assert (= (and b!340610 res!188187) b!340617))

(assert (= (and b!340617 res!188185) b!340613))

(assert (= (and b!340613 res!188184) b!340609))

(assert (= (and b!340609 res!188188) b!340608))

(assert (= (and b!340608 res!188186) b!340612))

(assert (= (and b!340611 condMapEmpty!12156) mapIsEmpty!12156))

(assert (= (and b!340611 (not condMapEmpty!12156)) mapNonEmpty!12156))

(assert (= (and mapNonEmpty!12156 ((_ is ValueCellFull!3233) mapValue!12156)) b!340615))

(assert (= (and b!340611 ((_ is ValueCellFull!3233) mapDefault!12156)) b!340616))

(assert (= start!34164 b!340611))

(declare-fun m!343527 () Bool)

(assert (=> b!340610 m!343527))

(declare-fun m!343529 () Bool)

(assert (=> b!340608 m!343529))

(declare-fun m!343531 () Bool)

(assert (=> b!340614 m!343531))

(declare-fun m!343533 () Bool)

(assert (=> mapNonEmpty!12156 m!343533))

(declare-fun m!343535 () Bool)

(assert (=> b!340612 m!343535))

(declare-fun m!343537 () Bool)

(assert (=> b!340613 m!343537))

(assert (=> b!340613 m!343537))

(declare-fun m!343539 () Bool)

(assert (=> b!340613 m!343539))

(declare-fun m!343541 () Bool)

(assert (=> start!34164 m!343541))

(declare-fun m!343543 () Bool)

(assert (=> start!34164 m!343543))

(declare-fun m!343545 () Bool)

(assert (=> start!34164 m!343545))

(declare-fun m!343547 () Bool)

(assert (=> b!340609 m!343547))

(declare-fun m!343549 () Bool)

(assert (=> b!340617 m!343549))

(check-sat (not b!340610) (not b_next!7201) (not b!340613) b_and!14415 (not start!34164) (not b!340608) (not b!340617) (not mapNonEmpty!12156) tp_is_empty!7153 (not b!340609) (not b!340614) (not b!340612))
(check-sat b_and!14415 (not b_next!7201))
