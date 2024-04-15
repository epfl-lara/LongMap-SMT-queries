; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33670 () Bool)

(assert start!33670)

(declare-fun b_free!6919 () Bool)

(declare-fun b_next!6919 () Bool)

(assert (=> start!33670 (= b_free!6919 (not b_next!6919))))

(declare-fun tp!24261 () Bool)

(declare-fun b_and!14073 () Bool)

(assert (=> start!33670 (= tp!24261 b_and!14073)))

(declare-fun mapIsEmpty!11703 () Bool)

(declare-fun mapRes!11703 () Bool)

(assert (=> mapIsEmpty!11703 mapRes!11703))

(declare-fun b!334393 () Bool)

(declare-fun res!184418 () Bool)

(declare-fun e!205244 () Bool)

(assert (=> b!334393 (=> (not res!184418) (not e!205244))))

(declare-datatypes ((array!17315 0))(
  ( (array!17316 (arr!8188 (Array (_ BitVec 32) (_ BitVec 64))) (size!8541 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17315)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17315 (_ BitVec 32)) Bool)

(assert (=> b!334393 (= res!184418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334394 () Bool)

(declare-fun res!184416 () Bool)

(assert (=> b!334394 (=> (not res!184416) (not e!205244))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334394 (= res!184416 (validKeyInArray!0 k0!1348))))

(declare-fun b!334395 () Bool)

(declare-fun e!205248 () Bool)

(declare-fun e!205249 () Bool)

(assert (=> b!334395 (= e!205248 (and e!205249 mapRes!11703))))

(declare-fun condMapEmpty!11703 () Bool)

(declare-datatypes ((V!10139 0))(
  ( (V!10140 (val!3480 Int)) )
))
(declare-datatypes ((ValueCell!3092 0))(
  ( (ValueCellFull!3092 (v!5636 V!10139)) (EmptyCell!3092) )
))
(declare-datatypes ((array!17317 0))(
  ( (array!17318 (arr!8189 (Array (_ BitVec 32) ValueCell!3092)) (size!8542 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17317)

(declare-fun mapDefault!11703 () ValueCell!3092)

(assert (=> b!334395 (= condMapEmpty!11703 (= (arr!8189 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3092)) mapDefault!11703)))))

(declare-fun b!334396 () Bool)

(declare-fun e!205247 () Bool)

(assert (=> b!334396 (= e!205244 e!205247)))

(declare-fun res!184413 () Bool)

(assert (=> b!334396 (=> (not res!184413) (not e!205247))))

(declare-datatypes ((SeekEntryResult!3165 0))(
  ( (MissingZero!3165 (index!14839 (_ BitVec 32))) (Found!3165 (index!14840 (_ BitVec 32))) (Intermediate!3165 (undefined!3977 Bool) (index!14841 (_ BitVec 32)) (x!33342 (_ BitVec 32))) (Undefined!3165) (MissingVacant!3165 (index!14842 (_ BitVec 32))) )
))
(declare-fun lt!159330 () SeekEntryResult!3165)

(get-info :version)

(assert (=> b!334396 (= res!184413 (and ((_ is Found!3165) lt!159330) (= (select (arr!8188 _keys!1895) (index!14840 lt!159330)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17315 (_ BitVec 32)) SeekEntryResult!3165)

(assert (=> b!334396 (= lt!159330 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334397 () Bool)

(assert (=> b!334397 (= e!205247 (not true))))

(declare-fun arrayContainsKey!0 (array!17315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334397 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10388 0))(
  ( (Unit!10389) )
))
(declare-fun lt!159329 () Unit!10388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17315 (_ BitVec 64) (_ BitVec 32)) Unit!10388)

(assert (=> b!334397 (= lt!159329 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14840 lt!159330)))))

(declare-fun b!334398 () Bool)

(declare-fun res!184417 () Bool)

(assert (=> b!334398 (=> (not res!184417) (not e!205247))))

(assert (=> b!334398 (= res!184417 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14840 lt!159330)))))

(declare-fun b!334399 () Bool)

(declare-fun res!184415 () Bool)

(assert (=> b!334399 (=> (not res!184415) (not e!205244))))

(declare-datatypes ((List!4636 0))(
  ( (Nil!4633) (Cons!4632 (h!5488 (_ BitVec 64)) (t!9715 List!4636)) )
))
(declare-fun arrayNoDuplicates!0 (array!17315 (_ BitVec 32) List!4636) Bool)

(assert (=> b!334399 (= res!184415 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4633))))

(declare-fun b!334400 () Bool)

(declare-fun res!184411 () Bool)

(assert (=> b!334400 (=> (not res!184411) (not e!205244))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334400 (= res!184411 (and (= (size!8542 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8541 _keys!1895) (size!8542 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!184412 () Bool)

(assert (=> start!33670 (=> (not res!184412) (not e!205244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33670 (= res!184412 (validMask!0 mask!2385))))

(assert (=> start!33670 e!205244))

(assert (=> start!33670 true))

(declare-fun tp_is_empty!6871 () Bool)

(assert (=> start!33670 tp_is_empty!6871))

(assert (=> start!33670 tp!24261))

(declare-fun array_inv!6104 (array!17317) Bool)

(assert (=> start!33670 (and (array_inv!6104 _values!1525) e!205248)))

(declare-fun array_inv!6105 (array!17315) Bool)

(assert (=> start!33670 (array_inv!6105 _keys!1895)))

(declare-fun mapNonEmpty!11703 () Bool)

(declare-fun tp!24260 () Bool)

(declare-fun e!205246 () Bool)

(assert (=> mapNonEmpty!11703 (= mapRes!11703 (and tp!24260 e!205246))))

(declare-fun mapValue!11703 () ValueCell!3092)

(declare-fun mapRest!11703 () (Array (_ BitVec 32) ValueCell!3092))

(declare-fun mapKey!11703 () (_ BitVec 32))

(assert (=> mapNonEmpty!11703 (= (arr!8189 _values!1525) (store mapRest!11703 mapKey!11703 mapValue!11703))))

(declare-fun b!334401 () Bool)

(assert (=> b!334401 (= e!205249 tp_is_empty!6871)))

(declare-fun b!334402 () Bool)

(declare-fun res!184414 () Bool)

(assert (=> b!334402 (=> (not res!184414) (not e!205244))))

(declare-fun zeroValue!1467 () V!10139)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10139)

(declare-datatypes ((tuple2!4996 0))(
  ( (tuple2!4997 (_1!2509 (_ BitVec 64)) (_2!2509 V!10139)) )
))
(declare-datatypes ((List!4637 0))(
  ( (Nil!4634) (Cons!4633 (h!5489 tuple2!4996) (t!9716 List!4637)) )
))
(declare-datatypes ((ListLongMap!3899 0))(
  ( (ListLongMap!3900 (toList!1965 List!4637)) )
))
(declare-fun contains!2020 (ListLongMap!3899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1474 (array!17315 array!17317 (_ BitVec 32) (_ BitVec 32) V!10139 V!10139 (_ BitVec 32) Int) ListLongMap!3899)

(assert (=> b!334402 (= res!184414 (not (contains!2020 (getCurrentListMap!1474 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334403 () Bool)

(assert (=> b!334403 (= e!205246 tp_is_empty!6871)))

(assert (= (and start!33670 res!184412) b!334400))

(assert (= (and b!334400 res!184411) b!334393))

(assert (= (and b!334393 res!184418) b!334399))

(assert (= (and b!334399 res!184415) b!334394))

(assert (= (and b!334394 res!184416) b!334402))

(assert (= (and b!334402 res!184414) b!334396))

(assert (= (and b!334396 res!184413) b!334398))

(assert (= (and b!334398 res!184417) b!334397))

(assert (= (and b!334395 condMapEmpty!11703) mapIsEmpty!11703))

(assert (= (and b!334395 (not condMapEmpty!11703)) mapNonEmpty!11703))

(assert (= (and mapNonEmpty!11703 ((_ is ValueCellFull!3092) mapValue!11703)) b!334403))

(assert (= (and b!334395 ((_ is ValueCellFull!3092) mapDefault!11703)) b!334401))

(assert (= start!33670 b!334395))

(declare-fun m!337967 () Bool)

(assert (=> mapNonEmpty!11703 m!337967))

(declare-fun m!337969 () Bool)

(assert (=> b!334396 m!337969))

(declare-fun m!337971 () Bool)

(assert (=> b!334396 m!337971))

(declare-fun m!337973 () Bool)

(assert (=> b!334394 m!337973))

(declare-fun m!337975 () Bool)

(assert (=> b!334402 m!337975))

(assert (=> b!334402 m!337975))

(declare-fun m!337977 () Bool)

(assert (=> b!334402 m!337977))

(declare-fun m!337979 () Bool)

(assert (=> b!334393 m!337979))

(declare-fun m!337981 () Bool)

(assert (=> b!334398 m!337981))

(declare-fun m!337983 () Bool)

(assert (=> b!334399 m!337983))

(declare-fun m!337985 () Bool)

(assert (=> b!334397 m!337985))

(declare-fun m!337987 () Bool)

(assert (=> b!334397 m!337987))

(declare-fun m!337989 () Bool)

(assert (=> start!33670 m!337989))

(declare-fun m!337991 () Bool)

(assert (=> start!33670 m!337991))

(declare-fun m!337993 () Bool)

(assert (=> start!33670 m!337993))

(check-sat (not b!334402) b_and!14073 (not b!334396) (not b!334393) (not b_next!6919) (not b!334397) (not start!33670) (not b!334398) tp_is_empty!6871 (not b!334394) (not b!334399) (not mapNonEmpty!11703))
(check-sat b_and!14073 (not b_next!6919))
