; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33674 () Bool)

(assert start!33674)

(declare-fun b_free!6909 () Bool)

(declare-fun b_next!6909 () Bool)

(assert (=> start!33674 (= b_free!6909 (not b_next!6909))))

(declare-fun tp!24231 () Bool)

(declare-fun b_and!14089 () Bool)

(assert (=> start!33674 (= tp!24231 b_and!14089)))

(declare-fun res!184426 () Bool)

(declare-fun e!205330 () Bool)

(assert (=> start!33674 (=> (not res!184426) (not e!205330))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33674 (= res!184426 (validMask!0 mask!2385))))

(assert (=> start!33674 e!205330))

(assert (=> start!33674 true))

(declare-fun tp_is_empty!6861 () Bool)

(assert (=> start!33674 tp_is_empty!6861))

(assert (=> start!33674 tp!24231))

(declare-datatypes ((V!10125 0))(
  ( (V!10126 (val!3475 Int)) )
))
(declare-datatypes ((ValueCell!3087 0))(
  ( (ValueCellFull!3087 (v!5637 V!10125)) (EmptyCell!3087) )
))
(declare-datatypes ((array!17315 0))(
  ( (array!17316 (arr!8188 (Array (_ BitVec 32) ValueCell!3087)) (size!8540 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17315)

(declare-fun e!205333 () Bool)

(declare-fun array_inv!6088 (array!17315) Bool)

(assert (=> start!33674 (and (array_inv!6088 _values!1525) e!205333)))

(declare-datatypes ((array!17317 0))(
  ( (array!17318 (arr!8189 (Array (_ BitVec 32) (_ BitVec 64))) (size!8541 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17317)

(declare-fun array_inv!6089 (array!17317) Bool)

(assert (=> start!33674 (array_inv!6089 _keys!1895)))

(declare-fun b!334503 () Bool)

(declare-fun e!205335 () Bool)

(assert (=> b!334503 (= e!205335 tp_is_empty!6861)))

(declare-fun b!334504 () Bool)

(declare-fun res!184421 () Bool)

(assert (=> b!334504 (=> (not res!184421) (not e!205330))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10125)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10125)

(declare-datatypes ((tuple2!5044 0))(
  ( (tuple2!5045 (_1!2533 (_ BitVec 64)) (_2!2533 V!10125)) )
))
(declare-datatypes ((List!4668 0))(
  ( (Nil!4665) (Cons!4664 (h!5520 tuple2!5044) (t!9756 List!4668)) )
))
(declare-datatypes ((ListLongMap!3957 0))(
  ( (ListLongMap!3958 (toList!1994 List!4668)) )
))
(declare-fun contains!2038 (ListLongMap!3957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1522 (array!17317 array!17315 (_ BitVec 32) (_ BitVec 32) V!10125 V!10125 (_ BitVec 32) Int) ListLongMap!3957)

(assert (=> b!334504 (= res!184421 (not (contains!2038 (getCurrentListMap!1522 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334505 () Bool)

(declare-fun res!184423 () Bool)

(assert (=> b!334505 (=> (not res!184423) (not e!205330))))

(assert (=> b!334505 (= res!184423 (and (= (size!8540 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8541 _keys!1895) (size!8540 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334506 () Bool)

(declare-fun e!205334 () Bool)

(assert (=> b!334506 (= e!205334 tp_is_empty!6861)))

(declare-fun b!334507 () Bool)

(declare-fun e!205331 () Bool)

(assert (=> b!334507 (= e!205331 (not true))))

(declare-fun arrayContainsKey!0 (array!17317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334507 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10403 0))(
  ( (Unit!10404) )
))
(declare-fun lt!159534 () Unit!10403)

(declare-datatypes ((SeekEntryResult!3164 0))(
  ( (MissingZero!3164 (index!14835 (_ BitVec 32))) (Found!3164 (index!14836 (_ BitVec 32))) (Intermediate!3164 (undefined!3976 Bool) (index!14837 (_ BitVec 32)) (x!33330 (_ BitVec 32))) (Undefined!3164) (MissingVacant!3164 (index!14838 (_ BitVec 32))) )
))
(declare-fun lt!159535 () SeekEntryResult!3164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17317 (_ BitVec 64) (_ BitVec 32)) Unit!10403)

(assert (=> b!334507 (= lt!159534 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14836 lt!159535)))))

(declare-fun b!334508 () Bool)

(assert (=> b!334508 (= e!205330 e!205331)))

(declare-fun res!184425 () Bool)

(assert (=> b!334508 (=> (not res!184425) (not e!205331))))

(get-info :version)

(assert (=> b!334508 (= res!184425 (and ((_ is Found!3164) lt!159535) (= (select (arr!8189 _keys!1895) (index!14836 lt!159535)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17317 (_ BitVec 32)) SeekEntryResult!3164)

(assert (=> b!334508 (= lt!159535 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334509 () Bool)

(declare-fun res!184422 () Bool)

(assert (=> b!334509 (=> (not res!184422) (not e!205330))))

(declare-datatypes ((List!4669 0))(
  ( (Nil!4666) (Cons!4665 (h!5521 (_ BitVec 64)) (t!9757 List!4669)) )
))
(declare-fun arrayNoDuplicates!0 (array!17317 (_ BitVec 32) List!4669) Bool)

(assert (=> b!334509 (= res!184422 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4666))))

(declare-fun b!334510 () Bool)

(declare-fun res!184427 () Bool)

(assert (=> b!334510 (=> (not res!184427) (not e!205331))))

(assert (=> b!334510 (= res!184427 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14836 lt!159535)))))

(declare-fun b!334511 () Bool)

(declare-fun res!184424 () Bool)

(assert (=> b!334511 (=> (not res!184424) (not e!205330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17317 (_ BitVec 32)) Bool)

(assert (=> b!334511 (= res!184424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334512 () Bool)

(declare-fun mapRes!11688 () Bool)

(assert (=> b!334512 (= e!205333 (and e!205334 mapRes!11688))))

(declare-fun condMapEmpty!11688 () Bool)

(declare-fun mapDefault!11688 () ValueCell!3087)

(assert (=> b!334512 (= condMapEmpty!11688 (= (arr!8188 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3087)) mapDefault!11688)))))

(declare-fun mapNonEmpty!11688 () Bool)

(declare-fun tp!24230 () Bool)

(assert (=> mapNonEmpty!11688 (= mapRes!11688 (and tp!24230 e!205335))))

(declare-fun mapValue!11688 () ValueCell!3087)

(declare-fun mapRest!11688 () (Array (_ BitVec 32) ValueCell!3087))

(declare-fun mapKey!11688 () (_ BitVec 32))

(assert (=> mapNonEmpty!11688 (= (arr!8188 _values!1525) (store mapRest!11688 mapKey!11688 mapValue!11688))))

(declare-fun b!334513 () Bool)

(declare-fun res!184420 () Bool)

(assert (=> b!334513 (=> (not res!184420) (not e!205330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334513 (= res!184420 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11688 () Bool)

(assert (=> mapIsEmpty!11688 mapRes!11688))

(assert (= (and start!33674 res!184426) b!334505))

(assert (= (and b!334505 res!184423) b!334511))

(assert (= (and b!334511 res!184424) b!334509))

(assert (= (and b!334509 res!184422) b!334513))

(assert (= (and b!334513 res!184420) b!334504))

(assert (= (and b!334504 res!184421) b!334508))

(assert (= (and b!334508 res!184425) b!334510))

(assert (= (and b!334510 res!184427) b!334507))

(assert (= (and b!334512 condMapEmpty!11688) mapIsEmpty!11688))

(assert (= (and b!334512 (not condMapEmpty!11688)) mapNonEmpty!11688))

(assert (= (and mapNonEmpty!11688 ((_ is ValueCellFull!3087) mapValue!11688)) b!334503))

(assert (= (and b!334512 ((_ is ValueCellFull!3087) mapDefault!11688)) b!334506))

(assert (= start!33674 b!334512))

(declare-fun m!338557 () Bool)

(assert (=> b!334510 m!338557))

(declare-fun m!338559 () Bool)

(assert (=> start!33674 m!338559))

(declare-fun m!338561 () Bool)

(assert (=> start!33674 m!338561))

(declare-fun m!338563 () Bool)

(assert (=> start!33674 m!338563))

(declare-fun m!338565 () Bool)

(assert (=> b!334504 m!338565))

(assert (=> b!334504 m!338565))

(declare-fun m!338567 () Bool)

(assert (=> b!334504 m!338567))

(declare-fun m!338569 () Bool)

(assert (=> b!334508 m!338569))

(declare-fun m!338571 () Bool)

(assert (=> b!334508 m!338571))

(declare-fun m!338573 () Bool)

(assert (=> b!334513 m!338573))

(declare-fun m!338575 () Bool)

(assert (=> mapNonEmpty!11688 m!338575))

(declare-fun m!338577 () Bool)

(assert (=> b!334509 m!338577))

(declare-fun m!338579 () Bool)

(assert (=> b!334507 m!338579))

(declare-fun m!338581 () Bool)

(assert (=> b!334507 m!338581))

(declare-fun m!338583 () Bool)

(assert (=> b!334511 m!338583))

(check-sat tp_is_empty!6861 (not b!334507) (not start!33674) (not b!334504) (not b!334509) (not b!334511) (not b!334508) (not b!334513) (not b!334510) (not mapNonEmpty!11688) b_and!14089 (not b_next!6909))
(check-sat b_and!14089 (not b_next!6909))
