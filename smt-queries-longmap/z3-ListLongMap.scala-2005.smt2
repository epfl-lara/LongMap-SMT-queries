; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35012 () Bool)

(assert start!35012)

(declare-fun b_free!7701 () Bool)

(declare-fun b_next!7701 () Bool)

(assert (=> start!35012 (= b_free!7701 (not b_next!7701))))

(declare-fun tp!26681 () Bool)

(declare-fun b_and!14931 () Bool)

(assert (=> start!35012 (= tp!26681 b_and!14931)))

(declare-fun mapIsEmpty!12951 () Bool)

(declare-fun mapRes!12951 () Bool)

(assert (=> mapIsEmpty!12951 mapRes!12951))

(declare-fun b!350810 () Bool)

(declare-fun res!194468 () Bool)

(declare-fun e!214866 () Bool)

(assert (=> b!350810 (=> (not res!194468) (not e!214866))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350810 (= res!194468 (validKeyInArray!0 k0!1348))))

(declare-fun b!350811 () Bool)

(declare-fun res!194470 () Bool)

(assert (=> b!350811 (=> (not res!194470) (not e!214866))))

(declare-datatypes ((array!18893 0))(
  ( (array!18894 (arr!8952 (Array (_ BitVec 32) (_ BitVec 64))) (size!9304 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18893)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18893 (_ BitVec 32)) Bool)

(assert (=> b!350811 (= res!194470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350812 () Bool)

(declare-fun res!194465 () Bool)

(assert (=> b!350812 (=> (not res!194465) (not e!214866))))

(declare-datatypes ((V!11181 0))(
  ( (V!11182 (val!3871 Int)) )
))
(declare-datatypes ((ValueCell!3483 0))(
  ( (ValueCellFull!3483 (v!6058 V!11181)) (EmptyCell!3483) )
))
(declare-datatypes ((array!18895 0))(
  ( (array!18896 (arr!8953 (Array (_ BitVec 32) ValueCell!3483)) (size!9305 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18895)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350812 (= res!194465 (and (= (size!9305 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9304 _keys!1895) (size!9305 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350813 () Bool)

(declare-fun res!194466 () Bool)

(assert (=> b!350813 (=> (not res!194466) (not e!214866))))

(declare-fun zeroValue!1467 () V!11181)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11181)

(declare-datatypes ((tuple2!5586 0))(
  ( (tuple2!5587 (_1!2804 (_ BitVec 64)) (_2!2804 V!11181)) )
))
(declare-datatypes ((List!5207 0))(
  ( (Nil!5204) (Cons!5203 (h!6059 tuple2!5586) (t!10345 List!5207)) )
))
(declare-datatypes ((ListLongMap!4499 0))(
  ( (ListLongMap!4500 (toList!2265 List!5207)) )
))
(declare-fun contains!2334 (ListLongMap!4499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1786 (array!18893 array!18895 (_ BitVec 32) (_ BitVec 32) V!11181 V!11181 (_ BitVec 32) Int) ListLongMap!4499)

(assert (=> b!350813 (= res!194466 (not (contains!2334 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350814 () Bool)

(declare-fun res!194472 () Bool)

(assert (=> b!350814 (=> (not res!194472) (not e!214866))))

(declare-datatypes ((List!5208 0))(
  ( (Nil!5205) (Cons!5204 (h!6060 (_ BitVec 64)) (t!10346 List!5208)) )
))
(declare-fun arrayNoDuplicates!0 (array!18893 (_ BitVec 32) List!5208) Bool)

(assert (=> b!350814 (= res!194472 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5205))))

(declare-fun b!350815 () Bool)

(declare-fun e!214864 () Bool)

(declare-fun e!214862 () Bool)

(assert (=> b!350815 (= e!214864 (and e!214862 mapRes!12951))))

(declare-fun condMapEmpty!12951 () Bool)

(declare-fun mapDefault!12951 () ValueCell!3483)

(assert (=> b!350815 (= condMapEmpty!12951 (= (arr!8953 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3483)) mapDefault!12951)))))

(declare-fun b!350816 () Bool)

(declare-fun res!194471 () Bool)

(declare-fun e!214863 () Bool)

(assert (=> b!350816 (=> (not res!194471) (not e!214863))))

(declare-fun arrayContainsKey!0 (array!18893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350816 (= res!194471 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350817 () Bool)

(assert (=> b!350817 (= e!214863 false)))

(declare-fun lt!164650 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18893 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350817 (= lt!164650 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194469 () Bool)

(assert (=> start!35012 (=> (not res!194469) (not e!214866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35012 (= res!194469 (validMask!0 mask!2385))))

(assert (=> start!35012 e!214866))

(assert (=> start!35012 true))

(declare-fun tp_is_empty!7653 () Bool)

(assert (=> start!35012 tp_is_empty!7653))

(assert (=> start!35012 tp!26681))

(declare-fun array_inv!6606 (array!18895) Bool)

(assert (=> start!35012 (and (array_inv!6606 _values!1525) e!214864)))

(declare-fun array_inv!6607 (array!18893) Bool)

(assert (=> start!35012 (array_inv!6607 _keys!1895)))

(declare-fun b!350818 () Bool)

(assert (=> b!350818 (= e!214866 e!214863)))

(declare-fun res!194467 () Bool)

(assert (=> b!350818 (=> (not res!194467) (not e!214863))))

(declare-datatypes ((SeekEntryResult!3444 0))(
  ( (MissingZero!3444 (index!15955 (_ BitVec 32))) (Found!3444 (index!15956 (_ BitVec 32))) (Intermediate!3444 (undefined!4256 Bool) (index!15957 (_ BitVec 32)) (x!34916 (_ BitVec 32))) (Undefined!3444) (MissingVacant!3444 (index!15958 (_ BitVec 32))) )
))
(declare-fun lt!164649 () SeekEntryResult!3444)

(get-info :version)

(assert (=> b!350818 (= res!194467 (and (not ((_ is Found!3444) lt!164649)) (not ((_ is MissingZero!3444) lt!164649)) ((_ is MissingVacant!3444) lt!164649)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18893 (_ BitVec 32)) SeekEntryResult!3444)

(assert (=> b!350818 (= lt!164649 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350819 () Bool)

(assert (=> b!350819 (= e!214862 tp_is_empty!7653)))

(declare-fun b!350820 () Bool)

(declare-fun e!214865 () Bool)

(assert (=> b!350820 (= e!214865 tp_is_empty!7653)))

(declare-fun mapNonEmpty!12951 () Bool)

(declare-fun tp!26682 () Bool)

(assert (=> mapNonEmpty!12951 (= mapRes!12951 (and tp!26682 e!214865))))

(declare-fun mapValue!12951 () ValueCell!3483)

(declare-fun mapKey!12951 () (_ BitVec 32))

(declare-fun mapRest!12951 () (Array (_ BitVec 32) ValueCell!3483))

(assert (=> mapNonEmpty!12951 (= (arr!8953 _values!1525) (store mapRest!12951 mapKey!12951 mapValue!12951))))

(assert (= (and start!35012 res!194469) b!350812))

(assert (= (and b!350812 res!194465) b!350811))

(assert (= (and b!350811 res!194470) b!350814))

(assert (= (and b!350814 res!194472) b!350810))

(assert (= (and b!350810 res!194468) b!350813))

(assert (= (and b!350813 res!194466) b!350818))

(assert (= (and b!350818 res!194467) b!350816))

(assert (= (and b!350816 res!194471) b!350817))

(assert (= (and b!350815 condMapEmpty!12951) mapIsEmpty!12951))

(assert (= (and b!350815 (not condMapEmpty!12951)) mapNonEmpty!12951))

(assert (= (and mapNonEmpty!12951 ((_ is ValueCellFull!3483) mapValue!12951)) b!350820))

(assert (= (and b!350815 ((_ is ValueCellFull!3483) mapDefault!12951)) b!350819))

(assert (= start!35012 b!350815))

(declare-fun m!350905 () Bool)

(assert (=> b!350816 m!350905))

(declare-fun m!350907 () Bool)

(assert (=> b!350817 m!350907))

(declare-fun m!350909 () Bool)

(assert (=> b!350818 m!350909))

(declare-fun m!350911 () Bool)

(assert (=> start!35012 m!350911))

(declare-fun m!350913 () Bool)

(assert (=> start!35012 m!350913))

(declare-fun m!350915 () Bool)

(assert (=> start!35012 m!350915))

(declare-fun m!350917 () Bool)

(assert (=> b!350813 m!350917))

(assert (=> b!350813 m!350917))

(declare-fun m!350919 () Bool)

(assert (=> b!350813 m!350919))

(declare-fun m!350921 () Bool)

(assert (=> b!350811 m!350921))

(declare-fun m!350923 () Bool)

(assert (=> mapNonEmpty!12951 m!350923))

(declare-fun m!350925 () Bool)

(assert (=> b!350814 m!350925))

(declare-fun m!350927 () Bool)

(assert (=> b!350810 m!350927))

(check-sat (not b!350810) (not b!350813) tp_is_empty!7653 (not start!35012) (not mapNonEmpty!12951) (not b!350817) (not b_next!7701) (not b!350811) (not b!350816) b_and!14931 (not b!350818) (not b!350814))
(check-sat b_and!14931 (not b_next!7701))
