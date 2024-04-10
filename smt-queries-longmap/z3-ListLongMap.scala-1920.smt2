; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34168 () Bool)

(assert start!34168)

(declare-fun b_free!7191 () Bool)

(declare-fun b_next!7191 () Bool)

(assert (=> start!34168 (= b_free!7191 (not b_next!7191))))

(declare-fun tp!25106 () Bool)

(declare-fun b_and!14391 () Bool)

(assert (=> start!34168 (= tp!25106 b_and!14391)))

(declare-fun mapIsEmpty!12141 () Bool)

(declare-fun mapRes!12141 () Bool)

(assert (=> mapIsEmpty!12141 mapRes!12141))

(declare-fun b!340495 () Bool)

(declare-fun res!188068 () Bool)

(declare-fun e!208879 () Bool)

(assert (=> b!340495 (=> (not res!188068) (not e!208879))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17891 0))(
  ( (array!17892 (arr!8466 (Array (_ BitVec 32) (_ BitVec 64))) (size!8818 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17891)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10501 0))(
  ( (V!10502 (val!3616 Int)) )
))
(declare-datatypes ((ValueCell!3228 0))(
  ( (ValueCellFull!3228 (v!5788 V!10501)) (EmptyCell!3228) )
))
(declare-datatypes ((array!17893 0))(
  ( (array!17894 (arr!8467 (Array (_ BitVec 32) ValueCell!3228)) (size!8819 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17893)

(assert (=> b!340495 (= res!188068 (and (= (size!8819 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8818 _keys!1895) (size!8819 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!188069 () Bool)

(assert (=> start!34168 (=> (not res!188069) (not e!208879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34168 (= res!188069 (validMask!0 mask!2385))))

(assert (=> start!34168 e!208879))

(assert (=> start!34168 true))

(declare-fun tp_is_empty!7143 () Bool)

(assert (=> start!34168 tp_is_empty!7143))

(assert (=> start!34168 tp!25106))

(declare-fun e!208883 () Bool)

(declare-fun array_inv!6272 (array!17893) Bool)

(assert (=> start!34168 (and (array_inv!6272 _values!1525) e!208883)))

(declare-fun array_inv!6273 (array!17891) Bool)

(assert (=> start!34168 (array_inv!6273 _keys!1895)))

(declare-fun b!340496 () Bool)

(declare-fun e!208884 () Bool)

(assert (=> b!340496 (= e!208884 false)))

(declare-fun lt!161599 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17891 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340496 (= lt!161599 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340497 () Bool)

(declare-fun res!188072 () Bool)

(assert (=> b!340497 (=> (not res!188072) (not e!208879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17891 (_ BitVec 32)) Bool)

(assert (=> b!340497 (= res!188072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340498 () Bool)

(declare-fun res!188066 () Bool)

(assert (=> b!340498 (=> (not res!188066) (not e!208879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340498 (= res!188066 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12141 () Bool)

(declare-fun tp!25107 () Bool)

(declare-fun e!208882 () Bool)

(assert (=> mapNonEmpty!12141 (= mapRes!12141 (and tp!25107 e!208882))))

(declare-fun mapRest!12141 () (Array (_ BitVec 32) ValueCell!3228))

(declare-fun mapValue!12141 () ValueCell!3228)

(declare-fun mapKey!12141 () (_ BitVec 32))

(assert (=> mapNonEmpty!12141 (= (arr!8467 _values!1525) (store mapRest!12141 mapKey!12141 mapValue!12141))))

(declare-fun b!340499 () Bool)

(assert (=> b!340499 (= e!208882 tp_is_empty!7143)))

(declare-fun b!340500 () Bool)

(declare-fun res!188071 () Bool)

(assert (=> b!340500 (=> (not res!188071) (not e!208879))))

(declare-datatypes ((List!4868 0))(
  ( (Nil!4865) (Cons!4864 (h!5720 (_ BitVec 64)) (t!9976 List!4868)) )
))
(declare-fun arrayNoDuplicates!0 (array!17891 (_ BitVec 32) List!4868) Bool)

(assert (=> b!340500 (= res!188071 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4865))))

(declare-fun b!340501 () Bool)

(declare-fun res!188070 () Bool)

(assert (=> b!340501 (=> (not res!188070) (not e!208884))))

(declare-fun arrayContainsKey!0 (array!17891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340501 (= res!188070 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340502 () Bool)

(declare-fun e!208880 () Bool)

(assert (=> b!340502 (= e!208883 (and e!208880 mapRes!12141))))

(declare-fun condMapEmpty!12141 () Bool)

(declare-fun mapDefault!12141 () ValueCell!3228)

(assert (=> b!340502 (= condMapEmpty!12141 (= (arr!8467 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3228)) mapDefault!12141)))))

(declare-fun b!340503 () Bool)

(assert (=> b!340503 (= e!208879 e!208884)))

(declare-fun res!188067 () Bool)

(assert (=> b!340503 (=> (not res!188067) (not e!208884))))

(declare-datatypes ((SeekEntryResult!3272 0))(
  ( (MissingZero!3272 (index!15267 (_ BitVec 32))) (Found!3272 (index!15268 (_ BitVec 32))) (Intermediate!3272 (undefined!4084 Bool) (index!15269 (_ BitVec 32)) (x!33914 (_ BitVec 32))) (Undefined!3272) (MissingVacant!3272 (index!15270 (_ BitVec 32))) )
))
(declare-fun lt!161598 () SeekEntryResult!3272)

(get-info :version)

(assert (=> b!340503 (= res!188067 (and (not ((_ is Found!3272) lt!161598)) (not ((_ is MissingZero!3272) lt!161598)) ((_ is MissingVacant!3272) lt!161598)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17891 (_ BitVec 32)) SeekEntryResult!3272)

(assert (=> b!340503 (= lt!161598 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340504 () Bool)

(declare-fun res!188065 () Bool)

(assert (=> b!340504 (=> (not res!188065) (not e!208879))))

(declare-fun zeroValue!1467 () V!10501)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10501)

(declare-datatypes ((tuple2!5250 0))(
  ( (tuple2!5251 (_1!2636 (_ BitVec 64)) (_2!2636 V!10501)) )
))
(declare-datatypes ((List!4869 0))(
  ( (Nil!4866) (Cons!4865 (h!5721 tuple2!5250) (t!9977 List!4869)) )
))
(declare-datatypes ((ListLongMap!4163 0))(
  ( (ListLongMap!4164 (toList!2097 List!4869)) )
))
(declare-fun contains!2151 (ListLongMap!4163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1618 (array!17891 array!17893 (_ BitVec 32) (_ BitVec 32) V!10501 V!10501 (_ BitVec 32) Int) ListLongMap!4163)

(assert (=> b!340504 (= res!188065 (not (contains!2151 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340505 () Bool)

(assert (=> b!340505 (= e!208880 tp_is_empty!7143)))

(assert (= (and start!34168 res!188069) b!340495))

(assert (= (and b!340495 res!188068) b!340497))

(assert (= (and b!340497 res!188072) b!340500))

(assert (= (and b!340500 res!188071) b!340498))

(assert (= (and b!340498 res!188066) b!340504))

(assert (= (and b!340504 res!188065) b!340503))

(assert (= (and b!340503 res!188067) b!340501))

(assert (= (and b!340501 res!188070) b!340496))

(assert (= (and b!340502 condMapEmpty!12141) mapIsEmpty!12141))

(assert (= (and b!340502 (not condMapEmpty!12141)) mapNonEmpty!12141))

(assert (= (and mapNonEmpty!12141 ((_ is ValueCellFull!3228) mapValue!12141)) b!340499))

(assert (= (and b!340502 ((_ is ValueCellFull!3228) mapDefault!12141)) b!340505))

(assert (= start!34168 b!340502))

(declare-fun m!343183 () Bool)

(assert (=> b!340504 m!343183))

(assert (=> b!340504 m!343183))

(declare-fun m!343185 () Bool)

(assert (=> b!340504 m!343185))

(declare-fun m!343187 () Bool)

(assert (=> b!340496 m!343187))

(declare-fun m!343189 () Bool)

(assert (=> b!340498 m!343189))

(declare-fun m!343191 () Bool)

(assert (=> mapNonEmpty!12141 m!343191))

(declare-fun m!343193 () Bool)

(assert (=> b!340497 m!343193))

(declare-fun m!343195 () Bool)

(assert (=> b!340503 m!343195))

(declare-fun m!343197 () Bool)

(assert (=> b!340500 m!343197))

(declare-fun m!343199 () Bool)

(assert (=> b!340501 m!343199))

(declare-fun m!343201 () Bool)

(assert (=> start!34168 m!343201))

(declare-fun m!343203 () Bool)

(assert (=> start!34168 m!343203))

(declare-fun m!343205 () Bool)

(assert (=> start!34168 m!343205))

(check-sat (not b!340501) b_and!14391 (not b_next!7191) (not b!340503) (not b!340504) (not start!34168) tp_is_empty!7143 (not b!340500) (not b!340497) (not mapNonEmpty!12141) (not b!340496) (not b!340498))
(check-sat b_and!14391 (not b_next!7191))
