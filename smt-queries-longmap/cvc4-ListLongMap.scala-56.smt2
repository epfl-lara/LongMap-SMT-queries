; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!852 () Bool)

(assert start!852)

(declare-fun b_free!245 () Bool)

(declare-fun b_next!245 () Bool)

(assert (=> start!852 (= b_free!245 (not b_next!245))))

(declare-fun tp!965 () Bool)

(declare-fun b_and!391 () Bool)

(assert (=> start!852 (= tp!965 b_and!391)))

(declare-fun b!6955 () Bool)

(declare-fun e!3845 () Bool)

(declare-fun e!3847 () Bool)

(assert (=> b!6955 (= e!3845 e!3847)))

(declare-fun res!7149 () Bool)

(assert (=> b!6955 (=> res!7149 e!3847)))

(declare-datatypes ((array!577 0))(
  ( (array!578 (arr!277 (Array (_ BitVec 32) (_ BitVec 64))) (size!339 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!577)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!6955 (= res!7149 (not (= (size!339 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1378 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!577 (_ BitVec 32)) Bool)

(assert (=> b!6955 (arrayForallSeekEntryOrOpenFound!0 lt!1378 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!127 0))(
  ( (Unit!128) )
))
(declare-fun lt!1380 () Unit!127)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!127)

(assert (=> b!6955 (= lt!1380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1378))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!577 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6955 (= lt!1378 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6956 () Bool)

(declare-fun e!3846 () Bool)

(declare-fun arrayContainsKey!0 (array!577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6956 (= e!3846 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6957 () Bool)

(declare-fun res!7145 () Bool)

(declare-fun e!3848 () Bool)

(assert (=> b!6957 (=> (not res!7145) (not e!3848))))

(assert (=> b!6957 (= res!7145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6958 () Bool)

(assert (=> b!6958 (= e!3847 true)))

(declare-datatypes ((SeekEntryResult!27 0))(
  ( (MissingZero!27 (index!2227 (_ BitVec 32))) (Found!27 (index!2228 (_ BitVec 32))) (Intermediate!27 (undefined!839 Bool) (index!2229 (_ BitVec 32)) (x!2565 (_ BitVec 32))) (Undefined!27) (MissingVacant!27 (index!2230 (_ BitVec 32))) )
))
(declare-fun lt!1377 () SeekEntryResult!27)

(assert (=> b!6958 (and (is-Found!27 lt!1377) (= (index!2228 lt!1377) lt!1378))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!577 (_ BitVec 32)) SeekEntryResult!27)

(assert (=> b!6958 (= lt!1377 (seekEntry!0 k!1278 _keys!1806 mask!2250))))

(declare-fun lt!1379 () Unit!127)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!577 (_ BitVec 32)) Unit!127)

(assert (=> b!6958 (= lt!1379 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1278 lt!1378 _keys!1806 mask!2250))))

(declare-fun b!6959 () Bool)

(declare-fun res!7148 () Bool)

(assert (=> b!6959 (=> (not res!7148) (not e!3848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6959 (= res!7148 (validKeyInArray!0 k!1278))))

(declare-fun res!7147 () Bool)

(assert (=> start!852 (=> (not res!7147) (not e!3848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!852 (= res!7147 (validMask!0 mask!2250))))

(assert (=> start!852 e!3848))

(assert (=> start!852 tp!965))

(assert (=> start!852 true))

(declare-datatypes ((V!607 0))(
  ( (V!608 (val!167 Int)) )
))
(declare-datatypes ((ValueCell!145 0))(
  ( (ValueCellFull!145 (v!1258 V!607)) (EmptyCell!145) )
))
(declare-datatypes ((array!579 0))(
  ( (array!580 (arr!278 (Array (_ BitVec 32) ValueCell!145)) (size!340 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!579)

(declare-fun e!3844 () Bool)

(declare-fun array_inv!203 (array!579) Bool)

(assert (=> start!852 (and (array_inv!203 _values!1492) e!3844)))

(declare-fun tp_is_empty!323 () Bool)

(assert (=> start!852 tp_is_empty!323))

(declare-fun array_inv!204 (array!577) Bool)

(assert (=> start!852 (array_inv!204 _keys!1806)))

(declare-fun mapNonEmpty!455 () Bool)

(declare-fun mapRes!455 () Bool)

(declare-fun tp!964 () Bool)

(declare-fun e!3850 () Bool)

(assert (=> mapNonEmpty!455 (= mapRes!455 (and tp!964 e!3850))))

(declare-fun mapKey!455 () (_ BitVec 32))

(declare-fun mapRest!455 () (Array (_ BitVec 32) ValueCell!145))

(declare-fun mapValue!455 () ValueCell!145)

(assert (=> mapNonEmpty!455 (= (arr!278 _values!1492) (store mapRest!455 mapKey!455 mapValue!455))))

(declare-fun b!6960 () Bool)

(declare-fun res!7143 () Bool)

(assert (=> b!6960 (=> (not res!7143) (not e!3848))))

(declare-datatypes ((List!185 0))(
  ( (Nil!182) (Cons!181 (h!747 (_ BitVec 64)) (t!2320 List!185)) )
))
(declare-fun arrayNoDuplicates!0 (array!577 (_ BitVec 32) List!185) Bool)

(assert (=> b!6960 (= res!7143 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!182))))

(declare-fun mapIsEmpty!455 () Bool)

(assert (=> mapIsEmpty!455 mapRes!455))

(declare-fun b!6961 () Bool)

(assert (=> b!6961 (= e!3848 (not e!3845))))

(declare-fun res!7150 () Bool)

(assert (=> b!6961 (=> res!7150 e!3845)))

(assert (=> b!6961 (= res!7150 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6961 e!3846))

(declare-fun c!500 () Bool)

(assert (=> b!6961 (= c!500 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1376 () Unit!127)

(declare-fun minValue!1434 () V!607)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!607)

(declare-fun lemmaKeyInListMapIsInArray!45 (array!577 array!579 (_ BitVec 32) (_ BitVec 32) V!607 V!607 (_ BitVec 64) Int) Unit!127)

(assert (=> b!6961 (= lt!1376 (lemmaKeyInListMapIsInArray!45 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!6962 () Bool)

(assert (=> b!6962 (= e!3846 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6963 () Bool)

(declare-fun res!7144 () Bool)

(assert (=> b!6963 (=> (not res!7144) (not e!3848))))

(assert (=> b!6963 (= res!7144 (and (= (size!340 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!339 _keys!1806) (size!340 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6964 () Bool)

(declare-fun res!7142 () Bool)

(assert (=> b!6964 (=> (not res!7142) (not e!3848))))

(declare-datatypes ((tuple2!176 0))(
  ( (tuple2!177 (_1!88 (_ BitVec 64)) (_2!88 V!607)) )
))
(declare-datatypes ((List!186 0))(
  ( (Nil!183) (Cons!182 (h!748 tuple2!176) (t!2321 List!186)) )
))
(declare-datatypes ((ListLongMap!181 0))(
  ( (ListLongMap!182 (toList!106 List!186)) )
))
(declare-fun contains!80 (ListLongMap!181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!65 (array!577 array!579 (_ BitVec 32) (_ BitVec 32) V!607 V!607 (_ BitVec 32) Int) ListLongMap!181)

(assert (=> b!6964 (= res!7142 (contains!80 (getCurrentListMap!65 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6965 () Bool)

(assert (=> b!6965 (= e!3850 tp_is_empty!323)))

(declare-fun b!6966 () Bool)

(declare-fun e!3851 () Bool)

(assert (=> b!6966 (= e!3844 (and e!3851 mapRes!455))))

(declare-fun condMapEmpty!455 () Bool)

(declare-fun mapDefault!455 () ValueCell!145)

