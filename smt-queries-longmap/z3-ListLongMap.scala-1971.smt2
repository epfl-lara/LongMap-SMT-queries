; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34674 () Bool)

(assert start!34674)

(declare-fun b_free!7495 () Bool)

(declare-fun b_next!7495 () Bool)

(assert (=> start!34674 (= b_free!7495 (not b_next!7495))))

(declare-fun tp!26049 () Bool)

(declare-fun b_and!14729 () Bool)

(assert (=> start!34674 (= tp!26049 b_and!14729)))

(declare-fun b!346530 () Bool)

(declare-fun res!191706 () Bool)

(declare-fun e!212381 () Bool)

(assert (=> b!346530 (=> (not res!191706) (not e!212381))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346530 (= res!191706 (validKeyInArray!0 k0!1348))))

(declare-fun b!346531 () Bool)

(declare-fun e!212384 () Bool)

(declare-fun tp_is_empty!7447 () Bool)

(assert (=> b!346531 (= e!212384 tp_is_empty!7447)))

(declare-fun res!191707 () Bool)

(assert (=> start!34674 (=> (not res!191707) (not e!212381))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34674 (= res!191707 (validMask!0 mask!2385))))

(assert (=> start!34674 e!212381))

(assert (=> start!34674 true))

(assert (=> start!34674 tp_is_empty!7447))

(assert (=> start!34674 tp!26049))

