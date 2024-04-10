; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35180 () Bool)

(assert start!35180)

(declare-fun b_free!7773 () Bool)

(declare-fun b_next!7773 () Bool)

(assert (=> start!35180 (= b_free!7773 (not b_next!7773))))

(declare-fun tp!26909 () Bool)

(declare-fun b_and!15011 () Bool)

(assert (=> start!35180 (= tp!26909 b_and!15011)))

(declare-fun b!352645 () Bool)

(declare-fun res!195537 () Bool)

(declare-fun e!215950 () Bool)

(assert (=> b!352645 (=> (not res!195537) (not e!215950))))

(declare-datatypes ((array!19041 0))(
  ( (array!19042 (arr!9022 (Array (_ BitVec 32) (_ BitVec 64))) (size!9374 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19041)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19041 (_ BitVec 32)) Bool)

(assert (=> b!352645 (= res!195537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352646 () Bool)

(declare-fun res!195534 () Bool)

(assert (=> b!352646 (=> (not res!195534) (not e!215950))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352646 (= res!195534 (validKeyInArray!0 k0!1348))))

(declare-fun res!195539 () Bool)

(assert (=> start!35180 (=> (not res!195539) (not e!215950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35180 (= res!195539 (validMask!0 mask!2385))))

(assert (=> start!35180 e!215950))

(assert (=> start!35180 true))

(declare-fun tp_is_empty!7725 () Bool)

(assert (=> start!35180 tp_is_empty!7725))

(assert (=> start!35180 tp!26909))

(declare-datatypes ((V!11277 0))(
  ( (V!11278 (val!3907 Int)) )
))
(declare-datatypes ((ValueCell!3519 0))(
  ( (ValueCellFull!3519 (v!6098 V!11277)) (EmptyCell!3519) )
))
(declare-datatypes ((array!19043 0))(
  ( (array!19044 (arr!9023 (Array (_ BitVec 32) ValueCell!3519)) (size!9375 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19043)

(declare-fun e!215951 () Bool)

(declare-fun array_inv!6650 (array!19043) Bool)

(assert (=> start!35180 (and (array_inv!6650 _values!1525) e!215951)))

(declare-fun array_inv!6651 (array!19041) Bool)

(assert (=> start!35180 (array_inv!6651 _keys!1895)))

(declare-fun b!352647 () Bool)

(declare-fun res!195538 () Bool)

(assert (=> b!352647 (=> (not res!195538) (not e!215950))))

(declare-fun zeroValue!1467 () V!11277)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11277)

(declare-datatypes ((tuple2!5630 0))(
  ( (tuple2!5631 (_1!2826 (_ BitVec 64)) (_2!2826 V!11277)) )
))
(declare-datatypes ((List!5250 0))(
  ( (Nil!5247) (Cons!5246 (h!6102 tuple2!5630) (t!10396 List!5250)) )
))
(declare-datatypes ((ListLongMap!4543 0))(
  ( (ListLongMap!4544 (toList!2287 List!5250)) )
))
(declare-fun contains!2360 (ListLongMap!4543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1808 (array!19041 array!19043 (_ BitVec 32) (_ BitVec 32) V!11277 V!11277 (_ BitVec 32) Int) ListLongMap!4543)

(assert (=> b!352647 (= res!195538 (not (contains!2360 (getCurrentListMap!1808 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13071 () Bool)

(declare-fun mapRes!13071 () Bool)

(declare-fun tp!26910 () Bool)

(declare-fun e!215948 () Bool)

(assert (=> mapNonEmpty!13071 (= mapRes!13071 (and tp!26910 e!215948))))

(declare-fun mapValue!13071 () ValueCell!3519)

(declare-fun mapKey!13071 () (_ BitVec 32))

(declare-fun mapRest!13071 () (Array (_ BitVec 32) ValueCell!3519))

(assert (=> mapNonEmpty!13071 (= (arr!9023 _values!1525) (store mapRest!13071 mapKey!13071 mapValue!13071))))

(declare-fun b!352648 () Bool)

(declare-fun e!215949 () Bool)

(assert (=> b!352648 (= e!215951 (and e!215949 mapRes!13071))))

(declare-fun condMapEmpty!13071 () Bool)

(declare-fun mapDefault!13071 () ValueCell!3519)

(assert (=> b!352648 (= condMapEmpty!13071 (= (arr!9023 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3519)) mapDefault!13071)))))

(declare-fun b!352649 () Bool)

(assert (=> b!352649 (= e!215950 false)))

(declare-datatypes ((SeekEntryResult!3470 0))(
  ( (MissingZero!3470 (index!16059 (_ BitVec 32))) (Found!3470 (index!16060 (_ BitVec 32))) (Intermediate!3470 (undefined!4282 Bool) (index!16061 (_ BitVec 32)) (x!35078 (_ BitVec 32))) (Undefined!3470) (MissingVacant!3470 (index!16062 (_ BitVec 32))) )
))
(declare-fun lt!165325 () SeekEntryResult!3470)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19041 (_ BitVec 32)) SeekEntryResult!3470)

(assert (=> b!352649 (= lt!165325 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352650 () Bool)

(assert (=> b!352650 (= e!215948 tp_is_empty!7725)))

(declare-fun mapIsEmpty!13071 () Bool)

(assert (=> mapIsEmpty!13071 mapRes!13071))

(declare-fun b!352651 () Bool)

(declare-fun res!195535 () Bool)

(assert (=> b!352651 (=> (not res!195535) (not e!215950))))

(assert (=> b!352651 (= res!195535 (and (= (size!9375 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9374 _keys!1895) (size!9375 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352652 () Bool)

(assert (=> b!352652 (= e!215949 tp_is_empty!7725)))

(declare-fun b!352653 () Bool)

(declare-fun res!195536 () Bool)

(assert (=> b!352653 (=> (not res!195536) (not e!215950))))

(declare-datatypes ((List!5251 0))(
  ( (Nil!5248) (Cons!5247 (h!6103 (_ BitVec 64)) (t!10397 List!5251)) )
))
(declare-fun arrayNoDuplicates!0 (array!19041 (_ BitVec 32) List!5251) Bool)

(assert (=> b!352653 (= res!195536 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5248))))

(assert (= (and start!35180 res!195539) b!352651))

(assert (= (and b!352651 res!195535) b!352645))

(assert (= (and b!352645 res!195537) b!352653))

(assert (= (and b!352653 res!195536) b!352646))

(assert (= (and b!352646 res!195534) b!352647))

(assert (= (and b!352647 res!195538) b!352649))

(assert (= (and b!352648 condMapEmpty!13071) mapIsEmpty!13071))

(assert (= (and b!352648 (not condMapEmpty!13071)) mapNonEmpty!13071))

(get-info :version)

(assert (= (and mapNonEmpty!13071 ((_ is ValueCellFull!3519) mapValue!13071)) b!352650))

(assert (= (and b!352648 ((_ is ValueCellFull!3519) mapDefault!13071)) b!352652))

(assert (= start!35180 b!352648))

(declare-fun m!352227 () Bool)

(assert (=> b!352645 m!352227))

(declare-fun m!352229 () Bool)

(assert (=> mapNonEmpty!13071 m!352229))

(declare-fun m!352231 () Bool)

(assert (=> start!35180 m!352231))

(declare-fun m!352233 () Bool)

(assert (=> start!35180 m!352233))

(declare-fun m!352235 () Bool)

(assert (=> start!35180 m!352235))

(declare-fun m!352237 () Bool)

(assert (=> b!352646 m!352237))

(declare-fun m!352239 () Bool)

(assert (=> b!352649 m!352239))

(declare-fun m!352241 () Bool)

(assert (=> b!352653 m!352241))

(declare-fun m!352243 () Bool)

(assert (=> b!352647 m!352243))

(assert (=> b!352647 m!352243))

(declare-fun m!352245 () Bool)

(assert (=> b!352647 m!352245))

(check-sat tp_is_empty!7725 (not b!352645) (not b!352647) (not b!352646) (not b!352653) (not b_next!7773) b_and!15011 (not start!35180) (not mapNonEmpty!13071) (not b!352649))
(check-sat b_and!15011 (not b_next!7773))
