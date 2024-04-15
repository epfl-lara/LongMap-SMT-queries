; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33604 () Bool)

(assert start!33604)

(declare-fun b_free!6853 () Bool)

(declare-fun b_next!6853 () Bool)

(assert (=> start!33604 (= b_free!6853 (not b_next!6853))))

(declare-fun tp!24062 () Bool)

(declare-fun b_and!14007 () Bool)

(assert (=> start!33604 (= tp!24062 b_and!14007)))

(declare-fun b!333336 () Bool)

(declare-fun res!183652 () Bool)

(declare-fun e!204668 () Bool)

(assert (=> b!333336 (=> (not res!183652) (not e!204668))))

(declare-datatypes ((array!17191 0))(
  ( (array!17192 (arr!8126 (Array (_ BitVec 32) (_ BitVec 64))) (size!8479 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17191)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17191 (_ BitVec 32)) Bool)

(assert (=> b!333336 (= res!183652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333337 () Bool)

(declare-fun res!183653 () Bool)

(assert (=> b!333337 (=> (not res!183653) (not e!204668))))

(declare-datatypes ((List!4596 0))(
  ( (Nil!4593) (Cons!4592 (h!5448 (_ BitVec 64)) (t!9675 List!4596)) )
))
(declare-fun arrayNoDuplicates!0 (array!17191 (_ BitVec 32) List!4596) Bool)

(assert (=> b!333337 (= res!183653 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4593))))

(declare-fun res!183656 () Bool)

(assert (=> start!33604 (=> (not res!183656) (not e!204668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33604 (= res!183656 (validMask!0 mask!2385))))

(assert (=> start!33604 e!204668))

(assert (=> start!33604 true))

(declare-fun tp_is_empty!6805 () Bool)

(assert (=> start!33604 tp_is_empty!6805))

(assert (=> start!33604 tp!24062))

(declare-datatypes ((V!10051 0))(
  ( (V!10052 (val!3447 Int)) )
))
(declare-datatypes ((ValueCell!3059 0))(
  ( (ValueCellFull!3059 (v!5603 V!10051)) (EmptyCell!3059) )
))
(declare-datatypes ((array!17193 0))(
  ( (array!17194 (arr!8127 (Array (_ BitVec 32) ValueCell!3059)) (size!8480 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17193)

(declare-fun e!204669 () Bool)

(declare-fun array_inv!6062 (array!17193) Bool)

(assert (=> start!33604 (and (array_inv!6062 _values!1525) e!204669)))

(declare-fun array_inv!6063 (array!17191) Bool)

(assert (=> start!33604 (array_inv!6063 _keys!1895)))

(declare-fun b!333338 () Bool)

(declare-fun e!204667 () Bool)

(assert (=> b!333338 (= e!204667 tp_is_empty!6805)))

(declare-fun b!333339 () Bool)

(declare-fun res!183654 () Bool)

(assert (=> b!333339 (=> (not res!183654) (not e!204668))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333339 (= res!183654 (and (= (size!8480 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8479 _keys!1895) (size!8480 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11604 () Bool)

(declare-fun mapRes!11604 () Bool)

(assert (=> mapIsEmpty!11604 mapRes!11604))

(declare-fun b!333340 () Bool)

(assert (=> b!333340 (= e!204668 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3138 0))(
  ( (MissingZero!3138 (index!14731 (_ BitVec 32))) (Found!3138 (index!14732 (_ BitVec 32))) (Intermediate!3138 (undefined!3950 Bool) (index!14733 (_ BitVec 32)) (x!33227 (_ BitVec 32))) (Undefined!3138) (MissingVacant!3138 (index!14734 (_ BitVec 32))) )
))
(declare-fun lt!159147 () SeekEntryResult!3138)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17191 (_ BitVec 32)) SeekEntryResult!3138)

(assert (=> b!333340 (= lt!159147 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333341 () Bool)

(declare-fun res!183655 () Bool)

(assert (=> b!333341 (=> (not res!183655) (not e!204668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333341 (= res!183655 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11604 () Bool)

(declare-fun tp!24063 () Bool)

(assert (=> mapNonEmpty!11604 (= mapRes!11604 (and tp!24063 e!204667))))

(declare-fun mapKey!11604 () (_ BitVec 32))

(declare-fun mapRest!11604 () (Array (_ BitVec 32) ValueCell!3059))

(declare-fun mapValue!11604 () ValueCell!3059)

(assert (=> mapNonEmpty!11604 (= (arr!8127 _values!1525) (store mapRest!11604 mapKey!11604 mapValue!11604))))

(declare-fun b!333342 () Bool)

(declare-fun e!204670 () Bool)

(assert (=> b!333342 (= e!204670 tp_is_empty!6805)))

(declare-fun b!333343 () Bool)

(declare-fun res!183651 () Bool)

(assert (=> b!333343 (=> (not res!183651) (not e!204668))))

(declare-fun zeroValue!1467 () V!10051)

(declare-fun minValue!1467 () V!10051)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!4956 0))(
  ( (tuple2!4957 (_1!2489 (_ BitVec 64)) (_2!2489 V!10051)) )
))
(declare-datatypes ((List!4597 0))(
  ( (Nil!4594) (Cons!4593 (h!5449 tuple2!4956) (t!9676 List!4597)) )
))
(declare-datatypes ((ListLongMap!3859 0))(
  ( (ListLongMap!3860 (toList!1945 List!4597)) )
))
(declare-fun contains!2000 (ListLongMap!3859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1454 (array!17191 array!17193 (_ BitVec 32) (_ BitVec 32) V!10051 V!10051 (_ BitVec 32) Int) ListLongMap!3859)

(assert (=> b!333343 (= res!183651 (not (contains!2000 (getCurrentListMap!1454 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333344 () Bool)

(assert (=> b!333344 (= e!204669 (and e!204670 mapRes!11604))))

(declare-fun condMapEmpty!11604 () Bool)

(declare-fun mapDefault!11604 () ValueCell!3059)

(assert (=> b!333344 (= condMapEmpty!11604 (= (arr!8127 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3059)) mapDefault!11604)))))

(assert (= (and start!33604 res!183656) b!333339))

(assert (= (and b!333339 res!183654) b!333336))

(assert (= (and b!333336 res!183652) b!333337))

(assert (= (and b!333337 res!183653) b!333341))

(assert (= (and b!333341 res!183655) b!333343))

(assert (= (and b!333343 res!183651) b!333340))

(assert (= (and b!333344 condMapEmpty!11604) mapIsEmpty!11604))

(assert (= (and b!333344 (not condMapEmpty!11604)) mapNonEmpty!11604))

(get-info :version)

(assert (= (and mapNonEmpty!11604 ((_ is ValueCellFull!3059) mapValue!11604)) b!333338))

(assert (= (and b!333344 ((_ is ValueCellFull!3059) mapDefault!11604)) b!333342))

(assert (= start!33604 b!333344))

(declare-fun m!337091 () Bool)

(assert (=> b!333337 m!337091))

(declare-fun m!337093 () Bool)

(assert (=> b!333340 m!337093))

(declare-fun m!337095 () Bool)

(assert (=> b!333341 m!337095))

(declare-fun m!337097 () Bool)

(assert (=> start!33604 m!337097))

(declare-fun m!337099 () Bool)

(assert (=> start!33604 m!337099))

(declare-fun m!337101 () Bool)

(assert (=> start!33604 m!337101))

(declare-fun m!337103 () Bool)

(assert (=> b!333336 m!337103))

(declare-fun m!337105 () Bool)

(assert (=> b!333343 m!337105))

(assert (=> b!333343 m!337105))

(declare-fun m!337107 () Bool)

(assert (=> b!333343 m!337107))

(declare-fun m!337109 () Bool)

(assert (=> mapNonEmpty!11604 m!337109))

(check-sat (not b!333340) (not mapNonEmpty!11604) b_and!14007 (not b_next!6853) (not b!333343) tp_is_empty!6805 (not start!33604) (not b!333341) (not b!333336) (not b!333337))
(check-sat b_and!14007 (not b_next!6853))
