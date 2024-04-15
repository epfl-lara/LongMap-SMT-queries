; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34200 () Bool)

(assert start!34200)

(declare-fun b_free!7237 () Bool)

(declare-fun b_next!7237 () Bool)

(assert (=> start!34200 (= b_free!7237 (not b_next!7237))))

(declare-fun tp!25244 () Bool)

(declare-fun b_and!14411 () Bool)

(assert (=> start!34200 (= tp!25244 b_and!14411)))

(declare-fun b!340979 () Bool)

(declare-fun res!188494 () Bool)

(declare-fun e!209118 () Bool)

(assert (=> b!340979 (=> (not res!188494) (not e!209118))))

(declare-datatypes ((array!17953 0))(
  ( (array!17954 (arr!8497 (Array (_ BitVec 32) (_ BitVec 64))) (size!8850 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17953)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340979 (= res!188494 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340980 () Bool)

(assert (=> b!340980 (= e!209118 false)))

(declare-fun lt!161501 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17953 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340980 (= lt!161501 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340981 () Bool)

(declare-fun e!209120 () Bool)

(assert (=> b!340981 (= e!209120 e!209118)))

(declare-fun res!188495 () Bool)

(assert (=> b!340981 (=> (not res!188495) (not e!209118))))

(declare-datatypes ((SeekEntryResult!3273 0))(
  ( (MissingZero!3273 (index!15271 (_ BitVec 32))) (Found!3273 (index!15272 (_ BitVec 32))) (Intermediate!3273 (undefined!4085 Bool) (index!15273 (_ BitVec 32)) (x!33974 (_ BitVec 32))) (Undefined!3273) (MissingVacant!3273 (index!15274 (_ BitVec 32))) )
))
(declare-fun lt!161502 () SeekEntryResult!3273)

(get-info :version)

(assert (=> b!340981 (= res!188495 (and (not ((_ is Found!3273) lt!161502)) (not ((_ is MissingZero!3273) lt!161502)) ((_ is MissingVacant!3273) lt!161502)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17953 (_ BitVec 32)) SeekEntryResult!3273)

(assert (=> b!340981 (= lt!161502 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340982 () Bool)

(declare-fun res!188488 () Bool)

(assert (=> b!340982 (=> (not res!188488) (not e!209120))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10563 0))(
  ( (V!10564 (val!3639 Int)) )
))
(declare-datatypes ((ValueCell!3251 0))(
  ( (ValueCellFull!3251 (v!5805 V!10563)) (EmptyCell!3251) )
))
(declare-datatypes ((array!17955 0))(
  ( (array!17956 (arr!8498 (Array (_ BitVec 32) ValueCell!3251)) (size!8851 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17955)

(assert (=> b!340982 (= res!188488 (and (= (size!8851 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8850 _keys!1895) (size!8851 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12210 () Bool)

(declare-fun mapRes!12210 () Bool)

(assert (=> mapIsEmpty!12210 mapRes!12210))

(declare-fun mapNonEmpty!12210 () Bool)

(declare-fun tp!25245 () Bool)

(declare-fun e!209119 () Bool)

(assert (=> mapNonEmpty!12210 (= mapRes!12210 (and tp!25245 e!209119))))

(declare-fun mapKey!12210 () (_ BitVec 32))

(declare-fun mapRest!12210 () (Array (_ BitVec 32) ValueCell!3251))

(declare-fun mapValue!12210 () ValueCell!3251)

(assert (=> mapNonEmpty!12210 (= (arr!8498 _values!1525) (store mapRest!12210 mapKey!12210 mapValue!12210))))

(declare-fun b!340983 () Bool)

(declare-fun e!209122 () Bool)

(declare-fun e!209117 () Bool)

(assert (=> b!340983 (= e!209122 (and e!209117 mapRes!12210))))

(declare-fun condMapEmpty!12210 () Bool)

(declare-fun mapDefault!12210 () ValueCell!3251)

(assert (=> b!340983 (= condMapEmpty!12210 (= (arr!8498 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3251)) mapDefault!12210)))))

(declare-fun b!340984 () Bool)

(declare-fun tp_is_empty!7189 () Bool)

(assert (=> b!340984 (= e!209117 tp_is_empty!7189)))

(declare-fun b!340985 () Bool)

(declare-fun res!188492 () Bool)

(assert (=> b!340985 (=> (not res!188492) (not e!209120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17953 (_ BitVec 32)) Bool)

(assert (=> b!340985 (= res!188492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340987 () Bool)

(assert (=> b!340987 (= e!209119 tp_is_empty!7189)))

(declare-fun b!340988 () Bool)

(declare-fun res!188489 () Bool)

(assert (=> b!340988 (=> (not res!188489) (not e!209120))))

(declare-datatypes ((List!4842 0))(
  ( (Nil!4839) (Cons!4838 (h!5694 (_ BitVec 64)) (t!9941 List!4842)) )
))
(declare-fun arrayNoDuplicates!0 (array!17953 (_ BitVec 32) List!4842) Bool)

(assert (=> b!340988 (= res!188489 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4839))))

(declare-fun b!340989 () Bool)

(declare-fun res!188491 () Bool)

(assert (=> b!340989 (=> (not res!188491) (not e!209120))))

(declare-fun zeroValue!1467 () V!10563)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10563)

(declare-datatypes ((tuple2!5218 0))(
  ( (tuple2!5219 (_1!2620 (_ BitVec 64)) (_2!2620 V!10563)) )
))
(declare-datatypes ((List!4843 0))(
  ( (Nil!4840) (Cons!4839 (h!5695 tuple2!5218) (t!9942 List!4843)) )
))
(declare-datatypes ((ListLongMap!4121 0))(
  ( (ListLongMap!4122 (toList!2076 List!4843)) )
))
(declare-fun contains!2141 (ListLongMap!4121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1582 (array!17953 array!17955 (_ BitVec 32) (_ BitVec 32) V!10563 V!10563 (_ BitVec 32) Int) ListLongMap!4121)

(assert (=> b!340989 (= res!188491 (not (contains!2141 (getCurrentListMap!1582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!188493 () Bool)

(assert (=> start!34200 (=> (not res!188493) (not e!209120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34200 (= res!188493 (validMask!0 mask!2385))))

(assert (=> start!34200 e!209120))

(assert (=> start!34200 true))

(assert (=> start!34200 tp_is_empty!7189))

(assert (=> start!34200 tp!25244))

(declare-fun array_inv!6322 (array!17955) Bool)

(assert (=> start!34200 (and (array_inv!6322 _values!1525) e!209122)))

(declare-fun array_inv!6323 (array!17953) Bool)

(assert (=> start!34200 (array_inv!6323 _keys!1895)))

(declare-fun b!340986 () Bool)

(declare-fun res!188490 () Bool)

(assert (=> b!340986 (=> (not res!188490) (not e!209120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340986 (= res!188490 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34200 res!188493) b!340982))

(assert (= (and b!340982 res!188488) b!340985))

(assert (= (and b!340985 res!188492) b!340988))

(assert (= (and b!340988 res!188489) b!340986))

(assert (= (and b!340986 res!188490) b!340989))

(assert (= (and b!340989 res!188491) b!340981))

(assert (= (and b!340981 res!188495) b!340979))

(assert (= (and b!340979 res!188494) b!340980))

(assert (= (and b!340983 condMapEmpty!12210) mapIsEmpty!12210))

(assert (= (and b!340983 (not condMapEmpty!12210)) mapNonEmpty!12210))

(assert (= (and mapNonEmpty!12210 ((_ is ValueCellFull!3251) mapValue!12210)) b!340987))

(assert (= (and b!340983 ((_ is ValueCellFull!3251) mapDefault!12210)) b!340984))

(assert (= start!34200 b!340983))

(declare-fun m!343005 () Bool)

(assert (=> b!340989 m!343005))

(assert (=> b!340989 m!343005))

(declare-fun m!343007 () Bool)

(assert (=> b!340989 m!343007))

(declare-fun m!343009 () Bool)

(assert (=> mapNonEmpty!12210 m!343009))

(declare-fun m!343011 () Bool)

(assert (=> b!340985 m!343011))

(declare-fun m!343013 () Bool)

(assert (=> b!340986 m!343013))

(declare-fun m!343015 () Bool)

(assert (=> b!340980 m!343015))

(declare-fun m!343017 () Bool)

(assert (=> b!340981 m!343017))

(declare-fun m!343019 () Bool)

(assert (=> b!340979 m!343019))

(declare-fun m!343021 () Bool)

(assert (=> b!340988 m!343021))

(declare-fun m!343023 () Bool)

(assert (=> start!34200 m!343023))

(declare-fun m!343025 () Bool)

(assert (=> start!34200 m!343025))

(declare-fun m!343027 () Bool)

(assert (=> start!34200 m!343027))

(check-sat b_and!14411 (not b!340980) (not mapNonEmpty!12210) (not b!340981) (not b!340989) (not b!340986) (not b_next!7237) tp_is_empty!7189 (not b!340979) (not b!340988) (not start!34200) (not b!340985))
(check-sat b_and!14411 (not b_next!7237))
