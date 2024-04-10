; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34526 () Bool)

(assert start!34526)

(declare-fun b_free!7449 () Bool)

(declare-fun b_next!7449 () Bool)

(assert (=> start!34526 (= b_free!7449 (not b_next!7449))))

(declare-fun tp!25892 () Bool)

(declare-fun b_and!14657 () Bool)

(assert (=> start!34526 (= tp!25892 b_and!14657)))

(declare-fun res!190935 () Bool)

(declare-fun e!211520 () Bool)

(assert (=> start!34526 (=> (not res!190935) (not e!211520))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34526 (= res!190935 (validMask!0 mask!2385))))

(assert (=> start!34526 e!211520))

(assert (=> start!34526 true))

(declare-fun tp_is_empty!7401 () Bool)

(assert (=> start!34526 tp_is_empty!7401))

(assert (=> start!34526 tp!25892))

(declare-datatypes ((V!10845 0))(
  ( (V!10846 (val!3745 Int)) )
))
(declare-datatypes ((ValueCell!3357 0))(
  ( (ValueCellFull!3357 (v!5921 V!10845)) (EmptyCell!3357) )
))
(declare-datatypes ((array!18385 0))(
  ( (array!18386 (arr!8709 (Array (_ BitVec 32) ValueCell!3357)) (size!9061 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18385)

(declare-fun e!211524 () Bool)

(declare-fun array_inv!6444 (array!18385) Bool)

(assert (=> start!34526 (and (array_inv!6444 _values!1525) e!211524)))

(declare-datatypes ((array!18387 0))(
  ( (array!18388 (arr!8710 (Array (_ BitVec 32) (_ BitVec 64))) (size!9062 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18387)

(declare-fun array_inv!6445 (array!18387) Bool)

(assert (=> start!34526 (array_inv!6445 _keys!1895)))

(declare-fun b!345109 () Bool)

(declare-fun e!211522 () Bool)

(assert (=> b!345109 (= e!211522 tp_is_empty!7401)))

(declare-fun b!345110 () Bool)

(declare-fun e!211523 () Bool)

(assert (=> b!345110 (= e!211523 tp_is_empty!7401)))

(declare-fun b!345111 () Bool)

(assert (=> b!345111 (= e!211520 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3356 0))(
  ( (MissingZero!3356 (index!15603 (_ BitVec 32))) (Found!3356 (index!15604 (_ BitVec 32))) (Intermediate!3356 (undefined!4168 Bool) (index!15605 (_ BitVec 32)) (x!34382 (_ BitVec 32))) (Undefined!3356) (MissingVacant!3356 (index!15606 (_ BitVec 32))) )
))
(declare-fun lt!162748 () SeekEntryResult!3356)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18387 (_ BitVec 32)) SeekEntryResult!3356)

(assert (=> b!345111 (= lt!162748 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345112 () Bool)

(declare-fun res!190933 () Bool)

(assert (=> b!345112 (=> (not res!190933) (not e!211520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345112 (= res!190933 (validKeyInArray!0 k0!1348))))

(declare-fun b!345113 () Bool)

(declare-fun res!190936 () Bool)

(assert (=> b!345113 (=> (not res!190936) (not e!211520))))

(declare-fun zeroValue!1467 () V!10845)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10845)

(declare-datatypes ((tuple2!5414 0))(
  ( (tuple2!5415 (_1!2718 (_ BitVec 64)) (_2!2718 V!10845)) )
))
(declare-datatypes ((List!5037 0))(
  ( (Nil!5034) (Cons!5033 (h!5889 tuple2!5414) (t!10153 List!5037)) )
))
(declare-datatypes ((ListLongMap!4327 0))(
  ( (ListLongMap!4328 (toList!2179 List!5037)) )
))
(declare-fun contains!2237 (ListLongMap!4327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1700 (array!18387 array!18385 (_ BitVec 32) (_ BitVec 32) V!10845 V!10845 (_ BitVec 32) Int) ListLongMap!4327)

(assert (=> b!345113 (= res!190936 (not (contains!2237 (getCurrentListMap!1700 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345114 () Bool)

(declare-fun res!190934 () Bool)

(assert (=> b!345114 (=> (not res!190934) (not e!211520))))

(declare-datatypes ((List!5038 0))(
  ( (Nil!5035) (Cons!5034 (h!5890 (_ BitVec 64)) (t!10154 List!5038)) )
))
(declare-fun arrayNoDuplicates!0 (array!18387 (_ BitVec 32) List!5038) Bool)

(assert (=> b!345114 (= res!190934 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5035))))

(declare-fun mapNonEmpty!12540 () Bool)

(declare-fun mapRes!12540 () Bool)

(declare-fun tp!25893 () Bool)

(assert (=> mapNonEmpty!12540 (= mapRes!12540 (and tp!25893 e!211523))))

(declare-fun mapRest!12540 () (Array (_ BitVec 32) ValueCell!3357))

(declare-fun mapKey!12540 () (_ BitVec 32))

(declare-fun mapValue!12540 () ValueCell!3357)

(assert (=> mapNonEmpty!12540 (= (arr!8709 _values!1525) (store mapRest!12540 mapKey!12540 mapValue!12540))))

(declare-fun mapIsEmpty!12540 () Bool)

(assert (=> mapIsEmpty!12540 mapRes!12540))

(declare-fun b!345115 () Bool)

(declare-fun res!190937 () Bool)

(assert (=> b!345115 (=> (not res!190937) (not e!211520))))

(assert (=> b!345115 (= res!190937 (and (= (size!9061 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9062 _keys!1895) (size!9061 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345116 () Bool)

(declare-fun res!190932 () Bool)

(assert (=> b!345116 (=> (not res!190932) (not e!211520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18387 (_ BitVec 32)) Bool)

(assert (=> b!345116 (= res!190932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345117 () Bool)

(assert (=> b!345117 (= e!211524 (and e!211522 mapRes!12540))))

(declare-fun condMapEmpty!12540 () Bool)

(declare-fun mapDefault!12540 () ValueCell!3357)

(assert (=> b!345117 (= condMapEmpty!12540 (= (arr!8709 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3357)) mapDefault!12540)))))

(assert (= (and start!34526 res!190935) b!345115))

(assert (= (and b!345115 res!190937) b!345116))

(assert (= (and b!345116 res!190932) b!345114))

(assert (= (and b!345114 res!190934) b!345112))

(assert (= (and b!345112 res!190933) b!345113))

(assert (= (and b!345113 res!190936) b!345111))

(assert (= (and b!345117 condMapEmpty!12540) mapIsEmpty!12540))

(assert (= (and b!345117 (not condMapEmpty!12540)) mapNonEmpty!12540))

(get-info :version)

(assert (= (and mapNonEmpty!12540 ((_ is ValueCellFull!3357) mapValue!12540)) b!345110))

(assert (= (and b!345117 ((_ is ValueCellFull!3357) mapDefault!12540)) b!345109))

(assert (= start!34526 b!345117))

(declare-fun m!346557 () Bool)

(assert (=> b!345112 m!346557))

(declare-fun m!346559 () Bool)

(assert (=> b!345111 m!346559))

(declare-fun m!346561 () Bool)

(assert (=> b!345116 m!346561))

(declare-fun m!346563 () Bool)

(assert (=> b!345113 m!346563))

(assert (=> b!345113 m!346563))

(declare-fun m!346565 () Bool)

(assert (=> b!345113 m!346565))

(declare-fun m!346567 () Bool)

(assert (=> start!34526 m!346567))

(declare-fun m!346569 () Bool)

(assert (=> start!34526 m!346569))

(declare-fun m!346571 () Bool)

(assert (=> start!34526 m!346571))

(declare-fun m!346573 () Bool)

(assert (=> b!345114 m!346573))

(declare-fun m!346575 () Bool)

(assert (=> mapNonEmpty!12540 m!346575))

(check-sat (not b!345114) (not b_next!7449) b_and!14657 (not start!34526) (not b!345111) (not mapNonEmpty!12540) tp_is_empty!7401 (not b!345116) (not b!345113) (not b!345112))
(check-sat b_and!14657 (not b_next!7449))
