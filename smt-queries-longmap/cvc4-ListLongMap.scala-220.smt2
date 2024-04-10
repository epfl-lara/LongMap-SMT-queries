; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4006 () Bool)

(assert start!4006)

(declare-fun b_free!911 () Bool)

(declare-fun b_next!911 () Bool)

(assert (=> start!4006 (= b_free!911 (not b_next!911))))

(declare-fun tp!4153 () Bool)

(declare-fun b_and!1721 () Bool)

(assert (=> start!4006 (= tp!4153 b_and!1721)))

(declare-fun mapIsEmpty!1426 () Bool)

(declare-fun mapRes!1426 () Bool)

(assert (=> mapIsEmpty!1426 mapRes!1426))

(declare-fun b!29091 () Bool)

(declare-fun e!18800 () Bool)

(declare-fun tp_is_empty!1265 () Bool)

(assert (=> b!29091 (= e!18800 tp_is_empty!1265)))

(declare-fun b!29092 () Bool)

(declare-fun res!17412 () Bool)

(declare-fun e!18797 () Bool)

(assert (=> b!29092 (=> (not res!17412) (not e!18797))))

(declare-datatypes ((array!1763 0))(
  ( (array!1764 (arr!835 (Array (_ BitVec 32) (_ BitVec 64))) (size!936 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1763)

(declare-datatypes ((List!692 0))(
  ( (Nil!689) (Cons!688 (h!1255 (_ BitVec 64)) (t!3385 List!692)) )
))
(declare-fun arrayNoDuplicates!0 (array!1763 (_ BitVec 32) List!692) Bool)

(assert (=> b!29092 (= res!17412 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!689))))

(declare-fun res!17414 () Bool)

(assert (=> start!4006 (=> (not res!17414) (not e!18797))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4006 (= res!17414 (validMask!0 mask!2294))))

(assert (=> start!4006 e!18797))

(assert (=> start!4006 true))

(assert (=> start!4006 tp!4153))

(declare-datatypes ((V!1511 0))(
  ( (V!1512 (val!659 Int)) )
))
(declare-datatypes ((ValueCell!433 0))(
  ( (ValueCellFull!433 (v!1748 V!1511)) (EmptyCell!433) )
))
(declare-datatypes ((array!1765 0))(
  ( (array!1766 (arr!836 (Array (_ BitVec 32) ValueCell!433)) (size!937 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1765)

(declare-fun e!18796 () Bool)

(declare-fun array_inv!577 (array!1765) Bool)

(assert (=> start!4006 (and (array_inv!577 _values!1501) e!18796)))

(declare-fun array_inv!578 (array!1763) Bool)

(assert (=> start!4006 (array_inv!578 _keys!1833)))

(assert (=> start!4006 tp_is_empty!1265))

(declare-fun b!29093 () Bool)

(declare-fun e!18798 () Bool)

(assert (=> b!29093 (= e!18797 e!18798)))

(declare-fun res!17409 () Bool)

(assert (=> b!29093 (=> (not res!17409) (not e!18798))))

(declare-datatypes ((tuple2!1092 0))(
  ( (tuple2!1093 (_1!557 (_ BitVec 64)) (_2!557 V!1511)) )
))
(declare-datatypes ((List!693 0))(
  ( (Nil!690) (Cons!689 (h!1256 tuple2!1092) (t!3386 List!693)) )
))
(declare-datatypes ((ListLongMap!669 0))(
  ( (ListLongMap!670 (toList!350 List!693)) )
))
(declare-fun lt!11083 () ListLongMap!669)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!290 (ListLongMap!669 (_ BitVec 64)) Bool)

(assert (=> b!29093 (= res!17409 (not (contains!290 lt!11083 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1511)

(declare-fun minValue!1443 () V!1511)

(declare-fun getCurrentListMap!180 (array!1763 array!1765 (_ BitVec 32) (_ BitVec 32) V!1511 V!1511 (_ BitVec 32) Int) ListLongMap!669)

(assert (=> b!29093 (= lt!11083 (getCurrentListMap!180 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29094 () Bool)

(declare-fun res!17410 () Bool)

(assert (=> b!29094 (=> (not res!17410) (not e!18797))))

(assert (=> b!29094 (= res!17410 (and (= (size!937 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!936 _keys!1833) (size!937 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29095 () Bool)

(declare-fun e!18799 () Bool)

(assert (=> b!29095 (= e!18799 tp_is_empty!1265)))

(declare-fun b!29096 () Bool)

(assert (=> b!29096 (= e!18798 (not true))))

(declare-datatypes ((SeekEntryResult!79 0))(
  ( (MissingZero!79 (index!2438 (_ BitVec 32))) (Found!79 (index!2439 (_ BitVec 32))) (Intermediate!79 (undefined!891 Bool) (index!2440 (_ BitVec 32)) (x!6381 (_ BitVec 32))) (Undefined!79) (MissingVacant!79 (index!2441 (_ BitVec 32))) )
))
(declare-fun lt!11080 () SeekEntryResult!79)

(declare-fun lt!11082 () (_ BitVec 32))

(assert (=> b!29096 (and (is-Found!79 lt!11080) (= (index!2439 lt!11080) lt!11082))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1763 (_ BitVec 32)) SeekEntryResult!79)

(assert (=> b!29096 (= lt!11080 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!665 0))(
  ( (Unit!666) )
))
(declare-fun lt!11084 () Unit!665)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1763 (_ BitVec 32)) Unit!665)

(assert (=> b!29096 (= lt!11084 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11082 _keys!1833 mask!2294))))

(assert (=> b!29096 (contains!290 lt!11083 (select (arr!835 _keys!1833) lt!11082))))

(declare-fun lt!11081 () Unit!665)

(declare-fun lemmaValidKeyInArrayIsInListMap!26 (array!1763 array!1765 (_ BitVec 32) (_ BitVec 32) V!1511 V!1511 (_ BitVec 32) Int) Unit!665)

(assert (=> b!29096 (= lt!11081 (lemmaValidKeyInArrayIsInListMap!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11082 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1763 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29096 (= lt!11082 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29097 () Bool)

(declare-fun res!17413 () Bool)

(assert (=> b!29097 (=> (not res!17413) (not e!18798))))

(declare-fun arrayContainsKey!0 (array!1763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29097 (= res!17413 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29098 () Bool)

(declare-fun res!17411 () Bool)

(assert (=> b!29098 (=> (not res!17411) (not e!18797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29098 (= res!17411 (validKeyInArray!0 k!1304))))

(declare-fun b!29099 () Bool)

(declare-fun res!17415 () Bool)

(assert (=> b!29099 (=> (not res!17415) (not e!18797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1763 (_ BitVec 32)) Bool)

(assert (=> b!29099 (= res!17415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29100 () Bool)

(assert (=> b!29100 (= e!18796 (and e!18800 mapRes!1426))))

(declare-fun condMapEmpty!1426 () Bool)

(declare-fun mapDefault!1426 () ValueCell!433)

