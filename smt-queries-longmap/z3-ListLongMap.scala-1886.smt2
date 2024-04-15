; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33736 () Bool)

(assert start!33736)

(declare-fun b_free!6985 () Bool)

(declare-fun b_next!6985 () Bool)

(assert (=> start!33736 (= b_free!6985 (not b_next!6985))))

(declare-fun tp!24458 () Bool)

(declare-fun b_and!14139 () Bool)

(assert (=> start!33736 (= tp!24458 b_and!14139)))

(declare-fun b!335478 () Bool)

(declare-fun e!205928 () Bool)

(declare-fun e!205927 () Bool)

(declare-fun mapRes!11802 () Bool)

(assert (=> b!335478 (= e!205928 (and e!205927 mapRes!11802))))

(declare-fun condMapEmpty!11802 () Bool)

(declare-datatypes ((V!10227 0))(
  ( (V!10228 (val!3513 Int)) )
))
(declare-datatypes ((ValueCell!3125 0))(
  ( (ValueCellFull!3125 (v!5669 V!10227)) (EmptyCell!3125) )
))
(declare-datatypes ((array!17447 0))(
  ( (array!17448 (arr!8254 (Array (_ BitVec 32) ValueCell!3125)) (size!8607 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17447)

(declare-fun mapDefault!11802 () ValueCell!3125)

(assert (=> b!335478 (= condMapEmpty!11802 (= (arr!8254 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3125)) mapDefault!11802)))))

(declare-fun mapNonEmpty!11802 () Bool)

(declare-fun tp!24459 () Bool)

(declare-fun e!205929 () Bool)

(assert (=> mapNonEmpty!11802 (= mapRes!11802 (and tp!24459 e!205929))))

(declare-fun mapValue!11802 () ValueCell!3125)

(declare-fun mapKey!11802 () (_ BitVec 32))

(declare-fun mapRest!11802 () (Array (_ BitVec 32) ValueCell!3125))

(assert (=> mapNonEmpty!11802 (= (arr!8254 _values!1525) (store mapRest!11802 mapKey!11802 mapValue!11802))))

(declare-fun b!335479 () Bool)

(declare-fun tp_is_empty!6937 () Bool)

(assert (=> b!335479 (= e!205927 tp_is_empty!6937)))

(declare-fun b!335480 () Bool)

(declare-fun res!185204 () Bool)

(declare-fun e!205930 () Bool)

(assert (=> b!335480 (=> (not res!185204) (not e!205930))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10227)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17449 0))(
  ( (array!17450 (arr!8255 (Array (_ BitVec 32) (_ BitVec 64))) (size!8608 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17449)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10227)

(declare-datatypes ((tuple2!5050 0))(
  ( (tuple2!5051 (_1!2536 (_ BitVec 64)) (_2!2536 V!10227)) )
))
(declare-datatypes ((List!4685 0))(
  ( (Nil!4682) (Cons!4681 (h!5537 tuple2!5050) (t!9764 List!4685)) )
))
(declare-datatypes ((ListLongMap!3953 0))(
  ( (ListLongMap!3954 (toList!1992 List!4685)) )
))
(declare-fun contains!2047 (ListLongMap!3953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1498 (array!17449 array!17447 (_ BitVec 32) (_ BitVec 32) V!10227 V!10227 (_ BitVec 32) Int) ListLongMap!3953)

(assert (=> b!335480 (= res!185204 (not (contains!2047 (getCurrentListMap!1498 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!335481 () Bool)

(declare-fun res!185203 () Bool)

(assert (=> b!335481 (=> (not res!185203) (not e!205930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335481 (= res!185203 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11802 () Bool)

(assert (=> mapIsEmpty!11802 mapRes!11802))

(declare-fun b!335482 () Bool)

(declare-fun res!185199 () Bool)

(assert (=> b!335482 (=> (not res!185199) (not e!205930))))

(declare-datatypes ((List!4686 0))(
  ( (Nil!4683) (Cons!4682 (h!5538 (_ BitVec 64)) (t!9765 List!4686)) )
))
(declare-fun arrayNoDuplicates!0 (array!17449 (_ BitVec 32) List!4686) Bool)

(assert (=> b!335482 (= res!185199 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4683))))

(declare-fun b!335483 () Bool)

(declare-fun res!185200 () Bool)

(assert (=> b!335483 (=> (not res!185200) (not e!205930))))

(assert (=> b!335483 (= res!185200 (and (= (size!8607 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8608 _keys!1895) (size!8607 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335484 () Bool)

(declare-fun res!185202 () Bool)

(assert (=> b!335484 (=> (not res!185202) (not e!205930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17449 (_ BitVec 32)) Bool)

(assert (=> b!335484 (= res!185202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335485 () Bool)

(assert (=> b!335485 (= e!205930 false)))

(declare-datatypes ((SeekEntryResult!3195 0))(
  ( (MissingZero!3195 (index!14959 (_ BitVec 32))) (Found!3195 (index!14960 (_ BitVec 32))) (Intermediate!3195 (undefined!4007 Bool) (index!14961 (_ BitVec 32)) (x!33460 (_ BitVec 32))) (Undefined!3195) (MissingVacant!3195 (index!14962 (_ BitVec 32))) )
))
(declare-fun lt!159705 () SeekEntryResult!3195)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17449 (_ BitVec 32)) SeekEntryResult!3195)

(assert (=> b!335485 (= lt!159705 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!185201 () Bool)

(assert (=> start!33736 (=> (not res!185201) (not e!205930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33736 (= res!185201 (validMask!0 mask!2385))))

(assert (=> start!33736 e!205930))

(assert (=> start!33736 true))

(assert (=> start!33736 tp_is_empty!6937))

(assert (=> start!33736 tp!24458))

(declare-fun array_inv!6158 (array!17447) Bool)

(assert (=> start!33736 (and (array_inv!6158 _values!1525) e!205928)))

(declare-fun array_inv!6159 (array!17449) Bool)

(assert (=> start!33736 (array_inv!6159 _keys!1895)))

(declare-fun b!335486 () Bool)

(assert (=> b!335486 (= e!205929 tp_is_empty!6937)))

(assert (= (and start!33736 res!185201) b!335483))

(assert (= (and b!335483 res!185200) b!335484))

(assert (= (and b!335484 res!185202) b!335482))

(assert (= (and b!335482 res!185199) b!335481))

(assert (= (and b!335481 res!185203) b!335480))

(assert (= (and b!335480 res!185204) b!335485))

(assert (= (and b!335478 condMapEmpty!11802) mapIsEmpty!11802))

(assert (= (and b!335478 (not condMapEmpty!11802)) mapNonEmpty!11802))

(get-info :version)

(assert (= (and mapNonEmpty!11802 ((_ is ValueCellFull!3125) mapValue!11802)) b!335486))

(assert (= (and b!335478 ((_ is ValueCellFull!3125) mapDefault!11802)) b!335479))

(assert (= start!33736 b!335478))

(declare-fun m!339011 () Bool)

(assert (=> b!335485 m!339011))

(declare-fun m!339013 () Bool)

(assert (=> mapNonEmpty!11802 m!339013))

(declare-fun m!339015 () Bool)

(assert (=> b!335484 m!339015))

(declare-fun m!339017 () Bool)

(assert (=> start!33736 m!339017))

(declare-fun m!339019 () Bool)

(assert (=> start!33736 m!339019))

(declare-fun m!339021 () Bool)

(assert (=> start!33736 m!339021))

(declare-fun m!339023 () Bool)

(assert (=> b!335482 m!339023))

(declare-fun m!339025 () Bool)

(assert (=> b!335481 m!339025))

(declare-fun m!339027 () Bool)

(assert (=> b!335480 m!339027))

(assert (=> b!335480 m!339027))

(declare-fun m!339029 () Bool)

(assert (=> b!335480 m!339029))

(check-sat (not b!335481) tp_is_empty!6937 (not b!335484) b_and!14139 (not mapNonEmpty!11802) (not b!335482) (not b!335485) (not b!335480) (not start!33736) (not b_next!6985))
(check-sat b_and!14139 (not b_next!6985))
