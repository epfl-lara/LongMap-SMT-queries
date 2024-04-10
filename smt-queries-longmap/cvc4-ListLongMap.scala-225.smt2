; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4036 () Bool)

(assert start!4036)

(declare-fun b_free!941 () Bool)

(declare-fun b_next!941 () Bool)

(assert (=> start!4036 (= b_free!941 (not b_next!941))))

(declare-fun tp!4243 () Bool)

(declare-fun b_and!1751 () Bool)

(assert (=> start!4036 (= tp!4243 b_and!1751)))

(declare-fun res!17724 () Bool)

(declare-fun e!19070 () Bool)

(assert (=> start!4036 (=> (not res!17724) (not e!19070))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4036 (= res!17724 (validMask!0 mask!2294))))

(assert (=> start!4036 e!19070))

(assert (=> start!4036 true))

(assert (=> start!4036 tp!4243))

(declare-datatypes ((V!1551 0))(
  ( (V!1552 (val!674 Int)) )
))
(declare-datatypes ((ValueCell!448 0))(
  ( (ValueCellFull!448 (v!1763 V!1551)) (EmptyCell!448) )
))
(declare-datatypes ((array!1821 0))(
  ( (array!1822 (arr!864 (Array (_ BitVec 32) ValueCell!448)) (size!965 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1821)

(declare-fun e!19069 () Bool)

(declare-fun array_inv!599 (array!1821) Bool)

(assert (=> start!4036 (and (array_inv!599 _values!1501) e!19069)))

(declare-datatypes ((array!1823 0))(
  ( (array!1824 (arr!865 (Array (_ BitVec 32) (_ BitVec 64))) (size!966 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1823)

(declare-fun array_inv!600 (array!1823) Bool)

(assert (=> start!4036 (array_inv!600 _keys!1833)))

(declare-fun tp_is_empty!1295 () Bool)

(assert (=> start!4036 tp_is_empty!1295))

(declare-fun b!29541 () Bool)

(declare-fun res!17726 () Bool)

(declare-fun e!19068 () Bool)

(assert (=> b!29541 (=> (not res!17726) (not e!19068))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29541 (= res!17726 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29542 () Bool)

(declare-fun res!17727 () Bool)

(assert (=> b!29542 (=> (not res!17727) (not e!19070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1823 (_ BitVec 32)) Bool)

(assert (=> b!29542 (= res!17727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29543 () Bool)

(assert (=> b!29543 (= e!19068 (not true))))

(declare-fun lt!11333 () (_ BitVec 32))

(assert (=> b!29543 (arrayForallSeekEntryOrOpenFound!0 lt!11333 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!685 0))(
  ( (Unit!686) )
))
(declare-fun lt!11336 () Unit!685)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!685)

(assert (=> b!29543 (= lt!11336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11333))))

(declare-datatypes ((SeekEntryResult!89 0))(
  ( (MissingZero!89 (index!2478 (_ BitVec 32))) (Found!89 (index!2479 (_ BitVec 32))) (Intermediate!89 (undefined!901 Bool) (index!2480 (_ BitVec 32)) (x!6431 (_ BitVec 32))) (Undefined!89) (MissingVacant!89 (index!2481 (_ BitVec 32))) )
))
(declare-fun lt!11332 () SeekEntryResult!89)

(assert (=> b!29543 (and (is-Found!89 lt!11332) (= (index!2479 lt!11332) lt!11333))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1823 (_ BitVec 32)) SeekEntryResult!89)

(assert (=> b!29543 (= lt!11332 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!11335 () Unit!685)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1823 (_ BitVec 32)) Unit!685)

(assert (=> b!29543 (= lt!11335 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11333 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1116 0))(
  ( (tuple2!1117 (_1!569 (_ BitVec 64)) (_2!569 V!1551)) )
))
(declare-datatypes ((List!717 0))(
  ( (Nil!714) (Cons!713 (h!1280 tuple2!1116) (t!3410 List!717)) )
))
(declare-datatypes ((ListLongMap!693 0))(
  ( (ListLongMap!694 (toList!362 List!717)) )
))
(declare-fun lt!11331 () ListLongMap!693)

(declare-fun contains!302 (ListLongMap!693 (_ BitVec 64)) Bool)

(assert (=> b!29543 (contains!302 lt!11331 (select (arr!865 _keys!1833) lt!11333))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11334 () Unit!685)

(declare-fun zeroValue!1443 () V!1551)

(declare-fun minValue!1443 () V!1551)

(declare-fun lemmaValidKeyInArrayIsInListMap!36 (array!1823 array!1821 (_ BitVec 32) (_ BitVec 32) V!1551 V!1551 (_ BitVec 32) Int) Unit!685)

(assert (=> b!29543 (= lt!11334 (lemmaValidKeyInArrayIsInListMap!36 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11333 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1823 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29543 (= lt!11333 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29544 () Bool)

(declare-fun e!19066 () Bool)

(declare-fun mapRes!1471 () Bool)

(assert (=> b!29544 (= e!19069 (and e!19066 mapRes!1471))))

(declare-fun condMapEmpty!1471 () Bool)

(declare-fun mapDefault!1471 () ValueCell!448)

