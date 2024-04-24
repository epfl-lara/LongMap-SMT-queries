; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34284 () Bool)

(assert start!34284)

(declare-fun b_free!7273 () Bool)

(declare-fun b_next!7273 () Bool)

(assert (=> start!34284 (= b_free!7273 (not b_next!7273))))

(declare-fun tp!25358 () Bool)

(declare-fun b_and!14491 () Bool)

(assert (=> start!34284 (= tp!25358 b_and!14491)))

(declare-fun b!342102 () Bool)

(declare-fun e!209796 () Bool)

(declare-fun e!209798 () Bool)

(assert (=> b!342102 (= e!209796 e!209798)))

(declare-fun res!189121 () Bool)

(assert (=> b!342102 (=> (not res!189121) (not e!209798))))

(declare-datatypes ((SeekEntryResult!3251 0))(
  ( (MissingZero!3251 (index!15183 (_ BitVec 32))) (Found!3251 (index!15184 (_ BitVec 32))) (Intermediate!3251 (undefined!4063 Bool) (index!15185 (_ BitVec 32)) (x!34022 (_ BitVec 32))) (Undefined!3251) (MissingVacant!3251 (index!15186 (_ BitVec 32))) )
))
(declare-fun lt!162096 () SeekEntryResult!3251)

(get-info :version)

