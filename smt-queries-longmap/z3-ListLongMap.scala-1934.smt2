; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34284 () Bool)

(assert start!34284)

(declare-fun b_free!7273 () Bool)

(declare-fun b_next!7273 () Bool)

(assert (=> start!34284 (= b_free!7273 (not b_next!7273))))

(declare-fun tp!25358 () Bool)

(declare-fun b_and!14451 () Bool)

(assert (=> start!34284 (= tp!25358 b_and!14451)))

(declare-fun b!341880 () Bool)

(declare-fun res!188998 () Bool)

(declare-fun e!209650 () Bool)

(assert (=> b!341880 (=> (not res!188998) (not e!209650))))

(declare-datatypes ((array!18029 0))(
  ( (array!18030 (arr!8533 (Array (_ BitVec 32) (_ BitVec 64))) (size!8886 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18029)

(declare-datatypes ((List!4871 0))(
  ( (Nil!4868) (Cons!4867 (h!5723 (_ BitVec 64)) (t!9974 List!4871)) )
))
(declare-fun arrayNoDuplicates!0 (array!18029 (_ BitVec 32) List!4871) Bool)

(assert (=> b!341880 (= res!188998 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4868))))

(declare-fun mapIsEmpty!12270 () Bool)

(declare-fun mapRes!12270 () Bool)

(assert (=> mapIsEmpty!12270 mapRes!12270))

(declare-fun b!341881 () Bool)

(declare-fun e!209654 () Bool)

(assert (=> b!341881 (= e!209650 e!209654)))

(declare-fun res!188993 () Bool)

(assert (=> b!341881 (=> (not res!188993) (not e!209654))))

(declare-datatypes ((SeekEntryResult!3288 0))(
  ( (MissingZero!3288 (index!15331 (_ BitVec 32))) (Found!3288 (index!15332 (_ BitVec 32))) (Intermediate!3288 (undefined!4100 Bool) (index!15333 (_ BitVec 32)) (x!34057 (_ BitVec 32))) (Undefined!3288) (MissingVacant!3288 (index!15334 (_ BitVec 32))) )
))
(declare-fun lt!161842 () SeekEntryResult!3288)

(get-info :version)

(assert (=> b!341881 (= res!188993 (and (not ((_ is Found!3288) lt!161842)) (not ((_ is MissingZero!3288) lt!161842)) ((_ is MissingVacant!3288) lt!161842)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18029 (_ BitVec 32)) SeekEntryResult!3288)

(assert (=> b!341881 (= lt!161842 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341882 () Bool)

(declare-datatypes ((Unit!10603 0))(
  ( (Unit!10604) )
))
(declare-fun e!209656 () Unit!10603)

(declare-fun Unit!10605 () Unit!10603)

(assert (=> b!341882 (= e!209656 Unit!10605)))

(declare-datatypes ((V!10611 0))(
  ( (V!10612 (val!3657 Int)) )
))
(declare-fun zeroValue!1467 () V!10611)

(declare-fun lt!161843 () Unit!10603)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3269 0))(
  ( (ValueCellFull!3269 (v!5825 V!10611)) (EmptyCell!3269) )
))
(declare-datatypes ((array!18031 0))(
  ( (array!18032 (arr!8534 (Array (_ BitVec 32) ValueCell!3269)) (size!8887 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18031)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10611)

(declare-fun lemmaArrayContainsKeyThenInListMap!294 (array!18029 array!18031 (_ BitVec 32) (_ BitVec 32) V!10611 V!10611 (_ BitVec 64) (_ BitVec 32) Int) Unit!10603)

(declare-fun arrayScanForKey!0 (array!18029 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341882 (= lt!161843 (lemmaArrayContainsKeyThenInListMap!294 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341882 false))

(declare-fun b!341883 () Bool)

(declare-fun res!188996 () Bool)

(assert (=> b!341883 (=> (not res!188996) (not e!209650))))

(assert (=> b!341883 (= res!188996 (and (= (size!8887 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8886 _keys!1895) (size!8887 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341884 () Bool)

(declare-fun res!188997 () Bool)

(assert (=> b!341884 (=> (not res!188997) (not e!209650))))

(declare-datatypes ((tuple2!5248 0))(
  ( (tuple2!5249 (_1!2635 (_ BitVec 64)) (_2!2635 V!10611)) )
))
(declare-datatypes ((List!4872 0))(
  ( (Nil!4869) (Cons!4868 (h!5724 tuple2!5248) (t!9975 List!4872)) )
))
(declare-datatypes ((ListLongMap!4151 0))(
  ( (ListLongMap!4152 (toList!2091 List!4872)) )
))
(declare-fun contains!2158 (ListLongMap!4151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1597 (array!18029 array!18031 (_ BitVec 32) (_ BitVec 32) V!10611 V!10611 (_ BitVec 32) Int) ListLongMap!4151)

(assert (=> b!341884 (= res!188997 (not (contains!2158 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341885 () Bool)

(declare-fun Unit!10606 () Unit!10603)

(assert (=> b!341885 (= e!209656 Unit!10606)))

(declare-fun b!341886 () Bool)

(declare-fun e!209655 () Bool)

(declare-fun tp_is_empty!7225 () Bool)

(assert (=> b!341886 (= e!209655 tp_is_empty!7225)))

(declare-fun b!341887 () Bool)

(assert (=> b!341887 (= e!209654 false)))

(declare-fun lt!161844 () Unit!10603)

(assert (=> b!341887 (= lt!161844 e!209656)))

(declare-fun c!52718 () Bool)

(declare-fun arrayContainsKey!0 (array!18029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341887 (= c!52718 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341888 () Bool)

(declare-fun e!209651 () Bool)

(assert (=> b!341888 (= e!209651 tp_is_empty!7225)))

(declare-fun b!341889 () Bool)

(declare-fun res!188995 () Bool)

(assert (=> b!341889 (=> (not res!188995) (not e!209650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18029 (_ BitVec 32)) Bool)

(assert (=> b!341889 (= res!188995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341890 () Bool)

(declare-fun e!209653 () Bool)

(assert (=> b!341890 (= e!209653 (and e!209655 mapRes!12270))))

(declare-fun condMapEmpty!12270 () Bool)

(declare-fun mapDefault!12270 () ValueCell!3269)

(assert (=> b!341890 (= condMapEmpty!12270 (= (arr!8534 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3269)) mapDefault!12270)))))

(declare-fun b!341891 () Bool)

(declare-fun res!188999 () Bool)

(assert (=> b!341891 (=> (not res!188999) (not e!209650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341891 (= res!188999 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12270 () Bool)

(declare-fun tp!25359 () Bool)

(assert (=> mapNonEmpty!12270 (= mapRes!12270 (and tp!25359 e!209651))))

(declare-fun mapKey!12270 () (_ BitVec 32))

(declare-fun mapValue!12270 () ValueCell!3269)

(declare-fun mapRest!12270 () (Array (_ BitVec 32) ValueCell!3269))

(assert (=> mapNonEmpty!12270 (= (arr!8534 _values!1525) (store mapRest!12270 mapKey!12270 mapValue!12270))))

(declare-fun res!188994 () Bool)

(assert (=> start!34284 (=> (not res!188994) (not e!209650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34284 (= res!188994 (validMask!0 mask!2385))))

(assert (=> start!34284 e!209650))

(assert (=> start!34284 true))

(assert (=> start!34284 tp_is_empty!7225))

(assert (=> start!34284 tp!25358))

(declare-fun array_inv!6348 (array!18031) Bool)

(assert (=> start!34284 (and (array_inv!6348 _values!1525) e!209653)))

(declare-fun array_inv!6349 (array!18029) Bool)

(assert (=> start!34284 (array_inv!6349 _keys!1895)))

(assert (= (and start!34284 res!188994) b!341883))

(assert (= (and b!341883 res!188996) b!341889))

(assert (= (and b!341889 res!188995) b!341880))

(assert (= (and b!341880 res!188998) b!341891))

(assert (= (and b!341891 res!188999) b!341884))

(assert (= (and b!341884 res!188997) b!341881))

(assert (= (and b!341881 res!188993) b!341887))

(assert (= (and b!341887 c!52718) b!341882))

(assert (= (and b!341887 (not c!52718)) b!341885))

(assert (= (and b!341890 condMapEmpty!12270) mapIsEmpty!12270))

(assert (= (and b!341890 (not condMapEmpty!12270)) mapNonEmpty!12270))

(assert (= (and mapNonEmpty!12270 ((_ is ValueCellFull!3269) mapValue!12270)) b!341888))

(assert (= (and b!341890 ((_ is ValueCellFull!3269) mapDefault!12270)) b!341886))

(assert (= start!34284 b!341890))

(declare-fun m!343659 () Bool)

(assert (=> b!341891 m!343659))

(declare-fun m!343661 () Bool)

(assert (=> b!341882 m!343661))

(assert (=> b!341882 m!343661))

(declare-fun m!343663 () Bool)

(assert (=> b!341882 m!343663))

(declare-fun m!343665 () Bool)

(assert (=> b!341884 m!343665))

(assert (=> b!341884 m!343665))

(declare-fun m!343667 () Bool)

(assert (=> b!341884 m!343667))

(declare-fun m!343669 () Bool)

(assert (=> b!341881 m!343669))

(declare-fun m!343671 () Bool)

(assert (=> mapNonEmpty!12270 m!343671))

(declare-fun m!343673 () Bool)

(assert (=> b!341889 m!343673))

(declare-fun m!343675 () Bool)

(assert (=> b!341880 m!343675))

(declare-fun m!343677 () Bool)

(assert (=> b!341887 m!343677))

(declare-fun m!343679 () Bool)

(assert (=> start!34284 m!343679))

(declare-fun m!343681 () Bool)

(assert (=> start!34284 m!343681))

(declare-fun m!343683 () Bool)

(assert (=> start!34284 m!343683))

(check-sat (not mapNonEmpty!12270) (not start!34284) (not b!341882) (not b!341887) (not b!341881) (not b!341889) (not b_next!7273) (not b!341884) b_and!14451 tp_is_empty!7225 (not b!341891) (not b!341880))
(check-sat b_and!14451 (not b_next!7273))
