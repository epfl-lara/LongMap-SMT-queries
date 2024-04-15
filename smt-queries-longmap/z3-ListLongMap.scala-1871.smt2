; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33646 () Bool)

(assert start!33646)

(declare-fun b_free!6895 () Bool)

(declare-fun b_next!6895 () Bool)

(assert (=> start!33646 (= b_free!6895 (not b_next!6895))))

(declare-fun tp!24189 () Bool)

(declare-fun b_and!14049 () Bool)

(assert (=> start!33646 (= tp!24189 b_and!14049)))

(declare-fun mapIsEmpty!11667 () Bool)

(declare-fun mapRes!11667 () Bool)

(assert (=> mapIsEmpty!11667 mapRes!11667))

(declare-fun mapNonEmpty!11667 () Bool)

(declare-fun tp!24188 () Bool)

(declare-fun e!205031 () Bool)

(assert (=> mapNonEmpty!11667 (= mapRes!11667 (and tp!24188 e!205031))))

(declare-datatypes ((V!10107 0))(
  ( (V!10108 (val!3468 Int)) )
))
(declare-datatypes ((ValueCell!3080 0))(
  ( (ValueCellFull!3080 (v!5624 V!10107)) (EmptyCell!3080) )
))
(declare-fun mapRest!11667 () (Array (_ BitVec 32) ValueCell!3080))

