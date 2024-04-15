; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34206 () Bool)

(assert start!34206)

(declare-fun b_free!7243 () Bool)

(declare-fun b_next!7243 () Bool)

(assert (=> start!34206 (= b_free!7243 (not b_next!7243))))

(declare-fun tp!25262 () Bool)

(declare-fun b_and!14417 () Bool)

(assert (=> start!34206 (= tp!25262 b_and!14417)))

(declare-fun b!341078 () Bool)

(declare-fun res!188561 () Bool)

(declare-fun e!209175 () Bool)

(assert (=> b!341078 (=> (not res!188561) (not e!209175))))

(declare-datatypes ((array!17965 0))(
  ( (array!17966 (arr!8503 (Array (_ BitVec 32) (_ BitVec 64))) (size!8856 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17965)

(declare-datatypes ((List!4845 0))(
  ( (Nil!4842) (Cons!4841 (h!5697 (_ BitVec 64)) (t!9944 List!4845)) )
))
(declare-fun arrayNoDuplicates!0 (array!17965 (_ BitVec 32) List!4845) Bool)

(assert (=> b!341078 (= res!188561 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4842))))

(declare-fun b!341079 () Bool)

(declare-fun e!209171 () Bool)

(declare-fun e!209176 () Bool)

(declare-fun mapRes!12219 () Bool)

(assert (=> b!341079 (= e!209171 (and e!209176 mapRes!12219))))

(declare-fun condMapEmpty!12219 () Bool)

(declare-datatypes ((V!10571 0))(
  ( (V!10572 (val!3642 Int)) )
))
(declare-datatypes ((ValueCell!3254 0))(
  ( (ValueCellFull!3254 (v!5808 V!10571)) (EmptyCell!3254) )
))
(declare-datatypes ((array!17967 0))(
  ( (array!17968 (arr!8504 (Array (_ BitVec 32) ValueCell!3254)) (size!8857 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17967)

(declare-fun mapDefault!12219 () ValueCell!3254)

(assert (=> b!341079 (= condMapEmpty!12219 (= (arr!8504 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3254)) mapDefault!12219)))))

(declare-fun b!341080 () Bool)

(declare-fun e!209172 () Bool)

(declare-fun tp_is_empty!7195 () Bool)

(assert (=> b!341080 (= e!209172 tp_is_empty!7195)))

(declare-fun b!341081 () Bool)

(declare-fun res!188564 () Bool)

(assert (=> b!341081 (=> (not res!188564) (not e!209175))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17965 (_ BitVec 32)) Bool)

(assert (=> b!341081 (= res!188564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341082 () Bool)

(declare-fun res!188563 () Bool)

(assert (=> b!341082 (=> (not res!188563) (not e!209175))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341082 (= res!188563 (and (= (size!8857 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8856 _keys!1895) (size!8857 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341083 () Bool)

(declare-fun e!209173 () Bool)

(assert (=> b!341083 (= e!209175 e!209173)))

(declare-fun res!188567 () Bool)

(assert (=> b!341083 (=> (not res!188567) (not e!209173))))

(declare-datatypes ((SeekEntryResult!3275 0))(
  ( (MissingZero!3275 (index!15279 (_ BitVec 32))) (Found!3275 (index!15280 (_ BitVec 32))) (Intermediate!3275 (undefined!4087 Bool) (index!15281 (_ BitVec 32)) (x!33984 (_ BitVec 32))) (Undefined!3275) (MissingVacant!3275 (index!15282 (_ BitVec 32))) )
))
(declare-fun lt!161520 () SeekEntryResult!3275)

(get-info :version)

(assert (=> b!341083 (= res!188567 (and (not ((_ is Found!3275) lt!161520)) (not ((_ is MissingZero!3275) lt!161520)) ((_ is MissingVacant!3275) lt!161520)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17965 (_ BitVec 32)) SeekEntryResult!3275)

(assert (=> b!341083 (= lt!161520 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12219 () Bool)

(declare-fun tp!25263 () Bool)

(assert (=> mapNonEmpty!12219 (= mapRes!12219 (and tp!25263 e!209172))))

(declare-fun mapValue!12219 () ValueCell!3254)

(declare-fun mapRest!12219 () (Array (_ BitVec 32) ValueCell!3254))

(declare-fun mapKey!12219 () (_ BitVec 32))

(assert (=> mapNonEmpty!12219 (= (arr!8504 _values!1525) (store mapRest!12219 mapKey!12219 mapValue!12219))))

(declare-fun b!341084 () Bool)

(assert (=> b!341084 (= e!209176 tp_is_empty!7195)))

(declare-fun res!188562 () Bool)

(assert (=> start!34206 (=> (not res!188562) (not e!209175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34206 (= res!188562 (validMask!0 mask!2385))))

(assert (=> start!34206 e!209175))

(assert (=> start!34206 true))

(assert (=> start!34206 tp_is_empty!7195))

(assert (=> start!34206 tp!25262))

(declare-fun array_inv!6324 (array!17967) Bool)

(assert (=> start!34206 (and (array_inv!6324 _values!1525) e!209171)))

(declare-fun array_inv!6325 (array!17965) Bool)

(assert (=> start!34206 (array_inv!6325 _keys!1895)))

(declare-fun b!341085 () Bool)

(declare-fun res!188566 () Bool)

(assert (=> b!341085 (=> (not res!188566) (not e!209175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341085 (= res!188566 (validKeyInArray!0 k0!1348))))

(declare-fun b!341086 () Bool)

(declare-fun res!188560 () Bool)

(assert (=> b!341086 (=> (not res!188560) (not e!209173))))

(declare-fun arrayContainsKey!0 (array!17965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341086 (= res!188560 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341087 () Bool)

(assert (=> b!341087 (= e!209173 false)))

(declare-fun lt!161519 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17965 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341087 (= lt!161519 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341088 () Bool)

(declare-fun res!188565 () Bool)

(assert (=> b!341088 (=> (not res!188565) (not e!209175))))

(declare-fun zeroValue!1467 () V!10571)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10571)

(declare-datatypes ((tuple2!5220 0))(
  ( (tuple2!5221 (_1!2621 (_ BitVec 64)) (_2!2621 V!10571)) )
))
(declare-datatypes ((List!4846 0))(
  ( (Nil!4843) (Cons!4842 (h!5698 tuple2!5220) (t!9945 List!4846)) )
))
(declare-datatypes ((ListLongMap!4123 0))(
  ( (ListLongMap!4124 (toList!2077 List!4846)) )
))
(declare-fun contains!2142 (ListLongMap!4123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1583 (array!17965 array!17967 (_ BitVec 32) (_ BitVec 32) V!10571 V!10571 (_ BitVec 32) Int) ListLongMap!4123)

(assert (=> b!341088 (= res!188565 (not (contains!2142 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12219 () Bool)

(assert (=> mapIsEmpty!12219 mapRes!12219))

(assert (= (and start!34206 res!188562) b!341082))

(assert (= (and b!341082 res!188563) b!341081))

(assert (= (and b!341081 res!188564) b!341078))

(assert (= (and b!341078 res!188561) b!341085))

(assert (= (and b!341085 res!188566) b!341088))

(assert (= (and b!341088 res!188565) b!341083))

(assert (= (and b!341083 res!188567) b!341086))

(assert (= (and b!341086 res!188560) b!341087))

(assert (= (and b!341079 condMapEmpty!12219) mapIsEmpty!12219))

(assert (= (and b!341079 (not condMapEmpty!12219)) mapNonEmpty!12219))

(assert (= (and mapNonEmpty!12219 ((_ is ValueCellFull!3254) mapValue!12219)) b!341080))

(assert (= (and b!341079 ((_ is ValueCellFull!3254) mapDefault!12219)) b!341084))

(assert (= start!34206 b!341079))

(declare-fun m!343077 () Bool)

(assert (=> b!341085 m!343077))

(declare-fun m!343079 () Bool)

(assert (=> b!341088 m!343079))

(assert (=> b!341088 m!343079))

(declare-fun m!343081 () Bool)

(assert (=> b!341088 m!343081))

(declare-fun m!343083 () Bool)

(assert (=> mapNonEmpty!12219 m!343083))

(declare-fun m!343085 () Bool)

(assert (=> b!341083 m!343085))

(declare-fun m!343087 () Bool)

(assert (=> start!34206 m!343087))

(declare-fun m!343089 () Bool)

(assert (=> start!34206 m!343089))

(declare-fun m!343091 () Bool)

(assert (=> start!34206 m!343091))

(declare-fun m!343093 () Bool)

(assert (=> b!341086 m!343093))

(declare-fun m!343095 () Bool)

(assert (=> b!341087 m!343095))

(declare-fun m!343097 () Bool)

(assert (=> b!341078 m!343097))

(declare-fun m!343099 () Bool)

(assert (=> b!341081 m!343099))

(check-sat tp_is_empty!7195 (not b!341088) (not b!341081) (not b!341087) (not b!341085) (not b!341083) (not b_next!7243) (not mapNonEmpty!12219) (not start!34206) b_and!14417 (not b!341078) (not b!341086))
(check-sat b_and!14417 (not b_next!7243))
