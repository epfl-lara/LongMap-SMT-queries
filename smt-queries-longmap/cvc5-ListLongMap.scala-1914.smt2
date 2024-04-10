; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34074 () Bool)

(assert start!34074)

(declare-fun b_free!7153 () Bool)

(declare-fun b_next!7153 () Bool)

(assert (=> start!34074 (= b_free!7153 (not b_next!7153))))

(declare-fun tp!24983 () Bool)

(declare-fun b_and!14347 () Bool)

(assert (=> start!34074 (= tp!24983 b_and!14347)))

(declare-fun b!339546 () Bool)

(declare-fun e!208321 () Bool)

(declare-fun tp_is_empty!7105 () Bool)

(assert (=> b!339546 (= e!208321 tp_is_empty!7105)))

(declare-fun mapNonEmpty!12075 () Bool)

(declare-fun mapRes!12075 () Bool)

(declare-fun tp!24984 () Bool)

(declare-fun e!208317 () Bool)

(assert (=> mapNonEmpty!12075 (= mapRes!12075 (and tp!24984 e!208317))))

(declare-datatypes ((V!10451 0))(
  ( (V!10452 (val!3597 Int)) )
))
(declare-datatypes ((ValueCell!3209 0))(
  ( (ValueCellFull!3209 (v!5766 V!10451)) (EmptyCell!3209) )
))
(declare-fun mapRest!12075 () (Array (_ BitVec 32) ValueCell!3209))

(declare-fun mapValue!12075 () ValueCell!3209)