(declare-datatypes ((array!17269 0))(
  ( (array!17270 (arr!8165 (Array (_ BitVec 32) ValueCell!3080)) (size!8518 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17269)

(declare-fun mapValue!11667 () ValueCell!3080)

(declare-fun mapKey!11667 () (_ BitVec 32))

(assert (=> mapNonEmpty!11667 (= (arr!8165 _values!1525) (store mapRest!11667 mapKey!11667 mapValue!11667))))

(declare-fun b!333997 () Bool)

(declare-fun res!184124 () Bool)

(declare-fun e!205029 () Bool)

(assert (=> b!333997 (=> (not res!184124) (not e!205029))))

(declare-datatypes ((array!17271 0))(
  ( (array!17272 (arr!8166 (Array (_ BitVec 32) (_ BitVec 64))) (size!8519 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17271)

(declare-datatypes ((List!4623 0))(
  ( (Nil!4620) (Cons!4619 (h!5475 (_ BitVec 64)) (t!9702 List!4623)) )
))
(declare-fun arrayNoDuplicates!0 (array!17271 (_ BitVec 32) List!4623) Bool)

(assert (=> b!333997 (= res!184124 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4620))))

(declare-fun b!333999 () Bool)

(declare-fun res!184127 () Bool)

(assert (=> b!333999 (=> (not res!184127) (not e!205029))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10107)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10107)

(declare-datatypes ((tuple2!4982 0))(
  ( (tuple2!4983 (_1!2502 (_ BitVec 64)) (_2!2502 V!10107)) )
))
(declare-datatypes ((List!4624 0))(
  ( (Nil!4621) (Cons!4620 (h!5476 tuple2!4982) (t!9703 List!4624)) )
))
(declare-datatypes ((ListLongMap!3885 0))(
  ( (ListLongMap!3886 (toList!1958 List!4624)) )
))
(declare-fun contains!2013 (ListLongMap!3885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1467 (array!17271 array!17269 (_ BitVec 32) (_ BitVec 32) V!10107 V!10107 (_ BitVec 32) Int) ListLongMap!3885)

(assert (=> b!333999 (= res!184127 (not (contains!2013 (getCurrentListMap!1467 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334000 () Bool)

(declare-fun res!184123 () Bool)

(declare-fun e!205032 () Bool)

(assert (=> b!334000 (=> (not res!184123) (not e!205032))))

(declare-datatypes ((SeekEntryResult!3156 0))(
  ( (MissingZero!3156 (index!14803 (_ BitVec 32))) (Found!3156 (index!14804 (_ BitVec 32))) (Intermediate!3156 (undefined!3968 Bool) (index!14805 (_ BitVec 32)) (x!33301 (_ BitVec 32))) (Undefined!3156) (MissingVacant!3156 (index!14806 (_ BitVec 32))) )
))
(declare-fun lt!159258 () SeekEntryResult!3156)

(declare-fun arrayContainsKey!0 (array!17271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334000 (= res!184123 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14804 lt!159258)))))

(declare-fun b!334001 () Bool)

(declare-fun res!184125 () Bool)

(assert (=> b!334001 (=> (not res!184125) (not e!205029))))

(assert (=> b!334001 (= res!184125 (and (= (size!8518 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8519 _keys!1895) (size!8518 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334002 () Bool)

(declare-fun e!205033 () Bool)

(declare-fun tp_is_empty!6847 () Bool)

(assert (=> b!334002 (= e!205033 tp_is_empty!6847)))

(declare-fun b!334003 () Bool)

(declare-fun res!184126 () Bool)

(assert (=> b!334003 (=> (not res!184126) (not e!205029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334003 (= res!184126 (validKeyInArray!0 k0!1348))))

(declare-fun b!334004 () Bool)

(assert (=> b!334004 (= e!205031 tp_is_empty!6847)))

(declare-fun b!334005 () Bool)

(declare-fun res!184129 () Bool)

(assert (=> b!334005 (=> (not res!184129) (not e!205029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17271 (_ BitVec 32)) Bool)

(assert (=> b!334005 (= res!184129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333998 () Bool)

(declare-fun e!205030 () Bool)

(assert (=> b!333998 (= e!205030 (and e!205033 mapRes!11667))))

(declare-fun condMapEmpty!11667 () Bool)

(declare-fun mapDefault!11667 () ValueCell!3080)

(assert (=> b!333998 (= condMapEmpty!11667 (= (arr!8165 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3080)) mapDefault!11667)))))

(declare-fun res!184128 () Bool)

(assert (=> start!33646 (=> (not res!184128) (not e!205029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33646 (= res!184128 (validMask!0 mask!2385))))

(assert (=> start!33646 e!205029))

(assert (=> start!33646 true))

(assert (=> start!33646 tp_is_empty!6847))

(assert (=> start!33646 tp!24189))

(declare-fun array_inv!6090 (array!17269) Bool)

(assert (=> start!33646 (and (array_inv!6090 _values!1525) e!205030)))

(declare-fun array_inv!6091 (array!17271) Bool)

(assert (=> start!33646 (array_inv!6091 _keys!1895)))

(declare-fun b!334006 () Bool)

(assert (=> b!334006 (= e!205029 e!205032)))

(declare-fun res!184130 () Bool)

(assert (=> b!334006 (=> (not res!184130) (not e!205032))))

(get-info :version)

(assert (=> b!334006 (= res!184130 (and ((_ is Found!3156) lt!159258) (= (select (arr!8166 _keys!1895) (index!14804 lt!159258)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17271 (_ BitVec 32)) SeekEntryResult!3156)

(assert (=> b!334006 (= lt!159258 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334007 () Bool)

(assert (=> b!334007 (= e!205032 (not true))))

(assert (=> b!334007 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10374 0))(
  ( (Unit!10375) )
))
(declare-fun lt!159257 () Unit!10374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17271 (_ BitVec 64) (_ BitVec 32)) Unit!10374)

(assert (=> b!334007 (= lt!159257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14804 lt!159258)))))

(assert (= (and start!33646 res!184128) b!334001))

(assert (= (and b!334001 res!184125) b!334005))

(assert (= (and b!334005 res!184129) b!333997))

(assert (= (and b!333997 res!184124) b!334003))

(assert (= (and b!334003 res!184126) b!333999))

(assert (= (and b!333999 res!184127) b!334006))

(assert (= (and b!334006 res!184130) b!334000))

(assert (= (and b!334000 res!184123) b!334007))

(assert (= (and b!333998 condMapEmpty!11667) mapIsEmpty!11667))

(assert (= (and b!333998 (not condMapEmpty!11667)) mapNonEmpty!11667))

(assert (= (and mapNonEmpty!11667 ((_ is ValueCellFull!3080) mapValue!11667)) b!334004))

(assert (= (and b!333998 ((_ is ValueCellFull!3080) mapDefault!11667)) b!334002))

(assert (= start!33646 b!333998))

(declare-fun m!337631 () Bool)

(assert (=> b!334007 m!337631))

(declare-fun m!337633 () Bool)

(assert (=> b!334007 m!337633))

(declare-fun m!337635 () Bool)

(assert (=> b!334000 m!337635))

(declare-fun m!337637 () Bool)

(assert (=> b!333997 m!337637))

(declare-fun m!337639 () Bool)

(assert (=> start!33646 m!337639))

(declare-fun m!337641 () Bool)

(assert (=> start!33646 m!337641))

(declare-fun m!337643 () Bool)

(assert (=> start!33646 m!337643))

(declare-fun m!337645 () Bool)

(assert (=> b!334006 m!337645))

(declare-fun m!337647 () Bool)

(assert (=> b!334006 m!337647))

(declare-fun m!337649 () Bool)

(assert (=> b!334003 m!337649))

(declare-fun m!337651 () Bool)

(assert (=> b!334005 m!337651))

(declare-fun m!337653 () Bool)

(assert (=> b!333999 m!337653))

(assert (=> b!333999 m!337653))

(declare-fun m!337655 () Bool)

(assert (=> b!333999 m!337655))

(declare-fun m!337657 () Bool)

(assert (=> mapNonEmpty!11667 m!337657))

(check-sat (not b!334006) (not mapNonEmpty!11667) tp_is_empty!6847 (not b_next!6895) (not b!333997) (not b!334005) b_and!14049 (not b!333999) (not b!334000) (not start!33646) (not b!334003) (not b!334007))
(check-sat b_and!14049 (not b_next!6895))
