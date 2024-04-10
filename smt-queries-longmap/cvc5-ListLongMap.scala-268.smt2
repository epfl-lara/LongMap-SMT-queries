; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4406 () Bool)

(assert start!4406)

(declare-fun b_free!1195 () Bool)

(declare-fun b_next!1195 () Bool)

(assert (=> start!4406 (= b_free!1195 (not b_next!1195))))

(declare-fun tp!5020 () Bool)

(declare-fun b_and!2015 () Bool)

(assert (=> start!4406 (= tp!5020 b_and!2015)))

(declare-fun b!33992 () Bool)

(declare-fun res!20624 () Bool)

(declare-fun e!21584 () Bool)

(assert (=> b!33992 (=> (not res!20624) (not e!21584))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33992 (= res!20624 (validKeyInArray!0 k!1304))))

(declare-fun b!33993 () Bool)

(declare-fun e!21582 () Bool)

(assert (=> b!33993 (= e!21582 (not false))))

(declare-fun lt!12549 () (_ BitVec 32))

(declare-datatypes ((array!2313 0))(
  ( (array!2314 (arr!1105 (Array (_ BitVec 32) (_ BitVec 64))) (size!1206 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2313)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2313 (_ BitVec 32)) Bool)

(assert (=> b!33993 (arrayForallSeekEntryOrOpenFound!0 lt!12549 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!764 0))(
  ( (Unit!765) )
))
(declare-fun lt!12550 () Unit!764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!764)

(assert (=> b!33993 (= lt!12550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12549))))

(declare-datatypes ((SeekEntryResult!135 0))(
  ( (MissingZero!135 (index!2662 (_ BitVec 32))) (Found!135 (index!2663 (_ BitVec 32))) (Intermediate!135 (undefined!947 Bool) (index!2664 (_ BitVec 32)) (x!6871 (_ BitVec 32))) (Undefined!135) (MissingVacant!135 (index!2665 (_ BitVec 32))) )
))
(declare-fun lt!12552 () SeekEntryResult!135)

(assert (=> b!33993 (and (is-Found!135 lt!12552) (= (index!2663 lt!12552) lt!12549))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2313 (_ BitVec 32)) SeekEntryResult!135)

(assert (=> b!33993 (= lt!12552 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!12553 () Unit!764)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2313 (_ BitVec 32)) Unit!764)

(assert (=> b!33993 (= lt!12553 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12549 _keys!1833 mask!2294))))

(declare-datatypes ((V!1891 0))(
  ( (V!1892 (val!801 Int)) )
))
(declare-datatypes ((tuple2!1302 0))(
  ( (tuple2!1303 (_1!662 (_ BitVec 64)) (_2!662 V!1891)) )
))
(declare-datatypes ((List!892 0))(
  ( (Nil!889) (Cons!888 (h!1455 tuple2!1302) (t!3595 List!892)) )
))
(declare-datatypes ((ListLongMap!879 0))(
  ( (ListLongMap!880 (toList!455 List!892)) )
))
(declare-fun lt!12554 () ListLongMap!879)

(declare-fun contains!400 (ListLongMap!879 (_ BitVec 64)) Bool)

(assert (=> b!33993 (contains!400 lt!12554 (select (arr!1105 _keys!1833) lt!12549))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!12551 () Unit!764)

(declare-datatypes ((ValueCell!575 0))(
  ( (ValueCellFull!575 (v!1895 V!1891)) (EmptyCell!575) )
))
(declare-datatypes ((array!2315 0))(
  ( (array!2316 (arr!1106 (Array (_ BitVec 32) ValueCell!575)) (size!1207 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2315)

(declare-fun zeroValue!1443 () V!1891)

(declare-fun minValue!1443 () V!1891)

(declare-fun lemmaValidKeyInArrayIsInListMap!67 (array!2313 array!2315 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) Unit!764)

(assert (=> b!33993 (= lt!12551 (lemmaValidKeyInArrayIsInListMap!67 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12549 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2313 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33993 (= lt!12549 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33994 () Bool)

(assert (=> b!33994 (= e!21584 e!21582)))

(declare-fun res!20623 () Bool)

(assert (=> b!33994 (=> (not res!20623) (not e!21582))))

(assert (=> b!33994 (= res!20623 (not (contains!400 lt!12554 k!1304)))))

(declare-fun getCurrentListMap!280 (array!2313 array!2315 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) ListLongMap!879)

(assert (=> b!33994 (= lt!12554 (getCurrentListMap!280 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33995 () Bool)

(declare-fun e!21586 () Bool)

(declare-fun e!21583 () Bool)

(declare-fun mapRes!1867 () Bool)

(assert (=> b!33995 (= e!21586 (and e!21583 mapRes!1867))))

(declare-fun condMapEmpty!1867 () Bool)

(declare-fun mapDefault!1867 () ValueCell!575)

