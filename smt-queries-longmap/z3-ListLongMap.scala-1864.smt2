; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33604 () Bool)

(assert start!33604)

(declare-fun b_free!6853 () Bool)

(declare-fun b_next!6853 () Bool)

(assert (=> start!33604 (= b_free!6853 (not b_next!6853))))

(declare-fun tp!24063 () Bool)

(declare-fun b_and!14047 () Bool)

(assert (=> start!33604 (= tp!24063 b_and!14047)))

(declare-fun b!333558 () Bool)

(declare-fun res!183781 () Bool)

(declare-fun e!204809 () Bool)

(assert (=> b!333558 (=> (not res!183781) (not e!204809))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10051 0))(
  ( (V!10052 (val!3447 Int)) )
))
(declare-fun zeroValue!1467 () V!10051)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3059 0))(
  ( (ValueCellFull!3059 (v!5610 V!10051)) (EmptyCell!3059) )
))
(declare-datatypes ((array!17200 0))(
  ( (array!17201 (arr!8130 (Array (_ BitVec 32) ValueCell!3059)) (size!8482 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17200)

(declare-datatypes ((array!17202 0))(
  ( (array!17203 (arr!8131 (Array (_ BitVec 32) (_ BitVec 64))) (size!8483 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17202)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10051)

(declare-datatypes ((tuple2!4930 0))(
  ( (tuple2!4931 (_1!2476 (_ BitVec 64)) (_2!2476 V!10051)) )
))
(declare-datatypes ((List!4544 0))(
  ( (Nil!4541) (Cons!4540 (h!5396 tuple2!4930) (t!9624 List!4544)) )
))
(declare-datatypes ((ListLongMap!3845 0))(
  ( (ListLongMap!3846 (toList!1938 List!4544)) )
))
(declare-fun contains!2001 (ListLongMap!3845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1470 (array!17202 array!17200 (_ BitVec 32) (_ BitVec 32) V!10051 V!10051 (_ BitVec 32) Int) ListLongMap!3845)

(assert (=> b!333558 (= res!183781 (not (contains!2001 (getCurrentListMap!1470 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!11604 () Bool)

(declare-fun mapRes!11604 () Bool)

(assert (=> mapIsEmpty!11604 mapRes!11604))

(declare-fun b!333559 () Bool)

(declare-fun e!204812 () Bool)

(declare-fun tp_is_empty!6805 () Bool)

(assert (=> b!333559 (= e!204812 tp_is_empty!6805)))

(declare-fun b!333560 () Bool)

(declare-fun res!183778 () Bool)

(assert (=> b!333560 (=> (not res!183778) (not e!204809))))

(assert (=> b!333560 (= res!183778 (and (= (size!8482 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8483 _keys!1895) (size!8482 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11604 () Bool)

(declare-fun tp!24062 () Bool)

(declare-fun e!204811 () Bool)

(assert (=> mapNonEmpty!11604 (= mapRes!11604 (and tp!24062 e!204811))))

(declare-fun mapRest!11604 () (Array (_ BitVec 32) ValueCell!3059))

(declare-fun mapKey!11604 () (_ BitVec 32))

(declare-fun mapValue!11604 () ValueCell!3059)

(assert (=> mapNonEmpty!11604 (= (arr!8130 _values!1525) (store mapRest!11604 mapKey!11604 mapValue!11604))))

(declare-fun b!333561 () Bool)

(assert (=> b!333561 (= e!204811 tp_is_empty!6805)))

(declare-fun b!333562 () Bool)

(declare-fun res!183780 () Bool)

(assert (=> b!333562 (=> (not res!183780) (not e!204809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17202 (_ BitVec 32)) Bool)

(assert (=> b!333562 (= res!183780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183779 () Bool)

(assert (=> start!33604 (=> (not res!183779) (not e!204809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33604 (= res!183779 (validMask!0 mask!2385))))

(assert (=> start!33604 e!204809))

(assert (=> start!33604 true))

(assert (=> start!33604 tp_is_empty!6805))

(assert (=> start!33604 tp!24063))

(declare-fun e!204808 () Bool)

(declare-fun array_inv!6050 (array!17200) Bool)

(assert (=> start!33604 (and (array_inv!6050 _values!1525) e!204808)))

(declare-fun array_inv!6051 (array!17202) Bool)

(assert (=> start!33604 (array_inv!6051 _keys!1895)))

(declare-fun b!333563 () Bool)

(declare-fun res!183777 () Bool)

(assert (=> b!333563 (=> (not res!183777) (not e!204809))))

(declare-datatypes ((List!4545 0))(
  ( (Nil!4542) (Cons!4541 (h!5397 (_ BitVec 64)) (t!9625 List!4545)) )
))
(declare-fun arrayNoDuplicates!0 (array!17202 (_ BitVec 32) List!4545) Bool)

(assert (=> b!333563 (= res!183777 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4542))))

(declare-fun b!333564 () Bool)

(declare-fun res!183782 () Bool)

(assert (=> b!333564 (=> (not res!183782) (not e!204809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333564 (= res!183782 (validKeyInArray!0 k0!1348))))

(declare-fun b!333565 () Bool)

(assert (=> b!333565 (= e!204808 (and e!204812 mapRes!11604))))

(declare-fun condMapEmpty!11604 () Bool)

(declare-fun mapDefault!11604 () ValueCell!3059)

(assert (=> b!333565 (= condMapEmpty!11604 (= (arr!8130 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3059)) mapDefault!11604)))))

(declare-fun b!333566 () Bool)

(assert (=> b!333566 (= e!204809 false)))

(declare-datatypes ((SeekEntryResult!3106 0))(
  ( (MissingZero!3106 (index!14603 (_ BitVec 32))) (Found!3106 (index!14604 (_ BitVec 32))) (Intermediate!3106 (undefined!3918 Bool) (index!14605 (_ BitVec 32)) (x!33197 (_ BitVec 32))) (Undefined!3106) (MissingVacant!3106 (index!14606 (_ BitVec 32))) )
))
(declare-fun lt!159400 () SeekEntryResult!3106)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17202 (_ BitVec 32)) SeekEntryResult!3106)

(assert (=> b!333566 (= lt!159400 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33604 res!183779) b!333560))

(assert (= (and b!333560 res!183778) b!333562))

(assert (= (and b!333562 res!183780) b!333563))

(assert (= (and b!333563 res!183777) b!333564))

(assert (= (and b!333564 res!183782) b!333558))

(assert (= (and b!333558 res!183781) b!333566))

(assert (= (and b!333565 condMapEmpty!11604) mapIsEmpty!11604))

(assert (= (and b!333565 (not condMapEmpty!11604)) mapNonEmpty!11604))

(get-info :version)

(assert (= (and mapNonEmpty!11604 ((_ is ValueCellFull!3059) mapValue!11604)) b!333561))

(assert (= (and b!333565 ((_ is ValueCellFull!3059) mapDefault!11604)) b!333559))

(assert (= start!33604 b!333565))

(declare-fun m!338045 () Bool)

(assert (=> start!33604 m!338045))

(declare-fun m!338047 () Bool)

(assert (=> start!33604 m!338047))

(declare-fun m!338049 () Bool)

(assert (=> start!33604 m!338049))

(declare-fun m!338051 () Bool)

(assert (=> b!333558 m!338051))

(assert (=> b!333558 m!338051))

(declare-fun m!338053 () Bool)

(assert (=> b!333558 m!338053))

(declare-fun m!338055 () Bool)

(assert (=> b!333566 m!338055))

(declare-fun m!338057 () Bool)

(assert (=> b!333563 m!338057))

(declare-fun m!338059 () Bool)

(assert (=> mapNonEmpty!11604 m!338059))

(declare-fun m!338061 () Bool)

(assert (=> b!333562 m!338061))

(declare-fun m!338063 () Bool)

(assert (=> b!333564 m!338063))

(check-sat (not b!333562) (not b!333564) (not mapNonEmpty!11604) tp_is_empty!6805 (not b!333563) (not b!333558) (not b!333566) b_and!14047 (not b_next!6853) (not start!33604))
(check-sat b_and!14047 (not b_next!6853))
