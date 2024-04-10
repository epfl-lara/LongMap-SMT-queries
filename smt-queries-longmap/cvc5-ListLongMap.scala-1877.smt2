; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33696 () Bool)

(assert start!33696)

(declare-fun b_free!6931 () Bool)

(declare-fun b_next!6931 () Bool)

(assert (=> start!33696 (= b_free!6931 (not b_next!6931))))

(declare-fun tp!24297 () Bool)

(declare-fun b_and!14111 () Bool)

(assert (=> start!33696 (= tp!24297 b_and!14111)))

(declare-fun res!184684 () Bool)

(declare-fun e!205543 () Bool)

(assert (=> start!33696 (=> (not res!184684) (not e!205543))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33696 (= res!184684 (validMask!0 mask!2385))))

(assert (=> start!33696 e!205543))

(assert (=> start!33696 true))

(declare-fun tp_is_empty!6883 () Bool)

(assert (=> start!33696 tp_is_empty!6883))

(assert (=> start!33696 tp!24297))

(declare-datatypes ((V!10155 0))(
  ( (V!10156 (val!3486 Int)) )
))
(declare-datatypes ((ValueCell!3098 0))(
  ( (ValueCellFull!3098 (v!5648 V!10155)) (EmptyCell!3098) )
))
(declare-datatypes ((array!17359 0))(
  ( (array!17360 (arr!8210 (Array (_ BitVec 32) ValueCell!3098)) (size!8562 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17359)

(declare-fun e!205539 () Bool)

(declare-fun array_inv!6102 (array!17359) Bool)

(assert (=> start!33696 (and (array_inv!6102 _values!1525) e!205539)))

(declare-datatypes ((array!17361 0))(
  ( (array!17362 (arr!8211 (Array (_ BitVec 32) (_ BitVec 64))) (size!8563 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17361)

(declare-fun array_inv!6103 (array!17361) Bool)

(assert (=> start!33696 (array_inv!6103 _keys!1895)))

(declare-fun b!334866 () Bool)

(declare-fun e!205545 () Bool)

(assert (=> b!334866 (= e!205545 tp_is_empty!6883)))

(declare-fun mapNonEmpty!11721 () Bool)

(declare-fun mapRes!11721 () Bool)

(declare-fun tp!24296 () Bool)

(assert (=> mapNonEmpty!11721 (= mapRes!11721 (and tp!24296 e!205545))))

(declare-fun mapRest!11721 () (Array (_ BitVec 32) ValueCell!3098))

(declare-fun mapKey!11721 () (_ BitVec 32))

(declare-fun mapValue!11721 () ValueCell!3098)

(assert (=> mapNonEmpty!11721 (= (arr!8210 _values!1525) (store mapRest!11721 mapKey!11721 mapValue!11721))))

(declare-fun b!334867 () Bool)

(declare-fun e!205544 () Bool)

(declare-fun e!205542 () Bool)

(assert (=> b!334867 (= e!205544 e!205542)))

(declare-fun res!184689 () Bool)

(assert (=> b!334867 (=> (not res!184689) (not e!205542))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3172 0))(
  ( (MissingZero!3172 (index!14867 (_ BitVec 32))) (Found!3172 (index!14868 (_ BitVec 32))) (Intermediate!3172 (undefined!3984 Bool) (index!14869 (_ BitVec 32)) (x!33370 (_ BitVec 32))) (Undefined!3172) (MissingVacant!3172 (index!14870 (_ BitVec 32))) )
))
(declare-fun lt!159622 () SeekEntryResult!3172)

(assert (=> b!334867 (= res!184689 (and (is-Found!3172 lt!159622) (= (select (arr!8211 _keys!1895) (index!14868 lt!159622)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17361 (_ BitVec 32)) SeekEntryResult!3172)

(assert (=> b!334867 (= lt!159622 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334868 () Bool)

(declare-fun res!184691 () Bool)

(assert (=> b!334868 (=> (not res!184691) (not e!205542))))

(declare-fun arrayContainsKey!0 (array!17361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334868 (= res!184691 (arrayContainsKey!0 _keys!1895 k!1348 (index!14868 lt!159622)))))

(declare-fun b!334869 () Bool)

(assert (=> b!334869 (= e!205543 e!205544)))

(declare-fun res!184686 () Bool)

(assert (=> b!334869 (=> (not res!184686) (not e!205544))))

(declare-datatypes ((tuple2!5058 0))(
  ( (tuple2!5059 (_1!2540 (_ BitVec 64)) (_2!2540 V!10155)) )
))
(declare-datatypes ((List!4682 0))(
  ( (Nil!4679) (Cons!4678 (h!5534 tuple2!5058) (t!9770 List!4682)) )
))
(declare-datatypes ((ListLongMap!3971 0))(
  ( (ListLongMap!3972 (toList!2001 List!4682)) )
))
(declare-fun lt!159623 () ListLongMap!3971)

(declare-fun contains!2045 (ListLongMap!3971 (_ BitVec 64)) Bool)

(assert (=> b!334869 (= res!184686 (not (contains!2045 lt!159623 k!1348)))))

(declare-fun zeroValue!1467 () V!10155)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10155)

(declare-fun getCurrentListMap!1529 (array!17361 array!17359 (_ BitVec 32) (_ BitVec 32) V!10155 V!10155 (_ BitVec 32) Int) ListLongMap!3971)

(assert (=> b!334869 (= lt!159623 (getCurrentListMap!1529 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334870 () Bool)

(declare-fun res!184688 () Bool)

(assert (=> b!334870 (=> (not res!184688) (not e!205543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17361 (_ BitVec 32)) Bool)

(assert (=> b!334870 (= res!184688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334871 () Bool)

(declare-fun e!205540 () Bool)

(assert (=> b!334871 (= e!205540 tp_is_empty!6883)))

(declare-fun b!334872 () Bool)

(declare-fun res!184687 () Bool)

(assert (=> b!334872 (=> (not res!184687) (not e!205543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334872 (= res!184687 (validKeyInArray!0 k!1348))))

(declare-fun b!334873 () Bool)

(declare-fun res!184690 () Bool)

(assert (=> b!334873 (=> (not res!184690) (not e!205543))))

(declare-datatypes ((List!4683 0))(
  ( (Nil!4680) (Cons!4679 (h!5535 (_ BitVec 64)) (t!9771 List!4683)) )
))
(declare-fun arrayNoDuplicates!0 (array!17361 (_ BitVec 32) List!4683) Bool)

(assert (=> b!334873 (= res!184690 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4680))))

(declare-fun mapIsEmpty!11721 () Bool)

(assert (=> mapIsEmpty!11721 mapRes!11721))

(declare-fun b!334874 () Bool)

(assert (=> b!334874 (= e!205542 (not true))))

(assert (=> b!334874 (contains!2045 lt!159623 (select (arr!8211 _keys!1895) (index!14868 lt!159622)))))

(declare-datatypes ((Unit!10415 0))(
  ( (Unit!10416) )
))
(declare-fun lt!159624 () Unit!10415)

(declare-fun lemmaValidKeyInArrayIsInListMap!154 (array!17361 array!17359 (_ BitVec 32) (_ BitVec 32) V!10155 V!10155 (_ BitVec 32) Int) Unit!10415)

(assert (=> b!334874 (= lt!159624 (lemmaValidKeyInArrayIsInListMap!154 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14868 lt!159622) defaultEntry!1528))))

(assert (=> b!334874 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159625 () Unit!10415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17361 (_ BitVec 64) (_ BitVec 32)) Unit!10415)

(assert (=> b!334874 (= lt!159625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14868 lt!159622)))))

(declare-fun b!334875 () Bool)

(assert (=> b!334875 (= e!205539 (and e!205540 mapRes!11721))))

(declare-fun condMapEmpty!11721 () Bool)

(declare-fun mapDefault!11721 () ValueCell!3098)

