; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33640 () Bool)

(assert start!33640)

(declare-fun b_free!6875 () Bool)

(declare-fun b_next!6875 () Bool)

(assert (=> start!33640 (= b_free!6875 (not b_next!6875))))

(declare-fun tp!24128 () Bool)

(declare-fun b_and!14055 () Bool)

(assert (=> start!33640 (= tp!24128 b_and!14055)))

(declare-fun b!333942 () Bool)

(declare-fun res!184014 () Bool)

(declare-fun e!205026 () Bool)

(assert (=> b!333942 (=> (not res!184014) (not e!205026))))

(declare-datatypes ((array!17247 0))(
  ( (array!17248 (arr!8154 (Array (_ BitVec 32) (_ BitVec 64))) (size!8506 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17247)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17247 (_ BitVec 32)) Bool)

(assert (=> b!333942 (= res!184014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11637 () Bool)

(declare-fun mapRes!11637 () Bool)

(assert (=> mapIsEmpty!11637 mapRes!11637))

(declare-fun b!333944 () Bool)

(declare-fun res!184015 () Bool)

(declare-fun e!205024 () Bool)

(assert (=> b!333944 (=> (not res!184015) (not e!205024))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3149 0))(
  ( (MissingZero!3149 (index!14775 (_ BitVec 32))) (Found!3149 (index!14776 (_ BitVec 32))) (Intermediate!3149 (undefined!3961 Bool) (index!14777 (_ BitVec 32)) (x!33267 (_ BitVec 32))) (Undefined!3149) (MissingVacant!3149 (index!14778 (_ BitVec 32))) )
))
(declare-fun lt!159433 () SeekEntryResult!3149)

(declare-fun arrayContainsKey!0 (array!17247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333944 (= res!184015 (arrayContainsKey!0 _keys!1895 k!1348 (index!14776 lt!159433)))))

(declare-fun mapNonEmpty!11637 () Bool)

(declare-fun tp!24129 () Bool)

(declare-fun e!205025 () Bool)

(assert (=> mapNonEmpty!11637 (= mapRes!11637 (and tp!24129 e!205025))))

(declare-fun mapKey!11637 () (_ BitVec 32))

(declare-datatypes ((V!10079 0))(
  ( (V!10080 (val!3458 Int)) )
))
(declare-datatypes ((ValueCell!3070 0))(
  ( (ValueCellFull!3070 (v!5620 V!10079)) (EmptyCell!3070) )
))
(declare-datatypes ((array!17249 0))(
  ( (array!17250 (arr!8155 (Array (_ BitVec 32) ValueCell!3070)) (size!8507 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17249)

(declare-fun mapRest!11637 () (Array (_ BitVec 32) ValueCell!3070))

(declare-fun mapValue!11637 () ValueCell!3070)

(assert (=> mapNonEmpty!11637 (= (arr!8155 _values!1525) (store mapRest!11637 mapKey!11637 mapValue!11637))))

(declare-fun b!333945 () Bool)

(declare-fun res!184018 () Bool)

(assert (=> b!333945 (=> (not res!184018) (not e!205026))))

(declare-fun zeroValue!1467 () V!10079)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10079)

(declare-datatypes ((tuple2!5024 0))(
  ( (tuple2!5025 (_1!2523 (_ BitVec 64)) (_2!2523 V!10079)) )
))
(declare-datatypes ((List!4644 0))(
  ( (Nil!4641) (Cons!4640 (h!5496 tuple2!5024) (t!9732 List!4644)) )
))
(declare-datatypes ((ListLongMap!3937 0))(
  ( (ListLongMap!3938 (toList!1984 List!4644)) )
))
(declare-fun contains!2028 (ListLongMap!3937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1512 (array!17247 array!17249 (_ BitVec 32) (_ BitVec 32) V!10079 V!10079 (_ BitVec 32) Int) ListLongMap!3937)

(assert (=> b!333945 (= res!184018 (not (contains!2028 (getCurrentListMap!1512 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!333946 () Bool)

(declare-fun res!184019 () Bool)

(assert (=> b!333946 (=> (not res!184019) (not e!205026))))

(assert (=> b!333946 (= res!184019 (and (= (size!8507 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8506 _keys!1895) (size!8507 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!184017 () Bool)

(assert (=> start!33640 (=> (not res!184017) (not e!205026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33640 (= res!184017 (validMask!0 mask!2385))))

(assert (=> start!33640 e!205026))

(assert (=> start!33640 true))

(declare-fun tp_is_empty!6827 () Bool)

(assert (=> start!33640 tp_is_empty!6827))

(assert (=> start!33640 tp!24128))

(declare-fun e!205029 () Bool)

(declare-fun array_inv!6064 (array!17249) Bool)

(assert (=> start!33640 (and (array_inv!6064 _values!1525) e!205029)))

(declare-fun array_inv!6065 (array!17247) Bool)

(assert (=> start!33640 (array_inv!6065 _keys!1895)))

(declare-fun b!333943 () Bool)

(declare-fun e!205028 () Bool)

(assert (=> b!333943 (= e!205028 tp_is_empty!6827)))

(declare-fun b!333947 () Bool)

(assert (=> b!333947 (= e!205024 (not true))))

(assert (=> b!333947 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10379 0))(
  ( (Unit!10380) )
))
(declare-fun lt!159432 () Unit!10379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17247 (_ BitVec 64) (_ BitVec 32)) Unit!10379)

(assert (=> b!333947 (= lt!159432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14776 lt!159433)))))

(declare-fun b!333948 () Bool)

(declare-fun res!184013 () Bool)

(assert (=> b!333948 (=> (not res!184013) (not e!205026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333948 (= res!184013 (validKeyInArray!0 k!1348))))

(declare-fun b!333949 () Bool)

(assert (=> b!333949 (= e!205026 e!205024)))

(declare-fun res!184016 () Bool)

(assert (=> b!333949 (=> (not res!184016) (not e!205024))))

(assert (=> b!333949 (= res!184016 (and (is-Found!3149 lt!159433) (= (select (arr!8154 _keys!1895) (index!14776 lt!159433)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17247 (_ BitVec 32)) SeekEntryResult!3149)

(assert (=> b!333949 (= lt!159433 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333950 () Bool)

(assert (=> b!333950 (= e!205029 (and e!205028 mapRes!11637))))

(declare-fun condMapEmpty!11637 () Bool)

(declare-fun mapDefault!11637 () ValueCell!3070)

