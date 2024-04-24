; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35164 () Bool)

(assert start!35164)

(declare-fun b_free!7771 () Bool)

(declare-fun b_next!7771 () Bool)

(assert (=> start!35164 (= b_free!7771 (not b_next!7771))))

(declare-fun tp!26904 () Bool)

(declare-fun b_and!15023 () Bool)

(assert (=> start!35164 (= tp!26904 b_and!15023)))

(declare-fun b!352565 () Bool)

(declare-fun res!195515 () Bool)

(declare-fun e!215902 () Bool)

(assert (=> b!352565 (=> (not res!195515) (not e!215902))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11275 0))(
  ( (V!11276 (val!3906 Int)) )
))
(declare-datatypes ((ValueCell!3518 0))(
  ( (ValueCellFull!3518 (v!6098 V!11275)) (EmptyCell!3518) )
))
(declare-datatypes ((array!19026 0))(
  ( (array!19027 (arr!9014 (Array (_ BitVec 32) ValueCell!3518)) (size!9366 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19026)

(declare-datatypes ((array!19028 0))(
  ( (array!19029 (arr!9015 (Array (_ BitVec 32) (_ BitVec 64))) (size!9367 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19028)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352565 (= res!195515 (and (= (size!9366 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9367 _keys!1895) (size!9366 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352566 () Bool)

(assert (=> b!352566 (= e!215902 false)))

(declare-datatypes ((SeekEntryResult!3422 0))(
  ( (MissingZero!3422 (index!15867 (_ BitVec 32))) (Found!3422 (index!15868 (_ BitVec 32))) (Intermediate!3422 (undefined!4234 Bool) (index!15869 (_ BitVec 32)) (x!35027 (_ BitVec 32))) (Undefined!3422) (MissingVacant!3422 (index!15870 (_ BitVec 32))) )
))
(declare-fun lt!165340 () SeekEntryResult!3422)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19028 (_ BitVec 32)) SeekEntryResult!3422)

(assert (=> b!352566 (= lt!165340 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352567 () Bool)

(declare-fun res!195517 () Bool)

(assert (=> b!352567 (=> (not res!195517) (not e!215902))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11275)

(declare-fun zeroValue!1467 () V!11275)

(declare-datatypes ((tuple2!5548 0))(
  ( (tuple2!5549 (_1!2785 (_ BitVec 64)) (_2!2785 V!11275)) )
))
(declare-datatypes ((List!5153 0))(
  ( (Nil!5150) (Cons!5149 (h!6005 tuple2!5548) (t!10291 List!5153)) )
))
(declare-datatypes ((ListLongMap!4463 0))(
  ( (ListLongMap!4464 (toList!2247 List!5153)) )
))
(declare-fun contains!2339 (ListLongMap!4463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1775 (array!19028 array!19026 (_ BitVec 32) (_ BitVec 32) V!11275 V!11275 (_ BitVec 32) Int) ListLongMap!4463)

(assert (=> b!352567 (= res!195517 (not (contains!2339 (getCurrentListMap!1775 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352568 () Bool)

(declare-fun res!195513 () Bool)

(assert (=> b!352568 (=> (not res!195513) (not e!215902))))

(declare-datatypes ((List!5154 0))(
  ( (Nil!5151) (Cons!5150 (h!6006 (_ BitVec 64)) (t!10292 List!5154)) )
))
(declare-fun arrayNoDuplicates!0 (array!19028 (_ BitVec 32) List!5154) Bool)

(assert (=> b!352568 (= res!195513 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5151))))

(declare-fun mapNonEmpty!13068 () Bool)

(declare-fun mapRes!13068 () Bool)

(declare-fun tp!26903 () Bool)

(declare-fun e!215899 () Bool)

(assert (=> mapNonEmpty!13068 (= mapRes!13068 (and tp!26903 e!215899))))

(declare-fun mapKey!13068 () (_ BitVec 32))

(declare-fun mapRest!13068 () (Array (_ BitVec 32) ValueCell!3518))

(declare-fun mapValue!13068 () ValueCell!3518)

(assert (=> mapNonEmpty!13068 (= (arr!9014 _values!1525) (store mapRest!13068 mapKey!13068 mapValue!13068))))

(declare-fun b!352569 () Bool)

(declare-fun res!195518 () Bool)

(assert (=> b!352569 (=> (not res!195518) (not e!215902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352569 (= res!195518 (validKeyInArray!0 k0!1348))))

(declare-fun res!195514 () Bool)

(assert (=> start!35164 (=> (not res!195514) (not e!215902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35164 (= res!195514 (validMask!0 mask!2385))))

(assert (=> start!35164 e!215902))

(assert (=> start!35164 true))

(declare-fun tp_is_empty!7723 () Bool)

(assert (=> start!35164 tp_is_empty!7723))

(assert (=> start!35164 tp!26904))

(declare-fun e!215900 () Bool)

(declare-fun array_inv!6658 (array!19026) Bool)

(assert (=> start!35164 (and (array_inv!6658 _values!1525) e!215900)))

(declare-fun array_inv!6659 (array!19028) Bool)

(assert (=> start!35164 (array_inv!6659 _keys!1895)))

(declare-fun b!352570 () Bool)

(declare-fun e!215903 () Bool)

(assert (=> b!352570 (= e!215900 (and e!215903 mapRes!13068))))

(declare-fun condMapEmpty!13068 () Bool)

(declare-fun mapDefault!13068 () ValueCell!3518)

(assert (=> b!352570 (= condMapEmpty!13068 (= (arr!9014 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3518)) mapDefault!13068)))))

(declare-fun b!352571 () Bool)

(declare-fun res!195516 () Bool)

(assert (=> b!352571 (=> (not res!195516) (not e!215902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19028 (_ BitVec 32)) Bool)

(assert (=> b!352571 (= res!195516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13068 () Bool)

(assert (=> mapIsEmpty!13068 mapRes!13068))

(declare-fun b!352572 () Bool)

(assert (=> b!352572 (= e!215899 tp_is_empty!7723)))

(declare-fun b!352573 () Bool)

(assert (=> b!352573 (= e!215903 tp_is_empty!7723)))

(assert (= (and start!35164 res!195514) b!352565))

(assert (= (and b!352565 res!195515) b!352571))

(assert (= (and b!352571 res!195516) b!352568))

(assert (= (and b!352568 res!195513) b!352569))

(assert (= (and b!352569 res!195518) b!352567))

(assert (= (and b!352567 res!195517) b!352566))

(assert (= (and b!352570 condMapEmpty!13068) mapIsEmpty!13068))

(assert (= (and b!352570 (not condMapEmpty!13068)) mapNonEmpty!13068))

(get-info :version)

(assert (= (and mapNonEmpty!13068 ((_ is ValueCellFull!3518) mapValue!13068)) b!352572))

(assert (= (and b!352570 ((_ is ValueCellFull!3518) mapDefault!13068)) b!352573))

(assert (= start!35164 b!352570))

(declare-fun m!352431 () Bool)

(assert (=> b!352566 m!352431))

(declare-fun m!352433 () Bool)

(assert (=> start!35164 m!352433))

(declare-fun m!352435 () Bool)

(assert (=> start!35164 m!352435))

(declare-fun m!352437 () Bool)

(assert (=> start!35164 m!352437))

(declare-fun m!352439 () Bool)

(assert (=> b!352571 m!352439))

(declare-fun m!352441 () Bool)

(assert (=> b!352568 m!352441))

(declare-fun m!352443 () Bool)

(assert (=> b!352569 m!352443))

(declare-fun m!352445 () Bool)

(assert (=> mapNonEmpty!13068 m!352445))

(declare-fun m!352447 () Bool)

(assert (=> b!352567 m!352447))

(assert (=> b!352567 m!352447))

(declare-fun m!352449 () Bool)

(assert (=> b!352567 m!352449))

(check-sat b_and!15023 (not start!35164) (not b!352568) (not b!352569) (not b!352567) tp_is_empty!7723 (not mapNonEmpty!13068) (not b_next!7771) (not b!352571) (not b!352566))
(check-sat b_and!15023 (not b_next!7771))
