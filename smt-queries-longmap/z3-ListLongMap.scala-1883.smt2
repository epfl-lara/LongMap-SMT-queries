; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33734 () Bool)

(assert start!33734)

(declare-fun b_free!6969 () Bool)

(declare-fun b_next!6969 () Bool)

(assert (=> start!33734 (= b_free!6969 (not b_next!6969))))

(declare-fun tp!24410 () Bool)

(declare-fun b_and!14149 () Bool)

(assert (=> start!33734 (= tp!24410 b_and!14149)))

(declare-fun b!335493 () Bool)

(declare-fun e!205941 () Bool)

(declare-fun e!205944 () Bool)

(assert (=> b!335493 (= e!205941 e!205944)))

(declare-fun res!185143 () Bool)

(assert (=> b!335493 (=> (not res!185143) (not e!205944))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17435 0))(
  ( (array!17436 (arr!8248 (Array (_ BitVec 32) (_ BitVec 64))) (size!8600 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17435)

(declare-datatypes ((SeekEntryResult!3189 0))(
  ( (MissingZero!3189 (index!14935 (_ BitVec 32))) (Found!3189 (index!14936 (_ BitVec 32))) (Intermediate!3189 (undefined!4001 Bool) (index!14937 (_ BitVec 32)) (x!33435 (_ BitVec 32))) (Undefined!3189) (MissingVacant!3189 (index!14938 (_ BitVec 32))) )
))
(declare-fun lt!159850 () SeekEntryResult!3189)

(get-info :version)

(assert (=> b!335493 (= res!185143 (and ((_ is Found!3189) lt!159850) (= (select (arr!8248 _keys!1895) (index!14936 lt!159850)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17435 (_ BitVec 32)) SeekEntryResult!3189)

(assert (=> b!335493 (= lt!159850 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11778 () Bool)

(declare-fun mapRes!11778 () Bool)

(declare-fun tp!24411 () Bool)

(declare-fun e!205942 () Bool)

(assert (=> mapNonEmpty!11778 (= mapRes!11778 (and tp!24411 e!205942))))

(declare-datatypes ((V!10205 0))(
  ( (V!10206 (val!3505 Int)) )
))
(declare-datatypes ((ValueCell!3117 0))(
  ( (ValueCellFull!3117 (v!5667 V!10205)) (EmptyCell!3117) )
))
(declare-fun mapValue!11778 () ValueCell!3117)

(declare-fun mapKey!11778 () (_ BitVec 32))

(declare-datatypes ((array!17437 0))(
  ( (array!17438 (arr!8249 (Array (_ BitVec 32) ValueCell!3117)) (size!8601 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17437)

(declare-fun mapRest!11778 () (Array (_ BitVec 32) ValueCell!3117))

(assert (=> mapNonEmpty!11778 (= (arr!8249 _values!1525) (store mapRest!11778 mapKey!11778 mapValue!11778))))

(declare-fun mapIsEmpty!11778 () Bool)

(assert (=> mapIsEmpty!11778 mapRes!11778))

(declare-fun b!335494 () Bool)

(declare-fun res!185147 () Bool)

(declare-fun e!205940 () Bool)

(assert (=> b!335494 (=> (not res!185147) (not e!205940))))

(declare-datatypes ((List!4711 0))(
  ( (Nil!4708) (Cons!4707 (h!5563 (_ BitVec 64)) (t!9799 List!4711)) )
))
(declare-fun arrayNoDuplicates!0 (array!17435 (_ BitVec 32) List!4711) Bool)

(assert (=> b!335494 (= res!185147 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4708))))

(declare-fun b!335495 () Bool)

(declare-fun tp_is_empty!6921 () Bool)

(assert (=> b!335495 (= e!205942 tp_is_empty!6921)))

(declare-fun b!335496 () Bool)

(declare-fun e!205938 () Bool)

(declare-fun e!205939 () Bool)

(assert (=> b!335496 (= e!205938 (and e!205939 mapRes!11778))))

(declare-fun condMapEmpty!11778 () Bool)

(declare-fun mapDefault!11778 () ValueCell!3117)

(assert (=> b!335496 (= condMapEmpty!11778 (= (arr!8249 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3117)) mapDefault!11778)))))

(declare-fun b!335497 () Bool)

(declare-fun res!185146 () Bool)

(assert (=> b!335497 (=> (not res!185146) (not e!205940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17435 (_ BitVec 32)) Bool)

(assert (=> b!335497 (= res!185146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335498 () Bool)

(declare-fun res!185140 () Bool)

(assert (=> b!335498 (=> (not res!185140) (not e!205940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335498 (= res!185140 (validKeyInArray!0 k0!1348))))

(declare-fun b!335499 () Bool)

(declare-fun res!185145 () Bool)

(assert (=> b!335499 (=> (not res!185145) (not e!205940))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335499 (= res!185145 (and (= (size!8601 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8600 _keys!1895) (size!8601 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335500 () Bool)

(assert (=> b!335500 (= e!205940 e!205941)))

(declare-fun res!185141 () Bool)

(assert (=> b!335500 (=> (not res!185141) (not e!205941))))

(declare-datatypes ((tuple2!5092 0))(
  ( (tuple2!5093 (_1!2557 (_ BitVec 64)) (_2!2557 V!10205)) )
))
(declare-datatypes ((List!4712 0))(
  ( (Nil!4709) (Cons!4708 (h!5564 tuple2!5092) (t!9800 List!4712)) )
))
(declare-datatypes ((ListLongMap!4005 0))(
  ( (ListLongMap!4006 (toList!2018 List!4712)) )
))
(declare-fun lt!159851 () ListLongMap!4005)

(declare-fun contains!2062 (ListLongMap!4005 (_ BitVec 64)) Bool)

(assert (=> b!335500 (= res!185141 (not (contains!2062 lt!159851 k0!1348)))))

(declare-fun zeroValue!1467 () V!10205)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10205)

(declare-fun getCurrentListMap!1542 (array!17435 array!17437 (_ BitVec 32) (_ BitVec 32) V!10205 V!10205 (_ BitVec 32) Int) ListLongMap!4005)

(assert (=> b!335500 (= lt!159851 (getCurrentListMap!1542 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335501 () Bool)

(declare-fun res!185144 () Bool)

(assert (=> b!335501 (=> (not res!185144) (not e!205944))))

(declare-fun arrayContainsKey!0 (array!17435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335501 (= res!185144 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14936 lt!159850)))))

(declare-fun res!185142 () Bool)

(assert (=> start!33734 (=> (not res!185142) (not e!205940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33734 (= res!185142 (validMask!0 mask!2385))))

(assert (=> start!33734 e!205940))

(assert (=> start!33734 true))

(assert (=> start!33734 tp_is_empty!6921))

(assert (=> start!33734 tp!24410))

(declare-fun array_inv!6128 (array!17437) Bool)

(assert (=> start!33734 (and (array_inv!6128 _values!1525) e!205938)))

(declare-fun array_inv!6129 (array!17435) Bool)

(assert (=> start!33734 (array_inv!6129 _keys!1895)))

(declare-fun b!335502 () Bool)

(assert (=> b!335502 (= e!205939 tp_is_empty!6921)))

(declare-fun b!335503 () Bool)

(assert (=> b!335503 (= e!205944 (not true))))

(assert (=> b!335503 (contains!2062 lt!159851 (select (arr!8248 _keys!1895) (index!14936 lt!159850)))))

(declare-datatypes ((Unit!10443 0))(
  ( (Unit!10444) )
))
(declare-fun lt!159852 () Unit!10443)

(declare-fun lemmaValidKeyInArrayIsInListMap!168 (array!17435 array!17437 (_ BitVec 32) (_ BitVec 32) V!10205 V!10205 (_ BitVec 32) Int) Unit!10443)

(assert (=> b!335503 (= lt!159852 (lemmaValidKeyInArrayIsInListMap!168 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14936 lt!159850) defaultEntry!1528))))

(assert (=> b!335503 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159853 () Unit!10443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17435 (_ BitVec 64) (_ BitVec 32)) Unit!10443)

(assert (=> b!335503 (= lt!159853 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14936 lt!159850)))))

(assert (= (and start!33734 res!185142) b!335499))

(assert (= (and b!335499 res!185145) b!335497))

(assert (= (and b!335497 res!185146) b!335494))

(assert (= (and b!335494 res!185147) b!335498))

(assert (= (and b!335498 res!185140) b!335500))

(assert (= (and b!335500 res!185141) b!335493))

(assert (= (and b!335493 res!185143) b!335501))

(assert (= (and b!335501 res!185144) b!335503))

(assert (= (and b!335496 condMapEmpty!11778) mapIsEmpty!11778))

(assert (= (and b!335496 (not condMapEmpty!11778)) mapNonEmpty!11778))

(assert (= (and mapNonEmpty!11778 ((_ is ValueCellFull!3117) mapValue!11778)) b!335495))

(assert (= (and b!335496 ((_ is ValueCellFull!3117) mapDefault!11778)) b!335502))

(assert (= start!33734 b!335496))

(declare-fun m!339485 () Bool)

(assert (=> b!335497 m!339485))

(declare-fun m!339487 () Bool)

(assert (=> b!335500 m!339487))

(declare-fun m!339489 () Bool)

(assert (=> b!335500 m!339489))

(declare-fun m!339491 () Bool)

(assert (=> b!335498 m!339491))

(declare-fun m!339493 () Bool)

(assert (=> b!335503 m!339493))

(declare-fun m!339495 () Bool)

(assert (=> b!335503 m!339495))

(declare-fun m!339497 () Bool)

(assert (=> b!335503 m!339497))

(declare-fun m!339499 () Bool)

(assert (=> b!335503 m!339499))

(declare-fun m!339501 () Bool)

(assert (=> b!335503 m!339501))

(assert (=> b!335503 m!339499))

(declare-fun m!339503 () Bool)

(assert (=> mapNonEmpty!11778 m!339503))

(declare-fun m!339505 () Bool)

(assert (=> b!335501 m!339505))

(assert (=> b!335493 m!339499))

(declare-fun m!339507 () Bool)

(assert (=> b!335493 m!339507))

(declare-fun m!339509 () Bool)

(assert (=> start!33734 m!339509))

(declare-fun m!339511 () Bool)

(assert (=> start!33734 m!339511))

(declare-fun m!339513 () Bool)

(assert (=> start!33734 m!339513))

(declare-fun m!339515 () Bool)

(assert (=> b!335494 m!339515))

(check-sat (not b!335494) (not b!335493) (not mapNonEmpty!11778) (not b!335497) tp_is_empty!6921 (not b!335498) (not b!335501) b_and!14149 (not b!335500) (not start!33734) (not b!335503) (not b_next!6969))
(check-sat b_and!14149 (not b_next!6969))
