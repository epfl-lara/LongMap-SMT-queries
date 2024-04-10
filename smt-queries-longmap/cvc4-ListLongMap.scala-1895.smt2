; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33864 () Bool)

(assert start!33864)

(declare-fun b_free!7043 () Bool)

(declare-fun b_next!7043 () Bool)

(assert (=> start!33864 (= b_free!7043 (not b_next!7043))))

(declare-fun tp!24641 () Bool)

(declare-fun b_and!14229 () Bool)

(assert (=> start!33864 (= tp!24641 b_and!14229)))

(declare-fun b!337029 () Bool)

(declare-fun res!186101 () Bool)

(declare-fun e!206839 () Bool)

(assert (=> b!337029 (=> (not res!186101) (not e!206839))))

(declare-datatypes ((array!17585 0))(
  ( (array!17586 (arr!8320 (Array (_ BitVec 32) (_ BitVec 64))) (size!8672 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17585)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337029 (= res!186101 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun res!186104 () Bool)

(declare-fun e!206840 () Bool)

(assert (=> start!33864 (=> (not res!186104) (not e!206840))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33864 (= res!186104 (validMask!0 mask!2385))))

(assert (=> start!33864 e!206840))

(assert (=> start!33864 true))

(declare-fun tp_is_empty!6995 () Bool)

(assert (=> start!33864 tp_is_empty!6995))

(assert (=> start!33864 tp!24641))

(declare-datatypes ((V!10303 0))(
  ( (V!10304 (val!3542 Int)) )
))
(declare-datatypes ((ValueCell!3154 0))(
  ( (ValueCellFull!3154 (v!5707 V!10303)) (EmptyCell!3154) )
))
(declare-datatypes ((array!17587 0))(
  ( (array!17588 (arr!8321 (Array (_ BitVec 32) ValueCell!3154)) (size!8673 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17587)

(declare-fun e!206843 () Bool)

(declare-fun array_inv!6178 (array!17587) Bool)

(assert (=> start!33864 (and (array_inv!6178 _values!1525) e!206843)))

(declare-fun array_inv!6179 (array!17585) Bool)

(assert (=> start!33864 (array_inv!6179 _keys!1895)))

(declare-fun b!337030 () Bool)

(declare-fun res!186098 () Bool)

(assert (=> b!337030 (=> (not res!186098) (not e!206840))))

(declare-datatypes ((List!4759 0))(
  ( (Nil!4756) (Cons!4755 (h!5611 (_ BitVec 64)) (t!9853 List!4759)) )
))
(declare-fun arrayNoDuplicates!0 (array!17585 (_ BitVec 32) List!4759) Bool)

(assert (=> b!337030 (= res!186098 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4756))))

(declare-fun mapIsEmpty!11898 () Bool)

(declare-fun mapRes!11898 () Bool)

(assert (=> mapIsEmpty!11898 mapRes!11898))

(declare-fun b!337031 () Bool)

(declare-fun res!186100 () Bool)

(assert (=> b!337031 (=> (not res!186100) (not e!206840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17585 (_ BitVec 32)) Bool)

(assert (=> b!337031 (= res!186100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337032 () Bool)

(assert (=> b!337032 (= e!206840 e!206839)))

(declare-fun res!186099 () Bool)

(assert (=> b!337032 (=> (not res!186099) (not e!206839))))

(declare-datatypes ((SeekEntryResult!3215 0))(
  ( (MissingZero!3215 (index!15039 (_ BitVec 32))) (Found!3215 (index!15040 (_ BitVec 32))) (Intermediate!3215 (undefined!4027 Bool) (index!15041 (_ BitVec 32)) (x!33587 (_ BitVec 32))) (Undefined!3215) (MissingVacant!3215 (index!15042 (_ BitVec 32))) )
))
(declare-fun lt!160360 () SeekEntryResult!3215)

(assert (=> b!337032 (= res!186099 (and (not (is-Found!3215 lt!160360)) (is-MissingZero!3215 lt!160360)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17585 (_ BitVec 32)) SeekEntryResult!3215)

(assert (=> b!337032 (= lt!160360 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337033 () Bool)

(declare-fun res!186102 () Bool)

(assert (=> b!337033 (=> (not res!186102) (not e!206840))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10303)

(declare-fun zeroValue!1467 () V!10303)

(declare-datatypes ((tuple2!5144 0))(
  ( (tuple2!5145 (_1!2583 (_ BitVec 64)) (_2!2583 V!10303)) )
))
(declare-datatypes ((List!4760 0))(
  ( (Nil!4757) (Cons!4756 (h!5612 tuple2!5144) (t!9854 List!4760)) )
))
(declare-datatypes ((ListLongMap!4057 0))(
  ( (ListLongMap!4058 (toList!2044 List!4760)) )
))
(declare-fun contains!2091 (ListLongMap!4057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1565 (array!17585 array!17587 (_ BitVec 32) (_ BitVec 32) V!10303 V!10303 (_ BitVec 32) Int) ListLongMap!4057)

(assert (=> b!337033 (= res!186102 (not (contains!2091 (getCurrentListMap!1565 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337034 () Bool)

(declare-fun res!186103 () Bool)

(assert (=> b!337034 (=> (not res!186103) (not e!206840))))

(assert (=> b!337034 (= res!186103 (and (= (size!8673 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8672 _keys!1895) (size!8673 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337035 () Bool)

(declare-fun e!206841 () Bool)

(assert (=> b!337035 (= e!206841 tp_is_empty!6995)))

(declare-fun mapNonEmpty!11898 () Bool)

(declare-fun tp!24642 () Bool)

(assert (=> mapNonEmpty!11898 (= mapRes!11898 (and tp!24642 e!206841))))

(declare-fun mapRest!11898 () (Array (_ BitVec 32) ValueCell!3154))

(declare-fun mapValue!11898 () ValueCell!3154)

(declare-fun mapKey!11898 () (_ BitVec 32))

(assert (=> mapNonEmpty!11898 (= (arr!8321 _values!1525) (store mapRest!11898 mapKey!11898 mapValue!11898))))

(declare-fun b!337036 () Bool)

(declare-fun res!186097 () Bool)

(assert (=> b!337036 (=> (not res!186097) (not e!206840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337036 (= res!186097 (validKeyInArray!0 k!1348))))

(declare-fun b!337037 () Bool)

(assert (=> b!337037 (= e!206839 false)))

(declare-fun lt!160359 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17585 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337037 (= lt!160359 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337038 () Bool)

(declare-fun e!206842 () Bool)

(assert (=> b!337038 (= e!206842 tp_is_empty!6995)))

(declare-fun b!337039 () Bool)

(assert (=> b!337039 (= e!206843 (and e!206842 mapRes!11898))))

(declare-fun condMapEmpty!11898 () Bool)

(declare-fun mapDefault!11898 () ValueCell!3154)

