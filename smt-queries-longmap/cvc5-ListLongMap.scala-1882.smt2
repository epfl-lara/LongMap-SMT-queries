; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33726 () Bool)

(assert start!33726)

(declare-fun b_free!6961 () Bool)

(declare-fun b_next!6961 () Bool)

(assert (=> start!33726 (= b_free!6961 (not b_next!6961))))

(declare-fun tp!24387 () Bool)

(declare-fun b_and!14141 () Bool)

(assert (=> start!33726 (= tp!24387 b_and!14141)))

(declare-fun mapIsEmpty!11766 () Bool)

(declare-fun mapRes!11766 () Bool)

(assert (=> mapIsEmpty!11766 mapRes!11766))

(declare-fun b!335361 () Bool)

(declare-fun e!205858 () Bool)

(declare-fun tp_is_empty!6913 () Bool)

(assert (=> b!335361 (= e!205858 tp_is_empty!6913)))

(declare-fun b!335362 () Bool)

(declare-fun res!185045 () Bool)

(declare-fun e!205856 () Bool)

(assert (=> b!335362 (=> (not res!185045) (not e!205856))))

(declare-datatypes ((array!17419 0))(
  ( (array!17420 (arr!8240 (Array (_ BitVec 32) (_ BitVec 64))) (size!8592 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17419)

(declare-datatypes ((List!4704 0))(
  ( (Nil!4701) (Cons!4700 (h!5556 (_ BitVec 64)) (t!9792 List!4704)) )
))
(declare-fun arrayNoDuplicates!0 (array!17419 (_ BitVec 32) List!4704) Bool)

(assert (=> b!335362 (= res!185045 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4701))))

(declare-fun b!335363 () Bool)

(declare-fun res!185049 () Bool)

(assert (=> b!335363 (=> (not res!185049) (not e!205856))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335363 (= res!185049 (validKeyInArray!0 k!1348))))

(declare-fun b!335364 () Bool)

(declare-fun e!205859 () Bool)

(assert (=> b!335364 (= e!205859 (not true))))

(declare-datatypes ((V!10195 0))(
  ( (V!10196 (val!3501 Int)) )
))
(declare-datatypes ((tuple2!5084 0))(
  ( (tuple2!5085 (_1!2553 (_ BitVec 64)) (_2!2553 V!10195)) )
))
(declare-datatypes ((List!4705 0))(
  ( (Nil!4702) (Cons!4701 (h!5557 tuple2!5084) (t!9793 List!4705)) )
))
(declare-datatypes ((ListLongMap!3997 0))(
  ( (ListLongMap!3998 (toList!2014 List!4705)) )
))
(declare-fun lt!159804 () ListLongMap!3997)

(declare-datatypes ((SeekEntryResult!3186 0))(
  ( (MissingZero!3186 (index!14923 (_ BitVec 32))) (Found!3186 (index!14924 (_ BitVec 32))) (Intermediate!3186 (undefined!3998 Bool) (index!14925 (_ BitVec 32)) (x!33424 (_ BitVec 32))) (Undefined!3186) (MissingVacant!3186 (index!14926 (_ BitVec 32))) )
))
(declare-fun lt!159802 () SeekEntryResult!3186)

(declare-fun contains!2058 (ListLongMap!3997 (_ BitVec 64)) Bool)

(assert (=> b!335364 (contains!2058 lt!159804 (select (arr!8240 _keys!1895) (index!14924 lt!159802)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((Unit!10437 0))(
  ( (Unit!10438) )
))
(declare-fun lt!159805 () Unit!10437)

(declare-fun zeroValue!1467 () V!10195)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3113 0))(
  ( (ValueCellFull!3113 (v!5663 V!10195)) (EmptyCell!3113) )
))
(declare-datatypes ((array!17421 0))(
  ( (array!17422 (arr!8241 (Array (_ BitVec 32) ValueCell!3113)) (size!8593 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17421)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10195)

(declare-fun lemmaValidKeyInArrayIsInListMap!165 (array!17419 array!17421 (_ BitVec 32) (_ BitVec 32) V!10195 V!10195 (_ BitVec 32) Int) Unit!10437)

(assert (=> b!335364 (= lt!159805 (lemmaValidKeyInArrayIsInListMap!165 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14924 lt!159802) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335364 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159803 () Unit!10437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17419 (_ BitVec 64) (_ BitVec 32)) Unit!10437)

(assert (=> b!335364 (= lt!159803 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14924 lt!159802)))))

(declare-fun res!185046 () Bool)

(assert (=> start!33726 (=> (not res!185046) (not e!205856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33726 (= res!185046 (validMask!0 mask!2385))))

(assert (=> start!33726 e!205856))

(assert (=> start!33726 true))

(assert (=> start!33726 tp_is_empty!6913))

(assert (=> start!33726 tp!24387))

(declare-fun e!205854 () Bool)

(declare-fun array_inv!6122 (array!17421) Bool)

(assert (=> start!33726 (and (array_inv!6122 _values!1525) e!205854)))

(declare-fun array_inv!6123 (array!17419) Bool)

(assert (=> start!33726 (array_inv!6123 _keys!1895)))

(declare-fun b!335365 () Bool)

(declare-fun res!185048 () Bool)

(assert (=> b!335365 (=> (not res!185048) (not e!205859))))

(assert (=> b!335365 (= res!185048 (arrayContainsKey!0 _keys!1895 k!1348 (index!14924 lt!159802)))))

(declare-fun b!335366 () Bool)

(declare-fun e!205855 () Bool)

(assert (=> b!335366 (= e!205855 tp_is_empty!6913)))

(declare-fun b!335367 () Bool)

(declare-fun res!185044 () Bool)

(assert (=> b!335367 (=> (not res!185044) (not e!205856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17419 (_ BitVec 32)) Bool)

(assert (=> b!335367 (= res!185044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335368 () Bool)

(declare-fun e!205857 () Bool)

(assert (=> b!335368 (= e!205856 e!205857)))

(declare-fun res!185047 () Bool)

(assert (=> b!335368 (=> (not res!185047) (not e!205857))))

(assert (=> b!335368 (= res!185047 (not (contains!2058 lt!159804 k!1348)))))

(declare-fun getCurrentListMap!1538 (array!17419 array!17421 (_ BitVec 32) (_ BitVec 32) V!10195 V!10195 (_ BitVec 32) Int) ListLongMap!3997)

(assert (=> b!335368 (= lt!159804 (getCurrentListMap!1538 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335369 () Bool)

(declare-fun res!185050 () Bool)

(assert (=> b!335369 (=> (not res!185050) (not e!205856))))

(assert (=> b!335369 (= res!185050 (and (= (size!8593 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8592 _keys!1895) (size!8593 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335370 () Bool)

(assert (=> b!335370 (= e!205854 (and e!205858 mapRes!11766))))

(declare-fun condMapEmpty!11766 () Bool)

(declare-fun mapDefault!11766 () ValueCell!3113)

