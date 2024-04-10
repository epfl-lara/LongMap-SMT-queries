; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34336 () Bool)

(assert start!34336)

(declare-fun b_free!7311 () Bool)

(declare-fun b_next!7311 () Bool)

(assert (=> start!34336 (= b_free!7311 (not b_next!7311))))

(declare-fun tp!25472 () Bool)

(declare-fun b_and!14515 () Bool)

(assert (=> start!34336 (= tp!25472 b_and!14515)))

(declare-fun b!342839 () Bool)

(declare-fun res!189522 () Bool)

(declare-fun e!210231 () Bool)

(assert (=> b!342839 (=> (not res!189522) (not e!210231))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10661 0))(
  ( (V!10662 (val!3676 Int)) )
))
(declare-datatypes ((ValueCell!3288 0))(
  ( (ValueCellFull!3288 (v!5850 V!10661)) (EmptyCell!3288) )
))
(declare-datatypes ((array!18117 0))(
  ( (array!18118 (arr!8577 (Array (_ BitVec 32) ValueCell!3288)) (size!8929 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18117)

(declare-datatypes ((array!18119 0))(
  ( (array!18120 (arr!8578 (Array (_ BitVec 32) (_ BitVec 64))) (size!8930 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18119)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10661)

(declare-fun zeroValue!1467 () V!10661)

(declare-datatypes ((tuple2!5326 0))(
  ( (tuple2!5327 (_1!2674 (_ BitVec 64)) (_2!2674 V!10661)) )
))
(declare-datatypes ((List!4945 0))(
  ( (Nil!4942) (Cons!4941 (h!5797 tuple2!5326) (t!10057 List!4945)) )
))
(declare-datatypes ((ListLongMap!4239 0))(
  ( (ListLongMap!4240 (toList!2135 List!4945)) )
))
(declare-fun contains!2191 (ListLongMap!4239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1656 (array!18119 array!18117 (_ BitVec 32) (_ BitVec 32) V!10661 V!10661 (_ BitVec 32) Int) ListLongMap!4239)

(assert (=> b!342839 (= res!189522 (not (contains!2191 (getCurrentListMap!1656 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342840 () Bool)

(declare-fun e!210228 () Bool)

(declare-fun e!210225 () Bool)

(declare-fun mapRes!12327 () Bool)

(assert (=> b!342840 (= e!210228 (and e!210225 mapRes!12327))))

(declare-fun condMapEmpty!12327 () Bool)

(declare-fun mapDefault!12327 () ValueCell!3288)

(assert (=> b!342840 (= condMapEmpty!12327 (= (arr!8577 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3288)) mapDefault!12327)))))

(declare-fun b!342841 () Bool)

(declare-fun res!189526 () Bool)

(assert (=> b!342841 (=> (not res!189526) (not e!210231))))

(declare-datatypes ((List!4946 0))(
  ( (Nil!4943) (Cons!4942 (h!5798 (_ BitVec 64)) (t!10058 List!4946)) )
))
(declare-fun arrayNoDuplicates!0 (array!18119 (_ BitVec 32) List!4946) Bool)

(assert (=> b!342841 (= res!189526 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4943))))

(declare-fun res!189525 () Bool)

(assert (=> start!34336 (=> (not res!189525) (not e!210231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34336 (= res!189525 (validMask!0 mask!2385))))

(assert (=> start!34336 e!210231))

(assert (=> start!34336 true))

(declare-fun tp_is_empty!7263 () Bool)

(assert (=> start!34336 tp_is_empty!7263))

(assert (=> start!34336 tp!25472))

(declare-fun array_inv!6350 (array!18117) Bool)

(assert (=> start!34336 (and (array_inv!6350 _values!1525) e!210228)))

(declare-fun array_inv!6351 (array!18119) Bool)

(assert (=> start!34336 (array_inv!6351 _keys!1895)))

(declare-fun b!342842 () Bool)

(declare-fun res!189524 () Bool)

(assert (=> b!342842 (=> (not res!189524) (not e!210231))))

(assert (=> b!342842 (= res!189524 (and (= (size!8929 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8930 _keys!1895) (size!8929 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12327 () Bool)

(declare-fun tp!25473 () Bool)

(declare-fun e!210227 () Bool)

(assert (=> mapNonEmpty!12327 (= mapRes!12327 (and tp!25473 e!210227))))

(declare-fun mapKey!12327 () (_ BitVec 32))

(declare-fun mapRest!12327 () (Array (_ BitVec 32) ValueCell!3288))

(declare-fun mapValue!12327 () ValueCell!3288)

(assert (=> mapNonEmpty!12327 (= (arr!8577 _values!1525) (store mapRest!12327 mapKey!12327 mapValue!12327))))

(declare-fun b!342843 () Bool)

(declare-datatypes ((Unit!10693 0))(
  ( (Unit!10694) )
))
(declare-fun e!210230 () Unit!10693)

(declare-fun Unit!10695 () Unit!10693)

(assert (=> b!342843 (= e!210230 Unit!10695)))

(declare-fun mapIsEmpty!12327 () Bool)

(assert (=> mapIsEmpty!12327 mapRes!12327))

(declare-fun b!342844 () Bool)

(declare-fun e!210226 () Bool)

(assert (=> b!342844 (= e!210226 false)))

(declare-fun lt!162257 () Unit!10693)

(assert (=> b!342844 (= lt!162257 e!210230)))

(declare-fun c!52848 () Bool)

(declare-fun arrayContainsKey!0 (array!18119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342844 (= c!52848 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342845 () Bool)

(assert (=> b!342845 (= e!210227 tp_is_empty!7263)))

(declare-fun b!342846 () Bool)

(declare-fun res!189527 () Bool)

(assert (=> b!342846 (=> (not res!189527) (not e!210231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18119 (_ BitVec 32)) Bool)

(assert (=> b!342846 (= res!189527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342847 () Bool)

(declare-fun res!189523 () Bool)

(assert (=> b!342847 (=> (not res!189523) (not e!210231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342847 (= res!189523 (validKeyInArray!0 k0!1348))))

(declare-fun b!342848 () Bool)

(assert (=> b!342848 (= e!210225 tp_is_empty!7263)))

(declare-fun b!342849 () Bool)

(assert (=> b!342849 (= e!210231 e!210226)))

(declare-fun res!189521 () Bool)

(assert (=> b!342849 (=> (not res!189521) (not e!210226))))

(declare-datatypes ((SeekEntryResult!3309 0))(
  ( (MissingZero!3309 (index!15415 (_ BitVec 32))) (Found!3309 (index!15416 (_ BitVec 32))) (Intermediate!3309 (undefined!4121 Bool) (index!15417 (_ BitVec 32)) (x!34131 (_ BitVec 32))) (Undefined!3309) (MissingVacant!3309 (index!15418 (_ BitVec 32))) )
))
(declare-fun lt!162258 () SeekEntryResult!3309)

(get-info :version)

(assert (=> b!342849 (= res!189521 (and (not ((_ is Found!3309) lt!162258)) (not ((_ is MissingZero!3309) lt!162258)) ((_ is MissingVacant!3309) lt!162258)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18119 (_ BitVec 32)) SeekEntryResult!3309)

(assert (=> b!342849 (= lt!162258 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342850 () Bool)

(declare-fun Unit!10696 () Unit!10693)

(assert (=> b!342850 (= e!210230 Unit!10696)))

(declare-fun lt!162259 () Unit!10693)

(declare-fun lemmaArrayContainsKeyThenInListMap!308 (array!18119 array!18117 (_ BitVec 32) (_ BitVec 32) V!10661 V!10661 (_ BitVec 64) (_ BitVec 32) Int) Unit!10693)

(declare-fun arrayScanForKey!0 (array!18119 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342850 (= lt!162259 (lemmaArrayContainsKeyThenInListMap!308 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342850 false))

(assert (= (and start!34336 res!189525) b!342842))

(assert (= (and b!342842 res!189524) b!342846))

(assert (= (and b!342846 res!189527) b!342841))

(assert (= (and b!342841 res!189526) b!342847))

(assert (= (and b!342847 res!189523) b!342839))

(assert (= (and b!342839 res!189522) b!342849))

(assert (= (and b!342849 res!189521) b!342844))

(assert (= (and b!342844 c!52848) b!342850))

(assert (= (and b!342844 (not c!52848)) b!342843))

(assert (= (and b!342840 condMapEmpty!12327) mapIsEmpty!12327))

(assert (= (and b!342840 (not condMapEmpty!12327)) mapNonEmpty!12327))

(assert (= (and mapNonEmpty!12327 ((_ is ValueCellFull!3288) mapValue!12327)) b!342845))

(assert (= (and b!342840 ((_ is ValueCellFull!3288) mapDefault!12327)) b!342848))

(assert (= start!34336 b!342840))

(declare-fun m!344883 () Bool)

(assert (=> b!342847 m!344883))

(declare-fun m!344885 () Bool)

(assert (=> mapNonEmpty!12327 m!344885))

(declare-fun m!344887 () Bool)

(assert (=> b!342844 m!344887))

(declare-fun m!344889 () Bool)

(assert (=> b!342849 m!344889))

(declare-fun m!344891 () Bool)

(assert (=> b!342850 m!344891))

(assert (=> b!342850 m!344891))

(declare-fun m!344893 () Bool)

(assert (=> b!342850 m!344893))

(declare-fun m!344895 () Bool)

(assert (=> b!342839 m!344895))

(assert (=> b!342839 m!344895))

(declare-fun m!344897 () Bool)

(assert (=> b!342839 m!344897))

(declare-fun m!344899 () Bool)

(assert (=> b!342846 m!344899))

(declare-fun m!344901 () Bool)

(assert (=> b!342841 m!344901))

(declare-fun m!344903 () Bool)

(assert (=> start!34336 m!344903))

(declare-fun m!344905 () Bool)

(assert (=> start!34336 m!344905))

(declare-fun m!344907 () Bool)

(assert (=> start!34336 m!344907))

(check-sat (not b!342846) (not b!342847) (not mapNonEmpty!12327) (not b!342849) tp_is_empty!7263 (not b_next!7311) (not b!342841) (not b!342839) (not start!34336) b_and!14515 (not b!342844) (not b!342850))
(check-sat b_and!14515 (not b_next!7311))
