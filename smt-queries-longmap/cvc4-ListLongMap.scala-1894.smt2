; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33858 () Bool)

(assert start!33858)

(declare-fun b_free!7037 () Bool)

(declare-fun b_next!7037 () Bool)

(assert (=> start!33858 (= b_free!7037 (not b_next!7037))))

(declare-fun tp!24624 () Bool)

(declare-fun b_and!14223 () Bool)

(assert (=> start!33858 (= tp!24624 b_and!14223)))

(declare-fun b!336930 () Bool)

(declare-fun e!206786 () Bool)

(declare-fun tp_is_empty!6989 () Bool)

(assert (=> b!336930 (= e!206786 tp_is_empty!6989)))

(declare-fun b!336931 () Bool)

(declare-fun res!186025 () Bool)

(declare-fun e!206788 () Bool)

(assert (=> b!336931 (=> (not res!186025) (not e!206788))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336931 (= res!186025 (validKeyInArray!0 k!1348))))

(declare-fun b!336932 () Bool)

(declare-fun e!206787 () Bool)

(assert (=> b!336932 (= e!206787 false)))

(declare-fun lt!160341 () (_ BitVec 32))

(declare-datatypes ((array!17573 0))(
  ( (array!17574 (arr!8314 (Array (_ BitVec 32) (_ BitVec 64))) (size!8666 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17573)

(declare-fun arrayScanForKey!0 (array!17573 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336932 (= lt!160341 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336933 () Bool)

(declare-fun res!186032 () Bool)

(assert (=> b!336933 (=> (not res!186032) (not e!206788))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10295 0))(
  ( (V!10296 (val!3539 Int)) )
))
(declare-fun zeroValue!1467 () V!10295)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3151 0))(
  ( (ValueCellFull!3151 (v!5704 V!10295)) (EmptyCell!3151) )
))
(declare-datatypes ((array!17575 0))(
  ( (array!17576 (arr!8315 (Array (_ BitVec 32) ValueCell!3151)) (size!8667 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17575)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10295)

(declare-datatypes ((tuple2!5140 0))(
  ( (tuple2!5141 (_1!2581 (_ BitVec 64)) (_2!2581 V!10295)) )
))
(declare-datatypes ((List!4755 0))(
  ( (Nil!4752) (Cons!4751 (h!5607 tuple2!5140) (t!9849 List!4755)) )
))
(declare-datatypes ((ListLongMap!4053 0))(
  ( (ListLongMap!4054 (toList!2042 List!4755)) )
))
(declare-fun contains!2089 (ListLongMap!4053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1563 (array!17573 array!17575 (_ BitVec 32) (_ BitVec 32) V!10295 V!10295 (_ BitVec 32) Int) ListLongMap!4053)

(assert (=> b!336933 (= res!186032 (not (contains!2089 (getCurrentListMap!1563 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!336934 () Bool)

(declare-fun res!186027 () Bool)

(assert (=> b!336934 (=> (not res!186027) (not e!206788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17573 (_ BitVec 32)) Bool)

(assert (=> b!336934 (= res!186027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11889 () Bool)

(declare-fun mapRes!11889 () Bool)

(assert (=> mapIsEmpty!11889 mapRes!11889))

(declare-fun b!336935 () Bool)

(declare-fun res!186029 () Bool)

(assert (=> b!336935 (=> (not res!186029) (not e!206787))))

(declare-fun arrayContainsKey!0 (array!17573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336935 (= res!186029 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun res!186028 () Bool)

(assert (=> start!33858 (=> (not res!186028) (not e!206788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33858 (= res!186028 (validMask!0 mask!2385))))

(assert (=> start!33858 e!206788))

(assert (=> start!33858 true))

(assert (=> start!33858 tp_is_empty!6989))

(assert (=> start!33858 tp!24624))

(declare-fun e!206785 () Bool)

(declare-fun array_inv!6172 (array!17575) Bool)

(assert (=> start!33858 (and (array_inv!6172 _values!1525) e!206785)))

(declare-fun array_inv!6173 (array!17573) Bool)

(assert (=> start!33858 (array_inv!6173 _keys!1895)))

(declare-fun b!336936 () Bool)

(assert (=> b!336936 (= e!206788 e!206787)))

(declare-fun res!186031 () Bool)

(assert (=> b!336936 (=> (not res!186031) (not e!206787))))

(declare-datatypes ((SeekEntryResult!3213 0))(
  ( (MissingZero!3213 (index!15031 (_ BitVec 32))) (Found!3213 (index!15032 (_ BitVec 32))) (Intermediate!3213 (undefined!4025 Bool) (index!15033 (_ BitVec 32)) (x!33577 (_ BitVec 32))) (Undefined!3213) (MissingVacant!3213 (index!15034 (_ BitVec 32))) )
))
(declare-fun lt!160342 () SeekEntryResult!3213)

(assert (=> b!336936 (= res!186031 (and (not (is-Found!3213 lt!160342)) (is-MissingZero!3213 lt!160342)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17573 (_ BitVec 32)) SeekEntryResult!3213)

(assert (=> b!336936 (= lt!160342 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!336937 () Bool)

(declare-fun e!206789 () Bool)

(assert (=> b!336937 (= e!206789 tp_is_empty!6989)))

(declare-fun b!336938 () Bool)

(declare-fun res!186026 () Bool)

(assert (=> b!336938 (=> (not res!186026) (not e!206788))))

(declare-datatypes ((List!4756 0))(
  ( (Nil!4753) (Cons!4752 (h!5608 (_ BitVec 64)) (t!9850 List!4756)) )
))
(declare-fun arrayNoDuplicates!0 (array!17573 (_ BitVec 32) List!4756) Bool)

(assert (=> b!336938 (= res!186026 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4753))))

(declare-fun mapNonEmpty!11889 () Bool)

(declare-fun tp!24623 () Bool)

(assert (=> mapNonEmpty!11889 (= mapRes!11889 (and tp!24623 e!206789))))

(declare-fun mapRest!11889 () (Array (_ BitVec 32) ValueCell!3151))

(declare-fun mapValue!11889 () ValueCell!3151)

(declare-fun mapKey!11889 () (_ BitVec 32))

(assert (=> mapNonEmpty!11889 (= (arr!8315 _values!1525) (store mapRest!11889 mapKey!11889 mapValue!11889))))

(declare-fun b!336939 () Bool)

(assert (=> b!336939 (= e!206785 (and e!206786 mapRes!11889))))

(declare-fun condMapEmpty!11889 () Bool)

(declare-fun mapDefault!11889 () ValueCell!3151)