(declare-datatypes ((array!17809 0))(
  ( (array!17810 (arr!8428 (Array (_ BitVec 32) ValueCell!3209)) (size!8780 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17809)

(declare-fun mapKey!12075 () (_ BitVec 32))

(assert (=> mapNonEmpty!12075 (= (arr!8428 _values!1525) (store mapRest!12075 mapKey!12075 mapValue!12075))))

(declare-fun b!339547 () Bool)

(declare-fun res!187551 () Bool)

(declare-fun e!208319 () Bool)

(assert (=> b!339547 (=> (not res!187551) (not e!208319))))

(declare-datatypes ((array!17811 0))(
  ( (array!17812 (arr!8429 (Array (_ BitVec 32) (_ BitVec 64))) (size!8781 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17811)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17811 (_ BitVec 32)) Bool)

(assert (=> b!339547 (= res!187551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12075 () Bool)

(assert (=> mapIsEmpty!12075 mapRes!12075))

(declare-fun b!339549 () Bool)

(declare-datatypes ((Unit!10582 0))(
  ( (Unit!10583) )
))
(declare-fun e!208318 () Unit!10582)

(declare-fun Unit!10584 () Unit!10582)

(assert (=> b!339549 (= e!208318 Unit!10584)))

(declare-fun b!339550 () Bool)

(assert (=> b!339550 (= e!208317 tp_is_empty!7105)))

(declare-fun b!339551 () Bool)

(declare-fun Unit!10585 () Unit!10582)

(assert (=> b!339551 (= e!208318 Unit!10585)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10451)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10451)

(declare-fun lt!161235 () Unit!10582)

(declare-fun lemmaArrayContainsKeyThenInListMap!287 (array!17811 array!17809 (_ BitVec 32) (_ BitVec 32) V!10451 V!10451 (_ BitVec 64) (_ BitVec 32) Int) Unit!10582)

(declare-fun arrayScanForKey!0 (array!17811 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339551 (= lt!161235 (lemmaArrayContainsKeyThenInListMap!287 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339551 false))

(declare-fun b!339552 () Bool)

(declare-fun e!208320 () Bool)

(assert (=> b!339552 (= e!208319 e!208320)))

(declare-fun res!187547 () Bool)

(assert (=> b!339552 (=> (not res!187547) (not e!208320))))

(declare-datatypes ((SeekEntryResult!3256 0))(
  ( (MissingZero!3256 (index!15203 (_ BitVec 32))) (Found!3256 (index!15204 (_ BitVec 32))) (Intermediate!3256 (undefined!4068 Bool) (index!15205 (_ BitVec 32)) (x!33820 (_ BitVec 32))) (Undefined!3256) (MissingVacant!3256 (index!15206 (_ BitVec 32))) )
))
(declare-fun lt!161234 () SeekEntryResult!3256)

(assert (=> b!339552 (= res!187547 (and (not (is-Found!3256 lt!161234)) (is-MissingZero!3256 lt!161234)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17811 (_ BitVec 32)) SeekEntryResult!3256)

(assert (=> b!339552 (= lt!161234 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339553 () Bool)

(assert (=> b!339553 (= e!208320 false)))

(declare-fun lt!161236 () Unit!10582)

(assert (=> b!339553 (= lt!161236 e!208318)))

(declare-fun c!52569 () Bool)

(declare-fun arrayContainsKey!0 (array!17811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339553 (= c!52569 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!339554 () Bool)

(declare-fun res!187553 () Bool)

(assert (=> b!339554 (=> (not res!187553) (not e!208319))))

(declare-datatypes ((List!4842 0))(
  ( (Nil!4839) (Cons!4838 (h!5694 (_ BitVec 64)) (t!9944 List!4842)) )
))
(declare-fun arrayNoDuplicates!0 (array!17811 (_ BitVec 32) List!4842) Bool)

(assert (=> b!339554 (= res!187553 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4839))))

(declare-fun b!339555 () Bool)

(declare-fun res!187549 () Bool)

(assert (=> b!339555 (=> (not res!187549) (not e!208319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339555 (= res!187549 (validKeyInArray!0 k!1348))))

(declare-fun b!339548 () Bool)

(declare-fun res!187552 () Bool)

(assert (=> b!339548 (=> (not res!187552) (not e!208319))))

(declare-datatypes ((tuple2!5224 0))(
  ( (tuple2!5225 (_1!2623 (_ BitVec 64)) (_2!2623 V!10451)) )
))
(declare-datatypes ((List!4843 0))(
  ( (Nil!4840) (Cons!4839 (h!5695 tuple2!5224) (t!9945 List!4843)) )
))
(declare-datatypes ((ListLongMap!4137 0))(
  ( (ListLongMap!4138 (toList!2084 List!4843)) )
))
(declare-fun contains!2135 (ListLongMap!4137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1605 (array!17811 array!17809 (_ BitVec 32) (_ BitVec 32) V!10451 V!10451 (_ BitVec 32) Int) ListLongMap!4137)

(assert (=> b!339548 (= res!187552 (not (contains!2135 (getCurrentListMap!1605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!187550 () Bool)

(assert (=> start!34074 (=> (not res!187550) (not e!208319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34074 (= res!187550 (validMask!0 mask!2385))))

(assert (=> start!34074 e!208319))

(assert (=> start!34074 true))

(assert (=> start!34074 tp_is_empty!7105))

(assert (=> start!34074 tp!24983))

(declare-fun e!208323 () Bool)

(declare-fun array_inv!6248 (array!17809) Bool)

(assert (=> start!34074 (and (array_inv!6248 _values!1525) e!208323)))

(declare-fun array_inv!6249 (array!17811) Bool)

(assert (=> start!34074 (array_inv!6249 _keys!1895)))

(declare-fun b!339556 () Bool)

(declare-fun res!187548 () Bool)

(assert (=> b!339556 (=> (not res!187548) (not e!208319))))

(assert (=> b!339556 (= res!187548 (and (= (size!8780 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8781 _keys!1895) (size!8780 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339557 () Bool)

(assert (=> b!339557 (= e!208323 (and e!208321 mapRes!12075))))

(declare-fun condMapEmpty!12075 () Bool)

(declare-fun mapDefault!12075 () ValueCell!3209)