(assert (=> b!342102 (= res!189121 (and (not ((_ is Found!3251) lt!162096)) (not ((_ is MissingZero!3251) lt!162096)) ((_ is MissingVacant!3251) lt!162096)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18038 0))(
  ( (array!18039 (arr!8537 (Array (_ BitVec 32) (_ BitVec 64))) (size!8889 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18038 (_ BitVec 32)) SeekEntryResult!3251)

(assert (=> b!342102 (= lt!162096 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342103 () Bool)

(declare-fun res!189120 () Bool)

(assert (=> b!342103 (=> (not res!189120) (not e!209796))))

(declare-datatypes ((V!10611 0))(
  ( (V!10612 (val!3657 Int)) )
))
(declare-datatypes ((ValueCell!3269 0))(
  ( (ValueCellFull!3269 (v!5832 V!10611)) (EmptyCell!3269) )
))
(declare-datatypes ((array!18040 0))(
  ( (array!18041 (arr!8538 (Array (_ BitVec 32) ValueCell!3269)) (size!8890 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18040)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342103 (= res!189120 (and (= (size!8890 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8889 _keys!1895) (size!8890 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342104 () Bool)

(declare-fun res!189123 () Bool)

(assert (=> b!342104 (=> (not res!189123) (not e!209796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18038 (_ BitVec 32)) Bool)

(assert (=> b!342104 (= res!189123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342105 () Bool)

(declare-datatypes ((Unit!10607 0))(
  ( (Unit!10608) )
))
(declare-fun e!209794 () Unit!10607)

(declare-fun Unit!10609 () Unit!10607)

(assert (=> b!342105 (= e!209794 Unit!10609)))

(declare-fun b!342106 () Bool)

(declare-fun res!189124 () Bool)

(assert (=> b!342106 (=> (not res!189124) (not e!209796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342106 (= res!189124 (validKeyInArray!0 k0!1348))))

(declare-fun b!342107 () Bool)

(assert (=> b!342107 (= e!209798 false)))

(declare-fun lt!162097 () Unit!10607)

(assert (=> b!342107 (= lt!162097 e!209794)))

(declare-fun c!52766 () Bool)

(declare-fun arrayContainsKey!0 (array!18038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342107 (= c!52766 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342108 () Bool)

(declare-fun e!209797 () Bool)

(declare-fun tp_is_empty!7225 () Bool)

(assert (=> b!342108 (= e!209797 tp_is_empty!7225)))

(declare-fun res!189119 () Bool)

(assert (=> start!34284 (=> (not res!189119) (not e!209796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34284 (= res!189119 (validMask!0 mask!2385))))

(assert (=> start!34284 e!209796))

(assert (=> start!34284 true))

(assert (=> start!34284 tp_is_empty!7225))

(assert (=> start!34284 tp!25358))

(declare-fun e!209795 () Bool)

(declare-fun array_inv!6318 (array!18040) Bool)

(assert (=> start!34284 (and (array_inv!6318 _values!1525) e!209795)))

(declare-fun array_inv!6319 (array!18038) Bool)

(assert (=> start!34284 (array_inv!6319 _keys!1895)))

(declare-fun mapNonEmpty!12270 () Bool)

(declare-fun mapRes!12270 () Bool)

(declare-fun tp!25359 () Bool)

(declare-fun e!209793 () Bool)

(assert (=> mapNonEmpty!12270 (= mapRes!12270 (and tp!25359 e!209793))))

(declare-fun mapValue!12270 () ValueCell!3269)

(declare-fun mapRest!12270 () (Array (_ BitVec 32) ValueCell!3269))

(declare-fun mapKey!12270 () (_ BitVec 32))

(assert (=> mapNonEmpty!12270 (= (arr!8538 _values!1525) (store mapRest!12270 mapKey!12270 mapValue!12270))))

(declare-fun b!342109 () Bool)

(declare-fun Unit!10610 () Unit!10607)

(assert (=> b!342109 (= e!209794 Unit!10610)))

(declare-fun lt!162095 () Unit!10607)

(declare-fun zeroValue!1467 () V!10611)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10611)

(declare-fun lemmaArrayContainsKeyThenInListMap!304 (array!18038 array!18040 (_ BitVec 32) (_ BitVec 32) V!10611 V!10611 (_ BitVec 64) (_ BitVec 32) Int) Unit!10607)

(declare-fun arrayScanForKey!0 (array!18038 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342109 (= lt!162095 (lemmaArrayContainsKeyThenInListMap!304 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342109 false))

(declare-fun b!342110 () Bool)

(assert (=> b!342110 (= e!209793 tp_is_empty!7225)))

(declare-fun b!342111 () Bool)

(assert (=> b!342111 (= e!209795 (and e!209797 mapRes!12270))))

(declare-fun condMapEmpty!12270 () Bool)

(declare-fun mapDefault!12270 () ValueCell!3269)

(assert (=> b!342111 (= condMapEmpty!12270 (= (arr!8538 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3269)) mapDefault!12270)))))

(declare-fun b!342112 () Bool)

(declare-fun res!189125 () Bool)

(assert (=> b!342112 (=> (not res!189125) (not e!209796))))

(declare-datatypes ((tuple2!5216 0))(
  ( (tuple2!5217 (_1!2619 (_ BitVec 64)) (_2!2619 V!10611)) )
))
(declare-datatypes ((List!4819 0))(
  ( (Nil!4816) (Cons!4815 (h!5671 tuple2!5216) (t!9923 List!4819)) )
))
(declare-datatypes ((ListLongMap!4131 0))(
  ( (ListLongMap!4132 (toList!2081 List!4819)) )
))
(declare-fun contains!2156 (ListLongMap!4131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1610 (array!18038 array!18040 (_ BitVec 32) (_ BitVec 32) V!10611 V!10611 (_ BitVec 32) Int) ListLongMap!4131)

(assert (=> b!342112 (= res!189125 (not (contains!2156 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342113 () Bool)

(declare-fun res!189122 () Bool)

(assert (=> b!342113 (=> (not res!189122) (not e!209796))))

(declare-datatypes ((List!4820 0))(
  ( (Nil!4817) (Cons!4816 (h!5672 (_ BitVec 64)) (t!9924 List!4820)) )
))
(declare-fun arrayNoDuplicates!0 (array!18038 (_ BitVec 32) List!4820) Bool)

(assert (=> b!342113 (= res!189122 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4817))))

(declare-fun mapIsEmpty!12270 () Bool)

(assert (=> mapIsEmpty!12270 mapRes!12270))

(assert (= (and start!34284 res!189119) b!342103))

(assert (= (and b!342103 res!189120) b!342104))

(assert (= (and b!342104 res!189123) b!342113))

(assert (= (and b!342113 res!189122) b!342106))

(assert (= (and b!342106 res!189124) b!342112))

(assert (= (and b!342112 res!189125) b!342102))

(assert (= (and b!342102 res!189121) b!342107))

(assert (= (and b!342107 c!52766) b!342109))

(assert (= (and b!342107 (not c!52766)) b!342105))

(assert (= (and b!342111 condMapEmpty!12270) mapIsEmpty!12270))

(assert (= (and b!342111 (not condMapEmpty!12270)) mapNonEmpty!12270))

(assert (= (and mapNonEmpty!12270 ((_ is ValueCellFull!3269) mapValue!12270)) b!342110))

(assert (= (and b!342111 ((_ is ValueCellFull!3269) mapDefault!12270)) b!342108))

(assert (= start!34284 b!342111))

(declare-fun m!344613 () Bool)

(assert (=> start!34284 m!344613))

(declare-fun m!344615 () Bool)

(assert (=> start!34284 m!344615))

(declare-fun m!344617 () Bool)

(assert (=> start!34284 m!344617))

(declare-fun m!344619 () Bool)

(assert (=> b!342106 m!344619))

(declare-fun m!344621 () Bool)

(assert (=> b!342112 m!344621))

(assert (=> b!342112 m!344621))

(declare-fun m!344623 () Bool)

(assert (=> b!342112 m!344623))

(declare-fun m!344625 () Bool)

(assert (=> b!342109 m!344625))

(assert (=> b!342109 m!344625))

(declare-fun m!344627 () Bool)

(assert (=> b!342109 m!344627))

(declare-fun m!344629 () Bool)

(assert (=> mapNonEmpty!12270 m!344629))

(declare-fun m!344631 () Bool)

(assert (=> b!342104 m!344631))

(declare-fun m!344633 () Bool)

(assert (=> b!342107 m!344633))

(declare-fun m!344635 () Bool)

(assert (=> b!342102 m!344635))

(declare-fun m!344637 () Bool)

(assert (=> b!342113 m!344637))

(check-sat b_and!14491 (not mapNonEmpty!12270) (not b!342107) (not b!342113) (not b!342112) tp_is_empty!7225 (not b_next!7273) (not b!342106) (not b!342102) (not b!342109) (not start!34284) (not b!342104))
(check-sat b_and!14491 (not b_next!7273))
