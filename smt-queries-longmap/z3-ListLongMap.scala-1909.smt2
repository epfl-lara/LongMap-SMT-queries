; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33978 () Bool)

(assert start!33978)

(declare-fun b_free!7123 () Bool)

(declare-fun b_next!7123 () Bool)

(assert (=> start!33978 (= b_free!7123 (not b_next!7123))))

(declare-fun tp!24888 () Bool)

(declare-fun b_and!14287 () Bool)

(assert (=> start!33978 (= tp!24888 b_and!14287)))

(declare-fun b!338417 () Bool)

(declare-datatypes ((Unit!10506 0))(
  ( (Unit!10507) )
))
(declare-fun e!207629 () Unit!10506)

(declare-fun Unit!10508 () Unit!10506)

(assert (=> b!338417 (= e!207629 Unit!10508)))

(declare-fun b!338418 () Bool)

(declare-fun res!186967 () Bool)

(declare-fun e!207633 () Bool)

(assert (=> b!338418 (=> (not res!186967) (not e!207633))))

(declare-datatypes ((array!17725 0))(
  ( (array!17726 (arr!8388 (Array (_ BitVec 32) (_ BitVec 64))) (size!8741 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17725)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17725 (_ BitVec 32)) Bool)

(assert (=> b!338418 (= res!186967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338419 () Bool)

(declare-fun res!186965 () Bool)

(assert (=> b!338419 (=> (not res!186965) (not e!207633))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338419 (= res!186965 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12024 () Bool)

(declare-fun mapRes!12024 () Bool)

(declare-fun tp!24887 () Bool)

(declare-fun e!207628 () Bool)

(assert (=> mapNonEmpty!12024 (= mapRes!12024 (and tp!24887 e!207628))))

(declare-fun mapKey!12024 () (_ BitVec 32))

(declare-datatypes ((V!10411 0))(
  ( (V!10412 (val!3582 Int)) )
))
(declare-datatypes ((ValueCell!3194 0))(
  ( (ValueCellFull!3194 (v!5743 V!10411)) (EmptyCell!3194) )
))
(declare-datatypes ((array!17727 0))(
  ( (array!17728 (arr!8389 (Array (_ BitVec 32) ValueCell!3194)) (size!8742 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17727)

(declare-fun mapValue!12024 () ValueCell!3194)

(declare-fun mapRest!12024 () (Array (_ BitVec 32) ValueCell!3194))

(assert (=> mapNonEmpty!12024 (= (arr!8389 _values!1525) (store mapRest!12024 mapKey!12024 mapValue!12024))))

(declare-fun res!186969 () Bool)

(assert (=> start!33978 (=> (not res!186969) (not e!207633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33978 (= res!186969 (validMask!0 mask!2385))))

(assert (=> start!33978 e!207633))

(assert (=> start!33978 true))

(declare-fun tp_is_empty!7075 () Bool)

(assert (=> start!33978 tp_is_empty!7075))

(assert (=> start!33978 tp!24888))

(declare-fun e!207634 () Bool)

(declare-fun array_inv!6250 (array!17727) Bool)

(assert (=> start!33978 (and (array_inv!6250 _values!1525) e!207634)))

(declare-fun array_inv!6251 (array!17725) Bool)

(assert (=> start!33978 (array_inv!6251 _keys!1895)))

(declare-fun b!338420 () Bool)

(assert (=> b!338420 (= e!207628 tp_is_empty!7075)))

(declare-fun b!338421 () Bool)

(declare-fun res!186970 () Bool)

(assert (=> b!338421 (=> (not res!186970) (not e!207633))))

(declare-datatypes ((List!4773 0))(
  ( (Nil!4770) (Cons!4769 (h!5625 (_ BitVec 64)) (t!9862 List!4773)) )
))
(declare-fun arrayNoDuplicates!0 (array!17725 (_ BitVec 32) List!4773) Bool)

(assert (=> b!338421 (= res!186970 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4770))))

(declare-fun b!338422 () Bool)

(declare-fun Unit!10509 () Unit!10506)

(assert (=> b!338422 (= e!207629 Unit!10509)))

(declare-fun zeroValue!1467 () V!10411)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10411)

(declare-fun lt!160644 () Unit!10506)

(declare-fun lemmaArrayContainsKeyThenInListMap!278 (array!17725 array!17727 (_ BitVec 32) (_ BitVec 32) V!10411 V!10411 (_ BitVec 64) (_ BitVec 32) Int) Unit!10506)

(declare-fun arrayScanForKey!0 (array!17725 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338422 (= lt!160644 (lemmaArrayContainsKeyThenInListMap!278 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338422 false))

(declare-fun b!338423 () Bool)

(declare-fun res!186971 () Bool)

(assert (=> b!338423 (=> (not res!186971) (not e!207633))))

(assert (=> b!338423 (= res!186971 (and (= (size!8742 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8741 _keys!1895) (size!8742 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338424 () Bool)

(declare-fun e!207630 () Bool)

(assert (=> b!338424 (= e!207634 (and e!207630 mapRes!12024))))

(declare-fun condMapEmpty!12024 () Bool)

(declare-fun mapDefault!12024 () ValueCell!3194)

(assert (=> b!338424 (= condMapEmpty!12024 (= (arr!8389 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3194)) mapDefault!12024)))))

(declare-fun b!338425 () Bool)

(assert (=> b!338425 (= e!207630 tp_is_empty!7075)))

(declare-fun b!338426 () Bool)

(declare-fun res!186968 () Bool)

(assert (=> b!338426 (=> (not res!186968) (not e!207633))))

(declare-datatypes ((tuple2!5144 0))(
  ( (tuple2!5145 (_1!2583 (_ BitVec 64)) (_2!2583 V!10411)) )
))
(declare-datatypes ((List!4774 0))(
  ( (Nil!4771) (Cons!4770 (h!5626 tuple2!5144) (t!9863 List!4774)) )
))
(declare-datatypes ((ListLongMap!4047 0))(
  ( (ListLongMap!4048 (toList!2039 List!4774)) )
))
(declare-fun contains!2099 (ListLongMap!4047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1545 (array!17725 array!17727 (_ BitVec 32) (_ BitVec 32) V!10411 V!10411 (_ BitVec 32) Int) ListLongMap!4047)

(assert (=> b!338426 (= res!186968 (not (contains!2099 (getCurrentListMap!1545 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338427 () Bool)

(declare-fun e!207632 () Bool)

(assert (=> b!338427 (= e!207633 e!207632)))

(declare-fun res!186966 () Bool)

(assert (=> b!338427 (=> (not res!186966) (not e!207632))))

(declare-datatypes ((SeekEntryResult!3238 0))(
  ( (MissingZero!3238 (index!15131 (_ BitVec 32))) (Found!3238 (index!15132 (_ BitVec 32))) (Intermediate!3238 (undefined!4050 Bool) (index!15133 (_ BitVec 32)) (x!33737 (_ BitVec 32))) (Undefined!3238) (MissingVacant!3238 (index!15134 (_ BitVec 32))) )
))
(declare-fun lt!160643 () SeekEntryResult!3238)

(get-info :version)

(assert (=> b!338427 (= res!186966 (and (not ((_ is Found!3238) lt!160643)) ((_ is MissingZero!3238) lt!160643)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17725 (_ BitVec 32)) SeekEntryResult!3238)

(assert (=> b!338427 (= lt!160643 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338428 () Bool)

(assert (=> b!338428 (= e!207632 false)))

(declare-fun lt!160642 () Unit!10506)

(assert (=> b!338428 (= lt!160642 e!207629)))

(declare-fun c!52373 () Bool)

(declare-fun arrayContainsKey!0 (array!17725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338428 (= c!52373 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12024 () Bool)

(assert (=> mapIsEmpty!12024 mapRes!12024))

(assert (= (and start!33978 res!186969) b!338423))

(assert (= (and b!338423 res!186971) b!338418))

(assert (= (and b!338418 res!186967) b!338421))

(assert (= (and b!338421 res!186970) b!338419))

(assert (= (and b!338419 res!186965) b!338426))

(assert (= (and b!338426 res!186968) b!338427))

(assert (= (and b!338427 res!186966) b!338428))

(assert (= (and b!338428 c!52373) b!338422))

(assert (= (and b!338428 (not c!52373)) b!338417))

(assert (= (and b!338424 condMapEmpty!12024) mapIsEmpty!12024))

(assert (= (and b!338424 (not condMapEmpty!12024)) mapNonEmpty!12024))

(assert (= (and mapNonEmpty!12024 ((_ is ValueCellFull!3194) mapValue!12024)) b!338420))

(assert (= (and b!338424 ((_ is ValueCellFull!3194) mapDefault!12024)) b!338425))

(assert (= start!33978 b!338424))

(declare-fun m!341143 () Bool)

(assert (=> b!338427 m!341143))

(declare-fun m!341145 () Bool)

(assert (=> b!338428 m!341145))

(declare-fun m!341147 () Bool)

(assert (=> mapNonEmpty!12024 m!341147))

(declare-fun m!341149 () Bool)

(assert (=> b!338421 m!341149))

(declare-fun m!341151 () Bool)

(assert (=> b!338422 m!341151))

(assert (=> b!338422 m!341151))

(declare-fun m!341153 () Bool)

(assert (=> b!338422 m!341153))

(declare-fun m!341155 () Bool)

(assert (=> b!338426 m!341155))

(assert (=> b!338426 m!341155))

(declare-fun m!341157 () Bool)

(assert (=> b!338426 m!341157))

(declare-fun m!341159 () Bool)

(assert (=> start!33978 m!341159))

(declare-fun m!341161 () Bool)

(assert (=> start!33978 m!341161))

(declare-fun m!341163 () Bool)

(assert (=> start!33978 m!341163))

(declare-fun m!341165 () Bool)

(assert (=> b!338419 m!341165))

(declare-fun m!341167 () Bool)

(assert (=> b!338418 m!341167))

(check-sat b_and!14287 (not mapNonEmpty!12024) (not start!33978) (not b!338419) (not b!338428) (not b!338421) (not b_next!7123) (not b!338427) (not b!338422) tp_is_empty!7075 (not b!338426) (not b!338418))
(check-sat b_and!14287 (not b_next!7123))
