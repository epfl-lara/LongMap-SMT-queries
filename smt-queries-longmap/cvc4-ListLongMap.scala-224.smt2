; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4030 () Bool)

(assert start!4030)

(declare-fun b_free!935 () Bool)

(declare-fun b_next!935 () Bool)

(assert (=> start!4030 (= b_free!935 (not b_next!935))))

(declare-fun tp!4225 () Bool)

(declare-fun b_and!1745 () Bool)

(assert (=> start!4030 (= tp!4225 b_and!1745)))

(declare-fun b!29452 () Bool)

(declare-fun res!17663 () Bool)

(declare-fun e!19016 () Bool)

(assert (=> b!29452 (=> (not res!17663) (not e!19016))))

(declare-datatypes ((array!1809 0))(
  ( (array!1810 (arr!858 (Array (_ BitVec 32) (_ BitVec 64))) (size!959 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1809)

(declare-datatypes ((List!711 0))(
  ( (Nil!708) (Cons!707 (h!1274 (_ BitVec 64)) (t!3404 List!711)) )
))
(declare-fun arrayNoDuplicates!0 (array!1809 (_ BitVec 32) List!711) Bool)

(assert (=> b!29452 (= res!17663 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!708))))

(declare-fun b!29453 () Bool)

(declare-fun e!19013 () Bool)

(declare-fun tp_is_empty!1289 () Bool)

(assert (=> b!29453 (= e!19013 tp_is_empty!1289)))

(declare-fun b!29454 () Bool)

(declare-fun e!19012 () Bool)

(assert (=> b!29454 (= e!19012 (not true))))

(declare-fun lt!11277 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1809 (_ BitVec 32)) Bool)

(assert (=> b!29454 (arrayForallSeekEntryOrOpenFound!0 lt!11277 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!679 0))(
  ( (Unit!680) )
))
(declare-fun lt!11278 () Unit!679)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!679)

(assert (=> b!29454 (= lt!11278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11277))))

(declare-datatypes ((SeekEntryResult!86 0))(
  ( (MissingZero!86 (index!2466 (_ BitVec 32))) (Found!86 (index!2467 (_ BitVec 32))) (Intermediate!86 (undefined!898 Bool) (index!2468 (_ BitVec 32)) (x!6420 (_ BitVec 32))) (Undefined!86) (MissingVacant!86 (index!2469 (_ BitVec 32))) )
))
(declare-fun lt!11280 () SeekEntryResult!86)

(assert (=> b!29454 (and (is-Found!86 lt!11280) (= (index!2467 lt!11280) lt!11277))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1809 (_ BitVec 32)) SeekEntryResult!86)

(assert (=> b!29454 (= lt!11280 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!11281 () Unit!679)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1809 (_ BitVec 32)) Unit!679)

(assert (=> b!29454 (= lt!11281 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11277 _keys!1833 mask!2294))))

(declare-datatypes ((V!1543 0))(
  ( (V!1544 (val!671 Int)) )
))
(declare-datatypes ((tuple2!1110 0))(
  ( (tuple2!1111 (_1!566 (_ BitVec 64)) (_2!566 V!1543)) )
))
(declare-datatypes ((List!712 0))(
  ( (Nil!709) (Cons!708 (h!1275 tuple2!1110) (t!3405 List!712)) )
))
(declare-datatypes ((ListLongMap!687 0))(
  ( (ListLongMap!688 (toList!359 List!712)) )
))
(declare-fun lt!11282 () ListLongMap!687)

(declare-fun contains!299 (ListLongMap!687 (_ BitVec 64)) Bool)

(assert (=> b!29454 (contains!299 lt!11282 (select (arr!858 _keys!1833) lt!11277))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!445 0))(
  ( (ValueCellFull!445 (v!1760 V!1543)) (EmptyCell!445) )
))
(declare-datatypes ((array!1811 0))(
  ( (array!1812 (arr!859 (Array (_ BitVec 32) ValueCell!445)) (size!960 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1811)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11279 () Unit!679)

(declare-fun zeroValue!1443 () V!1543)

(declare-fun minValue!1443 () V!1543)

(declare-fun lemmaValidKeyInArrayIsInListMap!33 (array!1809 array!1811 (_ BitVec 32) (_ BitVec 32) V!1543 V!1543 (_ BitVec 32) Int) Unit!679)

(assert (=> b!29454 (= lt!11279 (lemmaValidKeyInArrayIsInListMap!33 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11277 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1809 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29454 (= lt!11277 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29455 () Bool)

(declare-fun res!17661 () Bool)

(assert (=> b!29455 (=> (not res!17661) (not e!19016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29455 (= res!17661 (validKeyInArray!0 k!1304))))

(declare-fun b!29456 () Bool)

(declare-fun res!17667 () Bool)

(assert (=> b!29456 (=> (not res!17667) (not e!19016))))

(assert (=> b!29456 (= res!17667 (and (= (size!960 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!959 _keys!1833) (size!960 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29457 () Bool)

(declare-fun res!17665 () Bool)

(assert (=> b!29457 (=> (not res!17665) (not e!19016))))

(assert (=> b!29457 (= res!17665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1462 () Bool)

(declare-fun mapRes!1462 () Bool)

(assert (=> mapIsEmpty!1462 mapRes!1462))

(declare-fun res!17664 () Bool)

(assert (=> start!4030 (=> (not res!17664) (not e!19016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4030 (= res!17664 (validMask!0 mask!2294))))

(assert (=> start!4030 e!19016))

(assert (=> start!4030 true))

(assert (=> start!4030 tp!4225))

(declare-fun e!19015 () Bool)

(declare-fun array_inv!593 (array!1811) Bool)

(assert (=> start!4030 (and (array_inv!593 _values!1501) e!19015)))

(declare-fun array_inv!594 (array!1809) Bool)

(assert (=> start!4030 (array_inv!594 _keys!1833)))

(assert (=> start!4030 tp_is_empty!1289))

(declare-fun b!29451 () Bool)

(declare-fun e!19014 () Bool)

(assert (=> b!29451 (= e!19014 tp_is_empty!1289)))

(declare-fun b!29458 () Bool)

(declare-fun res!17666 () Bool)

(assert (=> b!29458 (=> (not res!17666) (not e!19012))))

(declare-fun arrayContainsKey!0 (array!1809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29458 (= res!17666 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1462 () Bool)

(declare-fun tp!4224 () Bool)

(assert (=> mapNonEmpty!1462 (= mapRes!1462 (and tp!4224 e!19014))))

(declare-fun mapValue!1462 () ValueCell!445)

(declare-fun mapKey!1462 () (_ BitVec 32))

(declare-fun mapRest!1462 () (Array (_ BitVec 32) ValueCell!445))

(assert (=> mapNonEmpty!1462 (= (arr!859 _values!1501) (store mapRest!1462 mapKey!1462 mapValue!1462))))

(declare-fun b!29459 () Bool)

(assert (=> b!29459 (= e!19015 (and e!19013 mapRes!1462))))

(declare-fun condMapEmpty!1462 () Bool)

(declare-fun mapDefault!1462 () ValueCell!445)

