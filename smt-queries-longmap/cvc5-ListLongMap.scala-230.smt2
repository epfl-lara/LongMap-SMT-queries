; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4062 () Bool)

(assert start!4062)

(declare-fun b_free!967 () Bool)

(declare-fun b_next!967 () Bool)

(assert (=> start!4062 (= b_free!967 (not b_next!967))))

(declare-fun tp!4320 () Bool)

(declare-fun b_and!1777 () Bool)

(assert (=> start!4062 (= tp!4320 b_and!1777)))

(declare-fun b!29895 () Bool)

(declare-fun e!19261 () Bool)

(assert (=> b!29895 (= e!19261 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((array!1873 0))(
  ( (array!1874 (arr!890 (Array (_ BitVec 32) (_ BitVec 64))) (size!991 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1873)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!92 0))(
  ( (MissingZero!92 (index!2490 (_ BitVec 32))) (Found!92 (index!2491 (_ BitVec 32))) (Intermediate!92 (undefined!904 Bool) (index!2492 (_ BitVec 32)) (x!6474 (_ BitVec 32))) (Undefined!92) (MissingVacant!92 (index!2493 (_ BitVec 32))) )
))
(declare-fun lt!11366 () SeekEntryResult!92)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1873 (_ BitVec 32)) SeekEntryResult!92)

(assert (=> b!29895 (= lt!11366 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!29896 () Bool)

(declare-fun res!17961 () Bool)

(assert (=> b!29896 (=> (not res!17961) (not e!19261))))

(declare-datatypes ((V!1587 0))(
  ( (V!1588 (val!687 Int)) )
))
(declare-datatypes ((ValueCell!461 0))(
  ( (ValueCellFull!461 (v!1776 V!1587)) (EmptyCell!461) )
))
(declare-datatypes ((array!1875 0))(
  ( (array!1876 (arr!891 (Array (_ BitVec 32) ValueCell!461)) (size!992 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1875)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!29896 (= res!17961 (and (= (size!992 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!991 _keys!1833) (size!992 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29897 () Bool)

(declare-fun res!17962 () Bool)

(assert (=> b!29897 (=> (not res!17962) (not e!19261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29897 (= res!17962 (validKeyInArray!0 k!1304))))

(declare-fun res!17963 () Bool)

(assert (=> start!4062 (=> (not res!17963) (not e!19261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4062 (= res!17963 (validMask!0 mask!2294))))

(assert (=> start!4062 e!19261))

(assert (=> start!4062 true))

(assert (=> start!4062 tp!4320))

(declare-fun e!19265 () Bool)

(declare-fun array_inv!621 (array!1875) Bool)

(assert (=> start!4062 (and (array_inv!621 _values!1501) e!19265)))

(declare-fun array_inv!622 (array!1873) Bool)

(assert (=> start!4062 (array_inv!622 _keys!1833)))

(declare-fun tp_is_empty!1321 () Bool)

(assert (=> start!4062 tp_is_empty!1321))

(declare-fun mapNonEmpty!1510 () Bool)

(declare-fun mapRes!1510 () Bool)

(declare-fun tp!4321 () Bool)

(declare-fun e!19262 () Bool)

(assert (=> mapNonEmpty!1510 (= mapRes!1510 (and tp!4321 e!19262))))

(declare-fun mapValue!1510 () ValueCell!461)

(declare-fun mapRest!1510 () (Array (_ BitVec 32) ValueCell!461))

(declare-fun mapKey!1510 () (_ BitVec 32))

(assert (=> mapNonEmpty!1510 (= (arr!891 _values!1501) (store mapRest!1510 mapKey!1510 mapValue!1510))))

(declare-fun b!29898 () Bool)

(declare-fun e!19263 () Bool)

(assert (=> b!29898 (= e!19263 tp_is_empty!1321)))

(declare-fun mapIsEmpty!1510 () Bool)

(assert (=> mapIsEmpty!1510 mapRes!1510))

(declare-fun b!29899 () Bool)

(assert (=> b!29899 (= e!19262 tp_is_empty!1321)))

(declare-fun b!29900 () Bool)

(declare-fun res!17967 () Bool)

(assert (=> b!29900 (=> (not res!17967) (not e!19261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1873 (_ BitVec 32)) Bool)

(assert (=> b!29900 (= res!17967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29901 () Bool)

(declare-fun res!17964 () Bool)

(assert (=> b!29901 (=> (not res!17964) (not e!19261))))

(declare-fun arrayContainsKey!0 (array!1873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29901 (= res!17964 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29902 () Bool)

(declare-fun res!17966 () Bool)

(assert (=> b!29902 (=> (not res!17966) (not e!19261))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1587)

(declare-fun minValue!1443 () V!1587)

(declare-datatypes ((tuple2!1140 0))(
  ( (tuple2!1141 (_1!581 (_ BitVec 64)) (_2!581 V!1587)) )
))
(declare-datatypes ((List!736 0))(
  ( (Nil!733) (Cons!732 (h!1299 tuple2!1140) (t!3429 List!736)) )
))
(declare-datatypes ((ListLongMap!717 0))(
  ( (ListLongMap!718 (toList!374 List!736)) )
))
(declare-fun contains!314 (ListLongMap!717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!202 (array!1873 array!1875 (_ BitVec 32) (_ BitVec 32) V!1587 V!1587 (_ BitVec 32) Int) ListLongMap!717)

(assert (=> b!29902 (= res!17966 (not (contains!314 (getCurrentListMap!202 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!29903 () Bool)

(declare-fun res!17965 () Bool)

(assert (=> b!29903 (=> (not res!17965) (not e!19261))))

(declare-datatypes ((List!737 0))(
  ( (Nil!734) (Cons!733 (h!1300 (_ BitVec 64)) (t!3430 List!737)) )
))
(declare-fun arrayNoDuplicates!0 (array!1873 (_ BitVec 32) List!737) Bool)

(assert (=> b!29903 (= res!17965 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!734))))

(declare-fun b!29904 () Bool)

(assert (=> b!29904 (= e!19265 (and e!19263 mapRes!1510))))

(declare-fun condMapEmpty!1510 () Bool)

(declare-fun mapDefault!1510 () ValueCell!461)

