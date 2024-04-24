; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33682 () Bool)

(assert start!33682)

(declare-fun b_free!6931 () Bool)

(declare-fun b_next!6931 () Bool)

(assert (=> start!33682 (= b_free!6931 (not b_next!6931))))

(declare-fun tp!24297 () Bool)

(declare-fun b_and!14125 () Bool)

(assert (=> start!33682 (= tp!24297 b_and!14125)))

(declare-fun b!334813 () Bool)

(declare-fun e!205510 () Bool)

(declare-fun tp_is_empty!6883 () Bool)

(assert (=> b!334813 (= e!205510 tp_is_empty!6883)))

(declare-fun b!334814 () Bool)

(declare-fun res!184686 () Bool)

(declare-fun e!205509 () Bool)

(assert (=> b!334814 (=> (not res!184686) (not e!205509))))

(declare-datatypes ((array!17352 0))(
  ( (array!17353 (arr!8206 (Array (_ BitVec 32) (_ BitVec 64))) (size!8558 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17352)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17352 (_ BitVec 32)) Bool)

(assert (=> b!334814 (= res!184686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334815 () Bool)

(declare-fun e!205508 () Bool)

(assert (=> b!334815 (= e!205508 (not true))))

(declare-datatypes ((V!10155 0))(
  ( (V!10156 (val!3486 Int)) )
))
(declare-datatypes ((tuple2!4984 0))(
  ( (tuple2!4985 (_1!2503 (_ BitVec 64)) (_2!2503 V!10155)) )
))
(declare-datatypes ((List!4601 0))(
  ( (Nil!4598) (Cons!4597 (h!5453 tuple2!4984) (t!9681 List!4601)) )
))
(declare-datatypes ((ListLongMap!3899 0))(
  ( (ListLongMap!3900 (toList!1965 List!4601)) )
))
(declare-fun lt!159640 () ListLongMap!3899)

(declare-datatypes ((SeekEntryResult!3137 0))(
  ( (MissingZero!3137 (index!14727 (_ BitVec 32))) (Found!3137 (index!14728 (_ BitVec 32))) (Intermediate!3137 (undefined!3949 Bool) (index!14729 (_ BitVec 32)) (x!33332 (_ BitVec 32))) (Undefined!3137) (MissingVacant!3137 (index!14730 (_ BitVec 32))) )
))
(declare-fun lt!159641 () SeekEntryResult!3137)

(declare-fun contains!2028 (ListLongMap!3899 (_ BitVec 64)) Bool)

(assert (=> b!334815 (contains!2028 lt!159640 (select (arr!8206 _keys!1895) (index!14728 lt!159641)))))

(declare-fun zeroValue!1467 () V!10155)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3098 0))(
  ( (ValueCellFull!3098 (v!5649 V!10155)) (EmptyCell!3098) )
))
(declare-datatypes ((array!17354 0))(
  ( (array!17355 (arr!8207 (Array (_ BitVec 32) ValueCell!3098)) (size!8559 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17354)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10155)

(declare-datatypes ((Unit!10395 0))(
  ( (Unit!10396) )
))
(declare-fun lt!159643 () Unit!10395)

(declare-fun lemmaValidKeyInArrayIsInListMap!155 (array!17352 array!17354 (_ BitVec 32) (_ BitVec 32) V!10155 V!10155 (_ BitVec 32) Int) Unit!10395)

(assert (=> b!334815 (= lt!159643 (lemmaValidKeyInArrayIsInListMap!155 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14728 lt!159641) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334815 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159642 () Unit!10395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17352 (_ BitVec 64) (_ BitVec 32)) Unit!10395)

(assert (=> b!334815 (= lt!159642 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14728 lt!159641)))))

(declare-fun b!334816 () Bool)

(declare-fun res!184681 () Bool)

(assert (=> b!334816 (=> (not res!184681) (not e!205509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334816 (= res!184681 (validKeyInArray!0 k0!1348))))

(declare-fun res!184687 () Bool)

(assert (=> start!33682 (=> (not res!184687) (not e!205509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33682 (= res!184687 (validMask!0 mask!2385))))

(assert (=> start!33682 e!205509))

(assert (=> start!33682 true))

(assert (=> start!33682 tp_is_empty!6883))

(assert (=> start!33682 tp!24297))

(declare-fun e!205506 () Bool)

(declare-fun array_inv!6106 (array!17354) Bool)

(assert (=> start!33682 (and (array_inv!6106 _values!1525) e!205506)))

(declare-fun array_inv!6107 (array!17352) Bool)

(assert (=> start!33682 (array_inv!6107 _keys!1895)))

(declare-fun b!334817 () Bool)

(declare-fun res!184682 () Bool)

(assert (=> b!334817 (=> (not res!184682) (not e!205509))))

(assert (=> b!334817 (= res!184682 (and (= (size!8559 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8558 _keys!1895) (size!8559 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334818 () Bool)

(declare-fun res!184684 () Bool)

(assert (=> b!334818 (=> (not res!184684) (not e!205508))))

(assert (=> b!334818 (= res!184684 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14728 lt!159641)))))

(declare-fun b!334819 () Bool)

(declare-fun mapRes!11721 () Bool)

(assert (=> b!334819 (= e!205506 (and e!205510 mapRes!11721))))

(declare-fun condMapEmpty!11721 () Bool)

(declare-fun mapDefault!11721 () ValueCell!3098)

(assert (=> b!334819 (= condMapEmpty!11721 (= (arr!8207 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3098)) mapDefault!11721)))))

(declare-fun mapIsEmpty!11721 () Bool)

(assert (=> mapIsEmpty!11721 mapRes!11721))

(declare-fun b!334820 () Bool)

(declare-fun e!205505 () Bool)

(assert (=> b!334820 (= e!205505 e!205508)))

(declare-fun res!184688 () Bool)

(assert (=> b!334820 (=> (not res!184688) (not e!205508))))

(get-info :version)

(assert (=> b!334820 (= res!184688 (and ((_ is Found!3137) lt!159641) (= (select (arr!8206 _keys!1895) (index!14728 lt!159641)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17352 (_ BitVec 32)) SeekEntryResult!3137)

(assert (=> b!334820 (= lt!159641 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11721 () Bool)

(declare-fun tp!24296 () Bool)

(declare-fun e!205507 () Bool)

(assert (=> mapNonEmpty!11721 (= mapRes!11721 (and tp!24296 e!205507))))

(declare-fun mapKey!11721 () (_ BitVec 32))

(declare-fun mapValue!11721 () ValueCell!3098)

(declare-fun mapRest!11721 () (Array (_ BitVec 32) ValueCell!3098))

(assert (=> mapNonEmpty!11721 (= (arr!8207 _values!1525) (store mapRest!11721 mapKey!11721 mapValue!11721))))

(declare-fun b!334821 () Bool)

(assert (=> b!334821 (= e!205509 e!205505)))

(declare-fun res!184683 () Bool)

(assert (=> b!334821 (=> (not res!184683) (not e!205505))))

(assert (=> b!334821 (= res!184683 (not (contains!2028 lt!159640 k0!1348)))))

(declare-fun getCurrentListMap!1496 (array!17352 array!17354 (_ BitVec 32) (_ BitVec 32) V!10155 V!10155 (_ BitVec 32) Int) ListLongMap!3899)

(assert (=> b!334821 (= lt!159640 (getCurrentListMap!1496 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334822 () Bool)

(declare-fun res!184685 () Bool)

(assert (=> b!334822 (=> (not res!184685) (not e!205509))))

(declare-datatypes ((List!4602 0))(
  ( (Nil!4599) (Cons!4598 (h!5454 (_ BitVec 64)) (t!9682 List!4602)) )
))
(declare-fun arrayNoDuplicates!0 (array!17352 (_ BitVec 32) List!4602) Bool)

(assert (=> b!334822 (= res!184685 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4599))))

(declare-fun b!334823 () Bool)

(assert (=> b!334823 (= e!205507 tp_is_empty!6883)))

(assert (= (and start!33682 res!184687) b!334817))

(assert (= (and b!334817 res!184682) b!334814))

(assert (= (and b!334814 res!184686) b!334822))

(assert (= (and b!334822 res!184685) b!334816))

(assert (= (and b!334816 res!184681) b!334821))

(assert (= (and b!334821 res!184683) b!334820))

(assert (= (and b!334820 res!184688) b!334818))

(assert (= (and b!334818 res!184684) b!334815))

(assert (= (and b!334819 condMapEmpty!11721) mapIsEmpty!11721))

(assert (= (and b!334819 (not condMapEmpty!11721)) mapNonEmpty!11721))

(assert (= (and mapNonEmpty!11721 ((_ is ValueCellFull!3098) mapValue!11721)) b!334823))

(assert (= (and b!334819 ((_ is ValueCellFull!3098) mapDefault!11721)) b!334813))

(assert (= start!33682 b!334819))

(declare-fun m!339101 () Bool)

(assert (=> b!334815 m!339101))

(declare-fun m!339103 () Bool)

(assert (=> b!334815 m!339103))

(declare-fun m!339105 () Bool)

(assert (=> b!334815 m!339105))

(declare-fun m!339107 () Bool)

(assert (=> b!334815 m!339107))

(declare-fun m!339109 () Bool)

(assert (=> b!334815 m!339109))

(assert (=> b!334815 m!339105))

(declare-fun m!339111 () Bool)

(assert (=> b!334814 m!339111))

(declare-fun m!339113 () Bool)

(assert (=> b!334816 m!339113))

(declare-fun m!339115 () Bool)

(assert (=> b!334818 m!339115))

(declare-fun m!339117 () Bool)

(assert (=> b!334821 m!339117))

(declare-fun m!339119 () Bool)

(assert (=> b!334821 m!339119))

(declare-fun m!339121 () Bool)

(assert (=> mapNonEmpty!11721 m!339121))

(declare-fun m!339123 () Bool)

(assert (=> b!334822 m!339123))

(assert (=> b!334820 m!339105))

(declare-fun m!339125 () Bool)

(assert (=> b!334820 m!339125))

(declare-fun m!339127 () Bool)

(assert (=> start!33682 m!339127))

(declare-fun m!339129 () Bool)

(assert (=> start!33682 m!339129))

(declare-fun m!339131 () Bool)

(assert (=> start!33682 m!339131))

(check-sat (not mapNonEmpty!11721) (not b!334816) (not b!334821) (not b!334820) (not b!334815) (not b!334822) (not start!33682) tp_is_empty!6883 b_and!14125 (not b_next!6931) (not b!334818) (not b!334814))
(check-sat b_and!14125 (not b_next!6931))
