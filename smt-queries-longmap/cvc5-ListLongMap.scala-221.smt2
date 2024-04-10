; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4008 () Bool)

(assert start!4008)

(declare-fun b_free!913 () Bool)

(declare-fun b_next!913 () Bool)

(assert (=> start!4008 (= b_free!913 (not b_next!913))))

(declare-fun tp!4158 () Bool)

(declare-fun b_and!1723 () Bool)

(assert (=> start!4008 (= tp!4158 b_and!1723)))

(declare-fun mapIsEmpty!1429 () Bool)

(declare-fun mapRes!1429 () Bool)

(assert (=> mapIsEmpty!1429 mapRes!1429))

(declare-fun b!29121 () Bool)

(declare-fun res!17432 () Bool)

(declare-fun e!18816 () Bool)

(assert (=> b!29121 (=> (not res!17432) (not e!18816))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29121 (= res!17432 (validKeyInArray!0 k!1304))))

(declare-fun b!29122 () Bool)

(declare-fun e!18817 () Bool)

(declare-fun tp_is_empty!1267 () Bool)

(assert (=> b!29122 (= e!18817 tp_is_empty!1267)))

(declare-fun b!29123 () Bool)

(declare-fun res!17430 () Bool)

(assert (=> b!29123 (=> (not res!17430) (not e!18816))))

(declare-datatypes ((array!1767 0))(
  ( (array!1768 (arr!837 (Array (_ BitVec 32) (_ BitVec 64))) (size!938 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1767)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1767 (_ BitVec 32)) Bool)

(assert (=> b!29123 (= res!17430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17436 () Bool)

(assert (=> start!4008 (=> (not res!17436) (not e!18816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4008 (= res!17436 (validMask!0 mask!2294))))

(assert (=> start!4008 e!18816))

(assert (=> start!4008 true))

(assert (=> start!4008 tp!4158))

(declare-datatypes ((V!1515 0))(
  ( (V!1516 (val!660 Int)) )
))
(declare-datatypes ((ValueCell!434 0))(
  ( (ValueCellFull!434 (v!1749 V!1515)) (EmptyCell!434) )
))
(declare-datatypes ((array!1769 0))(
  ( (array!1770 (arr!838 (Array (_ BitVec 32) ValueCell!434)) (size!939 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1769)

(declare-fun e!18814 () Bool)

(declare-fun array_inv!579 (array!1769) Bool)

(assert (=> start!4008 (and (array_inv!579 _values!1501) e!18814)))

(declare-fun array_inv!580 (array!1767) Bool)

(assert (=> start!4008 (array_inv!580 _keys!1833)))

(assert (=> start!4008 tp_is_empty!1267))

(declare-fun b!29124 () Bool)

(declare-fun e!18818 () Bool)

(assert (=> b!29124 (= e!18818 (not true))))

(declare-datatypes ((SeekEntryResult!80 0))(
  ( (MissingZero!80 (index!2442 (_ BitVec 32))) (Found!80 (index!2443 (_ BitVec 32))) (Intermediate!80 (undefined!892 Bool) (index!2444 (_ BitVec 32)) (x!6390 (_ BitVec 32))) (Undefined!80) (MissingVacant!80 (index!2445 (_ BitVec 32))) )
))
(declare-fun lt!11095 () SeekEntryResult!80)

(declare-fun lt!11099 () (_ BitVec 32))

(assert (=> b!29124 (and (is-Found!80 lt!11095) (= (index!2443 lt!11095) lt!11099))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1767 (_ BitVec 32)) SeekEntryResult!80)

(assert (=> b!29124 (= lt!11095 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!667 0))(
  ( (Unit!668) )
))
(declare-fun lt!11096 () Unit!667)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1767 (_ BitVec 32)) Unit!667)

(assert (=> b!29124 (= lt!11096 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11099 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1094 0))(
  ( (tuple2!1095 (_1!558 (_ BitVec 64)) (_2!558 V!1515)) )
))
(declare-datatypes ((List!694 0))(
  ( (Nil!691) (Cons!690 (h!1257 tuple2!1094) (t!3387 List!694)) )
))
(declare-datatypes ((ListLongMap!671 0))(
  ( (ListLongMap!672 (toList!351 List!694)) )
))
(declare-fun lt!11097 () ListLongMap!671)

(declare-fun contains!291 (ListLongMap!671 (_ BitVec 64)) Bool)

(assert (=> b!29124 (contains!291 lt!11097 (select (arr!837 _keys!1833) lt!11099))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11098 () Unit!667)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1515)

(declare-fun minValue!1443 () V!1515)

(declare-fun lemmaValidKeyInArrayIsInListMap!27 (array!1767 array!1769 (_ BitVec 32) (_ BitVec 32) V!1515 V!1515 (_ BitVec 32) Int) Unit!667)

(assert (=> b!29124 (= lt!11098 (lemmaValidKeyInArrayIsInListMap!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11099 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1767 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29124 (= lt!11099 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29125 () Bool)

(declare-fun res!17434 () Bool)

(assert (=> b!29125 (=> (not res!17434) (not e!18816))))

(declare-datatypes ((List!695 0))(
  ( (Nil!692) (Cons!691 (h!1258 (_ BitVec 64)) (t!3388 List!695)) )
))
(declare-fun arrayNoDuplicates!0 (array!1767 (_ BitVec 32) List!695) Bool)

(assert (=> b!29125 (= res!17434 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!692))))

(declare-fun b!29126 () Bool)

(declare-fun res!17435 () Bool)

(assert (=> b!29126 (=> (not res!17435) (not e!18818))))

(declare-fun arrayContainsKey!0 (array!1767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29126 (= res!17435 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29127 () Bool)

(declare-fun res!17431 () Bool)

(assert (=> b!29127 (=> (not res!17431) (not e!18816))))

(assert (=> b!29127 (= res!17431 (and (= (size!939 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!938 _keys!1833) (size!939 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29128 () Bool)

(assert (=> b!29128 (= e!18816 e!18818)))

(declare-fun res!17433 () Bool)

(assert (=> b!29128 (=> (not res!17433) (not e!18818))))

(assert (=> b!29128 (= res!17433 (not (contains!291 lt!11097 k!1304)))))

(declare-fun getCurrentListMap!181 (array!1767 array!1769 (_ BitVec 32) (_ BitVec 32) V!1515 V!1515 (_ BitVec 32) Int) ListLongMap!671)

(assert (=> b!29128 (= lt!11097 (getCurrentListMap!181 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1429 () Bool)

(declare-fun tp!4159 () Bool)

(assert (=> mapNonEmpty!1429 (= mapRes!1429 (and tp!4159 e!18817))))

(declare-fun mapKey!1429 () (_ BitVec 32))

(declare-fun mapRest!1429 () (Array (_ BitVec 32) ValueCell!434))

(declare-fun mapValue!1429 () ValueCell!434)

(assert (=> mapNonEmpty!1429 (= (arr!838 _values!1501) (store mapRest!1429 mapKey!1429 mapValue!1429))))

(declare-fun b!29129 () Bool)

(declare-fun e!18813 () Bool)

(assert (=> b!29129 (= e!18813 tp_is_empty!1267)))

(declare-fun b!29130 () Bool)

(assert (=> b!29130 (= e!18814 (and e!18813 mapRes!1429))))

(declare-fun condMapEmpty!1429 () Bool)

(declare-fun mapDefault!1429 () ValueCell!434)

