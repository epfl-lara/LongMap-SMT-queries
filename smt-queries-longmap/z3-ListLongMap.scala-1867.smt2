; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33622 () Bool)

(assert start!33622)

(declare-fun b_free!6871 () Bool)

(declare-fun b_next!6871 () Bool)

(assert (=> start!33622 (= b_free!6871 (not b_next!6871))))

(declare-fun tp!24116 () Bool)

(declare-fun b_and!14025 () Bool)

(assert (=> start!33622 (= tp!24116 b_and!14025)))

(declare-fun mapNonEmpty!11631 () Bool)

(declare-fun mapRes!11631 () Bool)

(declare-fun tp!24117 () Bool)

(declare-fun e!204816 () Bool)

(assert (=> mapNonEmpty!11631 (= mapRes!11631 (and tp!24117 e!204816))))

(declare-fun mapKey!11631 () (_ BitVec 32))

(declare-datatypes ((V!10075 0))(
  ( (V!10076 (val!3456 Int)) )
))
(declare-datatypes ((ValueCell!3068 0))(
  ( (ValueCellFull!3068 (v!5612 V!10075)) (EmptyCell!3068) )
))
(declare-datatypes ((array!17223 0))(
  ( (array!17224 (arr!8142 (Array (_ BitVec 32) ValueCell!3068)) (size!8495 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17223)

(declare-fun mapRest!11631 () (Array (_ BitVec 32) ValueCell!3068))

(declare-fun mapValue!11631 () ValueCell!3068)

(assert (=> mapNonEmpty!11631 (= (arr!8142 _values!1525) (store mapRest!11631 mapKey!11631 mapValue!11631))))

(declare-fun b!333601 () Bool)

(declare-fun res!183839 () Bool)

(declare-fun e!204815 () Bool)

(assert (=> b!333601 (=> (not res!183839) (not e!204815))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333601 (= res!183839 (validKeyInArray!0 k0!1348))))

(declare-fun b!333602 () Bool)

(declare-fun res!183838 () Bool)

(assert (=> b!333602 (=> (not res!183838) (not e!204815))))

(declare-datatypes ((array!17225 0))(
  ( (array!17226 (arr!8143 (Array (_ BitVec 32) (_ BitVec 64))) (size!8496 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17225)

(declare-datatypes ((List!4608 0))(
  ( (Nil!4605) (Cons!4604 (h!5460 (_ BitVec 64)) (t!9687 List!4608)) )
))
(declare-fun arrayNoDuplicates!0 (array!17225 (_ BitVec 32) List!4608) Bool)

(assert (=> b!333602 (= res!183838 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4605))))

(declare-fun b!333603 () Bool)

(declare-fun res!183837 () Bool)

(assert (=> b!333603 (=> (not res!183837) (not e!204815))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17225 (_ BitVec 32)) Bool)

(assert (=> b!333603 (= res!183837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183835 () Bool)

(assert (=> start!33622 (=> (not res!183835) (not e!204815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33622 (= res!183835 (validMask!0 mask!2385))))

(assert (=> start!33622 e!204815))

(assert (=> start!33622 true))

(declare-fun tp_is_empty!6823 () Bool)

(assert (=> start!33622 tp_is_empty!6823))

(assert (=> start!33622 tp!24116))

(declare-fun e!204817 () Bool)

(declare-fun array_inv!6074 (array!17223) Bool)

(assert (=> start!33622 (and (array_inv!6074 _values!1525) e!204817)))

(declare-fun array_inv!6075 (array!17225) Bool)

(assert (=> start!33622 (array_inv!6075 _keys!1895)))

(declare-fun b!333604 () Bool)

(declare-fun e!204813 () Bool)

(assert (=> b!333604 (= e!204813 tp_is_empty!6823)))

(declare-fun mapIsEmpty!11631 () Bool)

(assert (=> mapIsEmpty!11631 mapRes!11631))

(declare-fun b!333605 () Bool)

(declare-fun e!204814 () Bool)

(assert (=> b!333605 (= e!204815 e!204814)))

(declare-fun res!183836 () Bool)

(assert (=> b!333605 (=> (not res!183836) (not e!204814))))

(declare-datatypes ((SeekEntryResult!3145 0))(
  ( (MissingZero!3145 (index!14759 (_ BitVec 32))) (Found!3145 (index!14760 (_ BitVec 32))) (Intermediate!3145 (undefined!3957 Bool) (index!14761 (_ BitVec 32)) (x!33258 (_ BitVec 32))) (Undefined!3145) (MissingVacant!3145 (index!14762 (_ BitVec 32))) )
))
(declare-fun lt!159186 () SeekEntryResult!3145)

(get-info :version)

(assert (=> b!333605 (= res!183836 (and ((_ is Found!3145) lt!159186) (= (select (arr!8143 _keys!1895) (index!14760 lt!159186)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17225 (_ BitVec 32)) SeekEntryResult!3145)

(assert (=> b!333605 (= lt!159186 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333606 () Bool)

(declare-fun res!183840 () Bool)

(assert (=> b!333606 (=> (not res!183840) (not e!204814))))

(declare-fun arrayContainsKey!0 (array!17225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333606 (= res!183840 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14760 lt!159186)))))

(declare-fun b!333607 () Bool)

(assert (=> b!333607 (= e!204814 (not true))))

(assert (=> b!333607 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10354 0))(
  ( (Unit!10355) )
))
(declare-fun lt!159185 () Unit!10354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17225 (_ BitVec 64) (_ BitVec 32)) Unit!10354)

(assert (=> b!333607 (= lt!159185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14760 lt!159186)))))

(declare-fun b!333608 () Bool)

(assert (=> b!333608 (= e!204816 tp_is_empty!6823)))

(declare-fun b!333609 () Bool)

(declare-fun res!183841 () Bool)

(assert (=> b!333609 (=> (not res!183841) (not e!204815))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333609 (= res!183841 (and (= (size!8495 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8496 _keys!1895) (size!8495 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333610 () Bool)

(declare-fun res!183842 () Bool)

(assert (=> b!333610 (=> (not res!183842) (not e!204815))))

(declare-fun zeroValue!1467 () V!10075)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10075)

(declare-datatypes ((tuple2!4968 0))(
  ( (tuple2!4969 (_1!2495 (_ BitVec 64)) (_2!2495 V!10075)) )
))
(declare-datatypes ((List!4609 0))(
  ( (Nil!4606) (Cons!4605 (h!5461 tuple2!4968) (t!9688 List!4609)) )
))
(declare-datatypes ((ListLongMap!3871 0))(
  ( (ListLongMap!3872 (toList!1951 List!4609)) )
))
(declare-fun contains!2006 (ListLongMap!3871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1460 (array!17225 array!17223 (_ BitVec 32) (_ BitVec 32) V!10075 V!10075 (_ BitVec 32) Int) ListLongMap!3871)

(assert (=> b!333610 (= res!183842 (not (contains!2006 (getCurrentListMap!1460 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333611 () Bool)

(assert (=> b!333611 (= e!204817 (and e!204813 mapRes!11631))))

(declare-fun condMapEmpty!11631 () Bool)

(declare-fun mapDefault!11631 () ValueCell!3068)

(assert (=> b!333611 (= condMapEmpty!11631 (= (arr!8142 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3068)) mapDefault!11631)))))

(assert (= (and start!33622 res!183835) b!333609))

(assert (= (and b!333609 res!183841) b!333603))

(assert (= (and b!333603 res!183837) b!333602))

(assert (= (and b!333602 res!183838) b!333601))

(assert (= (and b!333601 res!183839) b!333610))

(assert (= (and b!333610 res!183842) b!333605))

(assert (= (and b!333605 res!183836) b!333606))

(assert (= (and b!333606 res!183840) b!333607))

(assert (= (and b!333611 condMapEmpty!11631) mapIsEmpty!11631))

(assert (= (and b!333611 (not condMapEmpty!11631)) mapNonEmpty!11631))

(assert (= (and mapNonEmpty!11631 ((_ is ValueCellFull!3068) mapValue!11631)) b!333608))

(assert (= (and b!333611 ((_ is ValueCellFull!3068) mapDefault!11631)) b!333604))

(assert (= start!33622 b!333611))

(declare-fun m!337295 () Bool)

(assert (=> b!333601 m!337295))

(declare-fun m!337297 () Bool)

(assert (=> start!33622 m!337297))

(declare-fun m!337299 () Bool)

(assert (=> start!33622 m!337299))

(declare-fun m!337301 () Bool)

(assert (=> start!33622 m!337301))

(declare-fun m!337303 () Bool)

(assert (=> b!333602 m!337303))

(declare-fun m!337305 () Bool)

(assert (=> b!333605 m!337305))

(declare-fun m!337307 () Bool)

(assert (=> b!333605 m!337307))

(declare-fun m!337309 () Bool)

(assert (=> mapNonEmpty!11631 m!337309))

(declare-fun m!337311 () Bool)

(assert (=> b!333603 m!337311))

(declare-fun m!337313 () Bool)

(assert (=> b!333607 m!337313))

(declare-fun m!337315 () Bool)

(assert (=> b!333607 m!337315))

(declare-fun m!337317 () Bool)

(assert (=> b!333610 m!337317))

(assert (=> b!333610 m!337317))

(declare-fun m!337319 () Bool)

(assert (=> b!333610 m!337319))

(declare-fun m!337321 () Bool)

(assert (=> b!333606 m!337321))

(check-sat tp_is_empty!6823 (not mapNonEmpty!11631) (not b!333610) b_and!14025 (not b!333606) (not start!33622) (not b!333602) (not b!333603) (not b!333607) (not b_next!6871) (not b!333601) (not b!333605))
(check-sat b_and!14025 (not b_next!6871))
