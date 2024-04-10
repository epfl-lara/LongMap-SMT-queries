; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34204 () Bool)

(assert start!34204)

(declare-fun b_free!7227 () Bool)

(declare-fun b_next!7227 () Bool)

(assert (=> start!34204 (= b_free!7227 (not b_next!7227))))

(declare-fun tp!25214 () Bool)

(declare-fun b_and!14427 () Bool)

(assert (=> start!34204 (= tp!25214 b_and!14427)))

(declare-fun b!341089 () Bool)

(declare-fun e!209203 () Bool)

(declare-fun tp_is_empty!7179 () Bool)

(assert (=> b!341089 (= e!209203 tp_is_empty!7179)))

(declare-fun b!341090 () Bool)

(declare-fun res!188502 () Bool)

(declare-fun e!209208 () Bool)

(assert (=> b!341090 (=> (not res!188502) (not e!209208))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10549 0))(
  ( (V!10550 (val!3634 Int)) )
))
(declare-fun zeroValue!1467 () V!10549)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3246 0))(
  ( (ValueCellFull!3246 (v!5806 V!10549)) (EmptyCell!3246) )
))
(declare-datatypes ((array!17953 0))(
  ( (array!17954 (arr!8497 (Array (_ BitVec 32) ValueCell!3246)) (size!8849 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17953)

(declare-datatypes ((array!17955 0))(
  ( (array!17956 (arr!8498 (Array (_ BitVec 32) (_ BitVec 64))) (size!8850 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17955)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10549)

(declare-datatypes ((tuple2!5270 0))(
  ( (tuple2!5271 (_1!2646 (_ BitVec 64)) (_2!2646 V!10549)) )
))
(declare-datatypes ((List!4889 0))(
  ( (Nil!4886) (Cons!4885 (h!5741 tuple2!5270) (t!9997 List!4889)) )
))
(declare-datatypes ((ListLongMap!4183 0))(
  ( (ListLongMap!4184 (toList!2107 List!4889)) )
))
(declare-fun contains!2161 (ListLongMap!4183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1628 (array!17955 array!17953 (_ BitVec 32) (_ BitVec 32) V!10549 V!10549 (_ BitVec 32) Int) ListLongMap!4183)

(assert (=> b!341090 (= res!188502 (not (contains!2161 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12195 () Bool)

(declare-fun mapRes!12195 () Bool)

(declare-fun tp!25215 () Bool)

(declare-fun e!209207 () Bool)

(assert (=> mapNonEmpty!12195 (= mapRes!12195 (and tp!25215 e!209207))))

(declare-fun mapValue!12195 () ValueCell!3246)

(declare-fun mapRest!12195 () (Array (_ BitVec 32) ValueCell!3246))

(declare-fun mapKey!12195 () (_ BitVec 32))

(assert (=> mapNonEmpty!12195 (= (arr!8497 _values!1525) (store mapRest!12195 mapKey!12195 mapValue!12195))))

(declare-fun b!341091 () Bool)

(declare-fun res!188497 () Bool)

(assert (=> b!341091 (=> (not res!188497) (not e!209208))))

(assert (=> b!341091 (= res!188497 (and (= (size!8849 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8850 _keys!1895) (size!8849 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341092 () Bool)

(declare-fun res!188501 () Bool)

(declare-fun e!209205 () Bool)

(assert (=> b!341092 (=> (not res!188501) (not e!209205))))

(declare-fun arrayContainsKey!0 (array!17955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341092 (= res!188501 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341093 () Bool)

(assert (=> b!341093 (= e!209205 false)))

(declare-fun lt!161707 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17955 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341093 (= lt!161707 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341094 () Bool)

(declare-fun res!188499 () Bool)

(assert (=> b!341094 (=> (not res!188499) (not e!209208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17955 (_ BitVec 32)) Bool)

(assert (=> b!341094 (= res!188499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341095 () Bool)

(assert (=> b!341095 (= e!209207 tp_is_empty!7179)))

(declare-fun b!341096 () Bool)

(declare-fun res!188504 () Bool)

(assert (=> b!341096 (=> (not res!188504) (not e!209208))))

(declare-datatypes ((List!4890 0))(
  ( (Nil!4887) (Cons!4886 (h!5742 (_ BitVec 64)) (t!9998 List!4890)) )
))
(declare-fun arrayNoDuplicates!0 (array!17955 (_ BitVec 32) List!4890) Bool)

(assert (=> b!341096 (= res!188504 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4887))))

(declare-fun b!341097 () Bool)

(declare-fun e!209204 () Bool)

(assert (=> b!341097 (= e!209204 (and e!209203 mapRes!12195))))

(declare-fun condMapEmpty!12195 () Bool)

(declare-fun mapDefault!12195 () ValueCell!3246)

(assert (=> b!341097 (= condMapEmpty!12195 (= (arr!8497 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3246)) mapDefault!12195)))))

(declare-fun b!341098 () Bool)

(declare-fun res!188503 () Bool)

(assert (=> b!341098 (=> (not res!188503) (not e!209208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341098 (= res!188503 (validKeyInArray!0 k0!1348))))

(declare-fun b!341099 () Bool)

(assert (=> b!341099 (= e!209208 e!209205)))

(declare-fun res!188498 () Bool)

(assert (=> b!341099 (=> (not res!188498) (not e!209205))))

(declare-datatypes ((SeekEntryResult!3283 0))(
  ( (MissingZero!3283 (index!15311 (_ BitVec 32))) (Found!3283 (index!15312 (_ BitVec 32))) (Intermediate!3283 (undefined!4095 Bool) (index!15313 (_ BitVec 32)) (x!33973 (_ BitVec 32))) (Undefined!3283) (MissingVacant!3283 (index!15314 (_ BitVec 32))) )
))
(declare-fun lt!161706 () SeekEntryResult!3283)

(get-info :version)

(assert (=> b!341099 (= res!188498 (and (not ((_ is Found!3283) lt!161706)) (not ((_ is MissingZero!3283) lt!161706)) ((_ is MissingVacant!3283) lt!161706)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17955 (_ BitVec 32)) SeekEntryResult!3283)

(assert (=> b!341099 (= lt!161706 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12195 () Bool)

(assert (=> mapIsEmpty!12195 mapRes!12195))

(declare-fun res!188500 () Bool)

(assert (=> start!34204 (=> (not res!188500) (not e!209208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34204 (= res!188500 (validMask!0 mask!2385))))

(assert (=> start!34204 e!209208))

(assert (=> start!34204 true))

(assert (=> start!34204 tp_is_empty!7179))

(assert (=> start!34204 tp!25214))

(declare-fun array_inv!6294 (array!17953) Bool)

(assert (=> start!34204 (and (array_inv!6294 _values!1525) e!209204)))

(declare-fun array_inv!6295 (array!17955) Bool)

(assert (=> start!34204 (array_inv!6295 _keys!1895)))

(assert (= (and start!34204 res!188500) b!341091))

(assert (= (and b!341091 res!188497) b!341094))

(assert (= (and b!341094 res!188499) b!341096))

(assert (= (and b!341096 res!188504) b!341098))

(assert (= (and b!341098 res!188503) b!341090))

(assert (= (and b!341090 res!188502) b!341099))

(assert (= (and b!341099 res!188498) b!341092))

(assert (= (and b!341092 res!188501) b!341093))

(assert (= (and b!341097 condMapEmpty!12195) mapIsEmpty!12195))

(assert (= (and b!341097 (not condMapEmpty!12195)) mapNonEmpty!12195))

(assert (= (and mapNonEmpty!12195 ((_ is ValueCellFull!3246) mapValue!12195)) b!341095))

(assert (= (and b!341097 ((_ is ValueCellFull!3246) mapDefault!12195)) b!341089))

(assert (= start!34204 b!341097))

(declare-fun m!343615 () Bool)

(assert (=> b!341093 m!343615))

(declare-fun m!343617 () Bool)

(assert (=> b!341099 m!343617))

(declare-fun m!343619 () Bool)

(assert (=> b!341090 m!343619))

(assert (=> b!341090 m!343619))

(declare-fun m!343621 () Bool)

(assert (=> b!341090 m!343621))

(declare-fun m!343623 () Bool)

(assert (=> mapNonEmpty!12195 m!343623))

(declare-fun m!343625 () Bool)

(assert (=> b!341094 m!343625))

(declare-fun m!343627 () Bool)

(assert (=> b!341098 m!343627))

(declare-fun m!343629 () Bool)

(assert (=> b!341092 m!343629))

(declare-fun m!343631 () Bool)

(assert (=> start!34204 m!343631))

(declare-fun m!343633 () Bool)

(assert (=> start!34204 m!343633))

(declare-fun m!343635 () Bool)

(assert (=> start!34204 m!343635))

(declare-fun m!343637 () Bool)

(assert (=> b!341096 m!343637))

(check-sat (not b!341096) (not b!341092) (not b!341094) tp_is_empty!7179 (not b!341093) (not mapNonEmpty!12195) (not b!341098) (not b_next!7227) (not start!34204) b_and!14427 (not b!341090) (not b!341099))
(check-sat b_and!14427 (not b_next!7227))
