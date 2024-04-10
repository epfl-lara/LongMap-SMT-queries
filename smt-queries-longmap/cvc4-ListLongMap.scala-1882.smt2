; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33730 () Bool)

(assert start!33730)

(declare-fun b_free!6965 () Bool)

(declare-fun b_next!6965 () Bool)

(assert (=> start!33730 (= b_free!6965 (not b_next!6965))))

(declare-fun tp!24398 () Bool)

(declare-fun b_and!14145 () Bool)

(assert (=> start!33730 (= tp!24398 b_and!14145)))

(declare-fun res!185098 () Bool)

(declare-fun e!205900 () Bool)

(assert (=> start!33730 (=> (not res!185098) (not e!205900))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33730 (= res!185098 (validMask!0 mask!2385))))

(assert (=> start!33730 e!205900))

(assert (=> start!33730 true))

(declare-fun tp_is_empty!6917 () Bool)

(assert (=> start!33730 tp_is_empty!6917))

(assert (=> start!33730 tp!24398))

(declare-datatypes ((V!10199 0))(
  ( (V!10200 (val!3503 Int)) )
))
(declare-datatypes ((ValueCell!3115 0))(
  ( (ValueCellFull!3115 (v!5665 V!10199)) (EmptyCell!3115) )
))
(declare-datatypes ((array!17427 0))(
  ( (array!17428 (arr!8244 (Array (_ BitVec 32) ValueCell!3115)) (size!8596 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17427)

(declare-fun e!205896 () Bool)

(declare-fun array_inv!6126 (array!17427) Bool)

(assert (=> start!33730 (and (array_inv!6126 _values!1525) e!205896)))

(declare-datatypes ((array!17429 0))(
  ( (array!17430 (arr!8245 (Array (_ BitVec 32) (_ BitVec 64))) (size!8597 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17429)

(declare-fun array_inv!6127 (array!17429) Bool)

(assert (=> start!33730 (array_inv!6127 _keys!1895)))

(declare-fun b!335427 () Bool)

(declare-fun res!185097 () Bool)

(declare-fun e!205901 () Bool)

(assert (=> b!335427 (=> (not res!185097) (not e!205901))))

(declare-datatypes ((SeekEntryResult!3188 0))(
  ( (MissingZero!3188 (index!14931 (_ BitVec 32))) (Found!3188 (index!14932 (_ BitVec 32))) (Intermediate!3188 (undefined!4000 Bool) (index!14933 (_ BitVec 32)) (x!33426 (_ BitVec 32))) (Undefined!3188) (MissingVacant!3188 (index!14934 (_ BitVec 32))) )
))
(declare-fun lt!159826 () SeekEntryResult!3188)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335427 (= res!185097 (arrayContainsKey!0 _keys!1895 k!1348 (index!14932 lt!159826)))))

(declare-fun b!335428 () Bool)

(declare-fun res!185092 () Bool)

(assert (=> b!335428 (=> (not res!185092) (not e!205900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335428 (= res!185092 (validKeyInArray!0 k!1348))))

(declare-fun b!335429 () Bool)

(declare-fun e!205902 () Bool)

(assert (=> b!335429 (= e!205902 e!205901)))

(declare-fun res!185094 () Bool)

(assert (=> b!335429 (=> (not res!185094) (not e!205901))))

(assert (=> b!335429 (= res!185094 (and (is-Found!3188 lt!159826) (= (select (arr!8245 _keys!1895) (index!14932 lt!159826)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17429 (_ BitVec 32)) SeekEntryResult!3188)

(assert (=> b!335429 (= lt!159826 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335430 () Bool)

(declare-fun res!185099 () Bool)

(assert (=> b!335430 (=> (not res!185099) (not e!205900))))

(declare-datatypes ((List!4708 0))(
  ( (Nil!4705) (Cons!4704 (h!5560 (_ BitVec 64)) (t!9796 List!4708)) )
))
(declare-fun arrayNoDuplicates!0 (array!17429 (_ BitVec 32) List!4708) Bool)

(assert (=> b!335430 (= res!185099 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4705))))

(declare-fun b!335431 () Bool)

(declare-fun res!185093 () Bool)

(assert (=> b!335431 (=> (not res!185093) (not e!205900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17429 (_ BitVec 32)) Bool)

(assert (=> b!335431 (= res!185093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335432 () Bool)

(assert (=> b!335432 (= e!205901 (not true))))

(declare-datatypes ((tuple2!5088 0))(
  ( (tuple2!5089 (_1!2555 (_ BitVec 64)) (_2!2555 V!10199)) )
))
(declare-datatypes ((List!4709 0))(
  ( (Nil!4706) (Cons!4705 (h!5561 tuple2!5088) (t!9797 List!4709)) )
))
(declare-datatypes ((ListLongMap!4001 0))(
  ( (ListLongMap!4002 (toList!2016 List!4709)) )
))
(declare-fun lt!159829 () ListLongMap!4001)

(declare-fun contains!2060 (ListLongMap!4001 (_ BitVec 64)) Bool)

(assert (=> b!335432 (contains!2060 lt!159829 (select (arr!8245 _keys!1895) (index!14932 lt!159826)))))

(declare-fun zeroValue!1467 () V!10199)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((Unit!10441 0))(
  ( (Unit!10442) )
))
(declare-fun lt!159828 () Unit!10441)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10199)

(declare-fun lemmaValidKeyInArrayIsInListMap!167 (array!17429 array!17427 (_ BitVec 32) (_ BitVec 32) V!10199 V!10199 (_ BitVec 32) Int) Unit!10441)

(assert (=> b!335432 (= lt!159828 (lemmaValidKeyInArrayIsInListMap!167 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14932 lt!159826) defaultEntry!1528))))

(assert (=> b!335432 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159827 () Unit!10441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17429 (_ BitVec 64) (_ BitVec 32)) Unit!10441)

(assert (=> b!335432 (= lt!159827 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14932 lt!159826)))))

(declare-fun b!335433 () Bool)

(assert (=> b!335433 (= e!205900 e!205902)))

(declare-fun res!185095 () Bool)

(assert (=> b!335433 (=> (not res!185095) (not e!205902))))

(assert (=> b!335433 (= res!185095 (not (contains!2060 lt!159829 k!1348)))))

(declare-fun getCurrentListMap!1540 (array!17429 array!17427 (_ BitVec 32) (_ BitVec 32) V!10199 V!10199 (_ BitVec 32) Int) ListLongMap!4001)

(assert (=> b!335433 (= lt!159829 (getCurrentListMap!1540 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun mapNonEmpty!11772 () Bool)

(declare-fun mapRes!11772 () Bool)

(declare-fun tp!24399 () Bool)

(declare-fun e!205899 () Bool)

(assert (=> mapNonEmpty!11772 (= mapRes!11772 (and tp!24399 e!205899))))

(declare-fun mapKey!11772 () (_ BitVec 32))

(declare-fun mapValue!11772 () ValueCell!3115)

(declare-fun mapRest!11772 () (Array (_ BitVec 32) ValueCell!3115))

(assert (=> mapNonEmpty!11772 (= (arr!8244 _values!1525) (store mapRest!11772 mapKey!11772 mapValue!11772))))

(declare-fun b!335434 () Bool)

(declare-fun e!205897 () Bool)

(assert (=> b!335434 (= e!205897 tp_is_empty!6917)))

(declare-fun b!335435 () Bool)

(assert (=> b!335435 (= e!205896 (and e!205897 mapRes!11772))))

(declare-fun condMapEmpty!11772 () Bool)

(declare-fun mapDefault!11772 () ValueCell!3115)