(declare-datatypes ((V!10907 0))(
  ( (V!10908 (val!3768 Int)) )
))
(declare-datatypes ((ValueCell!3380 0))(
  ( (ValueCellFull!3380 (v!5951 V!10907)) (EmptyCell!3380) )
))
(declare-datatypes ((array!18482 0))(
  ( (array!18483 (arr!8751 (Array (_ BitVec 32) ValueCell!3380)) (size!9103 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18482)

(declare-fun e!212379 () Bool)

(declare-fun array_inv!6470 (array!18482) Bool)

(assert (=> start!34674 (and (array_inv!6470 _values!1525) e!212379)))

(declare-datatypes ((array!18484 0))(
  ( (array!18485 (arr!8752 (Array (_ BitVec 32) (_ BitVec 64))) (size!9104 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18484)

(declare-fun array_inv!6471 (array!18484) Bool)

(assert (=> start!34674 (array_inv!6471 _keys!1895)))

(declare-fun b!346532 () Bool)

(declare-fun res!191704 () Bool)

(assert (=> b!346532 (=> (not res!191704) (not e!212381))))

(declare-datatypes ((List!4976 0))(
  ( (Nil!4973) (Cons!4972 (h!5828 (_ BitVec 64)) (t!10096 List!4976)) )
))
(declare-fun arrayNoDuplicates!0 (array!18484 (_ BitVec 32) List!4976) Bool)

(assert (=> b!346532 (= res!191704 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4973))))

(declare-fun b!346533 () Bool)

(declare-fun res!191711 () Bool)

(assert (=> b!346533 (=> (not res!191711) (not e!212381))))

(declare-fun zeroValue!1467 () V!10907)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10907)

(declare-datatypes ((tuple2!5368 0))(
  ( (tuple2!5369 (_1!2695 (_ BitVec 64)) (_2!2695 V!10907)) )
))
(declare-datatypes ((List!4977 0))(
  ( (Nil!4974) (Cons!4973 (h!5829 tuple2!5368) (t!10097 List!4977)) )
))
(declare-datatypes ((ListLongMap!4283 0))(
  ( (ListLongMap!4284 (toList!2157 List!4977)) )
))
(declare-fun contains!2240 (ListLongMap!4283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1686 (array!18484 array!18482 (_ BitVec 32) (_ BitVec 32) V!10907 V!10907 (_ BitVec 32) Int) ListLongMap!4283)

(assert (=> b!346533 (= res!191711 (not (contains!2240 (getCurrentListMap!1686 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346534 () Bool)

(declare-fun e!212382 () Bool)

(assert (=> b!346534 (= e!212382 (not true))))

(declare-fun arrayContainsKey!0 (array!18484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346534 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3328 0))(
  ( (MissingZero!3328 (index!15491 (_ BitVec 32))) (Found!3328 (index!15492 (_ BitVec 32))) (Intermediate!3328 (undefined!4140 Bool) (index!15493 (_ BitVec 32)) (x!34475 (_ BitVec 32))) (Undefined!3328) (MissingVacant!3328 (index!15494 (_ BitVec 32))) )
))
(declare-fun lt!163413 () SeekEntryResult!3328)

(declare-datatypes ((Unit!10721 0))(
  ( (Unit!10722) )
))
(declare-fun lt!163414 () Unit!10721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18484 (_ BitVec 64) (_ BitVec 32)) Unit!10721)

(assert (=> b!346534 (= lt!163414 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15492 lt!163413)))))

(declare-fun b!346535 () Bool)

(declare-fun e!212383 () Bool)

(declare-fun mapRes!12627 () Bool)

(assert (=> b!346535 (= e!212379 (and e!212383 mapRes!12627))))

(declare-fun condMapEmpty!12627 () Bool)

(declare-fun mapDefault!12627 () ValueCell!3380)

(assert (=> b!346535 (= condMapEmpty!12627 (= (arr!8751 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3380)) mapDefault!12627)))))

(declare-fun mapIsEmpty!12627 () Bool)

(assert (=> mapIsEmpty!12627 mapRes!12627))

(declare-fun b!346536 () Bool)

(declare-fun res!191710 () Bool)

(assert (=> b!346536 (=> (not res!191710) (not e!212381))))

(assert (=> b!346536 (= res!191710 (and (= (size!9103 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9104 _keys!1895) (size!9103 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346537 () Bool)

(declare-fun res!191705 () Bool)

(assert (=> b!346537 (=> (not res!191705) (not e!212382))))

(assert (=> b!346537 (= res!191705 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15492 lt!163413)))))

(declare-fun b!346538 () Bool)

(declare-fun res!191708 () Bool)

(assert (=> b!346538 (=> (not res!191708) (not e!212381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18484 (_ BitVec 32)) Bool)

(assert (=> b!346538 (= res!191708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346539 () Bool)

(assert (=> b!346539 (= e!212383 tp_is_empty!7447)))

(declare-fun mapNonEmpty!12627 () Bool)

(declare-fun tp!26048 () Bool)

(assert (=> mapNonEmpty!12627 (= mapRes!12627 (and tp!26048 e!212384))))

(declare-fun mapKey!12627 () (_ BitVec 32))

(declare-fun mapValue!12627 () ValueCell!3380)

(declare-fun mapRest!12627 () (Array (_ BitVec 32) ValueCell!3380))

(assert (=> mapNonEmpty!12627 (= (arr!8751 _values!1525) (store mapRest!12627 mapKey!12627 mapValue!12627))))

(declare-fun b!346540 () Bool)

(assert (=> b!346540 (= e!212381 e!212382)))

(declare-fun res!191709 () Bool)

(assert (=> b!346540 (=> (not res!191709) (not e!212382))))

(get-info :version)

(assert (=> b!346540 (= res!191709 (and ((_ is Found!3328) lt!163413) (= (select (arr!8752 _keys!1895) (index!15492 lt!163413)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18484 (_ BitVec 32)) SeekEntryResult!3328)

(assert (=> b!346540 (= lt!163413 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34674 res!191707) b!346536))

(assert (= (and b!346536 res!191710) b!346538))

(assert (= (and b!346538 res!191708) b!346532))

(assert (= (and b!346532 res!191704) b!346530))

(assert (= (and b!346530 res!191706) b!346533))

(assert (= (and b!346533 res!191711) b!346540))

(assert (= (and b!346540 res!191709) b!346537))

(assert (= (and b!346537 res!191705) b!346534))

(assert (= (and b!346535 condMapEmpty!12627) mapIsEmpty!12627))

(assert (= (and b!346535 (not condMapEmpty!12627)) mapNonEmpty!12627))

(assert (= (and mapNonEmpty!12627 ((_ is ValueCellFull!3380) mapValue!12627)) b!346531))

(assert (= (and b!346535 ((_ is ValueCellFull!3380) mapDefault!12627)) b!346539))

(assert (= start!34674 b!346535))

(declare-fun m!347867 () Bool)

(assert (=> b!346533 m!347867))

(assert (=> b!346533 m!347867))

(declare-fun m!347869 () Bool)

(assert (=> b!346533 m!347869))

(declare-fun m!347871 () Bool)

(assert (=> b!346537 m!347871))

(declare-fun m!347873 () Bool)

(assert (=> mapNonEmpty!12627 m!347873))

(declare-fun m!347875 () Bool)

(assert (=> b!346540 m!347875))

(declare-fun m!347877 () Bool)

(assert (=> b!346540 m!347877))

(declare-fun m!347879 () Bool)

(assert (=> b!346532 m!347879))

(declare-fun m!347881 () Bool)

(assert (=> b!346530 m!347881))

(declare-fun m!347883 () Bool)

(assert (=> start!34674 m!347883))

(declare-fun m!347885 () Bool)

(assert (=> start!34674 m!347885))

(declare-fun m!347887 () Bool)

(assert (=> start!34674 m!347887))

(declare-fun m!347889 () Bool)

(assert (=> b!346538 m!347889))

(declare-fun m!347891 () Bool)

(assert (=> b!346534 m!347891))

(declare-fun m!347893 () Bool)

(assert (=> b!346534 m!347893))

(check-sat (not b!346538) tp_is_empty!7447 b_and!14729 (not b!346534) (not b!346532) (not b_next!7495) (not b!346537) (not start!34674) (not b!346540) (not mapNonEmpty!12627) (not b!346530) (not b!346533))
(check-sat b_and!14729 (not b_next!7495))
